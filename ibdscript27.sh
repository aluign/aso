#!/bin/bash

AGENDA="agenda.csv"



validar_telefono() {
    local telefono="$1"
    [[ "$telefono" =~ ^[0-9]{7,15}$ ]]
}

validar_email() {
    local email="$1"
    [[ "$email" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$ ]]
}


añadir_contacto() {
    echo "=== Añadir nuevo contacto ==="
    read -p "Nombre: " nombre
    read -p "Teléfono: " telefono
    read -p "Email: " email

    
    if ! validar_telefono "$telefono"; then
        echo "Teléfono no válido. Debe contener solo dígitos (7 a 15)."
        return
    fi
    if ! validar_email "$email"; then
        echo "Email no válido."
        return
    fi

    echo "${nombre};${telefono};${email}" >> "$AGENDA"
    echo "Contacto añadido correctamente."
}

listar_contactos() {
    echo "=== Lista de contactos ==="
    if [ ! -s "$AGENDA" ]; then
        echo "No hay contactos en la agenda."
        return
    fi
    nl -s". " "$AGENDA" | column -t -s";"
}

buscar_contacto() {
    echo "=== Buscar contacto ==="
    read -p "Introduce nombre o parte del nombre a buscar: " patron
    grep -i "$patron" "$AGENDA" | column -t -s";" || echo "No se encontraron coincidencias."
}

borrar_contacto() {
    echo "=== Borrar contacto ==="
    read -p "Introduce el nombre exacto del contacto a borrar: " nombre

    if grep -q "^${nombre};" "$AGENDA"; then
        grep -v "^${nombre};" "$AGENDA" > "${AGENDA}.tmp" && mv "${AGENDA}.tmp" "$AGENDA"
        echo "Contacto '${nombre}' borrado correctamente."
    else
        echo "No se encontró ningún contacto con ese nombre."
    fi
}

editar_contacto() {
    echo "=== Editar contacto ==="
    read -p "Introduce el nombre exacto del contacto a editar: " nombre

    if ! grep -q "^${nombre};" "$AGENDA"; then
        echo "No existe ningún contacto con ese nombre."
        return
    fi

   
    contacto_actual=$(grep "^${nombre};" "$AGENDA")
    echo "Contacto actual: $contacto_actual"

    read -p "Nuevo nombre (Enter para mantener): " nuevo_nombre
    read -p "Nuevo teléfono (Enter para mantener): " nuevo_telefono
    read -p "Nuevo email (Enter para mantener): " nuevo_email

   
    IFS=";" read -r old_nombre old_telefono old_email <<< "$contacto_actual"
    nuevo_nombre=${nuevo_nombre:-$old_nombre}
    nuevo_telefono=${nuevo_telefono:-$old_telefono}
    nuevo_email=${nuevo_email:-$old_email}

    
    if ! validar_telefono "$nuevo_telefono"; then
        echo "Teléfono no válido."
        return
    fi
    if ! validar_email "$nuevo_email"; then
        echo "Email no válido."
        return
    fi

   
    grep -v "^${nombre};" "$AGENDA" > "${AGENDA}.tmp"
    echo "${nuevo_nombre};${nuevo_telefono};${nuevo_email}" >> "${AGENDA}.tmp"
    mv "${AGENDA}.tmp" "$AGENDA"

    echo "Contacto actualizado correctamente."
}



imprimir_menu() {
    clear
    echo "============================="
    echo "      📒 AGENDA BASH         "
    echo "============================="
    echo "1) Añadir contacto"
    echo "2) Listar contactos"
    echo "3) Buscar contacto"
    echo "4) Borrar contacto"
    echo "5) Editar contacto"
    echo "6) Salir"
    echo "============================="
}


[ ! -f "$AGENDA" ] && touch "$AGENDA"

while true; do
    imprimir_menu
    read -p "Elige una opción [1-6]: " opcion
    case $opcion in
        1) añadir_contacto ;;
        2) listar_contactos ;;
        3) buscar_contacto ;;
        4) borrar_contacto ;;
        5) editar_contacto ;;
        6) echo "Saliendo de la agenda..."; break ;;
        *) echo "Opción no válida." ;;
    esac
    echo ""
    read -p "Presiona ENTER para continuar..." dummy
done

