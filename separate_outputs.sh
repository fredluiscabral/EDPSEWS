#!/bin/bash

# Arquivo de saída original
INPUT_FILE="output.txt"

# Arquivos de saída formatados
OUTPUT_BWAIT="output_bwait.txt"
OUTPUT_NAIVE="output_naive.txt"
OUTPUT_SEM="output_sem.txt"

# Limpa os arquivos de saída anteriores
> $OUTPUT_BWAIT
> $OUTPUT_NAIVE
> $OUTPUT_SEM

# Variáveis de controle
current_threads=0
current_program=""

# Variáveis para armazenar o tempo com 1 thread (referência para cálculo do speedup)
bwait_time_1_thread=0
naive_time_1_thread=0
sem_time_1_thread=0

# Lê linha por linha do arquivo de entrada
while IFS= read -r line; do
    # Se encontrar a linha que menciona o número de threads
    if [[ $line == *"MPI processes and"*threads ]]; then
        # Extrai o número de threads
        current_threads=$(echo "$line" | grep -oP '(?<=and )\d+(?= threads)')
        echo "Threads detectados: $current_threads" # Log para depuração
    fi
    
    # Verifica qual programa está sendo executado
    if [[ $line == *"Executing EQ_CALOR_EXPL_2D_BWAIT_HIBcr"* ]]; then
        current_program="BWAIT"
        echo "Programa detectado: BWAIT" # Log para depuração
    elif [[ $line == *"Executing EQ_CALOR_EXPL_2D_NAIVE_HIBcr"* ]]; then
        current_program="NAIVE"
        echo "Programa detectado: NAIVE" # Log para depuração
    elif [[ $line == *"Executing EQ_CALOR_EXPL_2D_SEM_HIBcr"* ]]; then
        current_program="SEM"
        echo "Programa detectado: SEM" # Log para depuração
    fi

    # Se encontrar uma linha com o tempo de execução
    if [[ $line == *"#Versao "* ]]; then
        # Extrai o tempo de execução
        execution_time=$(echo "$line" | grep -oP '(?<=Tempo = ).*(?= segundos)')

        # Substitui a vírgula por ponto para poder fazer cálculos corretamente
        execution_time=$(echo "$execution_time" | sed 's/,/./g')

        echo "Tempo detectado: $execution_time" # Log para depuração

        # Calcula o speedup
        if [[ $current_program == "BWAIT" ]]; then
            if [[ $current_threads -eq 1 ]]; then
                bwait_time_1_thread=$execution_time
            fi
            speedup=$(awk -v t1="$bwait_time_1_thread" -v tN="$execution_time" 'BEGIN {print t1/tN}')
            # Substitui ponto por vírgula para exibir no formato brasileiro
            speedup=$(echo "$speedup" | sed 's/\./,/g')
            execution_time=$(echo "$execution_time" | sed 's/\./,/g')
            echo "$current_threads;$execution_time;$speedup" >> $OUTPUT_BWAIT

        elif [[ $current_program == "NAIVE" ]]; then
            if [[ $current_threads -eq 1 ]]; then
                naive_time_1_thread=$execution_time
            fi
            speedup=$(awk -v t1="$naive_time_1_thread" -v tN="$execution_time" 'BEGIN {print t1/tN}')
            # Substitui ponto por vírgula para exibir no formato brasileiro
            speedup=$(echo "$speedup" | sed 's/\./,/g')
            execution_time=$(echo "$execution_time" | sed 's/\./,/g')
            echo "$current_threads;$execution_time;$speedup" >> $OUTPUT_NAIVE

        elif [[ $current_program == "SEM" ]]; then
            if [[ $current_threads -eq 1 ]]; then
                sem_time_1_thread=$execution_time
            fi
            speedup=$(awk -v t1="$sem_time_1_thread" -v tN="$execution_time" 'BEGIN {print t1/tN}')
            # Substitui ponto por vírgula para exibir no formato brasileiro
            speedup=$(echo "$speedup" | sed 's/\./,/g')
            execution_time=$(echo "$execution_time" | sed 's/\./,/g')
            echo "$current_threads;$execution_time;$speedup" >> $OUTPUT_SEM
        fi
    fi
done < "$INPUT_FILE"

# Log final para indicar que o script terminou
echo "Processamento concluído."

