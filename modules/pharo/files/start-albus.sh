#!/bin/bash

# export HOME=/home/ubuntu
export DISPLAY=:100

xpra start --no-pulseaudio :100

# path
MAINDIR="/opt/albus/main"
VMDIR="/opt/albus/pharo"
PID_FILE="$VMDIR/albus.pid"

NOW=$(date +"%Y%m%d%H%M")

$VMDIR/pharo-ui $VMDIR/albus.image --no-default-preferences > $MAINDIR/log/pharo_$NOW.log 2>&1  &

echo $! > $PID_FILE
