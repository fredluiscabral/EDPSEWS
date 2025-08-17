#include <mpi.h>
#include <stdio.h>
#include <unistd.h>
#include <omp.h>
#include <math.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <semaphore.h>

using namespace std;

double x, y, h, velX, velY, tempoFinal, deltaT, deltaX, deltaY, alfa, beta_coef, gama;
double t_ini, t_fim;
long int N, contagemTempo, nN, NP, m = 0;
int myRank, numProcs, numLocalPontos, inicioLocal, finalLocal, resto, vizNorte, vizSul;
sem_t semaphores_left[680];  // Semáforos para sincronização à esquerda
sem_t semaphores_right[680]; // Semáforos para sincronização à direita
int TILE; // Tamanho do tile

double pulso(double D, double xo, double yo, double x, double y) {
    return (exp(-D * ((x - xo) * (x - xo) + (y - yo) * (y - yo))));
}

void wait_for_neighbors(int tid, int nt) {
    if (tid > 0) { // Espera pelo vizinho da esquerda
        sem_wait(&semaphores_right[tid - 1]);
    }

    if (tid < nt - 1) { // Espera pelo vizinho da direita
        sem_wait(&semaphores_left[tid + 1]);
    }
}

void signal_done(int tid, int nt) {
    sem_post(&semaphores_left[tid]);  // Libera o vizinho da esquerda
    sem_post(&semaphores_right[tid]); // Libera o vizinho da direita
}

