# A description of what this class does
#
# @example
#   include pagerduty::package
class pagerduty::package {
  #install packages if not present
  if ! defined(Package['libwww-perl']) {package {'libwww-perl': ensure => present }}
  if ! defined(Package['libcrypt-ssleay-perl']) {package {'libcrypt-ssleay-perl': ensure => present }}
}
