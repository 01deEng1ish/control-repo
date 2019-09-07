class profile::gitlab {
  include profile::firewall::allow_http

  class { 'gitlab':
    external_url   => 'http://gitlab.oldenglish.net',
  }

}
