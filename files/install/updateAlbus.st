Author fullName: '{{albus.school.developerName}}'.

"Neuste Metacello Config holen"
Gofer new
			url: '{{albus.school.monticelloUrl}}';
      package: 'ConfigurationOf{{albus.school.code}}';
      load.

"Spezifische Version laden"
(Smalltalk at: #ConfigurationOfAlbus{{albus.school.code}}) load: '{{albus.school.version}}'.

"Speichern und quit"
Smalltalk snapshot: true andQuit: true.