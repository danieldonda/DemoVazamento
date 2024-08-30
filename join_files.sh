#!/bin/bash

# Arquivos de entrada
emails_file="emails.txt"
hashes_file="hashes_senhas_brasil.txt"

# Arquivo de saída
output_file="emails_com_hashes.txt"

# Limpa o arquivo de saída se ele já existir
> $output_file

# Lê os arquivos linha por linha e combina o conteúdo
paste -d ' : ' "$emails_file" "$hashes_file" > "$output_file"

echo "Arquivos combinados e salvos em $output_file com sucesso!"
