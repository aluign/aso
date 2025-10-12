#!/bin/bash

SALIDA="/tmp/listado_etc.txt"

ls -l /etc > "$SALIDA"
echo "El listado de /etc se ha guardado en $SALIDA"
echo "--------------------------------------------"

cat "$SALIDA"

echo "--------------------------------------------"

NumLineas=$( wc -l < "$SALIDA" )
NumPalabras=$( wc -w < "$SALIDA" )

echo "Número de líneas del archivo: $NumLineas"
echo "Número de palabras del archivo: $NumPalabras"
