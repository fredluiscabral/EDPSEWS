#!/bin/bash

# Verifica se o arquivo foi passado como parâmetro
if [ "$#" -ne 1 ]; then
  echo "Uso: $0 <arquivo_de_saida>"
  exit 1
fi

INPUT_FILE="$1"
OUTPUT_FILE="processed_output.csv"
> "$OUTPUT_FILE"  # Limpa o arquivo de saída

# Variáveis de controle
declare -A tile_data
declare -A baseline_time
current_tile=""
current_threads=""

# Cabeçalho do CSV
echo "Resultados agrupados por TILE:" > "$OUTPUT_FILE"

# Processa o arquivo linha por linha
while IFS= read -r line; do
  # Detectar o tamanho do TILE e o número de threads
  if echo "$line" | grep -q "Executing EQ_CALOR_EXPL_2D_SEM_HIBcr"; then
    current_tile=$(echo "$line" | grep -oP "TILE=\K\d+")
    current_threads=$(echo "$line" | grep -oP "with \K\d+(?= threads)")
  fi

  # Capturar o tempo de execução
  if echo "$line" | grep -q "#Versao Semaforo: Tempo ="; then
    time=$(echo "$line" | grep -oP "Tempo = \K[0-9\.]+")
    formatted_time=$(echo "$time" | tr '.' ',')  # Substituir ponto por vírgula

    # Define o baseline (menor tempo registrado para o TILE)
    if [ -z "${baseline_time[$current_tile]}" ]; then
      baseline_time[$current_tile]=$time
    fi

    # Calcula o speedup e formata com vírgula
    raw_speedup=$(echo "scale=2; ${baseline_time[$current_tile]} / $time" | bc)
    formatted_speedup=$(echo "$raw_speedup" | tr '.' ',')

    # Adiciona os dados ao agrupamento do TILE atual
    tile_data["$current_tile"]+="$current_threads;$formatted_time;$formatted_speedup\n"
  fi
done < "$INPUT_FILE"

# Escreve os dados organizados por TILE no arquivo de saída
for tile in "${!tile_data[@]}"; do
  echo >> "$OUTPUT_FILE"
  echo "TILE=$tile" >> "$OUTPUT_FILE"
  echo -e "Threads;Tempo (s);Speedup\n${tile_data[$tile]}" >> "$OUTPUT_FILE"
done

echo "Processamento concluído. Resultados salvos em $OUTPUT_FILE."

