#!/bin/bash

echo "Seleccione la operación que desea realizar:"
echo "1) Sumar"
echo "2) Restar"
echo "3) Multiplicar"
echo "4) Dividir"


read -p "Ingrese el número de la operación (1-4): " opcion


read -p "Ingrese el primer número: " num1
read -p "Ingrese el segundo número: " num2

case $opcion in
    1)
        resultado=$((num1 + num2))
        echo "Resultado: $num1 + $num2 = $resultado"
        ;;
    2)
        resultado=$((num1 - num2))
        echo "Resultado: $num1 - $num2 = $resultado"
        ;;
    3)
        resultado=$((num1 * num2))
        echo "Resultado: $num1 * $num2 = $resultado"
        ;;
    4)
        if [ "$num2" -eq 0 ]; then
            echo "Error: división entre cero no permitida"
        else
           
            resultado=$(echo "scale=2; $num1 / $num2" | bc)
            echo "Resultado: $num1 / $num2 = $resultado"
  fi
        ;;
    *)
        echo "Opción inválida. Por favor seleccione 1, 2, 3 o 4."
        ;;
esac
