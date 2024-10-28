#!/bin/bash

# Verificar si no se han pasado parámetros

if [ "$#" -eq 0 ]; then
    echo "No has introducido ningún parámetro."
    exit 1  # Retornar 1 si no se pasan parámetros
fi

# Si hay parámetros, mostrar cuántos se han recibido
echo "Se han recibido $# parámetros:"

# Mostrar los parámetros recibidos
for param in "$@"; do
    echo "- $param"
done

exit 0  # Retornar 0 si se han pasado parámetros
#!/bin/bash

# Verificar si no se han pasado parámetros
if [ "$#" -eq 0 ]; then
    echo "No has introducido ningún parámetro."
    exit 1
fi

# Si hay parámetros, mostrar cuántos se han recibido
echo "Se han recibido $#:"

# Mostrar los parámetros recibidos
for param in "$@"; do
    echo "- $param"
done
