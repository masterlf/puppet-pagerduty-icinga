# == Class: pagerduty
#
# This class will configure and install the pagerduty config for
#  -Icinga
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { pagerduty:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Kris Buytaert <Kris.Buytaert@gmail.com>
# Update: Frederic Lauret <masterlf@msn.com>
#
#
class pagerduty (
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
  String $manage_packages              = $::pagerduty::params::manage_packages,
  String $use_proxy                    = $::pagerduty::params::use_proxy,
  String $proxy_proto                  = $::pagerduty::params::proxy_proto,
  String $proxy                        = $::pagerduty::params::proxy,
) inherits pagerduty::params {

  class { 'pagerduty::package':
    manage_packages => $manage_packages,
  }

  class { 'pagerduty::config':
    servicekey                   => $servicekey,
    service_notification_period  => $service_notification_period,
    host_notification_period     => $host_notification_period,
    service_notification_options => $service_notification_options,
    host_notification_options    => $host_notification_options,
    icinga_cfg_path              => $icinga_cfg_path,
    icinga_user                  => $icinga_user,
    icinga_group                 => $icinga_group,
    command_file                 => $command_file,
    status_file                  => $status_file,
    use_proxy                    => $use_proxy,
    proxy_proto                  => $proxy_proto,
    proxy                        => $proxy,
  }
}
