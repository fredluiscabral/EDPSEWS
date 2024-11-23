#!/bin/bash

# Arquivo de log original
INPUT_FILE="output.txt"  # Substitua pelo arquivo correto

# Arquivos separados para as versões
NAIVE_OUTPUT="naive_output.txt"
SEM_OUTPUT="sem_output.txt"

# Limpar os arquivos anteriores (se existirem)
> $NAIVE_OUTPUT
> $SEM_OUTPUT

# Variáveis para controle
current_version=""

# Processar o arquivo de entrada linha por linha
while IFS= read -r line; do
  # Detectar qual versão está sendo processada
  if echo "$line" | grep -q "Executing EQ_CALOR_EXPL_2D_NAIVE_HIBcr"; then
    current_version="naive"
    echo "$line" >> $NAIVE_OUTPUT
  elif echo "$line" | grep -q "Executing EQ_CALOR_EXPL_2D_SEM_HIBcr"; then
    current_version="sem"
    echo "$line" >> $SEM_OUTPUT
  else
    # Adicionar linha à versão atual
    if [ "$current_version" = "naive" ]; then
      echo "$line" >> $NAIVE_OUTPUT
    elif [ "$current_version" = "sem" ]; then
      echo "$line" >> $SEM_OUTPUT
    fi
  fi
done < "$INPUT_FILE"

echo "Separação concluída. Resultados:"
echo " - Versão Naive: $NAIVE_OUTPUT"
echo " - Versão Semáforo: $SEM_OUTPUT"

