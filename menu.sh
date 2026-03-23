#!/bin/bash

export FILENAME=${FILENAME:-"default"}


while true; do
	echo "Opcion 1, crear entorno"
	echo "Opcion 2, "
	echo "Opcion 3"
	echo "Opcion 4"
	echo "Opcion 5"
	echo "Opcion 6"
	read -p "Opcion nro: "	opcion

	case $opcion in
		1)
			mkdir EPNro1
			cd EPNro1
			mkdir -p {salida,entrada,procesado}
			;;
		2)
			nohup ./consolidar.sh &
                       	;;
                3)
			sort -k5 -nr ~/TP1/EPNro1/salida/FILENAME.txt | head -n 10
			;;
		6)
			echo "salir"
			break
			;;
	esac
done
