#!/bin/bash

SSH_FILE="/tmp/xpra_to_albus.ssh_config"
vagrant ssh-config --host xpra_albus > $SSH_FILE
SSH_COMMAND="ssh -F $SSH_FILE"

# Weitere Optionen: --jpeg-quality=50 --compress=7
cd /Applications/internet/Xpra.app/Contents && Helpers/Xpra attach ssh/xpra_albus/100 --ssh="$SSH_COMMAND"
