class pharo {

  # Mail Transport Agent
  package { 'postfix':
    ensure => installed,
  }

  # X11 forwarding
  package { 'xauth':
    ensure => installed,
  }

  # Remote Screen
  package { 'xpra':
    ensure => installed,
  }

  # Monit, um Albus automatisch zu starten und zu überwachen
  package { 'monit':
    ensure => installed,
  }

  # Für Pharo 32bit
  exec { "provide 32bit":
	  command  => "/usr/bin/dpkg --add-architecture i386 && apt-get update",
		cwd      => "/opt/albus/server",
    user => "root",
	}

  $lib32_packages = ['libc6:i386', 'zlib1g:i386', 'libncurses5:i386', 'libbz2-1.0:i386', 'libssl1.0.0:i386', 'libX11.6:i386', 'libGL.1:i386', 'libasound2:i386']
  
  package { $lib32_packages:
    ensure => installed,
    require => Exec["provide 32bit"],
  }
  
  # Haupt Installations-Verzeichnisse
  file { ["/opt/albus", "/opt/albus/install", "/opt/albus/pharo", "/opt/albus/server"]:
    ensure => 'directory',
    owner => "ubuntu",
    group => "ubuntu",
  }

  # Symlink vom Pharo workingDir zum Haupt-Verzeichnis von Albus
  file { '/opt/albus/pharo/main':
    ensure => 'link',
    target => '/opt/albus/main',
  }
  
	file { "/opt/albus/install/installAlbus.st":
		ensure => present,
    owner => "ubuntu",
    group => "ubuntu",
    source => "puppet:///modules/pharo/installAlbus.st"
  }

  file { "/opt/albus/server/start-albus.sh":
		ensure => present,
    owner => "ubuntu",
    group => "ubuntu",
    mode => "+x",
    source => "puppet:///modules/pharo/start-albus.sh",
  }

  file { "/opt/albus/server/stop-albus.sh":
		ensure => present,
    owner => "ubuntu",
    group => "ubuntu",
    mode => "+x",
    source => "puppet:///modules/pharo/stop-albus.sh",
  }
  

	# Get pharo via Web
	exec { "get pharo":
		command  => "curl get.pharo.org/50+vm | bash && mv Pharo.image albus.image && mv Pharo.changes albus.changes",
		cwd      => "/opt/albus/pharo",
		path     => "/usr/bin:/usr/sbin:/bin",
		before    => Exec["install albus"],
    require => Package[$lib32_packages],
		creates  => "/opt/albus/pharo/albus.image",
    user => "ubuntu",
	}

	# Install Albus
	exec { "install albus":
		command  => "/opt/albus/pharo/pharo albus.image --no-default-preferences st /opt/albus/install/installAlbus.st",
		cwd      => "/opt/albus/pharo",
    user => "ubuntu",
		before   => Exec["run albus"],
    unless => '/usr/bin/pgrep pharo',
	}

  # Running Albus
  exec { "run albus":
	  command  => "/opt/albus/server/start-albus.sh",
		cwd      => "/opt/albus/server",
    user => "ubuntu",
    require => [Package['xpra'], File['/opt/albus/server/start-albus.sh']],
    unless => '/usr/bin/pgrep pharo',
	}


  # # Output info for connecting to Albus Web-Application
  # exec { 'output web URL':
  #   # path      => '/bin',
  #   command   => "ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '192\.([0-9]*\.){2}[0-9]*' | grep -v '127.0.0.1'",
  #   logoutput => true,
  #   require => Exec['run albus'],
  # }

}
