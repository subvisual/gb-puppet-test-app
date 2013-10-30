class gb::public_keys ($user=undef) {
  include git

  $home = "/home/${user}"
  $scripts_path = "${home}/scripts/puppet"
  $repo_path = "${scripts_path}/public-keys"

  $script_name = 'generate-authorized_keys.rb'
  $script = "${scripts_path}/${script_name}"
  $script_src = "puppet:///modules/gb/${script_name}"
  $auth_keys_file = "/home/${user}/.ssh/authorized_keys"

  file { [ $home, "${home}/scripts", "${home}/scripts/puppet", "${home}/.ssh"]:
    ensure => directory,
    owner  => $user,
    group  => $user,
    before => File[$script],
  }

  file { $script:
    ensure => present,
    mode   => 755,
    source => $script_src,
    owner  => $user,
    group  => $user,
  }

  git::repo { $repo_path:
    path    => $repo_path,
    source  => 'git://github.com/groupbuddies/public-keys.git',
    branch  => 'master',
    update  => true,
    require => User[$user],
    notify  => Exec[$script],
  }

  exec { $script:
    command     => "${script} ${repo_path} ${user}",
    #refreshonly => true,
    require     => File[$script],
    notify      => File[$auth_keys_file],
  }

  file { $auth_keys_file:
    ensure => file,
    owner  => $user,
    group  => $user,
    mode   => 644,
  }
}
