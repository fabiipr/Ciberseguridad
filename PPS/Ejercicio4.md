#!/bin/bash

# A. Comprobar si se han recibido parámetros
if [ "$#" -eq 0 ]; then
    echo "No has introducido ningún parámetro."
    exit 1
fi

# B. Si se han recibido parámetros
echo "Se han recibido $# parámetros."
echo "Los parámetros son:"

# Mostrar los parámetros
for param in "$@"; do
    echo "$param"
done
