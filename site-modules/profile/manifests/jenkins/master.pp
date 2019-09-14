class profile::jenkins::master(
  $slave_agent_port = 40404,
) {
  include profile::base

  # @param port
  #   Jenkins listening HTTP port
  #
  #   Note that this value is used for CLI communication and firewall
  #   configuration.  It does not configure the port on which the jenkins service
  #   listens. (see config_hash)

  # @param slaveagentport
  #   jenkins slave agent

  class { 'jenkins':
    cli_remoting_free  => true,
    configure_firewall => true,
    executors          => 0,
    cli                => true,
    slaveagentport     => $slave_agent_port,
    plugin_hash        => {
      ace-editor                         => {},
      apache-httpcomponents-client-4-api => {},
      authentication-tokens              => {},
      blueocean                          => {},
      blueocean-autofavorite             => {},
      blueocean-bitbucket-pipeline       => {},
      blueocean-commons                  => {},
      blueocean-config                   => {},
      blueocean-core-js                  => {},
      blueocean-dashboard                => {},
      blueocean-display-url              => {},
      blueocean-events                   => {},
      blueocean-git-pipeline             => {},
      blueocean-github-pipeline          => {},
      blueocean-i18n                     => {},
      blueocean-jira                     => {},
      blueocean-jwt                      => {},
      blueocean-personalization          => {},
      blueocean-pipeline-api-impl        => {},
      blueocean-pipeline-editor          => {},
      blueocean-pipeline-scm-api         => {},
      blueocean-rest                     => {},
      blueocean-rest-impl                => {},
      blueocean-web                      => {},
      branch-api                         => {},
      cloudbees-folder                   => {},
      credentials-binding                => {},
      display-url-api                    => { version => '2.3.2' },
      docker-commons                     => {},
      docker-workflow                    => {},
      durable-task                       => {},
      favorite                           => {},
      git                                => {},
      git-client                         => { version => '2.8.5' },
      git-server                         => {},
      github                             => {},
      github-api                         => {},
      github-branch-source               => {},
      gitlab-plugin                      => {},
      htmlpublisher                      => {},
      jackson2-api                       => {},
      jenkins-design-language            => {},
      jira                               => {},
      jquery-detached                    => {},
      jsch                               => {},
      junit                              => {},
      mailer                             => { version => '1.26' },
      matrix-auth                        => { version => '2.4.2' },
      matrix-project                     => {},
      pipeline-build-step                => {},
      pipeline-graph-analysis            => {},
      pipeline-input-step                => {},
      pipeline-milestone-step            => {},
      pipeline-model-api                 => {},
      pipeline-model-declarative-agent   => {},
      pipeline-model-definition          => {},
      pipeline-model-extensions          => {},
      pipeline-stage-step                => {},
      pipeline-stage-tags-metadata       => {},
      plain-credentials                  => {},
      pubsub-light                       => {},
      scm-api                            => {},
      script-security                    => { version => '1.64' },
      ssh-credentials                    => {},
      token-macro                        => {},
      variant                            => {},
      workflow-api                       => {},
      workflow-basic-steps               => {},
      workflow-cps                       => {},
      workflow-cps-global-lib            => {},
      workflow-durable-task-step         => {},
      workflow-job                       => {},
      workflow-multibranch               => {},
      workflow-scm-step                  => {},
      workflow-step-api                  => {},
      workflow-support                   => {},
    }
  }

  class { 'jenkins::master': version => '3.17' }

  firewall { '501 allow Jenkins inbound agent traffic':
    action => 'accept',
    state  => 'NEW',
    dport  => [$slave_agent_port],
    proto  => 'tcp',
  }

#  class { 'jenkins::security': security_model => 'full_control' }
}
