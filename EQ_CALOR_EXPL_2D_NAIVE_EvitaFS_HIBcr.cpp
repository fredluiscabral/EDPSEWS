#include <mpi.h>
#include <stdio.h>
#include <unistd.h>
#include <omp.h>
#include <math.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>

using namespace std;

// Alinhamento de cache
#define CACHE_LINE_SIZE 64
#define PAD (CACHE_LINE_SIZE / sizeof(double))

// Variáveis globais
double x, y, h, velX, velY, tempoFinal, deltaT, deltaX, deltaY, alfa, beta_coef, gama;
double t_ini, t_fim;

long int N, contagemTempo, nN, m;
int NP, myRank, numProcs, numLocalPontos, inicioLocal, finalLocal, resto, vizNorte, vizSul;
int TILE; // Tamanho do bloco para *tiling*

// Função para calcular o pulso inicial
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

    // Alocação alinhada para evitar conflitos de cache
    double* U_new, * U_old;
    posix_memalign((void**)&U_new, CACHE_LINE_SIZE, ((nN + 2) * (NP + 1 + PAD)) * sizeof(double));
    posix_memalign((void**)&U_old, CACHE_LINE_SIZE, ((nN + 2) * (NP + 1 + PAD)) * sizeof(double));

    // Inicialização com *tiling*
    #pragma omp parallel for collapse(2) schedule(static, TILE)
    for (int i_tile = 0; i_tile <= nN + 1; i_tile += TILE) {
        for (int j_tile = 0; j_tile <= N - 1; j_tile += TILE) {
            for (int i = i_tile; i < i_tile + TILE && i <= nN + 1; ++i) {
                for (int j = j_tile; j < j_tile + TILE && j <= N - 1; ++j) {
                    x = (double)(i + inicioLocal - 1) * h;
                    y = (double)j * h;
                    U_old[i * (NP + 1 + PAD) + j] = pulso(100, 0.5, 0.5, x, y);
                    U_new[i * (NP + 1 + PAD) + j] = U_old[i * (NP + 1 + PAD) + j];
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

        // Primeiro loop
        #pragma omp parallel for collapse(2) schedule(static, TILE)
        for (int i_tile = 1; i_tile <= nN; i_tile += TILE) {
            for (int j_tile = 1; j_tile <= N - 2; j_tile += TILE) {
                for (int i = i_tile; i < i_tile + TILE && i <= nN; ++i) {
                    for (int j = j_tile; j < j_tile + TILE && j <= N - 2; ++j) {
                        if ((i + j + m) % 2 == 0) {
                            U_old[i * (NP + 1 + PAD) + j] =
                                U_new[i * (NP + 1 + PAD) + j] +
                                alfa * (U_new[(i + 1) * (NP + 1 + PAD) + j] -
                                        2 * U_new[i * (NP + 1 + PAD) + j] +
                                        U_new[(i - 1) * (NP + 1 + PAD) + j]) +
                                beta_coef * (U_new[i * (NP + 1 + PAD) + j + 1] -
                                             2 * U_new[i * (NP + 1 + PAD) + j] +
                                             U_new[i * (NP + 1 + PAD) + j - 1]);
                        }
                    }
                }
            }
        }

        // Comunicação após o primeiro loop
        if (vizNorte != MPI_PROC_NULL) {
            MPI_Isend(U_old + (NP + 1 + PAD), NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &req[0]);
            MPI_Irecv(U_old, NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &req[1]);
        }
        if (vizSul != MPI_PROC_NULL) {
            MPI_Isend(U_old + nN * (NP + 1 + PAD), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &req[2]);
            MPI_Irecv(U_old + (nN + 1) * (NP + 1 + PAD), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &req[3]);
        }
        MPI_Waitall(4, req, MPI_STATUSES_IGNORE);

        // Segundo loop
        #pragma omp parallel for collapse(2) schedule(static, TILE)
        for (int i_tile = 1; i_tile <= nN; i_tile += TILE) {
            for (int j_tile = 1; j_tile <= N - 2; j_tile += TILE) {
                for (int i = i_tile; i < i_tile + TILE && i <= nN; ++i) {
                    for (int j = j_tile; j < j_tile + TILE && j <= N - 2; ++j) {
                        if ((i + j + m) % 2 == 1) {
                            U_old[i * (NP + 1 + PAD) + j] =
                                (U_new[i * (NP + 1 + PAD) + j] +
                                 alfa * (U_old[(i + 1) * (NP + 1 + PAD) + j] +
                                         U_old[(i - 1) * (NP + 1 + PAD) + j]) +
                                 beta_coef * (U_old[i * (NP + 1 + PAD) + j + 1] +
                                              U_old[i * (NP + 1 + PAD) + j - 1])) /
                                (1 + 2 * alfa + 2 * beta_coef);
                        }
                    }
                }
            }
        }

        // Comunicação após o segundo loop
        if (vizNorte != MPI_PROC_NULL) {
            MPI_Isend(U_old + (NP + 1 + PAD), NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &req[0]);
            MPI_Irecv(U_old, NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &req[1]);
        }
        if (vizSul != MPI_PROC_NULL) {
            MPI_Isend(U_old + nN * (NP + 1 + PAD), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &req[2]);
            MPI_Irecv(U_old + (nN + 1) * (NP + 1 + PAD), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &req[3]);
        }
        MPI_Waitall(4, req, MPI_STATUSES_IGNORE);

        // Terceiro loop
        #pragma omp parallel for collapse(2) schedule(static, TILE)
        for (int i_tile = 1; i_tile <= nN; i_tile += TILE) {
            for (int j_tile = 1; j_tile <= N - 2; j_tile += TILE) {
                for (int i = i_tile; i < i_tile + TILE && i <= nN; ++i) {
                    for (int j = j_tile; j < j_tile + TILE && j <= N - 2; ++j) {
                        if ((i + j + m) % 2 == 0) {
                            U_new[i * (NP + 1 + PAD) + j] =
                                U_old[i * (NP + 1 + PAD) + j] +
                                alfa * (U_old[(i + 1) * (NP + 1 + PAD) + j] -
                                        2 * U_old[i * (NP + 1 + PAD) + j] +
                                        U_old[(i - 1) * (NP + 1 + PAD) + j]) +
                                beta_coef * (U_old[i * (NP + 1 + PAD) + j + 1] -
                                             2 * U_old[i * (NP + 1 + PAD) + j] +
                                             U_old[i * (NP + 1 + PAD) + j - 1]);
                        }
                    }
                }
            }
        }

        // Comunicação após o terceiro loop
        if (vizNorte != MPI_PROC_NULL) {
            MPI_Isend(U_new + (NP + 1 + PAD), NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &req[0]);
            MPI_Irecv(U_new, NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &req[1]);
        }
        if (vizSul != MPI_PROC_NULL) {
            MPI_Isend(U_new + nN * (NP + 1 + PAD), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &req[2]);
            MPI_Irecv(U_new + (nN + 1) * (NP + 1 + PAD), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &req[3]);
        }
        MPI_Waitall(4, req, MPI_STATUSES_IGNORE);

        // Quarto loop
        #pragma omp parallel for collapse(2) schedule(static, TILE)
        for (int i_tile = 1; i_tile <= nN; i_tile += TILE) {
            for (int j_tile = 1; j_tile <= N - 2; j_tile += TILE) {
                for (int i = i_tile; i < i_tile + TILE && i <= nN; ++i) {
                    for (int j = j_tile; j < j_tile + TILE && j <= N - 2; ++j) {
                        if ((i + j + m) % 2 == 1) {
                            U_new[i * (NP + 1 + PAD) + j] =
                                (U_old[i * (NP + 1 + PAD) + j] +
                                 alfa * (U_new[(i + 1) * (NP + 1 + PAD) + j] +
                                         U_new[(i - 1) * (NP + 1 + PAD) + j]) +
                                 beta_coef * (U_new[i * (NP + 1 + PAD) + j + 1] +
                                              U_new[i * (NP + 1 + PAD) + j - 1])) /
                                (1 + 2 * alfa + 2 * beta_coef);
                        }
                    }
                }
            }
        }

        // Comunicação após o quarto loop
        if (vizNorte != MPI_PROC_NULL) {
            MPI_Isend(U_new + (NP + 1 + PAD), NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &req[0]);
            MPI_Irecv(U_new, NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &req[1]);
        }
        if (vizSul != MPI_PROC_NULL) {
            MPI_Isend(U_new + nN * (NP + 1 + PAD), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &req[2]);
            MPI_Irecv(U_new + (nN + 1) * (NP + 1 + PAD), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &req[3]);
        }
        MPI_Waitall(4, req, MPI_STATUSES_IGNORE);

        m++;
    }

    if (myRank == 0) t_fim = omp_get_wtime();

    MPI_Finalize();
    free(U_new);
    free(U_old);

    return 0;
}
