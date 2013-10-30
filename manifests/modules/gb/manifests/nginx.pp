class gb::nginx {

  node default {
    class { 'nginx': }

    nginx::resource::vhost { 'teste1':
      ensure      => present,
      www_root    => '/var/www/teste1',
      listen_port => '3001',
    }
    nginx::resource::vhost { 'teste2':
      ensure   => present,
      www_root => '/var/www/teste2',
      listen_port => '3002',
    }
  }
}
