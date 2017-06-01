Author fullName: 'AlbusDumbledore'.

Gofer new
			url: 'http://monticello.mindclue.dyndns.org:8753/albus_kshp' username: 'metacello' password: 'm3t4c3ll0';
      package: 'ConfigurationOfAlbusKshp';
      load.

"Damit Passwort drin ist"
Gofer new
			url: 'http://monticello.mindclue.dyndns.org:8753/albus' username: 'metacello' password: 'm3t4c3ll0';
      package: 'ConfigurationOfAlbus';
      load.

(Smalltalk at: #ConfigurationOfAlbusKshp) loadDevelopment.

ALAlbusInstaller installSchool: ALKshpSchoolConfigurator.

Smalltalk snapshot: true andQuit: true.