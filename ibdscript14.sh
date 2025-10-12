#!/bin/bash

if [ $# -lt 4 ] || [ $# -gt 5 ]; then
    echo "Error. La sintaxis correcta es:"
    echo "./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]"
    exit 1
fi

accion=$1
nombre=$2
apellido1=$3
apellido2=$4
grupo=$5


id_usuario="alu${apellido1:0:2}${apellido2:0:2}${nombre:0:1}"
id_usuario=$(echo "$id_usuario" | tr '[:upper:]' '[:lower:]') 


if [ "$accion" = "alta" ]; then
    
    if [ -z "$grupo" ]; then
        grupo="$id_usuario"
       
        if ! getent group "$grupo" > /dev/null; then
            groupadd "$grupo"
            echo "Grupo '$grupo' creado."
        else
            echo "El grupo '$grupo' ya existe."
        fi
    else
      
        if ! getent group "$grupo" > /dev/null; then
            echo "Error: el grupo '$grupo' no existe."
            exit 1
        fi
    fi

 
    if id "$id_usuario" &>/dev/null; then
        echo "Error: el usuario '$id_usuario' ya existe."
        exit 1
    else
        useradd -m -g "$grupo" -c "$nombre $apellido1 $apellido2" "$id_usuario"
        echo "Usuario '$id_usuario' creado correctamente."
        echo "Puedes asignarle una contraseña con: sudo passwd $id_usuario"
    fi


elif [ "$accion" = "baja" ]; then
    if id "$id_usuario" &>/dev/null; then
        userdel -r "$id_usuario"
        echo "Usuario '$id_usuario' eliminado correctamente."
    else
        echo "Error: el usuario '$id_usuario' no existe."
    fi


else
    echo "Error. La sintaxis correcta es:"
    echo "./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]"
    exit 1
fi

    
