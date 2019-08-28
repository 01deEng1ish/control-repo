class profile::puppet::master {
  firewall { '100 allow puppet master':
    dport  => 8140,
    proto  => tcp,
    action => accept,
  }

}