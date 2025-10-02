#!/bin/bash

if [ $# -ne 1 ];
    then
    echo " error: debes proporcionar un numero como argumento."
    echo " uso: ./tabla_multiplicar.sh <numero>"
    exit 1

fi

n=$1

if ! [[ "$n" =~ ^[0-9]+$ ]];
    then
    echo "error: el argumento debe ser un numero entero positivo."
    exit 1

fi

echo " Tabla de multiplicar del $n:"
for i in {1..10}; do
    resultado=$((i*n))
    echo "$i x $n= $resultado"

done