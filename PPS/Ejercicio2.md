#!/bin/bash

# Verificar que se ha pasado al menos dos parámetros
if [ "$#" -lt 2 ]; then
    echo "Uso: $0 <otro_parametro> <ruta_del_archivo>"
    exit 1
fi

# Obtener la ruta del archivo del segundo parámetro
archivo="$2"

# Verificar si el archivo existe
if [ ! -e "$archivo" ]; then
    echo "El archivo '$archivo' no existe."
    exit 1
fi

# Mostrar el contenido del archivo
cat "$archivo"

# Mostrar el código de salida del comando cat
exit_code=$?
echo "Código de salida del comando: $exit_code"
