#!/bin/bash

read -p "ingresa el primer numero: " numero1
read -p "ingresa el segundo numero: " numero2


if [ "$numero1" -gt "$numero2" ]; then
    echo "el numero mayor es: $numero1"
elif [ "$numero2" -gt "$numero1" ]; then
    echo "el numero mayor es: $numero2"
else
    echo "ambos numeros son iguales"

fi
