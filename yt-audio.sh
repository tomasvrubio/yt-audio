#!/bin/bash

#Cargamos variables entorno usuario
. $HOME/.profile

logWrite "Ejecucion iniciada"

#Nos posicionamos en el directorio en el que esta el script
cd "$(dirname "$0")"

#En el fichero con las listas de reproduccion hay que dejar un espacio en blanco al final.
LIST=./list.cfg
DATE=`date +'%Y%m%d'`
LOG="./log/yt-audio_${DATE}.log"

#Creamos directorio de logs y temporal (solo si no existen ya)
mkdir -p log temp data

#Mantenimiento de logs
logWrite "Eliminamos ficheros de log antiguos:"
find log/ -mtime +10 -name "yt-audio_*.log" -print -exec rm -f {} \; >> $LOG

function logWrite() {
        echo -n "`date +%d/%m/%y-%H:%M:%S` $1 \n" >> $LOG
}

#Borramos los ficheros que hayan podido quedar mal de otra ejecución
logWrite "De ejecuciones pasadas (Si sale algun fichero: Habria que eliminar sus correspondientes descargas de /log/download_nombre_lista.txt):\n `ls temp | grep .mp3`"
rm -f temp/*.mp3

while IFS="|" read usuario_lista mac_lista nombre_lista url_lista
do
        logWrite "Descargando $nombre_lista con url $url_lista"
        youtube-dl -i --download-archive "log/downloaded_${nombre_lista}.txt" --metadata-from-title "%(artist)s - %(title)s" --add-metadata --extract-audio --audio-format mp3 -o "./temp/%(title)s.%(ext)s" "${url_lista}" 

        mkdir -p "data/$nombre_lista"

        if [ `ls -l temp |grep -c mp3` -gt 0 ]; then
                mid3v2 -A "$nombre_lista" temp/*.mp3     
                mv temp/*.mp3 "data/$nombre_lista"
        fi

        gmsync up -U "$mac_lista" -c $usuario_lista "data/$nombre_lista"
done < $LIST 

logWrite "Ejecución finalizada"