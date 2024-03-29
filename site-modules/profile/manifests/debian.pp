class profile::debian {
  include apt

  apt::source { 'stretch':
    location => 'http://mirror/debian/',
    repos    => 'main contrib',
  }

  package { ['aptitude','vim']:
    ensure  => installed,
  }

}