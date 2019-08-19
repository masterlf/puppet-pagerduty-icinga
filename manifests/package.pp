# A description of what this class does
#
# @example
#   include pagerduty::package
class pagerduty::package {
  #install packages if not present
  if ! defined(Package['perl-libwww-perl']) {package {'perl-libwww-perl': ensure => present }}
  if ! defined(Package['perl-Crypt-SSLeay']) {package {'perl-Crypt-SSLeay': ensure => present }}
}
