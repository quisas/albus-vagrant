# Vagrant Konfiguration für Albus
Vagrant erzeugt ein Ubuntu Xenial Server und installiert alle Komponenten für Albus. Die Serverkonfiguration wird mittels Ansible direkt von Vagrant gemacht.

- Pharo Smalltalk
- Albus Smalltalk Code
- Diverse apt-Packages
- Div. Linux-Konfigurationen

Für Hilfe zu vagrant Befehlen: vagrant -h

## VM erzeugen

	vagrant up --provision dev

## Etc

- Siehe Tools im Ordner scripts/
- Mittels vagrant ssh gelangt man 
- Auf Pharo kommt man mittels Xpra remote screen.
