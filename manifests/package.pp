# A description of what this class does
#
# @example
#   include pagerduty::package
class pagerduty::package {
  #install packages if not present
  ensure_packages(['libwww-perl', 'libcrypt-ssleay-perl'], {'ensure' => 'present'})
}
