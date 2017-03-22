class albus {
  package { 'git':
    ensure => installed,
  }

  package { 'imagemagick':
    ensure => installed,
  }

  package { 'libreoffice':
    ensure => installed,
  }

  # Für ASCII-Captcha-Erzeugung
  package { 'figlet':
    ensure => installed,
  }

  
  # TODO Brauchts das? Wir starten evt. explizit von den folders.
  # file { '/opt/albus/main/pharo':
  #   ensure => 'link',
  #   target => '/opt/albus/pharo',
  # }

  # Symlink zum schulspezifischen Code (Eigenes Repo)
  file { '/opt/albus/main/school':
    ensure => 'link',
    target => '/opt/albus/school',
    owner => "ubuntu",
    group => "ubuntu",
    require => Vcsrepo["/opt/albus/main"]
  }

  # Arbeits-Verzeichnisse, die die Applikation benötigt
  file { ["/opt/albus/main/tmp", "/opt/albus/main/log_objects", "/opt/albus/main/log"]:
    ensure => 'directory',
    owner => "ubuntu",
    group => "ubuntu",
    require => Vcsrepo["/opt/albus/main"],
  }


	file { "/opt/albus/server/run-task.sh":
		ensure => present,
    owner => "ubuntu",
    group => "ubuntu",
    mode => "+x",
    source => "puppet:///modules/albus/run-task.sh"
  }
  
  # Haupt Datei-Repo
  vcsrepo { "/opt/albus/main":
    ensure   => latest,
    owner    => 'ubuntu',
    group    => 'ubuntu',
    provider => git,
    require  => [ Package["git"] ],

    # TODO Echtes repo und branch URL nehmen
    source => "https://github.com/quisas/albus.git",
    revision => 'master',
  }

  # Schulspezifisches Datei-Repo
  vcsrepo { "/opt/albus/school":
    ensure   => latest,
    owner    => 'ubuntu',
    group    => 'ubuntu',
    provider => git,
    require  => [ Package["git"] ],
    source => "https://github.com/quisas/albus-school-hogwarts.git",
    revision => 'master',
  }

  #
  # Cron Jobs
  #
  
  cron { 'hourly':
    command => 'cd /opt/albus/server && ./run-task.sh runHourlyTasks 240',
    user    => 'ubuntu',
    minute  => 1,
  }

  cron { 'midhourly':
    command => 'cd /opt/albus/server && ./run-task.sh runMidHourlyTasks 240',
    user    => 'ubuntu',
    minute  => 30,
  }

  cron { 'nightly':
    command => 'cd /opt/albus/server && ./run-task.sh runNightlyTasks 240',
    user    => 'ubuntu',
    hour    => 2,
    minute  => 3,
  }

  cron { 'nightly2':
    command => 'cd /opt/albus/server && ./run-task.sh runNightlyTasks2 240',
    user    => 'ubuntu',
    hour    => 2,
    minute  => 18,
  }
  
  cron { 'weekly':
    command => 'cd /opt/albus/server && ./run-task.sh runWeeklyTasks',
    user    => 'ubuntu',
    hour    => 2,
    minute  => 23,
    weekday => 'sun'
  }

  cron { 'daily':
    command => 'cd /opt/albus/server && ./run-task.sh runDailyTasks',
    user    => 'ubuntu',
    hour    => 12,
    minute  => 5,
  }

  cron { 'all5minutes':
    command => 'cd /opt/albus/server && ./run-task.sh runAllFiveMinutesTasks',
    user    => 'ubuntu',
    minute  => '*/5',
  }
  
  # Pharo Image save. Achtung: Problem, die Verbindungen werden kurzzeitig unterbrochen. Nicht zu haeufig machen
  cron { 'saveTheImage':
    command => 'cd /opt/albus/server && ./run-task.sh runSaveImageTask',
    user    => 'ubuntu',
    hour    => '6-20/6',
    minute  => 16,
  }

  # Image snapshot machen, immer etwas nach dem obigen image save
  cron { 'backupImage':
    command => 'cd /opt/albus/server/ && ./backup-image-snapshot.sh',
    user    => 'ubuntu',
    hour    => '6-20/6',
    minute  => 25,
  }

}
