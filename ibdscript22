
#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Uso: $0 <ruta_completa_directorio>"
    exit 1
fi

DIRECTORIO="$1"


if [ ! -d "$DIRECTORIO" ]; then
    echo "Error: $DIRECTORIO no es un directorio válido."
    exit 2
fi
as
contador=0

echo "Contenido de $DIRECTORIO:"
echo "-----------------------------"


for entrada in "$DIRECTORIO"/*; do
   
    [ -e "$entrada" ] || continue
    
    if [ -f "$entrada" ]; then
        echo "$(basename "$entrada") -> Fichero"
    elif [ -d "$entrada" ]; then
        echo "$(basename "$entrada") -> Directorio"
    else
        echo "$(basename "$entrada") -> Otro tipo"
    fi
    
    contador=$((contador+1))
done

echo "-----------------------------"
echo "Total de entradas procesadas: $contador"
