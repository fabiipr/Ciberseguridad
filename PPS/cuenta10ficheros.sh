#!/bin/bash

# Verificar si se ha pasado un directorio como parámetro
if [ -z "$1" ]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

# Verificar si el parámetro es un directorio válido
if [ ! -d "$1" ]; then
    echo "Error: $1 no es un directorio válido."
    exit 1
fi

# Contar solo los archivos en el directorio (excluyendo subdirectorios)
num_archivos=$(find "$1" -maxdepth 1 -type f | wc -l)

# Verificar si hay más de 10 archivos
if (( num_archivos > 10 )); then
    echo "Hay más de 10 archivos en el directorio $1."
else
    echo "No hay más de 10 archivos en el directorio $1."
fi
