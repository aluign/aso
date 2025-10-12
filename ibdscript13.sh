#!/bin/bash

archivo="lista.txt"

while true; do
    echo "======================================"
    echo "             AGENDA"
    echo "======================================"
    echo "1) Añadir un registro"
    echo "2) Buscar un registro"
    echo "3) Listar registros"
    echo "4) Ordenar registros"
    echo "5) Borrar archivo"
    echo "6) Salir"
    echo "--------------------------------------"
    read -p "Elige una opción (1-6): " opcion
    echo "--------------------------------------"

    case $opcion in
        1)
            echo ">>> Añadir un registro"
            read -p "Nombre: " nombre
            read -p "Dirección: " direccion
            read -p "Teléfono: " telefono

         
            echo "$nombre | $direccion | $telefono" >> "$archivo"
            echo "Registro añadido correctamente."
            ;;
        
        2)
            echo ">>> Buscar un registro"
            read -p "Introduce texto a buscar (nombre, dirección o teléfono): " buscar
            echo "--------------------------------------"
            grep -i "$buscar" "$archivo" 2>/dev/null || echo "No se encontraron coincidencias."
            ;;
        
        3)
            echo ">>> Listado completo de la agenda"
            echo "--------------------------------------"
            if [ -s "$archivo" ]; then
                cat "$archivo"
            else
                echo "La agenda está vacía."
            fi
            ;;
        
        4)
            echo ">>> Ordenar registros alfabéticamente por nombre"
            if [ -s "$archivo" ]; then
                sort -o "$archivo" "$archivo"
                echo "Archivo ordenado correctamente."
            else
                echo "No hay registros para ordenar."
            fi
            ;;
        
        5)
            echo ">>> Borrar archivo"
            if [ -e "$archivo" ]; then
                read -p "¿Seguro que deseas borrar la agenda? (s/n): " confirmar
                if [ "$confirmar" = "s" ]; then
                    rm -f "$archivo"
                    echo "Archivo eliminado."
                else
                    echo "Operación cancelada."
                fi
            else
                echo "No existe ningún archivo de agenda para borrar."
            fi
            ;;
        
        6)
            echo "Saliendo del programa..."
            exit 0
            ;;
        
        *)
            echo "Opción no válida. Intenta de nuevo."
            ;;
    esac

    echo "--------------------------------------"
    read -p "Pulsa ENTER para continuar..." pausa
    clear
done
