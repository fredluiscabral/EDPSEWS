#!/bin/bash

# Definir parâmetros
DIFFUSION_COEF=0.1
FINAL_TIME=0.1
DELTA_TIME=0.000025
N=100

# Definir o número de processos MPI fixo e o número máximo de threads
MPI_PROCS=1  # Defina aqui o número fixo de processos MPI
MAX_THREADS=10  # Altere conforme o limite máximo desejado

# Arquivo de saída
OUTPUT_FILE="output.txt"
> $OUTPUT_FILE

# Loop para variar o número de threads
for THREADS in $(seq 1 $MAX_THREADS); do
  export OMP_NUM_THREADS=$THREADS
  echo "Running with $MPI_PROCS MPI processes and $THREADS threads" | tee -a $OUTPUT_FILE
  
  echo "Executing EQ_CALOR_EXPL_2D_BWAIT_HIBcr with $THREADS threads" | tee -a $OUTPUT_FILE
  mpirun -np $MPI_PROCS ./EQ_CALOR_EXPL_2D_BWAIT_HIBcr $DIFFUSION_COEF $FINAL_TIME $DELTA_TIME $N | tee -a $OUTPUT_FILE
  
  echo "Executing EQ_CALOR_EXPL_2D_NAIVE_HIBcr with $THREADS threads" | tee -a $OUTPUT_FILE
  mpirun -np $MPI_PROCS ./EQ_CALOR_EXPL_2D_NAIVE_HIBcr $DIFFUSION_COEF $FINAL_TIME $DELTA_TIME $N | tee -a $OUTPUT_FILE
  
  echo "Executing EQ_CALOR_EXPL_2D_SEM_HIBcr with $THREADS threads" | tee -a $OUTPUT_FILE
  mpirun -np $MPI_PROCS ./EQ_CALOR_EXPL_2D_SEM_HIBcr $DIFFUSION_COEF $FINAL_TIME $DELTA_TIME $N | tee -a $OUTPUT_FILE
  
  echo "--------------------------------------" | tee -a $OUTPUT_FILE
done

