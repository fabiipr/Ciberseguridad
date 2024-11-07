#!/bin/bash

# Obtener el nombre y número del mes actual
mes=$(date +"%B")
num_mes=$(date +"%m")

# Determinar el número de días del mes
case $num_mes in
    01|03|05|07|08|10|12)
        dias=31
        ;;
    04|06|09|11)
        dias=30
        ;;
    02)
        dias=28
        ;;
    *)
        echo "Error: No se pudo determinar el mes."
        exit 1
        ;;
esac

# Mostrar el resultado
echo "Estamos en $mes, un mes con $dias días."
