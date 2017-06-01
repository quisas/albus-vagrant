#!/bin/bash

# Komischerweise nötig, sonst startet Xvfb nicht
export HOME=/home/ubuntu

# Xpra display Nummer
export DISPLAY=:100

xpra start --no-pulseaudio :100

# path
MAINDIR="/opt/albus/main"
VMDIR="/opt/albus/pharo"
PID_FILE="$VMDIR/albus.pid"

NOW=$(date +"%Y%m%d%H%M")

$VMDIR/pharo-ui $VMDIR/albus.image --no-default-preferences > $MAINDIR/log/pharo_$NOW.log 2>&1  &

# Das wäre das bashscript pharo-ui
# echo $! > $PID_FILE

sleep 2
pgrep pharo > $PID_FILE
