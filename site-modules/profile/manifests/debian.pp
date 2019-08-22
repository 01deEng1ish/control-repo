class profile::debian {
#  include apt

#  apt::source { 'stretch':
#    location => 'http://ftp.us.debian.org/debian/',
#    repos    => 'main contrib',
#  }
}