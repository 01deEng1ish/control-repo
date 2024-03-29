class profile::base {
  include my_fw

  if $facts['osfamily'] == 'Debian' {
    include profile::debian
  }

  if $facts['os']['name'] == 'CentOS' {
    include profile::centos
  }

  package { 'git': ensure => latest }

}
