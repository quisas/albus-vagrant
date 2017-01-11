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

  # Besser als top
  package { 'htop':
    ensure => installed,
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

  # file { "/opt/albus/install/installKshpTest.st":
	# 	ensure => present,
  #   owner => "ubuntu",
  #   group => "ubuntu",
  #   source => "puppet:///modules/pharo/installKshpTest.st"
  # }

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



}
