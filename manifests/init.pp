# install and manage service state for Cribl
#
# @example
#   include cribl
class cribl(
String $group,
String $user,
String $install_path
) {

  if defined('$install_path') and $::install_path =~ String {
    class { 'cribl::install': }
  }

  service { 'cribl':
    ensure   => 'running',
    provider => 'systemd'
  }

}
