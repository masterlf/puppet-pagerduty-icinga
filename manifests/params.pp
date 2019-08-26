# this class provide params for the module
#
# @example
#   inherits pagerduty::params
#
class pagerduty::params (
  String $servicekey                   = '',
  String $service_notification_period  = '24x7',
  String $host_notification_period     = '24x7',
  String $service_notification_options = 'w,u,c,r,f',
  String $host_notification_options    = 'd,u,r,f',
  String $icinga_cfg_path              = '/etc/icinga/',
  String $icinga_user                  = 'icinga',
  String $icinga_group                 = 'icinga',
){
}
