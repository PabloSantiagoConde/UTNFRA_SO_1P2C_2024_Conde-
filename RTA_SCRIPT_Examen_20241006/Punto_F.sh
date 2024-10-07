#!/bin/bash

echo "Filtros Avanzados"

echo "Mi IP Publica es: $(curl -s ifconfig.me)" >Filtro_Avanzado.txt
echo "Mi usuario es: $(whoami)" >> Filtro_Avanzado.txt
echo "El Hash de mi usuario es: $(sudo grep $(whoami) /etc/shadow | awk -F ':' '{ print $2 }')" >> Filtro_Avanzado.txt
echo "La URL de mi repositorio es : git@github.com:PabloSantiagoConde/UTNFRA_SO_1P2C_2024_Conde-.git" >> Filtro_Avanzado.txt

cat Filtro_Avanzado.txt
