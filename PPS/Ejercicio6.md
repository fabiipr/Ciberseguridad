#!/bin/bash

# Verificar si se han pasado al menos 2 parámetros
if [ "$#" -lt 2 ]; then
    echo "Se necesitan al menos 2 parámetros: <ruta_del_directorio> <ruta_del_archivo>"
    exit 1  # Retornar 1 si no se pasan suficientes parámetros
fi

# Obtener los parámetros
directorio="$1"
archivo="$2"

# Verificar si el archivo existe
if [ ! -e "$archivo" ]; then
    echo "El archivo '$archivo' no existe."
    exit 1  # Retornar 1 si el archivo no existe
fi

# Crear el directorio
mkdir -p "$directorio"
if [ $? -ne 0 ]; then
    echo "Error al crear el directorio '$directorio'."
    exit 1  # Retornar 1 si hay un error al crear el directorio
fi

# Copiar el archivo al directorio
cp "$archivo" "$directorio/"
if [ $? -ne 0 ]; then
    echo "Error al copiar el archivo '$archivo' a '$directorio'."
    exit 1  # Retornar 1 si hay un error al copiar el archivo
fi

echo "Archivo '$archivo' copiado a '$directorio' correctamente."
exit 0  # Retornar 0 si todo ha ido bien
