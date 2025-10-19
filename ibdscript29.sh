#!/bin/bash


obtener_ip_local() {
    ip_local=$(hostname -I | awk '{print $1}')
    echo "$ip_local"
}


obtener_prefijo_ip() {
    local ip=$1
    prefijo=$(echo "$ip" | cut -d'.' -f1-3)
    echo "$prefijo"
}


obtener_datos_red() {
  
    interfaz=$(ip route | grep default | awk '{print $5}')
    datos=$(ip addr show "$interfaz" | grep "inet " | head -n 1)
    
    ip_cidr=$(echo "$datos" | awk '{print $2}')
    broadcast=$(echo "$datos" | awk '{print $4}')
    mascara=$(ipcalc "$ip_cidr" | grep "Netmask:" | awk '{print $2}')
    red=$(ipcalc "$ip_cidr" | grep "Network:" | awk '{print $2}')

    echo "Interfaz: $interfaz"
    echo "Red: $red"
    echo "Broadcast: $broadcast"
    echo "Máscara: $mascara"
}


comprobar_ip_red() {
    local prefijo=$1
    local salida=$2

    echo "Comprobando IPs en la red ${prefijo}.0/24..."
    echo "--------------------------------------------" >> "$salida"
    echo "Dirección IP     Estado" >> "$salida"
    echo "--------------------------------------------" >> "$salida"

    for i in $(seq 1 254); do
        ip="${prefijo}.${i}"
    
        ping -c1 -W1 "$ip" &>/dev/null
        if [ $? -eq 0 ]; then
            echo "$ip     OCUPADA" | tee -a "$salida"
        else
            echo "$ip     LIBRE" | tee -a "$salida"
        fi
    done
}


informe="informe_ips_$(date +%Y%m%d_%H%M%S).txt"

echo "Generando informe de IPs libres y ocupadas..."
echo "==============================================" > "$informe"


ip_local=$(obtener_ip_local)
echo "IP local del equipo: $ip_local" | tee -a "$informe"


prefijo=$(obtener_prefijo_ip "$ip_local")
echo "Prefijo de red: $prefijo.0/24" | tee -a "$informe"
echo "" >> "$informe"


obtener_datos_red | tee -a "$informe"
echo "" >> "$informe"


comprobar_ip_red "$prefijo" "$informe"

echo ""
echo "Informe generado correctamente: $informe"
