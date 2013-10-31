define gb::rails_app (
  $rails_env = 'production',
  $port      = 80,
  $db_pass   = undef,
) {

  $capistrano_root = "/var/www/${name}"
  $db_yml = "${capistrano_root}/shared/config/database.yml"

  # nginx entry
  nginx::resource::upstream { $name:
    ensure  => present,
    members => ['localhost:3000'],
  }

  nginx::resource::vhost { $name:
    ensure      => present,
    proxy       => "http://${name}",
    #www_root    => "${capistrano_root}/current/public",
    #listen_port => $port,
  }

  # database role
  postgresql::server::role { $name:
    password_hash => postgresql_password($name, $db_pass),
  }
  # database user
  postgresql::server::db { $name:
    user     => $name,
    password => postgresql_password($name, $db_pass),
  }

  # shared/config/database.yml
  file { [$capistrano_root, "${capistrano_root}/shared", "${capistrano_root}/shared/config" ]:
    ensure => directory,
    owner  => 'deploy',
    group  => 'deploy',
  }
  ->
  file { $db_yml:
    owner   => 'deploy',
    group   => 'deploy',
    content => template('gb/database.yml.erb'),
    notify  => Service[nginx],
  }


}
