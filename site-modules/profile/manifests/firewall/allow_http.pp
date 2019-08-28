class profile::firewall::allow_http {
  firewall { '100 allow http and https access':
    dport  => [80, 443],
    proto  => tcp,
    action => accept,
  }
}