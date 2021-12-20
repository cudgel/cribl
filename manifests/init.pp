# install and manage service state for Cribl
#
# @example
#   include cribl
class cribl(
String $group,
String $user,
Optional[String] $install_path = undef
) {

  if $install_path =~ String {
    class { 'cribl::install': }
  }

  service { 'cribl':
    ensure   => 'running',
    provider => 'systemd'
  }

}
