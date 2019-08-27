# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include pagerduty::config
class pagerduty::config (
  String $servicekey                   = $::pagerduty::params::servicekey,
  String $service_notification_period  = $::pagerduty::params::service_notification_period,
  String $host_notification_period     = $::pagerduty::params::host_notification_period,
  String $service_notification_options = $::pagerduty::params::service_notification_options,
  String $host_notification_options    = $::pagerduty::params::host_notification_options,
  String $icinga_cfg_path              = $::pagerduty::params::icinga_cfg_path,
  String $icinga_user                  = $::pagerduty::params::icinga_user,
  String $icinga_group                 = $::pagerduty::params::icinga_group,
  String $command_file                 = $::pagerduty::params::command_file,
  String $status_file                  = $::pagerduty::params::status_file,
  String $use_proxy                    = $::pagerduty::params::use_proxy,
  String $proxy_proto                  = $::pagerduty::params::proxy_proto,
  String $proxy                        = $::pagerduty::params::proxy,
) inherits pagerduty::params {
  $mon = $facts['monitoring_system']

  file {"${icinga_cfg_path}/objects/pagerduty_icinga.cfg":
    ensure  => present,
    content => template('pagerduty/pagerduty_icinga.cfg.erb'),
    owner   => $icinga_user,
    group   => $icinga_group,
  }

  file {"/usr/lib/${mon}/pagerduty.pl":
    ensure  => present,
    content => template('pagerduty/pagerduty.pl.erb'),
    owner   => $icinga_user,
    group   => $icinga_group,
    mode    => '0755',
  }

  file {"/usr/lib/cgi-bin/${mon}/pagerduty.cgi":
    ensure  => present,
    content => template('pagerduty/pagerduty.cgi.erb'),
    owner   => $icinga_user,
    group   => $icinga_group,
    mode    => '0755',
  }

  cron {'pagerduty':
    ensure  => present,
    user    => $icinga_user,
    command => "/usr/lib/${mon}/pagerduty.pl flush",
  }
}
