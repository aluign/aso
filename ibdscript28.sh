#!/bin/bash


 existe() {   
    local fichero="$1"  

   
    if [ -e "$fichero" ]; then
        echo "El fichero '$fichero' existe."

       
        chmod u+x,g-x,o-x "$fichero"
        echo "Se han actualizado los permisos: ejecutable solo para el propietario."
    else
        echo "El fichero '$fichero' no existe."
    fi
}


if [ $# -eq 0 ]; then
    echo "Uso: $0 nombre_fichero"
    exit 1
fi


existe "$1"
