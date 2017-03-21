class server {

  # Besser als top
  package { 'htop':
    ensure => installed,
  }
  
	file { "/etc/network/if-up.d/show-ip-address":
		ensure => present,
    owner => "root",
    group => "root",
    mode => "+x",
    source => "puppet:///modules/server/show-ip-address"
  }

  file { "/usr/local/bin/get-ip-address":
		ensure => present,
    owner => "root",
    group => "root",
    mode => "+x",
    source => "puppet:///modules/server/get-ip-address"
  }

  file { "/etc/update-motd.d/99-albus":
		ensure => present,
    owner => "root",
    group => "root",
    mode => "+x",
    source => "puppet:///modules/server/99-albus"
  }

  
}
