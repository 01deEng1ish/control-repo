class role::gitlab {
  include profile::base
  include profile::gitlab

  Class['profile::base']->Class['profile::gitlab']
}