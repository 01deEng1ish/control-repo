class profile::jenkins {
  require jenkins

  firewall { '188 allow port 8080 access for Jenkins':
    dport  => 8080,
    proto  => tcp,
    action => accept,
  }
}