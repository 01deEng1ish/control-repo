class profile::base {

  if $facts['osfamily'] == 'Debian' {
    include profile::debian
  }

  if $facts['os']['name'] == 'CentOS' {
    include profile::centos
  }

}
