#!/bin/bash

if [ -z "$1" ]; then
  echo "Uso: $0 <directorio>"
  exit 1
fi

dir="$1"


if [ ! -d "$dir" ]; then
  echo "Error: el directorio '$dir' no existe."
  exit 1
fi

fecha=$(date +%F)

nombre_dir=$(basename "$dir")

archivo="${fecha}_${nombre_dir}.tar.gz"

tar -czf "$archivo" "$dir"

echo "Archivo creado correctamente: $archivo"
