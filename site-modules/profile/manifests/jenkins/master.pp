class profile::jenkins::master {
  class { 'jenkins::master':
    version => '3.17',
  }

  class { 'jenkins':
    configure_firewall => true,
    executors          => 0,
    plugin_hash => {
      'apache-httpcomponents-client-4-api' => {},
      'bouncycastle-api' => {},
      'cloudbees-folder' => {},
      'command-launcher' => {},
      'conditional-buildstep' => {},
      'config-file-provider' => {},
      'configuration-as-code' => {},
      'display-url-api' => {},
      'durable-task' => {},
      'git' => {},
      'git-client' => {},
      'gitlab' => {},
      'javadoc' => {},
      'jaxb' => {},
      'job-dsl' => {},
      'jdk-tool' => {},
      'jsch' => {},
      'junit' => {},
      'mailer' => {},
      'managed-scripts' => {},
      'matrix-project' => {},
      'maven-plugin' => {},
      'node-iterator-api' => {},
      'parameterized-trigger' => {},
      'plain-credentials' => {},
      'project-inheritance' => {},
      'promoted-builds' => {},
      'rebuild' => {},
      'run-condition' => {},
      'scm-api' => {},
      'script-security' => {},
      'sphere-cloud' => {},
      'ssh-credentials' => {},
      'ssh-slaves' => {},
      'token-macro' => {},
      'trilead-api' => {},
      'workflow-api' => {},
      'workflow-basic-steps' => {},
      'workflow-durable-task-step' => {},
      'workflow-job' => {},
      'workflow-scm-step' => {},
      'workflow-step-api' => {},
      'workflow-support' => {},
    },
  }

#  firewall { '188 allow port 8080 access for Jenkins':
#    dport  => 8080,
#    proto  => tcp,
#    action => accept,
#  }

}