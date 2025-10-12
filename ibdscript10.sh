#!/bin/bash

 read -p "Introduce un número: " num

if ! [[ "$num" =~ ^-?[0-9]+$ ]]; then
    echo "Error: Debes introducir un número entero."
    exit 1
fi


if [ $((num % 2)) -eq 0 ]; then
    echo "El número $num es PAR."
else
    echo "El número $num es IMPAR."
fi

   