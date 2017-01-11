Author fullName: 'AlbusDumbledore'.

Gofer new
			url: 'http://smalltalkhub.com/mc/AndreasBrodbeck/Albus/main';
      package: 'ConfigurationOfAlbus';
      load.

(Smalltalk at: #ConfigurationOfAlbus) loadDemo.

"Vorher löschen, damit beim überschreiben kein Dialog kommt, während dieser Vagrant-Installation"
ALDatabase destroyProductionDatabase.

"Datenbank mit Demo-Schule neu aufsetzen"
ALAlbusInstaller installSchool: ALHogwartsSchoolConfigurator.

"Speichern und quit"
Smalltalk snapshot: true andQuit: true.