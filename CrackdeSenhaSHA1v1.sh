#!/bin/bash

# Cores ANSI
RED='\033[1;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # Sem cor

# Nome e versão do script
script_name="CrackdeSenhaSHA1v1.sh"
# Arquivo de entrada de senhas 
input_file="senhas_brasil.txt"

# Verifica se o hash foi fornecido como argumento
if [ -z "$1" ]; then
    echo -e "${RED}Erro: Nenhum hash fornecido!${NC}"
    echo -e "${CYAN}Uso: ./CrackdeSenhaSHA1v1.sh <hash>${NC}"
    exit 1
fi

# Introdução estilizada
clear
echo -e "${GREEN}$script_name${NC}"
echo -e "${GREEN}+------------------------------------------------+${NC}"
echo -e "${GREEN}| ${NC} Script criado por Daniel Donda Hackers Hive ${GREEN}  |${NC}"
echo -e "${GREEN}| ${NC} para fins educacionais e de conscientização.${GREEN}  |${NC}"
echo -e "${GREEN}+------------------------------------------------+${NC}"
echo -e "${GREEN}| ${NC}    Visite: https://hackershive.io            ${GREEN} |${NC}"
echo -e "${GREEN}+------------------------------------------------+${NC}"
echo ""
echo -e "${YELLOW}[+]${NC} Procurando no pela HASH:${GREEN}$1${NC}"
echo -e "${YELLOW}[+]${NC} Wordlist (Senhas Comuns):${GREEN}$input_file${NC}"
echo -e "${BLUE}=================================================${NC}"
sleep 3
# Arquivo de entrada contendo as senhas
# input_file="senhas_brasil.txt"

# Hash que estamos procurando (passado como parâmetro)
target_hash="$1"
 
# Hash que estamos procurando
# target_hash="40bd001563085fc35165329ea1ff5c5ecbdbbeef"  # Substitua pelo hash que você deseja encontrar

# Itera sobre cada senha do arquivo de senhas
while IFS= read -r password; do
    # Gera o hash SHA-1 da senha
    hash=$(echo -n "$password" | sha1sum | awk '{print $1}')
    # Exibe a senha e o hash na tela com cores
#   echo -e "${CYAN}Senha:${NC} ${YELLOW}$password${NC} ${CYAN}=> Hash:${NC} ${GREEN}$hash${NC}"
echo -e "Hash:${NC} ${GREEN}$hash${NC}"
    # Verifica se o hash gerado corresponde ao hash alvo
    if [[ "$hash" == "$target_hash" ]]; then
        echo -e "${BLUE}=================================================${NC}"
        echo -e "${RED}Hash encontrado!${NC}"
        echo -e "${BLUE}=================================================${NC}"
        echo -e "${CYAN}A senha correspondente é:${NC} ${YELLOW}$password${NC}"
        break
    fi
done < "$input_file"
