#!/bin/bash

SALIDA="/tmp/listado_etc.txt"

ls -l /etc > "$SALIDA"
echo "El listado de /etc se ha guardado en $SALIDA"

cat "$SALIDA"

