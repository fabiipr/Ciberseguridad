#!/bin/bash

# Verificar si se ha pasado un parámetro
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <ruta>"
    exit 1  # Retornar 1 si no se pasa un parámetro
fi

# Obtener la ruta del parámetro
ruta="$1"

# Verificar si la ruta existe
if [ ! -e "$ruta" ]; then
    echo "La ruta '$ruta' no existe."
    exit 1  # Retornar 1 si la ruta no existe
fi

# Verificar si es un archivo o un directorio
if [ -f "$ruta" ]; then
    echo "'$ruta' es un archivo."
elif [ -d "$ruta" ]; then
    echo "'$ruta' es un directorio."
else
    echo "'$ruta' no es ni un archivo ni un directorio."
fi

exit 0  # Retornar 0 si todo ha ido bien
