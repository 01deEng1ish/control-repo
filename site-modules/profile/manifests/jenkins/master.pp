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
      apache-httpcomponents-client-4-api => {},
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
      display-url-api                    => { version => '2.3.2' },
      favorite                           => {},
      git                                => {},
      git-client                         => { version => '2.8.5' },
      gitlab-plugin                      => {},
      jackson2-api                       => {},
      jenkins-design-language            => {},
      jsch                               => {},
      junit                              => {},
      mailer                             => { version => '1.26' },
      matrix-auth                        => { version => '2.4.2' },
      matrix-project                     => {},
      pipeline-build-step                => {},
      pipeline-milestone-step            => {},
      scm-api                            => {},
      script-security                    => { version => '1.64' },
      ssh-credentials                    => {},
      workflow-api                       => {},
      workflow-job                       => {},
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
