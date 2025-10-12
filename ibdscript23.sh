#!/bin/bash


if [ $# -ne 1 ]; then
    echo "Error: Debes indicar un directorio como parámetro."
    echo "Uso: $0 <directorio>"
    exit 1
fi

dir="$1"


if [ ! -d "$dir" ]; then
    echo "Error: '$dir' no es un directorio válido."
    exit 1
fi

echo "Analizando el contenido de: $dir"
echo "--------------------------------------------"


for item in "$dir"/*; do
    [ -e "$item" ] || continue


    tipo=$(stat -c %F "$item")

    case "$tipo" in
        "regular file")             tipo_humano="Fichero ordinario" ;;
        "directory")                tipo_humano="Directorio" ;;
        "symbolic link")            tipo_humano="Enlace simbólico" ;;
        "block special file")       tipo_humano="Archivo especial de bloque" ;;
        "character special file")   tipo_humano="Archivo especial de carácter" ;;
        "fifo")                     tipo_humano="Tubo con nombre (FIFO)" ;;
        "socket")                   tipo_humano="Socket" ;;
        *)                          tipo_humano="Tipo desconocido" ;;
    esac

    echo "$(basename "$item") → $tipo_humano"
done

echo "--------------------------------------------"
echo "Análisis completado."

