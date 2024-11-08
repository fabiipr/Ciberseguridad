#!/bin/bash

# Archivo de usuarios y archivo de log
usuarios="usuarios.csv"
log="log.log"
intentos=0

# Crear archivo de usuarios y log si no existen
[[ ! -f $usuarios ]] && touch $usuarios
[[ ! -f $log ]] && touch $log

# Función generauser para crear nombre de usuario
generauser() {
  local nombre="$1"
  local apellido1="$2"
  local apellido2="$3"
  local dni="$4"
  local usuario=$(echo "${nombre:0:1}${apellido1:0:3}${apellido2:0:3}${dni:5:3}" | tr '[:upper:]' '[:lower:]')
  echo "$usuario"
}

# Función existe para comprobar existencia del usuario
existe() {
  local usuario="$1"
  grep -q ":$usuario$" "$usuarios"
}

# Función login con tres intentos
login() {
  echo "Iniciando sesión"
  while [ $intentos -lt 3 ]; do
    read -s -p "Usuario: " user
    echo
    if [[ $user == "admin" && $1 == "-root" ]]; then
      return 0
    elif existe "$user"; then
      return 0
    fi
    echo "Usuario incorrecto."
    ((intentos++))
  done
  echo "Acceso denegado."
  exit 1
}

# Función para mostrar el menú
menu() {
  echo "----------$(date '+%d/%m/%Y %H:%M')----------" >> "$log"
  echo "1.- EJECUTAR COPIA DE SEGURIDAD"
  echo "2.- DAR DE ALTA USUARIO"
  echo "3.- DAR DE BAJA AL USUARIO"
  echo "4.- MOSTRAR USUARIOS"
  echo "5.- MOSTRAR LOG DEL SISTEMA"
  echo "6.- SALIR"
}

# Función para copia de seguridad
copia_seguridad() {
  local fecha=$(date '+%d%m%Y_%H-%M-%S')
  zip "copia_usuarios_$fecha.zip" "$usuarios" &>/dev/null
  echo "Copia de seguridad creada: copia_usuarios_$fecha.zip" | tee -a "$log"
  # Mantener sólo 2 copias más recientes
  ls -t copia_usuarios_*.zip | tail -n +3 | xargs -I {} rm -- {}
}

# Función para dar de alta un usuario
alta_usuario() {
  read -p "Nombre: " nombre
  read -p "Apellido 1: " apellido1
  read -p "Apellido 2: " apellido2
  read -p "DNI (8 números y letra): " dni

  local usuario=$(generauser "$nombre" "$apellido1" "$apellido2" "$dni")

  if existe "$usuario"; then
    echo "El usuario ya existe."
  else
    echo "$nombre:$apellido1:$apellido2:$dni:$usuario" >> "$usuarios"
    echo "INSERTADO $nombre:$apellido1:$apellido2:$dni:$usuario el $(date '+%d/%m/%Y a las %H:%M')h" >> "$log"
    echo "Usuario añadido con éxito."
  fi
}

# Función para dar de baja un usuario
baja_usuario() {
  read -p "Nombre de usuario a eliminar: " usuario
  if existe "$usuario"; then
    grep -v ":$usuario$" "$usuarios" > tmpfile && mv tmpfile "$usuarios"
    echo "BORRADO $(grep ":$usuario$" "$usuarios") el $(date '+%d/%m/%Y a las %H:%M')h" >> "$log"
    echo "Usuario eliminado con éxito."
  else
    echo "El usuario no existe."
  fi
}

# Función para mostrar los usuarios
mostrar_usuarios() {
  echo "Lista de usuarios:"
  if [[ -s $usuarios ]]; then
    sort -t ':' -k 5 "$usuarios" | awk -F ':' '{print $5}'
  else
    echo "No hay usuarios registrados."
  fi
}

# Función para mostrar el log del sistema
mostrar_log() {
  echo "Registro del sistema:"
  cat "$log"
}

# Control de acceso y ejecución de menú
if [[ "$1" == "-root" ]]; then
  login "-root"
else
  [[ ! -s $usuarios ]] && echo "No hay usuarios y no estás usando la opción -root. Saliendo." && exit 1
  login
fi

while true; do
  menu
  read -p "Selecciona una opción: " opcion
  case $opcion in
    1) copia_seguridad ;;
    2) alta_usuario ;;
    3) baja_usuario ;;
    4) mostrar_usuarios ;;
    5) mostrar_log ;;
    6) echo "Saliendo." ; exit 0 ;;
    *) echo "Opción inválida" ;;
  esac
done
