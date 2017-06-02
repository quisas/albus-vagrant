#!/bin/bash

# Dieser Task endet sofort. Der Tasks wird im Hintergrund zu Ende gefuehrt
./run-task.sh saveAndQuitPharo

while pgrep pharo > /dev/null; do sleep 1; done

if [ -e "/opt/albus/pharo/albus.pid" ]; then
        rm -f /opt/albus/pharo/albus.pid
fi
