class profile::gitlab {
  package { 'postfix':
    ensure => 'installed',
  }

  class { 'gitlab':
    external_url   => 'http://gitlab.oldenglish.net',
    require        => Package['postfix'],
  }

  firewall { '100 allow http and https access':
    dport  => [80, 443],
    proto  => tcp,
    action => accept,
  }

}
