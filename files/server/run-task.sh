#!/bin/bash

OUTPUTFILE="/tmp/albus_runTask_$1_output.txt"
MAXTIME=${2:-60}
HOSTNAME=`hostname`

# Vorheriges Outputfile löschen
rm -f $OUTPUTFILE

# Albus via http kontaktieren
STATUS=$(curl --silent --show-error --max-time $MAXTIME -w "%{http_code}" -o $OUTPUTFILE http://$HOSTNAME/runTask/$1)

if [ $STATUS -ne 200 ]; then
        echo "Fehler in Task $1:"
        cat $OUTPUTFILE
        exit 1
fi
