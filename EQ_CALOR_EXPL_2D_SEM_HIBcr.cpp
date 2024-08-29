#include <mpi.h>
#include <stdio.h>
#include <unistd.h>
#include <omp.h>
#include <math.h>
#include <stdlib.h>
#include <iostream>
#include <ostream>
#include <istream>
#include <sstream>
#include <pthread.h>

using namespace std;

#define NP 10000

double x , y , h , velX , velY , tempoFinal , deltaT , deltaX , deltaY, alfa , beta , gama;

double t_ini , t_fim;
double xTil , yTil , suporteInferior , suporteSuperior;

long int N , contagemTempo, nN;
int myRank , numProcs , numLocalPontos, inicioLocal, finalLocal, resto, vizNorte , vizSul;

pthread_mutex_t mutex;
pthread_cond_t conds[280]; // Condicionais para sincronização entre threads

double pulso (double D , double xo , double yo , double x , double y) {
  return (exp(-D*((x-xo)*(x-xo) + (y-yo)*(y-yo))));
}

int main (int argc , char * argv[]){

  N = NP+1;
  h = (double) 1/(N-1);
  deltaX = h;
  deltaY = h;

  MPI_Status status;
  MPI_Request request[4];

  MPI_Init (&argc, &argv);
  MPI_Comm_rank (MPI_COMM_WORLD, &myRank);
  MPI_Comm_size (MPI_COMM_WORLD, &numProcs);

  numLocalPontos = (N-2)/numProcs;
  resto=(N-2)%numProcs;
  inicioLocal = numLocalPontos*myRank + 1;
  finalLocal = inicioLocal + numLocalPontos - 1;

  if(myRank+1 <= resto){
      inicioLocal = inicioLocal+myRank;
      finalLocal = finalLocal+myRank+1;
  } else {
      inicioLocal = inicioLocal+resto;
      finalLocal = finalLocal+resto;
  }

  if (myRank == 0) {
      vizNorte = MPI_PROC_NULL;
  } else {
      vizNorte = myRank - 1;
  }

  if (myRank == numProcs - 1) {
      vizSul = MPI_PROC_NULL;
  } else {
      vizSul = myRank + 1;
  }

  nN = finalLocal - inicioLocal + 1;

  double *U_new, *U_old;
  U_new = (double *) malloc(((nN+2)*(NP+1))*sizeof(double));
  U_old = (double *) malloc(((nN+2)*(NP+1))*sizeof(double));

  for (int i = 0 ; i <= nN+1 ; i++) {
      for (int j = 0 ; j <= N-1 ; j++) {
          x = (double) (i + inicioLocal - 1) * h; // Ajuste da coordenada x
          y = (double) j * h;
          U_old[i*(NP+1)+j] = pulso(100, 0.5, 0.5, x, y);
          U_new[i*(NP+1)+j] = U_old[i*(NP+1)+j];
      }
   }

  gama = atof(argv[1]);
  tempoFinal = atof(argv[2]);
  deltaT = atof(argv[3]);
 
  alfa = (gama * deltaT) / (deltaX * deltaX);
  beta  = (gama * deltaT) / (deltaY * deltaY);

  // Inicializando mutex e variáveis de condição
  pthread_mutex_init(&mutex, NULL);
  for (int i = 0; i < 280; i++) {
      pthread_cond_init(&conds[i], NULL);
  }

  t_ini = omp_get_wtime();

  #pragma omp parallel
  { 
    int k = 0;
    double tempo = 0;
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

    while (tempo < tempoFinal) {

        k++;
        tempo = (double)(k * deltaT);

        // Primeiro passo de tempo
        for (int i = iLocal; i <= fLocal; i++) {
            for (int j = 1; j < N-1; j++) {
                U_new[i*(NP+1)+j] = U_old[i*(NP+1)+j] 
                                    + alfa * (U_old[(i+1)*(NP+1)+j] - 2.0 * U_old[i*(NP+1)+j] + U_old[(i-1)*(NP+1)+j])
                                    + beta * (U_old[i*(NP+1)+(j+1)] - 2.0 * U_old[i*(NP+1)+j] + U_old[i*(NP+1)+(j-1)]);
            }
        }

        // Sincronização usando semáforos (espera pelas threads vizinhas)
        pthread_mutex_lock(&mutex);

        if (tid > 0) {
            pthread_cond_signal(&conds[tid - 1]);
        }
        if (tid < nt - 1) {
            pthread_cond_signal(&conds[tid + 1]);
        }

        pthread_cond_wait(&conds[tid], &mutex);
        pthread_mutex_unlock(&mutex);

        // Segundo passo de tempo usando U_new como base
        for (int i = iLocal; i <= fLocal; i++) {
            for (int j = 1; j < N-1; j++) {
                U_old[i*(NP+1)+j] = U_new[i*(NP+1)+j] 
                                    + alfa * (U_new[(i+1)*(NP+1)+j] - 2.0 * U_new[i*(NP+1)+j] + U_new[(i-1)*(NP+1)+j])
                                    + beta * (U_new[i*(NP+1)+(j+1)] - 2.0 * U_new[i*(NP+1)+j] + U_new[i*(NP+1)+(j-1)]);
            }
        }

        // Sincronização usando semáforos (espera pelas threads vizinhas)
        pthread_mutex_lock(&mutex);

        if (tid > 0) {
            pthread_cond_signal(&conds[tid - 1]);
        }
        if (tid < nt - 1) {
            pthread_cond_signal(&conds[tid + 1]);
        }

        pthread_cond_wait(&conds[tid], &mutex);
        pthread_mutex_unlock(&mutex);
    } // Fim WHILE

  }

  t_fim = omp_get_wtime();

  if (myRank == 0) 
      cout << "# Tempo = " << "  " << (double)(t_fim - t_ini) << " segundos ..." << endl;

  MPI_Finalize();

  free(U_new);
  free(U_old);

  // Destruindo mutex e variáveis de condição
  pthread_mutex_destroy(&mutex);
  for (int i = 0; i < 280; i++) {
      pthread_cond_destroy(&conds[i]);
  }

  return 0;
}
