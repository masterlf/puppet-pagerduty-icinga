# A description of what this class does
#
# @example
#   include pagerduty::package
class pagerduty::package (
  String $manage_packages = $::pagerduty::params::manage_packages,
  ){
  #install packages if not present
  if $manage_packages == 'yes' {
    ensure_packages(['libwww-perl', 'libjson-perl'], {'ensure' => 'present'})
  }
}
