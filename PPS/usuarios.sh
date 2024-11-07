#!/bin/bash

# Archivo de log para errores
LOG_FILE="/var/log/usuarios.sh.log"

# Función para mostrar la información del usuario
mostrar_info_usuario() {
    local usuario=$1

    # Verificar si el usuario existe en el sistema
    if id "$usuario" &>/dev/null; then
        # Obtener la información del usuario
        nombre_usuario=$(getent passwd "$usuario" | cut -d: -f1)
        uid=$(getent passwd "$usuario" | cut -d: -f3)
        gid=$(getent passwd "$usuario" | cut -d: -f4)
        dir_trabajo=$(getent passwd "$usuario" | cut -d: -f6)

        # Mostrar la información
        echo "Nombre de usuario: $nombre_usuario"
        echo "UID: $uid"
        echo "GID: $gid"
        echo "Directorio de trabajo: $dir_trabajo"
    else
        # Si el usuario no existe, mostrar mensaje de error
        echo "Error: El usuario '$usuario' no existe en el sistema."
        echo "$(date) - Error: El usuario '$usuario' no existe en el sistema." >> "$LOG_FILE"
    fi
}

# Bucle para consultar múltiples usuarios
while true; do
    # Solicitar el nombre del usuario
    echo "Introduce el nombre de usuario (o 'salir' para terminar):"
    read usuario

    # Salir del programa si el usuario introduce 'salir'
    if [[ "$usuario" == "salir" ]]; then
        echo "Saliendo del programa."
        break
    fi

    # Mostrar la información del usuario
    mostrar_info_usuario "$usuario"

    # Preguntar si se desea introducir otro usuario
    echo "¿Quieres introducir otro usuario? (sí/no)"
    read respuesta

    if [[ "$respuesta" != "sí" && "$respuesta" != "sí" ]]; then
        echo "Saliendo del programa."
        break
    fi
done
