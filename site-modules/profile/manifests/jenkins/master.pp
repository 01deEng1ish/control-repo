class profile::jenkins::master {

  class { 'jenkins':
    cli_remoting_free  => true,
    configure_firewall => true,
    executors          => 0,
    plugin_hash        => {
      gitlab-plugin     => {},
      git               => {},
      git-client        => {},
      scm-api           => {},
      ssh-credentials   => {},
      workflow-step-api => {},
      workflow-scm-step => {},
      matrix-project    => {},
    }
  }

  class { 'jenkins::master': }
}

  #  firewall { '188 allow port 8080 access for Jenkins':
#    dport  => 8080,
#    proto  => tcp,
#    action => accept,
#  }

#     plugin_hash => {
#       'display-url-api' => {},
#       'apache-httpcomponents-client-4-api' => {},
#       'bouncycastle-api' => {},
#       'cloudbees-folder' => {},
#       'command-launcher' => {},
#       'conditional-buildstep' => {},
#       'config-file-provider' => {},
#       'configuration-as-code' => {},
#       'durable-task' => {},
#       'javadoc' => {},
#       'jaxb' => {},
#       'job-dsl' => {},
#       'jdk-tool' => {},
#       'jsch' => {},
#       'junit' => {},
#       'mailer' => {},
#       'managed-scripts' => {},
#       'maven-plugin' => {},
#       'node-iterator-api' => {},
#       'parameterized-trigger' => {},
#       'plain-credentials' => {},
#       'project-inheritance' => {},
#       'promoted-builds' => {},
#       'rebuild' => {},
#       'run-condition' => {},
#       'script-security' => {},
#       'sphere-cloud' => {},
#       'ssh-slaves' => {},
#       'token-macro' => {},
#       'trilead-api' => {},
#       'workflow-api' => {},
#       'workflow-basic-steps' => {},
#       'workflow-durable-task-step' => {},
#       'workflow-job' => {},
#       'workflow-support' => {},
#     },