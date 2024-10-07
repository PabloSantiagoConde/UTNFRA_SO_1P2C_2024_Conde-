#!/bin/bash

echo "Creando estructura Asimétrica"

mkdir -p ~/Estructura_Asimetrica/{{correo,clientes}/cartas_{2..100},correo/carteros_{1..10}}


echo "se verificar si está lograda la estructura"

tree  ~/Estructura_Asimetrica/ --noreport | pr -T -s' ' -w 80 --column 4

echo "Lograda"
