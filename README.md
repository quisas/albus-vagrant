# Vagrant Konfiguration für Albus
Vagrant erzeugt ein Ubuntu Xenial Server und installiert alle Komponenten für Albus. Die Serverkonfiguration wird mittels Ansible direkt von Vagrant gemacht.

- Pharo Smalltalk
- Albus Smalltalk Code
- Diverse apt-Packages

Für Hilfe zu vagrant Befehlen: vagrant -h

# vagrant up

Erstellt die VM neu oder startet eine vorhandene VM.

# Etc

scripts/xpra_to_albus.sh
vagrant ssh

Auf Pharo kommt man mittels Xpra remote screen.
