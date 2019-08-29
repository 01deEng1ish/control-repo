class profile::gitlab {
  require profile::firewall::allow_http

  class { 'postfix':
#    mta           => true,
    mydestination => 'gitlab.oldenglish.net',
    mynetworks    => '127.0.0.0/8, 192.168.122.0/24',
    myorigin      => 'oldenglish.net',
  }

  class { 'gitlab':
    external_url   => 'http://gitlab.oldenglish.net',
    require        => Class['postfix'],
  }

}
