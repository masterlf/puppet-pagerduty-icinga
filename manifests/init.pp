# == Class: pagerduty
#
# This class will configure and install the pagerduty config for Icinga or Nagios
#
# Kris Buytaert <Kris.Buytaert@gmail.com>
# Update: Frederic Lauret <masterlf@msn.com>
#
class pagerduty (
  String $servicekey                   = $::pagerduty::params::servicekey,
  String $service_notification_period  = $::pagerduty::params::service_notification_period,
  String $host_notification_period     = $::pagerduty::params::host_notification_period,
  String $service_notification_options = $::pagerduty::params::service_notification_options,
  String $host_notification_options    = $::pagerduty::params::host_notification_options,
  String $monitoring_cfg_path          = $::pagerduty::params::monitoring_cfg_path,
  String $monitoring_user              = $::pagerduty::params::monitoring_user,
  String $monitoring_group             = $::pagerduty::params::monitoring_group,
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
    monitoring_cfg_path          => $monitoring_cfg_path,
    monitoring_user              => $monitoring_user,
    monitoring_group             => $monitoring_group,
    command_file                 => $command_file,
    status_file                  => $status_file,
    use_proxy                    => $use_proxy,
    proxy_proto                  => $proxy_proto,
    proxy                        => $proxy,
  }
}
