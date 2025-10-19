#!/bin/bash


OUTFILE="archivos_peligrosos.txt"
START_DIR="${1:-.}"


EXCLUDE_PATHS=(/proc /sys /dev /run /mnt /media)

PRUNE_EXPR=()
for p in "${EXCLUDE_PATHS[@]}"; do
  PRUNE_EXPR+=( -path "$p" -prune -o )
done


echo "Buscando ficheros world-writable (others write) desde: $START_DIR" > "$OUTFILE"
echo "Excluyendo: ${EXCLUDE_PATHS[*]}" >> "$OUTFILE"
echo "Fecha: $(date)" >> "$OUTFILE"
echo "----------------------------------------" >> "$OUTFILE"


sudo find "$START_DIR" "${PRUNE_EXPR[@]}" -type f -perm -0002 -print 2>/dev/null | while IFS= read -r f; do
   
    realpath "$f"
done >> "$OUTFILE"


echo "" >> "$OUTFILE"
echo "Total encontrado: $(wc -l < "$OUTFILE" | tr -d ' ')" >> "$OUTFILE"
echo "Resultado guardado en: $OUTFILE"
