#!/bin/bash

# Definir parâmetros
DIFFUSION_COEF=0.1
FINAL_TIME=0.0000025
DELTA_TIME=0.000000025
N=5000  # Número de pontos no grid

# Número de processos MPI fixo e número máximo de threads
MPI_PROCS=1  # Número fixo de processos MPI (1 por socket)
MAX_THREADS=128  # Número máximo de threads por processo

# Arquivo de saída
OUTPUT_FILE="output.txt"
> $OUTPUT_FILE

# Loop para variar o número de threads
for THREADS in $(seq 1 $MAX_THREADS); do
  export OMP_NUM_THREADS=$THREADS
  export OMP_PROC_BIND=spread
  export OMP_PLACES=cores

  echo "Running with $MPI_PROCS MPI processes and $THREADS threads per process" | tee -a $OUTPUT_FILE

  # Loop para variar o tamanho do TILE
  for TILE in $(seq 10 10 $N); do
    echo "Executing with TILE=$TILE" | tee -a $OUTPUT_FILE

    echo "Executing EQ_CALOR_EXPL_2D_NAIVE_HIBcr with $THREADS threads and TILE=$TILE" | tee -a $OUTPUT_FILE
    mpirun -np $MPI_PROCS ./EQ_CALOR_EXPL_2D_NAIVE_HIBcr $DIFFUSION_COEF $FINAL_TIME $DELTA_TIME $N $TILE | tee -a $OUTPUT_FILE

    echo "Executing EQ_CALOR_EXPL_2D_SEM_HIBcr with $THREADS threads and TILE=$TILE" | tee -a $OUTPUT_FILE
    mpirun -np $MPI_PROCS ./EQ_CALOR_EXPL_2D_SEM_HIBcr $DIFFUSION_COEF $FINAL_TIME $DELTA_TIME $N $TILE | tee -a $OUTPUT_FILE

    echo "--------------------------------------" | tee -a $OUTPUT_FILE
  done

  echo "Completed all TILE values for THREADS=$THREADS" | tee -a $OUTPUT_FILE
  echo "============================================" | tee -a $OUTPUT_FILE
done

