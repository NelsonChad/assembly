#!/bin/bash

# Verifica se o número de argumentos é válido
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <arquivo.asm>"
    exit 1
fi

# Extrai o nome do arquivo sem a extensão
filename=$(basename "$1" .asm)

# Monta o código Assembly
nasm -f elf64 -o "$filename.o" "$1"

# Verifica se a montagem foi bem-sucedida
if [ $? -eq 0 ]; then
    echo "Montagem concluída com sucesso: $filename.o"
else
    echo "Erro ao montar o código Assembly"
    exit 1
fi

# Linka o arquivo objeto usando GCC como linker
gcc -o "$filename" "$filename.o" -no-pie

# Verifica se o link foi bem-sucedido
if [ $? -eq 0 ]; then
    echo "Linkagem concluída com sucesso: $filename"
else
    echo "Erro ao linkar o arquivo objeto"
    exit 1
fi

# Executa o programa
echo "Executando $filename:"
./"$filename"