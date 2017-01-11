#!/bin/bash

# Weitere Optionen: --jpeg-quality=50 --compress=7
cd /Applications/internet/Xpra.app/Contents && Helpers/Xpra attach ssh/ubuntu@127.0.0.1:2222/100 --ssh="ssh -i /Users/dassi/code/smalltalk/seaside/albus/server-vm/.vagrant/machines/default/virtualbox/private_key"
