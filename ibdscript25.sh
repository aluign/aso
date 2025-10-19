#!/bin/bash



        echo "Usuarios con IP registrada:"
        echo "---------------------------"
        last | egrep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" || echo "No hay registros>


