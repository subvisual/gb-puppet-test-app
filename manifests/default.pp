class { gb::user:
  name => 'deploy',
}


class { gb::public_keys:
  user    => 'deploy',
}


class { gb::rvm_install:
  ruby_version => 'ruby-2.0.0-p247',
}


class { gb::nginx: }

nginx::resource::vhost { 'teste1':
  ensure      => present,
  www_root    => '/var/www/teste1',
  listen_port => '3001',
}

nginx::resource::vhost { 'teste2':
  ensure      => present,
  www_root    => '/var/www/teste2',
  listen_port => '3002',
}
