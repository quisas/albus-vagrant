class nginx {

  package { 'nginx':
    ensure => installed,
  }

  service { 'nginx':
    ensure  => 'running',
    enable  => true,
    require => Package['nginx'],
  }


	file { "/etc/nginx/nginx.conf":
    notify  => Service['nginx'],
		ensure => present,
    #mode    => '0600',
    owner   => 'root',
    group   => 'root',
    require => Package['nginx'],
    source => "puppet:///modules/nginx/nginx.conf"
  }



}
