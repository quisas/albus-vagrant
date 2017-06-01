Author fullName: 'AlbusDumbledore'.

Gofer new
			url: 'http://smalltalkhub.com/mc/quisas/albus/main';
      package: 'ConfigurationOfAlbus';
      load.

(Smalltalk at: #ConfigurationOfAlbus) loadDemo.

"Datenbank mit Demo-Schule neu aufsetzen"
(Smalltalk at: #ALAlbusInstaller) installDemo.

"Speichern und quit"
Smalltalk snapshot: true andQuit: true.