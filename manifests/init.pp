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

  if $facts['osfamily'] == 'RedHat' and $facts['os_maj_version'] == 6 {
    $provider = init
  } else {
    $provider = systemd
  }

  service { 'cribl':
    ensure   => 'running',
    provider => $provider
  }

}
