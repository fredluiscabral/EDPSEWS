#include <mpi.h>
#include <stdio.h>
#include <unistd.h>
#include <omp.h>
#include <math.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>

using namespace std;

double x, y, h, velX, velY, tempoFinal, deltaT, deltaX, deltaY, alfa, beta_coef, gama;
double t_ini, t_fim;

long int N, contagemTempo, nN, m;
int NP, myRank, numProcs, numLocalPontos, inicioLocal, finalLocal, resto, vizNorte, vizSul;
int TILE; // Tamanho do bloco para *tiling*

double pulso(double D, double xo, double yo, double x, double y) {
    return exp(-D * ((x - xo) * (x - xo) + (y - yo) * (y - yo)));
}

int main(int argc, char* argv[]) {
    MPI_Status status;
    MPI_Request req[4]; // Para até 4 operações: 2 sends e 2 receives

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &myRank);
    MPI_Comm_size(MPI_COMM_WORLD, &numProcs);

    gama = atof(argv[1]);
    tempoFinal = atof(argv[2]);
    deltaT = atof(argv[3]);
    NP = atoi(argv[4]);
    TILE = atoi(argv[5]); // Lê o tamanho do TILE como argumento

    N = NP + 1;
    h = 1.0 / (N - 1);
    deltaX = h;
    deltaY = h;

    // Verifica a condição CFL
    double cfl_condition = (h * h) / (4.0 * gama);
    if (deltaT > cfl_condition) {
        if (myRank == 0) {
            cerr << "Erro: A condição CFL não é atendida. O programa será abortado." << endl;
            cerr << "deltaT = " << deltaT << ", Condição CFL máxima = " << cfl_condition << endl;
        }
        MPI_Abort(MPI_COMM_WORLD, EXIT_FAILURE);
    }

    numLocalPontos = (N - 2) / numProcs;
    resto = (N - 2) % numProcs;
    inicioLocal = numLocalPontos * myRank + 1;
    finalLocal = inicioLocal + numLocalPontos - 1;

    if (myRank + 1 <= resto) {
        inicioLocal += myRank;
        finalLocal += myRank + 1;
    } else {
        inicioLocal += resto;
        finalLocal += resto;
    }

    if (myRank == 0) vizNorte = MPI_PROC_NULL;
    else vizNorte = myRank - 1;

    if (myRank == numProcs - 1) vizSul = MPI_PROC_NULL;
    else vizSul = myRank + 1;

    nN = finalLocal - inicioLocal + 1;

    double* U_new = (double*)malloc(((nN + 2) * (NP + 1)) * sizeof(double));
    double* U_old = (double*)malloc(((nN + 2) * (NP + 1)) * sizeof(double));

    // Inicialização com *tiling*
    //#pragma omp parallel for collapse(2)
    for (int j_tile = 0; j_tile <= N - 1; j_tile += TILE) {
        for (int i_tile = 0; i_tile <= nN + 1; i_tile += TILE) {
            for (int i = i_tile; i < i_tile + TILE && i <= nN + 1; ++i) {
                for (int j = j_tile; j < j_tile + TILE && j <= N - 1; ++j) {
                    x = (double)(i + inicioLocal - 1) * h;
                    y = (double)j * h;
                    U_old[i * (NP + 1) + j] = pulso(100, 0.5, 0.5, x, y);
                    U_new[i * (NP + 1) + j] = U_old[i * (NP + 1) + j];
                }
            }
        }
    }

    double tempo = 0.0;
    int k = 0;

    alfa = (gama * deltaT) / (deltaX * deltaX);
    beta_coef = (gama * deltaT) / (deltaY * deltaY);

    if (myRank == 0) t_ini = omp_get_wtime();

    // Loop principal de tempo
    while (tempo < tempoFinal / 2) {
        k++;
        tempo = (double)(k * deltaT);

        // Primeiro loop: Atualização dos pontos (i+j+m) % 2 == 0
        #pragma omp parallel for collapse(2)
        for (int j_tile = 1; j_tile <= N - 2; j_tile += TILE) {
            for (int i_tile = 1; i_tile <= nN; i_tile += TILE) {
                for (int i = i_tile; i < i_tile + TILE && i <= nN; ++i) {
                    for (int j = j_tile; j < j_tile + TILE && j <= N - 2; ++j) {
                        if ((i + j + m) % 2 == 0) {
                            U_old[i * (NP + 1) + j] =
                                U_new[i * (NP + 1) + j] +
                                alfa * (U_new[(i + 1) * (NP + 1) + j] -
                                        2 * U_new[i * (NP + 1) + j] +
                                        U_new[(i - 1) * (NP + 1) + j]) +
                                beta_coef * (U_new[i * (NP + 1) + j + 1] -
                                             2 * U_new[i * (NP + 1) + j] +
                                             U_new[i * (NP + 1) + j - 1]);
                        }
                    }
                }
            }
        }

        if (vizNorte != MPI_PROC_NULL) {
            MPI_Isend(U_old + (NP + 1), NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &req[0]);
            MPI_Irecv(U_old, NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &req[1]);
        }

        if (vizSul != MPI_PROC_NULL) {
            MPI_Isend(U_old + nN * (NP + 1), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &req[2]);
            MPI_Irecv(U_old + (nN + 1) * (NP + 1), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &req[3]);
        }

        // Segundo loop: Atualização dos pontos (i+j+m) % 2 == 1
        #pragma omp parallel for collapse(2)
        for (int j_tile = 1; j_tile <= N - 2; j_tile += TILE) {
            for (int i_tile = 1; i_tile <= nN; i_tile += TILE) {
                for (int i = i_tile; i < i_tile + TILE && i <= nN; ++i) {
                    for (int j = j_tile; j < j_tile + TILE && j <= N - 2; ++j) {
                        if ((i + j + m) % 2 == 1) {
                            U_old[i * (NP + 1) + j] =
                                (U_new[i * (NP + 1) + j] +
                                 alfa * (U_old[(i + 1) * (NP + 1) + j] +
                                         U_old[(i - 1) * (NP + 1) + j]) +
                                 beta_coef * (U_old[i * (NP + 1) + (j + 1)] +
                                              U_old[i * (NP + 1) + (j - 1)])) /
                                (1 + 2 * alfa + 2 * beta_coef);
                        }
                    }
                }
            }
        }

        // Troca de mensagens MPI após o segundo loop
        if (vizNorte != MPI_PROC_NULL) {
            MPI_Isend(U_old + (NP + 1), NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &req[0]);
            MPI_Irecv(U_old, NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &req[1]);
        }

        if (vizSul != MPI_PROC_NULL) {
            MPI_Isend(U_old + nN * (NP + 1), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &req[2]);
            MPI_Irecv(U_old + (nN + 1) * (NP + 1), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &req[3]);
        }

        // Terceiro loop: Atualização dos pontos (i+j+m) % 2 == 0
        #pragma omp parallel for collapse(2)
        for (int j_tile = 1; j_tile <= N - 2; j_tile += TILE) {
            for (int i_tile = 1; i_tile <= nN; i_tile += TILE) {
                for (int i = i_tile; i < i_tile + TILE && i <= nN; ++i) {
                    for (int j = j_tile; j < j_tile + TILE && j <= N - 2; ++j) {
                        if ((i + j + m) % 2 == 0) {
                            U_new[i * (NP + 1) + j] =
                                U_old[i * (NP + 1) + j] +
                                alfa * (U_old[(i + 1) * (NP + 1) + j] -
                                        2 * U_old[i * (NP + 1) + j] +
                                        U_old[(i - 1) * (NP + 1) + j]) +
                                beta_coef * (U_old[i * (NP + 1) + j + 1] -
                                             2 * U_old[i * (NP + 1) + j] +
                                             U_old[i * (NP + 1) + j - 1]);
                        }
                    }
                }
            }
        }

        // Troca de mensagens MPI após o terceiro loop
        if (vizNorte != MPI_PROC_NULL) {
            MPI_Isend(U_old + (NP + 1), NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &req[0]);
            MPI_Irecv(U_old, NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &req[1]);
        }

        if (vizSul != MPI_PROC_NULL) {
            MPI_Isend(U_old + nN * (NP + 1), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &req[2]);
            MPI_Irecv(U_old + (nN + 1) * (NP + 1), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &req[3]);
        }

        // Quarto loop: Atualização dos pontos (i+j+m) % 2 == 1
        #pragma omp parallel for collapse(2)
        for (int j_tile = 1; j_tile <= N - 2; j_tile += TILE) {
            for (int i_tile = 1; i_tile <= nN; i_tile += TILE) {
                for (int i = i_tile; i < i_tile + TILE && i <= nN; ++i) {
                    for (int j = j_tile; j < j_tile + TILE && j <= N - 2; ++j) {
                        if ((i + j + m) % 2 == 1) {
                            U_new[i * (NP + 1) + j] =
                                (U_old[i * (NP + 1) + j] +
                                 alfa * (U_new[(i + 1) * (NP + 1) + j] +
                                         U_new[(i - 1) * (NP + 1) + j]) +
                                 beta_coef * (U_new[i * (NP + 1) + (j + 1)] +
                                              U_new[i * (NP + 1) + (j - 1)])) /
                                (1 + 2 * alfa + 2 * beta_coef);
                        }
                    }
                }
            }
        }

        // Troca de mensagens MPI após o quarto loop
        if (vizNorte != MPI_PROC_NULL) {
            MPI_Isend(U_old + (NP + 1), NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &req[0]);
            MPI_Irecv(U_old, NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &req[1]);
        }

        if (vizSul != MPI_PROC_NULL) {
            MPI_Isend(U_old + nN * (NP + 1), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &req[2]);
            MPI_Irecv(U_old + (nN + 1) * (NP + 1), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &req[3]);
        }

        m++;
    }

 
  if (myRank == 0)
  	t_fim = omp_get_wtime();

  // Preparação para coleta dos dados
  double *U_total = nullptr;
  int *recvcounts = nullptr;
  int *displs = nullptr;

  if (myRank == 0) {
      //cout << "#Versao Naive: Tempo = " << (double)(t_fim - t_ini) << " segundos ..." << endl;

      U_total = (double *) malloc((N*(N+1))*sizeof(double));
      recvcounts = (int *) malloc(numProcs * sizeof(int));
      displs = (int *) malloc(numProcs * sizeof(int));
      
      for (int i = 0; i < numProcs; i++) {
          int local_nN = (N-2)/numProcs;
          if (i < resto) local_nN++;
          recvcounts[i] = (local_nN+2)*(NP+1); // Cada processo envia local_nN+2 linhas de N+1 pontos
          displs[i] = i*(local_nN+1)*(NP+1); // Deslocamento de onde cada bloco começa em U_total
      }
  }

  // Envio dos dados locais para o processo 0 ao final
  MPI_Gatherv(U_new, (nN+2)*(NP+1), MPI_DOUBLE, 
              U_total, recvcounts, displs, MPI_DOUBLE, 
              0, MPI_COMM_WORLD);

  if (myRank == 0) {
      cout << "#Versao Naive: Tempo = " << (double)(t_fim - t_ini) << " segundos ..." << "Tile de tamanho " << TILE << endl;

      // Abre um arquivo para saída dos dados
      
      ofstream outfile("output_data.txt");
      if (outfile.is_open()) {
          double x, y;
          for (int i = 0; i < N; i+=100) {
              for (int j = 0; j < N; j+=100) {
                  x = i * h;
                  y = j * h;
                  outfile << x << " " << y << " " << U_total[i*(NP+1)+j] << endl;
              }
          }
          outfile.close();
      } else {
          cerr << "Erro ao abrir o arquivo para escrita." << endl;
      }

      free(U_total);
      free(recvcounts);
      free(displs);
  }

  MPI_Finalize();

  free(U_new);
  free(U_old);

  return 0;
}

