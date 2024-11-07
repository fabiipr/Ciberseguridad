#!/bin/bash

# Solicitar un número al usuario
echo "Introduce un número:"
read numero

# Verificar si el número es múltiplo de 10
if (( numero % 10 == 0 )); then
    echo "El número $numero es múltiplo de 10."
else
    echo "El número $numero no es múltiplo de 10."
fi
