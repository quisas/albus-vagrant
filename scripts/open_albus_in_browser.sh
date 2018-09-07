#!/bin/bash
source ./get_albus_ip.sh
python -mwebbrowser http://$ALBUS_IP/
