# eventually isntall cribl package
# for now just make sure the directory exists
#
class cribl::install
{

  $install_path = $cribl::install_path
  $user         = $cribl::user
  $group        = $cribl::group
  $dir          = 'cribl'

  exec { 'mk_install_dir':
    command => "mkdir -p ${dir} && chown ${user}:${group} ${dir}",
    path    => '/bin:/usr/bin',
    cwd     => $install_path,
    unless  => "test -d ${dir}",
    creates => "${install_path}/${dir}"
  }

}
