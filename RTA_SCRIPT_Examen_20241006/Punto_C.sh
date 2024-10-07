#!/bin/bash

echo "Creacion de usuairos y grupos con la misma clave del usuario"
sudo useradd -m -s /bin/bash -p "$(sudo grep $(whoami) /etc/shadow | awk -F ':' '{ print $2 }')" -G p1c2_2024_gAlumno p1c2_2024_A1
sudo useradd -m -s /bin/bash -p "$(sudo grep $(whoami) /etc/shadow | awk -F ':' '{ print $2 }')" -G p1c2_2024_gAlumno p1c2_2024_A2
sudo useradd -m -s /bin/bash -p "$(sudo grep $(whoami) /etc/shadow | awk -F ':' '{ print $2 }')" -G p1c2_2024_gAlumno p1c2_2024_A3
sudo useradd -m -s /bin/bash -p "$(sudo grep $(whoami) /etc/shadow | awk -F ':' '{ print $2 }')" -G p1c2_2024_gProfesores p1c2_2024_P1


echo 
echo "Ajustamos los permisos"
sudo chown p1c2_2024_A1:p1c2_2024_A1 /Examenes-UTN/alumno_1
sudo chown p1c2_2024_A2:p1c2_2024_A2 /Examenes-UTN/alumno_2
sudo chown p1c2_2024_A3:p1c2_2024_A3 /Examenes-UTN/alumno_3
sudo chown p1c2_2024_P1:p1c2_2024_gProfesores /Examenes-UTN/profesores

echo
echo"Cambio los permisos"

sudo chmod 750 /Examenes-UTN/alumno_1
sudo chmod 760 /Examenes-UTN/alumno_2
sudo chmod 700 /Examenes-UTN/alumno_3
sudo chmod 773 /Examenes-UTN/profesores

echo
echo "Crear un archivo “validar.txt” con la salida del comando whoami"
echo 
sudo -su whoami > /Examenes-UTN/alumnos_1/validar1.txt p1c2_2024_A1
sudo -su whoami > /Examenes-UTN/alumnos_2/validar2.txt p1c2_2024_A2
sudo -su whoami > /Examenes-UTN/alumnos_3/validar3.txt p1c2_2024_A3
sudo -su whoami > /Examenes-UTN/profesores/validar4.txt p1c2_2024_P1

echo 
echo "Ejercicio Terminado"

