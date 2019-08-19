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
  String $servicekey      = $::pagerduty::params::servicekey,
  String $icinga_cfg_path = $::pagerduty::params::icinga_cfg_path,
  String $icinga_user     = $::pagerduty::params::icinga_user,
  String $icinga_group    = $::pagerduty::params::icinga_group,
) inherits pagerduty::params {

  include pagerduty::package

  class { 'pagerduty::config':
    servicekey      => $servicekey,
    icinga_cfg_path => $icinga_cfg_path,
    icinga_user     => $icinga_user,
    icinga_group    => $icinga_group,
  }
}
