class profile::docker(
  Array[String] $docker_users = [],
) {
  class { 'docker':
    docker_users => $docker_users,
  }
}