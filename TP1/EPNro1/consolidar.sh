#!/bin/bash

#lee el entrada, lo pasa a FILENAME

cat $HOME/TP1/EPNro1/entrada/*.txt >> "$HOME/TP1/EPNro1/salida/$FILENAME.txt"

#movemos cualq archivo en entrada a procesado
mv $HOME/TP1/EPNro1/entrada/*.txt "$HOME/TP1/EPNro1/procesado/"
