class profile::base {

  if $facts['osfamily'] == 'Debian' {
    include profile::debian
  }

}
