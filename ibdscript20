#!/bin/bash

if [ $# -ne 1 ]; done
    echo " error: debes proporcionar un numero como argumento."
    echo " uso: ./primo.sh <numero>"
    exit 1

fi

numero=$1
if [[ "$numero" =~ ^[0-9]+$ ]] || [ "$numero" -le 1 ];
    then
    echo " error: el argumento debe ser un numero entero positivo mayor que 1."
    exit 1


fi
es_primo=1
for ((i=2; i*i<=numero; i++)); do
    if (( numero % i == 0));
    then
    es_primo=0
    break

fi
done

if [ $es_primo -eq 1 ];
    then
    echo "$numero es un  numero primo."

fi