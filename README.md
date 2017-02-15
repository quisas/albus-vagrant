# Vagrant Konfiguration für Albus
Vagrant erzeugt ein Ubuntu Xenial Server und installiert alle Komponenten für Albus. Die Serverkonfiguration wird mittels Puppet direkt von Vagrant gemacht.

- Pharo Smalltalk
- Albus Smalltalk Code
- Diverse apt-Packages

# vagrant up

Erstellt die VM neu oder startet eine vorhandene VM.

# Etc

scripts/xpra_to_albus.sh
vagrant ssh

Auf Pharo kommt man mittels Xpra remote screen.