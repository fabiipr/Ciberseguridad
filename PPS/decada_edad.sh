#!/bin/bash

# Solicitar la edad al usuario
echo "Introduce tu edad (entre 15 y 60 años):"
read edad

# Verificar que la entrada sea un número válido y esté en el rango permitido
if ! [[ "$edad" =~ ^[0-9]+$ ]] || (( edad < 15 || edad > 60 )); then
    echo "Error: Por favor, introduce una edad válida entre 15 y 60 años."
    exit 1
fi

# Obtener el año actual
anio_actual=$(date +"%Y")

# Calcular el año de nacimiento aproximado
anio_nacimiento=$(( anio_actual - edad ))

# Calcular la década
decada=$(( (anio_nacimiento / 10) * 10 ))

# Mostrar el resultado
echo "Si naciste en $anio_nacimiento, naciste en la década de $decada."