int main(int argc, char* argv[]) {
    MPI_Status status;

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &myRank);
    MPI_Comm_size(MPI_COMM_WORLD, &numProcs);

    gama = atof(argv[1]);
    tempoFinal = atof(argv[2]);
    deltaT = atof(argv[3]);
    NP = atoi(argv[4]);
    TILE = atoi(argv[5]); // Tamanho do tile como parâmetro

    N = NP + 1;
    h = (double)1 / (N - 1);
    deltaX = h;
    deltaY = h;

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

    
    for (int j_tile = 0; j_tile <= N - 1; j_tile += TILE) {
        for (int i_tile = 0; i_tile <= nN + 1; i_tile += TILE) {
            for (int i = i_tile; i < i_tile + TILE && i <= nN + 1; ++i) {
                for (int j = j_tile; j < j_tile + TILE && j <= N - 1; ++j) {
                    x = (double)(i + inicioLocal - 1) * h; // Ajuste da coordenada x
                    y = (double)j * h;
                    U_old[i * (NP + 1) + j] = pulso(100, 0.5, 0.5, x, y);
                    U_new[i * (NP + 1) + j] = U_old[i * (NP + 1) + j];
                }
            }
        }
    }

    alfa = (gama * deltaT) / (deltaX * deltaX);
    beta_coef = (gama * deltaT) / (deltaY * deltaY);

    if (myRank == 0)
        t_ini = omp_get_wtime();

    #pragma omp parallel
    {
        double tempo = 0.0;
        int tid = omp_get_thread_num();
        int nt = omp_get_num_threads();
        int size = nN / nt;
        int sobra = nN % nt;
        int iLocal = tid * size + 1;
        int fLocal = iLocal + size - 1;

        if (tid + 1 <= sobra) {
            iLocal = iLocal + tid;
            fLocal = fLocal + tid + 1;
        } else {
            iLocal = iLocal + sobra;
            fLocal = fLocal + sobra;
        }

        #pragma omp master
        {
            for (int i = 0; i < nt; i++) {
                sem_init(&semaphores_left[i], 0, 0);
                sem_init(&semaphores_right[i], 0, 0);
            }
        }

        #pragma omp barrier

        while (tempo < tempoFinal / 2) {
            tempo += deltaT;

            // Primeiro loop: (i+j+m) % 2 == 0
            for (int j_tile = 1; j_tile <= N - 2; j_tile += TILE) {
                for (int i_tile = iLocal; i_tile <= fLocal; i_tile += TILE) {
                    for (int i = i_tile; i < i_tile + TILE && i <= fLocal; ++i) {
                        for (int j = j_tile; j < j_tile + TILE && j <= N - 2; ++j) {
                            if ((i + j + m) % 2 == 0) {
                                U_old[i * (NP + 1) + j] =
                                    U_new[i * (NP + 1) + j] +
                                    alfa * (U_new[(i + 1) * (NP + 1) + j] - 2 * U_new[i * (NP + 1) + j] + U_new[(i - 1) * (NP + 1) + j]) +
                                    beta_coef * (U_new[i * (NP + 1) + j + 1] - 2 * U_new[i * (NP + 1) + j] + U_new[i * (NP + 1) + j - 1]);
                            }
                        }
                    }
                }
            }

            signal_done(tid, nt);
            wait_for_neighbors(tid, nt);

            // Comunicação MPI após o primeiro loop
            if (tid == 0 || tid == nt - 1) {
                MPI_Request req[4]; // Array para gerenciar múltiplas requisições
                int req_count = 0;  // Contador de requisições ativas

                // Comunicação com o vizinho do norte
                if (tid == 0 && vizNorte != MPI_PROC_NULL) {
                    MPI_Isend(U_old + (NP + 1), NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &req[req_count++]);
                    MPI_Irecv(U_old, NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &req[req_count++]);
                }

                // Comunicação com o vizinho do sul
                if (tid == nt - 1 && vizSul != MPI_PROC_NULL) {
                    MPI_Isend(U_old + nN * (NP + 1), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &req[req_count++]);
                    MPI_Irecv(U_old + (nN + 1) * (NP + 1), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &req[req_count++]);
                }

                // Sincronizar todas as requisições não bloqueantes
                if (req_count > 0) {
                    MPI_Waitall(req_count, req, MPI_STATUSES_IGNORE);
                }
            }

            for (int j_tile = 1; j_tile <= N - 2; j_tile += TILE) {
            // Segundo loop: (i+j+m) % 2 == 1
                for (int i_tile = iLocal; i_tile <= fLocal; i_tile += TILE) {
                    for (int i = i_tile; i < i_tile + TILE && i <= fLocal; ++i) {
                        for (int j = j_tile; j < j_tile + TILE && j <= N - 2; ++j) {
                            if ((i + j + m) % 2 == 1) {
                                U_old[i * (NP + 1) + j] =
                                    (U_new[i * (NP + 1) + j] +
                                     alfa * (U_old[(i + 1) * (NP + 1) + j] + U_old[(i - 1) * (NP + 1) + j]) +
                                     beta_coef * (U_old[i * (NP + 1) + j + 1] + U_old[i * (NP + 1) + j - 1])) /
                                    (1 + 2 * alfa + 2 * beta_coef);
                            }
                        }
                    }
                }
            }

            signal_done(tid, nt);
            wait_for_neighbors(tid, nt);

            if (tid == 0 || tid == nt - 1) {
                MPI_Request req[4]; // Array para gerenciar múltiplas requisições
                int req_count = 0;  // Contador de requisições ativas

                // Comunicação com o vizinho do norte
                if (tid == 0 && vizNorte != MPI_PROC_NULL) {
                    MPI_Isend(U_old + (NP + 1), NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &req[req_count++]);
                    MPI_Irecv(U_old, NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &req[req_count++]);
                }

                // Comunicação com o vizinho do sul
                if (tid == nt - 1 && vizSul != MPI_PROC_NULL) {
                    MPI_Isend(U_old + nN * (NP + 1), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &req[req_count++]);
                    MPI_Irecv(U_old + (nN + 1) * (NP + 1), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &req[req_count++]);
                }

                // Sincronizar todas as requisições não bloqueantes
                if (req_count > 0) {
                    MPI_Waitall(req_count, req, MPI_STATUSES_IGNORE);
                }
            }

            // Terceiro loop: (i+j+m) % 2 == 0        
            for (int j_tile = 1; j_tile <= N - 2; j_tile += TILE) {
                for (int i_tile = iLocal; i_tile <= fLocal; i_tile += TILE) {
                    for (int i = i_tile; i < i_tile + TILE && i <= fLocal; ++i) {
                        for (int j = j_tile; j < j_tile + TILE && j <= N - 2; ++j) {
                            if ((i + j + m) % 2 == 0) {
                                U_new[i * (NP + 1) + j] =
                                    U_old[i * (NP + 1) + j] +
                                    alfa * (U_old[(i + 1) * (NP + 1) + j] - 2 * U_old[i * (NP + 1) + j] + U_old[(i - 1) * (NP + 1) + j]) +
                                    beta_coef * (U_old[i * (NP + 1) + j + 1] - 2 * U_old[i * (NP + 1) + j] + U_old[i * (NP + 1) + j - 1]);
                            }
                        }
                    }
                }
            }

            signal_done(tid, nt);
            wait_for_neighbors(tid, nt);

            if (tid == 0 || tid == nt - 1) {
                MPI_Request req[4]; // Array para gerenciar múltiplas requisições
                int req_count = 0;  // Contador de requisições ativas

                // Comunicação com o vizinho do norte
                if (tid == 0 && vizNorte != MPI_PROC_NULL) {
                    MPI_Isend(U_old + (NP + 1), NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &req[req_count++]);
                    MPI_Irecv(U_old, NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &req[req_count++]);
                }

                // Comunicação com o vizinho do sul
                if (tid == nt - 1 && vizSul != MPI_PROC_NULL) {
                    MPI_Isend(U_old + nN * (NP + 1), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &req[req_count++]);
                    MPI_Irecv(U_old + (nN + 1) * (NP + 1), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &req[req_count++]);
                }

                // Sincronizar todas as requisições não bloqueantes
                if (req_count > 0) {
                    MPI_Waitall(req_count, req, MPI_STATUSES_IGNORE);
                }
            }


            // Quarto loop: (i+j+m) % 2 == 1
            for (int j_tile = 1; j_tile <= N - 2; j_tile += TILE) {
                for (int i_tile = iLocal; i_tile <= fLocal; i_tile += TILE) {    
                    for (int i = i_tile; i < i_tile + TILE && i <= fLocal; ++i) {
                        for (int j = j_tile; j < j_tile + TILE && j <= N - 2; ++j) {
                            if ((i + j + m) % 2 == 1) {
                                U_new[i * (NP + 1) + j] =
                                    (U_old[i * (NP + 1) + j] +
                                     alfa * (U_new[(i + 1) * (NP + 1) + j] + U_new[(i - 1) * (NP + 1) + j]) +
                                     beta_coef * (U_new[i * (NP + 1) + j + 1] + U_new[i * (NP + 1) + j - 1])) /
                                    (1 + 2 * alfa + 2 * beta_coef);
                            }
                        }
                    }
                }
            }

            signal_done(tid, nt);
            wait_for_neighbors(tid, nt);

            if (tid == 0 || tid == nt - 1) {
                MPI_Request req[4]; // Array para gerenciar múltiplas requisições
                int req_count = 0;  // Contador de requisições ativas

                // Comunicação com o vizinho do norte
                if (tid == 0 && vizNorte != MPI_PROC_NULL) {
                    MPI_Isend(U_old + (NP + 1), NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &req[req_count++]);
                    MPI_Irecv(U_old, NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &req[req_count++]);
                }

                // Comunicação com o vizinho do sul
                if (tid == nt - 1 && vizSul != MPI_PROC_NULL) {
                    MPI_Isend(U_old + nN * (NP + 1), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &req[req_count++]);
                    MPI_Irecv(U_old + (nN + 1) * (NP + 1), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &req[req_count++]);
                }

                // Sincronizar todas as requisições não bloqueantes
                if (req_count > 0) {
                    MPI_Waitall(req_count, req, MPI_STATUSES_IGNORE);
                }
            }

            m++;
        }
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
      cout << "#Versao Semaforo: Tempo = " << (double)(t_fim - t_ini) << " segundos ..." << "Tile de tamanho " << TILE << endl;

      // Abre um arquivo para saída dos dados
      ofstream outfile("output_data.txt");
      if (outfile.is_open()) {
          double x, y;
          for (int i = 0; i < N; i=i+100) {
              for (int j = 0; j < N; j=j+100) {
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