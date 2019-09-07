class profile::jenkins::slave {
  class { 'jenkins::slave':
    slave_name               => 'jenkins1.oldenglish.net',
    masterurl                => 'http://jenkins.oldenglish.net:8080',
    ui_user                  => 'oldenglish',
    ui_pass                  => 'password',
    version                  => '3.17',
    executors                => 4,
    disable_ssl_verification => true,
  }
}