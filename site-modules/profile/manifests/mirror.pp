class profile::mirror {
  include apache

  package { 'apt-mirror':
    ensure => 'latest',
  }

}
