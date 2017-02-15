Author fullName: 'AlbusDumbledore'.

Gofer new
			url: 'http://smalltalkhub.com/mc/AndreasBrodbeck/Albus/main';
      package: 'ConfigurationOfAlbus';
      load.

(Smalltalk at: #ConfigurationOfAlbus) loadDemo.

"Datenbank mit Demo-Schule neu aufsetzen"
ALAlbusInstaller installDemo.

"Speichern und quit"
Smalltalk snapshot: true andQuit: true.