#!/bin/bash

# Solicitar los dos números al usuario
echo "Introduce el primer número:"
read num1
echo "Introduce el segundo número:"
read num2

# Verificar que las entradas sean números válidos
if ! [[ "$num1" =~ ^-?[0-9]+$ ]] || ! [[ "$num2" =~ ^-?[0-9]+$ ]]; then
    echo "Error: Por favor, introduce solo números enteros."
    exit 1
fi

# Determinar cuál número es menor y cuál es mayor
if (( num1 > num2 )); then
    menor=$num2
    mayor=$num1
else
    menor=$num1
    mayor=$num2
fi

# Calcular la suma de los números en el rango [menor, mayor]
suma=0
for (( i=menor; i<=mayor; i++ )); do
    suma=$(( suma + i ))
done

# Mostrar el resultado
echo "La suma de los números entre $menor y $mayor es: $suma"
