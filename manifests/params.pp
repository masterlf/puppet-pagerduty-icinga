# this class provide params for the module
#
# @example
#   inherits pagerduty::params
#
class pagerduty::params (
  String $servicekey      = '',
  String $icinga_cfg_path = '/etc/icinga/',
  String $icinga_user     = 'icinga',
  String $icinga_group    = 'icinga',
){
}
