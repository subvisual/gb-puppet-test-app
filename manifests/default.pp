gb::user { 'deploy': }

gb::public_keys { 'deploy': }


class { gb::rvm_install:
  ruby_version => 'ruby-2.0.0-p247',
}



class { nginx: }

nginx::resource::vhost { 'production':
  ensure      => present,
  www_root    => '/srv/gb-blog',
  listen_port => '3001',
}

nginx::resource::vhost { 'staging':
  ensure      => present,
  www_root    => '/srv/test.gb-blog',
  listen_port => '3002',
}


class { postgresql::server: }

postgresql::server::db { 'database_production':
  user     => 'deploy',
  password => postgresql_password('deploy', 'password')
}

postgresql::server::db { 'database_staging':
  user     => 'deploy',
  password => postgresql_password('deploy', 'password')
}
