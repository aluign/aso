#!/bin/bash


echo "=== Suma del 1 al 1000 con FOR ==="
suma=0
for (( i=1; i<=1000; i++ )); do
    suma=$((suma + i))
done
echo "Resultado con FOR: $suma"
echo "----------------------------------"

echo "=== Suma del 1 al 1000 con WHILE ==="
suma=0
i=1
while [ $i -le 1000 ]; do
    suma=$((suma + i))
    ((i++))
done
echo "Resultado con WHILE: $suma"
echo "----------------------------------"

echo "=== Suma del 1 al 1000 con UNTIL ==="
suma=0
i=1
until [ $i -gt 1000 ]; do
    suma=$((suma + i))
    ((i++))
done
echo "Resultado con UNTIL: $suma"
echo "----------------------------------"
