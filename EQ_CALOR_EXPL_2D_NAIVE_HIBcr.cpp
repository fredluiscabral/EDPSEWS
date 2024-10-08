#include <mpi.h>
#include <stdio.h>
#include <unistd.h>
#include <omp.h>
#include <math.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>

using namespace std;

double x , y , h , velX , velY , tempoFinal , deltaT , deltaX , deltaY, alfa , beta_coef , gama;

double t_ini , t_fim;
double xTil , yTil , suporteInferior , suporteSuperior;

long int N , contagemTempo, nN, m;
int NP, myRank , numProcs , numLocalPontos, inicioLocal, finalLocal, resto, vizNorte , vizSul;

double pulso (double D , double xo , double yo , double x , double y) {
  return (exp(-D*((x-xo)*(x-xo) + (y-yo)*(y-yo))));
}

int main (int argc , char * argv[]){

  MPI_Status status;
  MPI_Request request[4];

  MPI_Init (&argc, &argv);
  MPI_Comm_rank (MPI_COMM_WORLD, &myRank);
  MPI_Comm_size (MPI_COMM_WORLD, &numProcs);

  gama = atof(argv[1]);
  tempoFinal = atof(argv[2]);
  deltaT = atof(argv[3]);
  NP = atoi (argv[4]);

  N = NP+1;
  h = (double) 1/(N-1);
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

  // Inicializa as variáveis tempo e k
  double tempo = 0.0;
  int k = 0;
 
  alfa = (gama * deltaT) / (deltaX * deltaX);
  beta_coef  = (gama * deltaT) / (deltaY * deltaY);

  if (myRank == 0)
  	t_ini = omp_get_wtime();

    while (tempo < tempoFinal/2) {

        k++;
        tempo = (double)(k * deltaT);

        #pragma omp parallel for
        for (int i = 1 ; i <= nN ; i++) {
            #pragma omp simd
            for (int j = 1 ; j <= N-2 ; j++) {
              		if ( (i+j+m) % 2 == 0 ) {
                 		U_old[i*(NP+1)+j] = U_new[i*(NP+1)+j] + alfa*(U_new[(i+1)*(NP+1)+j] - 2*U_new[i*(NP+1)+j] + U_new[(i-1)*(NP+1)+j]) +
							beta_coef*(U_new[i*(NP+1)+j+1] - 2*U_new[i*(NP+1)+j] + U_new[i*(NP+1)+j-1]);
              		}
            }
        }

        // Troca de mensagens com vizinhos após o primeiro passo de tempo
        if (vizNorte != MPI_PROC_NULL) {
                MPI_Send(U_old + (NP + 1), NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD);
                MPI_Recv(U_old, NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &status);
        }
        if (vizSul != MPI_PROC_NULL) {
                MPI_Send(U_old + nN * (NP + 1), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD);
                MPI_Recv(U_old + (nN + 1) * (NP + 1), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &status);
        }

        #pragma omp parallel for
	    for (int i = 1 ; i <= nN ; i++) {
            #pragma omp simd
            for (int j = 1 ; j <= N-2 ; j++) {
                if ( (i+j+m) % 2 == 1 ) {
                   	U_old[i*(NP+1)+j] = (U_new[i*(NP+1)+j] + alfa*(U_old[(i+1)*(NP+1)+j] +
							 U_old[(i-1)*(NP+1)+j]) + beta_coef*(U_old[i*(NP+1)+(j+1)] + U_old[i*(NP+1)+(j-1)]))/(1 + 2*alfa + 2*beta_coef);
                }
            }
        }

        m++;

        if (vizNorte != MPI_PROC_NULL) {
                MPI_Send(U_old + (NP + 1), NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD);
                MPI_Recv(U_old, NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &status);
        }
        if (vizSul != MPI_PROC_NULL) {
                MPI_Send(U_old + nN * (NP + 1), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD);
                MPI_Recv(U_old + (nN + 1) * (NP + 1), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &status);
        }

        #pragma omp parallel for
        for (int i = 1 ; i <= nN ; i++) {
            #pragma omp simd
            for (int j = 1 ; j <= N-2 ; j++) {
              	if ( (i+j+m) % 2 == 0 ) {
                 	U_new[i*(NP+1)+j] = U_old[i*(NP+1)+j] + alfa*(U_old[(i+1)*(NP+1)+j] - 2*U_old[i*(NP+1)+j] + U_old[(i-1)*(NP+1)+j]) +
                                        		beta_coef*(U_old[i*(NP+1)+j+1] - 2*U_old[i*(NP+1)+j] + U_old[i*(NP+1)+j-1]);
              	}
            }
        }


        // Troca de mensagens com vizinhos após o segundo passo de tempo
        if (vizNorte != MPI_PROC_NULL) {
                MPI_Send(U_new + (NP + 1), NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD);
                MPI_Recv(U_new, NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &status);
        }
        if (vizSul != MPI_PROC_NULL) {
                MPI_Send(U_new + nN * (NP + 1), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD);
                MPI_Recv(U_new + (nN + 1) * (NP + 1), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &status);
        }

        #pragma omp parallel for
        for (int i = 1 ; i <= nN ; i++) {
            #pragma omp simd
            for (int j = 1 ; j <= N-2 ; j++) {
                if ( (i+j+m) % 2 == 1 ) {
                   	U_new[i*(NP+1)+j] = (U_old[i*(NP+1)+j] + alfa*(U_new[(i+1)*(NP+1)+j] + U_new[(i-1)*(NP+1)+j]) +
							beta_coef*(U_new[i*(NP+1)+(j+1)] + U_new[i*(NP+1)+(j-1)]))/(1 + 2*alfa + 2*beta_coef);
                }
            }
        }

        m++;

        // Troca de mensagens com vizinhos após o segundo passo de tempo
        if (vizNorte != MPI_PROC_NULL) {
                MPI_Send(U_new + (NP + 1), NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD);
                MPI_Recv(U_new, NP + 1, MPI_DOUBLE, vizNorte, 0, MPI_COMM_WORLD, &status);
        }
        if (vizSul != MPI_PROC_NULL) {
                MPI_Send(U_new + nN * (NP + 1), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD);
                MPI_Recv(U_new + (nN + 1) * (NP + 1), NP + 1, MPI_DOUBLE, vizSul, 0, MPI_COMM_WORLD, &status);
        }

    } // Fim WHILE


  if (myRank == 0)
  	t_fim = omp_get_wtime();

  // Preparação para coleta dos dados
  double *U_total = nullptr;
  int *recvcounts = nullptr;
  int *displs = nullptr;

  if (myRank == 0) {
      cout << "#Versao Naive: Tempo = " << (double)(t_fim - t_ini) << " segundos ..." << endl;

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
/*      cout << "#Versao Naive: Tempo = " << (double)(t_fim - t_ini) << " segundos ..." << endl;

      // Abre um arquivo para saída dos dados
      ofstream outfile("output_data.txt");
      if (outfile.is_open()) {
          double x, y;
          for (int i = 0; i < N; i++) {
              for (int j = 0; j < N; j++) {
                  x = i * h;
                  y = j * h;
                  outfile << x << " " << y << " " << U_total[i*(NP+1)+j] << endl;
              }
          }
          outfile.close();
      } else {
          cerr << "Erro ao abrir o arquivo para escrita." << endl;
      }
*/
      free(U_total);
      free(recvcounts);
      free(displs);
  }

  MPI_Finalize();

  free(U_new);
  free(U_old);

  return 0;
}
