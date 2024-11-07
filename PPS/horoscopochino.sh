#!/bin/bash

# Pedir el año de nacimiento
echo "Introduce tu año de nacimiento (4 cifras):"
read anio

# Validar que el año tiene 4 dígitos y es un número
if ! [[ "$anio" =~ ^[0-9]{4}$ ]]; then
    echo "Error: Por favor, introduce un año válido de 4 cifras."
    exit 1
fi

# Calcular el resto al dividir el año entre 12
resto=$(( anio % 12 ))

# Determinar el animal correspondiente según el resto
case $resto in
    0)
        animal="La rata"
        ;;
    1)
        animal="El buey"
        ;;
    2)
        animal="El tigre"
        ;;
    3)
        animal="El conejo"
        ;;
    4)
        animal="El dragón"
        ;;
    5)
        animal="La serpiente"
        ;;
    6)
        animal="El caballo"
        ;;
    7)
        animal="La cabra"
        ;;
    8)
        animal="El mono"
        ;;
    9)
        animal="El gallo"
        ;;
    10)
        animal="El perro"
        ;;
    11)
        animal="El cerdo"
        ;;
    *)
        echo "Error: No se pudo determinar el animal."
        exit 1
        ;;
esac

# Mostrar el resultado
echo "Según el horóscopo chino, naciste en el año del $animal."
