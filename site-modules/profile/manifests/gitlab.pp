class profile::gitlab {
  require profile::firewall::allow_http

  package { 'postfix':
    ensure => 'installed',
  }

  class { 'gitlab':
    external_url   => 'http://gitlab.oldenglish.net',
    require        => Package['postfix'],
  }

}
