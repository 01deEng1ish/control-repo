class profile::centos {
  yumrepo { 'local':
    ensure       => absent,
    baseurl      => 'http://mirror/centos/7',
    enabled      => 1,
    gpgcheck     => 0,
    descr        => 'local',
    http_caching => 'none',
  }

  yumrepo { ['base', 'updates', 'extras']:
    enabled => 1,
  }

  package { 'unzip': ensure => installed }

}
