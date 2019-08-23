class profile::gitlab {

  package { 'postfix':
    ensure => 'installed',
  }

  class { 'gitlab':
    external_url   => 'http://gitlab.oldenglish.net',
    require        => Package['postfix'],
  }

}
