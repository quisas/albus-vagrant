#!/bin/bash
#export ALBUS_IP=$(vagrant ssh -c "ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '192\.([0-9]*\.){2}[0-9]*' | grep -v '127.0.0.1'" dev)

export ALBUS_IP=$(vagrant ssh -c "/usr/local/bin/get-ip-address" dev)
echo $ALBUS_IP
