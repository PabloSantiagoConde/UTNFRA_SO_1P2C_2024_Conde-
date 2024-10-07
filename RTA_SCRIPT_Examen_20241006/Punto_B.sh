#!/bin/bash

DISCO_TP="/dev/sdc"
PART_SIZE="+10M"

sudo fdisk $DISCO_TP << EOF
n
p
1

$PART_SIZE
n
p
2

$PART_SIZE
n
p
3

$PART_SIZE
n
e
4


n
l

$PART_SIZE
n
l

$PART_SIZE
n
l

$PART_SIZE
n
l

$PART_SIZE
n
l

$PART_SIZE
n
l

$PART_SIZE
n
l

$PART_SIZE
w
EOF
NUEVO
[1:37]
echo
echo "Mostrar particionamientos"
sudo fdisk $DISCO_TP -l

echo
echo "Formateando las particiones"

Formateo de las particiones primarias
sudo mkfs.ext4 ${DISCO_TP}1
sudo mkfs.ext4 ${DISCO_TP}2
sudo mkfs.ext4 ${DISCO_TP}3

Formateo de las particiones lógicas (5 a 11)
sudo mkfs.ext4 ${DISCO_TP}5
sudo mkfs.ext4 ${DISCO_TP}6
sudo mkfs.ext4 ${DISCO_TP}7
sudo mkfs.ext4 ${DISCO_TP}8
sudo mkfs.ext4 ${DISCO_TP}9
sudo mkfs.ext4 ${DISCO_TP}10
sudo mkfs.ext4 ${DISCO_TP}11

echo
echo "Montando de forma PERSISTENTE"

echo UUID=38686a72-b4c0-4c93-8392-2c12e74cc290  /Examenes-UTN/alumno_1/parcial_1  ext4  defaults  0  2 | sudo tee -a /etc/fstab
echo PARTUUID=ecdb58b0-0b  /Examenes-UTN/alumno_1/parcial_2  ext4  defaults  0  2 | sudo tee -a /etc/fstab
echo PARTUUID=ecdb58b0-09  /Examenes-UTN/alumno_1/parcial_3  ext4  defaults  0  2 | sudo tee -a /etc/fstab
echo PARTUUID=ecdb58b0-07  /Examenes-UTN/alumno_2/parcial_2  ext4  defaults  0  2 | sudo tee -a /etc/fstab
echo PARTUUID=ecdb58b0-05  /Examenes-UTN/alumno_2/parcial_3  ext4  defaults  0  2 | sudo tee -a /etc/fstab
echo UUID=37c58960-7765-4376-b5e6-aff2e8dd9283  /Examenes-UTN/alumno_3/parcial_1  ext4  defaults  0  2 | sudo tee -a /etc/fstab
echo PARTUUID=ecdb58b0-0a  /Examenes-UTN/alumno_3/parcial_2  ext4  defaults  0  2 | sudo tee -a /etc/fstab
echo PARTUUID=ecdb58b0-08  /Examenes-UTN/alumno_3/parcial_3  ext4  defaults  0  2 | sudo tee -a /etc/fstab
echo PARTUUID=ecdb58b0-06  /Examenes-UTN/profesores          ext4  defaults  0  2 | sudo tee -a /etc/fstab



echo
echo "Muestro montajes"

sudo df -h 
lsblk -f /dev/sdb

echo
echo "Fin del script del punto B"


