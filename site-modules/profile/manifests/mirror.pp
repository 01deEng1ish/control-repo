class profile::mirror {
  require apache
  require profile::firewall::allow_http

  package { 'apt-mirror':
    ensure => 'latest',
  }

}
