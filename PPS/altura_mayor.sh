#!/bin/bash

# Solicitar alturas al usuario
echo "Introduce la altura de la primera persona en centímetros:"
read altura1

echo "Introduce la altura de la segunda persona en centímetros:"
read altura2

echo "Introduce la altura de la tercera persona en centímetros:"
read altura3

# Verificar que las entradas sean números
re='^[0-9]+$'
if ! [[ $altura1 =~ $re ]] || ! [[ $altura2 =~ $re ]] || ! [[ $altura3 =~ $re ]]; then
    echo "Error: Por favor, introduce solo números enteros."
    exit 1
fi

# Determinar la altura mayor
mayor=$altura1

if [ "$altura2" -gt "$mayor" ]; then
    mayor=$altura2
fi

if [ "$altura3" -gt "$mayor" ]; then
    mayor=$altura3
fi

# Convertir a metros
mayor_metros=$(echo "scale=2; $mayor / 100" | bc)

echo "La altura más alta es $mayor_metros metros."
