#!/bin/bash

# Comprobar que se han pasado 2 parámetros
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <ruta_del_directorio_a_crear> <ruta_del_fichero_a_copiar>"
    exit 1
fi

# Asignar parámetros a variables
DIRECTORIO="$1"
FICHERO="$2"

# Crear el directorio
mkdir -p "$DIRECTORIO"

# Comprobar si el archivo existe
if [ ! -f "$FICHERO" ]; then
    echo "El archivo '$FICHERO' no existe."
    exit 1
fi

# Copiar el archivo al directorio
cp "$FICHERO" "$DIRECTORIO"

# Confirmación
echo "El archivo '$FICHERO' ha sido copiado a '$DIRECTORIO'."
