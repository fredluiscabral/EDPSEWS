#!/bin/bash

# Definir parâmetros
DIFFUSION_COEF=0.1
FINAL_TIME=0.0000025
DELTA_TIME=0.000000025
N=5000

# Definir o número de processos MPI fixo e o número máximo de threads
MPI_PROCS=2  # Defina aqui o número fixo de processos MPI (1 por socket)
MAX_THREADS=120  # Número máximo de threads por processo (ajustado para 120 para usar apenas núcleos físicos)

# Arquivo de saída
OUTPUT_FILE="output.txt"
> $OUTPUT_FILE

# Execução com 1 processo MPI e 1 thread (fora do loop)
export OMP_NUM_THREADS=1
echo "Running with 1 MPI process and 1 thread" | tee -a $OUTPUT_FILE

echo "Executing EQ_CALOR_EXPL_2D_BWAIT_HIBcr with 1 thread" | tee -a $OUTPUT_FILE
mpirun -np 1 --bind-to core --report-bindings ./EQ_CALOR_EXPL_2D_BWAIT_HIBcr $DIFFUSION_COEF $FINAL_TIME $DELTA_TIME $N | tee -a $OUTPUT_FILE

echo "Executing EQ_CALOR_EXPL_2D_NAIVE_HIBcr with 1 thread" | tee -a $OUTPUT_FILE
mpirun -np 1 --bind-to core --report-bindings ./EQ_CALOR_EXPL_2D_NAIVE_HIBcr $DIFFUSION_COEF $FINAL_TIME $DELTA_TIME $N | tee -a $OUTPUT_FILE

echo "Executing EQ_CALOR_EXPL_2D_SEM_HIBcr with 1 thread" | tee -a $OUTPUT_FILE
mpirun -np 1 --bind-to core --report-bindings ./EQ_CALOR_EXPL_2D_SEM_HIBcr $DIFFUSION_COEF $FINAL_TIME $DELTA_TIME $N | tee -a $OUTPUT_FILE

echo "--------------------------------------" | tee -a $OUTPUT_FILE

# Loop para variar o número de threads
for THREADS in $(seq 1 $MAX_THREADS); do
  export OMP_NUM_THREADS=$THREADS
  export OMP_PROC_BIND=spread
  export OMP_PLACES=cores
  
  echo "Running with $MPI_PROCS MPI processes and $THREADS threads per process" | tee -a $OUTPUT_FILE

  echo "Executing EQ_CALOR_EXPL_2D_BWAIT_HIBcr with $THREADS threads" | tee -a $OUTPUT_FILE
  mpirun -np $MPI_PROCS --map-by socket --bind-to core --report-bindings ./EQ_CALOR_EXPL_2D_BWAIT_HIBcr $DIFFUSION_COEF $FINAL_TIME $DELTA_TIME $N | tee -a $OUTPUT_FILE

  echo "Executing EQ_CALOR_EXPL_2D_NAIVE_HIBcr with $THREADS threads" | tee -a $OUTPUT_FILE
  mpirun -np $MPI_PROCS --map-by socket --bind-to core --report-bindings ./EQ_CALOR_EXPL_2D_NAIVE_HIBcr $DIFFUSION_COEF $FINAL_TIME $DELTA_TIME $N | tee -a $OUTPUT_FILE

  echo "Executing EQ_CALOR_EXPL_2D_SEM_HIBcr with $THREADS threads" | tee -a $OUTPUT_FILE
  mpirun -np $MPI_PROCS --map-by socket --bind-to core --report-bindings ./EQ_CALOR_EXPL_2D_SEM_HIBcr $DIFFUSION_COEF $FINAL_TIME $DELTA_TIME $N | tee -a $OUTPUT_FILE

  echo "--------------------------------------" | tee -a $OUTPUT_FILE
done

