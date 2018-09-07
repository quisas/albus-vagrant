#!/bin/bash
export ALBUS_IP=$(vagrant ssh -c "/opt/albus/server/get-ip-address" dev)
echo $ALBUS_IP
