class profile::jenkins {
  require jenkins
  require profile::firewall::allow_http
}