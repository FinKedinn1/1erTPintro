#!/bin/bash

export FILENAME=${FILENAME:-"default"}


while true; do
	echo "Opcion 1, crear entorno"
	echo "Opcion 2, copiamos el txt de entrada en FILENAME y movemos el archivo que ingreso el usuario a salida"
	echo "Opcion 3, si FILENAME.txt existe, mostramos los alumnos ordenados por padron"
	echo "Opcion 4, si FILENAME.txt existe, mostramos las 10 notas mas altas de los alumnos"
	echo "Opcion 5, solicitamos el nro de padron y devolvemos la informacion del mismo"
	echo "Opcion 6, EXIT"
	read -p "Opcion nro: "	opcion

	case $opcion in
		1)
			mkdir EPNro1
			cd EPNro1
			mkdir -p {salida,entrada,procesado}
		;;
		2)
			nohup "$HOME/TP1/EPNro1/consolidar.sh" &
		;;
		3)
			if [ -f "$HOME/TP1/EPNro1/salida/$FILENAME.txt" ]; then
				sort -n -k1 "$HOME/TP1/EPNro1/salida/$FILENAME.txt"
			else
				echo "El archivo no existe"
			fi
		;;
		4)	if [ -f "$HOME/TP1/EPNro1/salida/$FILENAME.txt" ]; then
				# -k5: ordena la columna 5 (la nota)
				#-n: ordena numericamente
				#-r: reverse (de mayor a menor)
				#head -n: recorta la salida para mostrar 10 resultados
				sort -n -k5 -r "$HOME/TP1/EPNro1/salida/$FILENAME.txt" | head -n 10
			else
				echo "EL archivo no existe"
			fi
		;;
		5)
			echo -n "Ingrese un padron: "
			read padron
			if [ -f "$HOME/TP1/EPNro1/salida/$FILENAME.txt" ]; then
				# Usando ^ para que solo coincida el inicio
				grep "^$padron" "$HOME/TP1/EPNro1/salida/$FILENAME.txt"
			else
				echo "El archivo no existe"
			fi
		;;
		6)
			echo "salir"
			break
		;;
	esac
done
