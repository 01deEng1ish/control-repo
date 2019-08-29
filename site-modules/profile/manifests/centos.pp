class profile::centos {
  yumrepo { 'local':
    ensure       => present,
    baseurl      => 'http://mirror/centos/7',
    enabled      => 1,
    gpgcheck     => 0,
    descr        => 'local',
    http_caching => 'none',
  }

  yumrepo { ['base', 'updates', 'extras']:
    enabled => 0,
  }

  package { 'deltarpm':
    ensure  => installed,
    require => Yumrepo['local'],
  }

}
