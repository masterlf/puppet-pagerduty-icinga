# this class provide params for the module
#
# @example
#   inherits pagerduty::params
#
class pagerduty::params {
  $servicekey                   = ''
  $service_notification_period  = '24x7'
  $host_notification_period     = '24x7'
  $service_notification_options = 'w,u,c,r,f'
  $host_notification_options    = 'd,u,r,f'
  $monitoring_cfg_path          = '/etc/icinga'
  $monitoring_user              = 'icinga'
  $monitoring_group             = 'icinga'
  $manage_packages              = 'yes'
  $use_proxy                    = 'no'
  $proxy_proto                  = 'https'
  $proxy                        = ''

  case $facts['monitoring_system'] {
    icinga: {
      $command_file = '/var/spool/icinga/cmd/icinga.cmd'
      $status_file  = '/var/spool/icinga/status.dat'
    }
    nagios: {
      $command_file = '/var/lib/nagios3/rw/nagios.cmd'
      $status_file  = '/var/cache/nagios3/status.dat'
    }
    default: {
      notify {'Monitoring is not detected !': }
    }
  }
}
