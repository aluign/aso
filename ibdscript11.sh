#!/bin/bash


if [ $# -ne 2 ]; then
    echo "Error: Debes indicar dos parámetros."
    echo "Uso: $0 <fichero_origen> <fichero_destino>"
    exit 1
fi


origen="$1"
destino="$2"


if [ ! -f "$origen" ]; then
    echo "Error: El fichero origen '$origen' no existe o no es un archivo ordinario."
    exit 1
fi


if [ -e "$destino" ]; then
    echo "Error: Ya existe un archivo, directorio u objeto llamado '$destino'."
    exit 1
fi


cp "$origen" "$destino"


if [ $? -eq 0 ]; then
    echo "Copia realizada correctamente: '$origen' → '$destino'"
else
    echo "Error: No se pudo copiar el archivo."
fi
