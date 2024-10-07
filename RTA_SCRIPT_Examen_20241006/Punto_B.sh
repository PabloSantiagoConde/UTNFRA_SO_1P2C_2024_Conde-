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

echo
echo "Mostrar particionamientos"
sudo fdisk $DISCO_TP -l

echo
echo "Formateando las particiones"

echo "Formateo de las particiones primarias"
sudo mkfs.ext4 ${DISCO_TP}1
sudo mkfs.ext4 ${DISCO_TP}2
sudo mkfs.ext4 ${DISCO_TP}3

echo "Formateo de las particiones lógicas (5 a 11)"
sudo mkfs.ext4 ${DISCO_TP}5
sudo mkfs.ext4 ${DISCO_TP}6
sudo mkfs.ext4 ${DISCO_TP}7
sudo mkfs.ext4 ${DISCO_TP}8
sudo mkfs.ext4 ${DISCO_TP}9
sudo mkfs.ext4 ${DISCO_TP}10
sudo mkfs.ext4 ${DISCO_TP}11

echo
echo "Montando de forma PERSISTENTE"

echo "${sudo lsblk -no UUID /dev/sdc1}  /Examenes-UTN/alumno_1/parcial_1  ext4  defaults  0  2" | sudo tee -a /etc/fstab
echo "${sudo lsblk -no UUID /dev/sdc2}  /Examenes-UTN/alumno_1/parcial_2  ext4  defaults  0  2" | sudo tee -a /etc/fstab
echo "${sudo lsblk -no UUID /dev/sdc3}  /Examenes-UTN/alumno_1/parcial_3  ext4  defaults  0  2" | sudo tee -a /etc/fstab
echo "${sudo lsblk -no UUID /dev/sdc11} /Examenes-UTN/alumno_2/parcial_1  ext4  defaults  0  2" | sudo tee -a /etc/fstab
echo "${sudo lsblk -no UUID /dev/sdc5}  /Examenes-UTN/alumno_2/parcial_2  ext4  defaults  0  2" | sudo tee -a /etc/fstab
echo "${sudo lsblk -no UUID /dev/sdc6}  /Examenes-UTN/alumno_2/parcial_3  ext4  defaults  0  2" | sudo tee -a /etc/fstab
echo "${sudo lsblk -no UUID /dev/sdc7}  /Examenes-UTN/alumno_3/parcial_1  ext4  defaults  0  2" | sudo tee -a /etc/fstab
echo "${sudo lsblk -no UUID /dev/sdc8}  /Examenes-UTN/alumno_3/parcial_2  ext4  defaults  0  2" | sudo tee -a /etc/fstab
echo "${sudo lsblk -no UUID /dev/sdc9}  /Examenes-UTN/alumno_3/parcial_3  ext4  defaults  0  2" | sudo tee -a /etc/fstab
echo "${sudo lsblk -no UUID /dev/sdc10} /Examenes-UTN/profesores          ext4  defaults  0  2" | sudo tee -a /etc/fstab



echo
echo "Muestro montajes"

sudo df -h 
lsblk -f /dev/sdb

echo
echo "Fin del script del punto B"


