# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include pagerduty::config
class pagerduty::config (
  String $servicekey      = $::pagerduty::params::servicekey,
  String $icinga_cfg_path = $::pagerduty::params::icinga_cfg_path,
  String $icinga_user     = $::pagerduty::params::icinga_user,
  String $icinga_group    = $::pagerduty::params::icinga_group,
) inherits pagerduty::params {

  file {"${icinga_cfg_path}/objects/pagerduty_icinga.cfg":
    ensure  => present,
    content => template('pagerduty/pagerduty_icinga.cfg.erb'),
    owner   => $icinga_user,
    group   => $icinga_group,
  }

  file {'/usr/local/bin/pagerduty_icinga.pl':
    ensure => present,
    source => 'puppet:///modules/pagerduty/pagerduty_icinga.pl',
    owner  => $icinga_user,
    group  => $icinga_group,
    mode   => '0755',
  }

  cron {'pagerduty':
    ensure  => present,
    user    => $icinga_user,
    command => '/usr/local/bin/pagerduty_icinga.pl flush',
  }
}
