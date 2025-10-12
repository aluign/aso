#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Uso: $0 <ruta_directorio>"
    exit 1
fi

DIRECTORIO="$1"

if [ ! -d "$DIRECTORIO" ]; then
    echo "Error: $DIRECTORIO no es un directorio válido."
    exit 2
fi

ficheros=0
subdirectorios=0

for entrada in "$DIRECTORIO"/*; do
    [ -e "$entrada" ] || continue   
    
    if [ -f "$entrada" ]; then
        ficheros=$((ficheros+1))
    elif [ -d "$entrada" ]; then
        subdirectorios=$((subdirectorios+1))
    fi
done

echo "Directorio analizado: $DIRECTORIO"
echo "Ficheros encontrados: $ficheros"
echo "Subdirectorios encontrados: $subdirectorios"
echo "Total de entradas procesadas: $((ficheros+subdirectorios))"
