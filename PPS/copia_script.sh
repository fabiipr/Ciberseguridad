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

# Obtener la fecha actual en formato ddmmaaaa
fecha=$(date +"%d%m%Y")

# Nombre del archivo de copia
archivo_copia="copia_scripts_$fecha.tar"

# Crear el archivo tar con todos los scripts .sh en el directorio especificado
tar -cvf "$archivo_copia" "$1"/*.sh

# Verificar si el archivo tar se ha creado correctamente
if [ $? -eq 0 ]; then
    echo "Copia realizada con éxito: $archivo_copia"
else
    echo "Error al crear la copia."
    exit 1
fi
