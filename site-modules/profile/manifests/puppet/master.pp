class profile::puppet::master {
  require profile::firewall::allow_http

  firewall { '900 allow puppet master':
    dport  => 8140,
    proto  => tcp,
    action => accept,
  }

}