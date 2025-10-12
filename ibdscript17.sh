#!/bin/bash

suma=0

while true; do
    echo -n " introduce un numero ( 0 para terminar): "
    read numero

    if [ "$numero" -eq 0 ];
        then
        echo "la suma total es: $suma"
        break

fi

suma=$((suma + numero))

done