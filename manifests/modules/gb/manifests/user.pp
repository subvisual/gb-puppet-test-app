class gb::user ($name=undef) {
  user { $name:
    ensure => present,
    home   => "/home/$name"
  }

  #
  # setup ssh keys for entire team
  #
  #include git

  #$home = "/home/${name}"
  #$public_keys_path = "${home}/public_keys"

  #git::repo { 'public_keys':
    #path    => $public_keys_path,
    #source  => 'git://github.com/groupbuddies/public-keys.git',
    #branch  => 'master',
    #update  => true,
    #require => User[$name],
  #}
  #->
  #file { 'generate_auth_keys_script':
    #ensure => present,
    #path   => "${home}/scripts/gen.rb",
    #source => 'puppet:///modules/gb/script.bash',
    #mode   => '0755',
  #}
  #->
  #exec { 'append_authorized_keys':
    #command => "${home}/scripts/gen.rb",
  #}
}
