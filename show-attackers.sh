#!/bin/bash

#Mensaje de error
error() {
echo "Cannot open log file: $1"
}


#variable para saber si son intetos o la ip, 1=intentos 0=ip 
is_count=1

#variable para guardar los intentos fallidos de conexion
count_failed=0

#comprobamos si el parametro esta vacio
if [ -z $1 ]
then
	#si esta vacio ejecuta 
	error
else
	#Comprobamos que el fichero exista
	if  [ ! -f $1 ]
	then
		#el fichero no existe y se le indica con un mensaje de error
		error $1
	else
	echo "Count,IP,Location"
	for i in $(cat $1 | grep Failed |rev | cut -d " " -f 4| rev | sort | uniq -c |sort -nr | sed 's/^[ ]*//;s/ /\t/')
	do
		#Comprobacion de si lo que vamos a leer son los intentos
		if [ $is_count -eq 1 ]
		then
			#comprobamos que hay mas o igual a 10 intentos de acceso
			if [ $i -ge 10 ]
			then
				#guardamos en una variable los intentos
				count_failed=$i
				#cambiamos el valor de is_count para indicar que el siguiente valor es la IP
				is_count=0
			else
			#Salida del programa en caso que sean menos de 10 intentos
			exit 0
			fi
		else
		#mostramos la informacion:
		#intentos, IP, Pais
		echo "$count_failed,$i,$(geoiplookup $i | cut -d " " -f 5-6)"
		is_count=1
		fi
	done
	fi 
fi 
