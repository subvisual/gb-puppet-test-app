define gb::server::puma (
  $root = undef,
  $port = 80,
  $url  = undef,
) {

  file { "/etc/nginx/conf.d/${name}.conf":
    owner   => 'root',
    group   => 'root',
    mode    => 644,
    content => template('gb/nginx_with_puma.erb'),
    notify  => Service[nginx],
  }

  file { "/run/deploy/${name}":
    ensure  => directory,
    owner   => 'deploy',
    group   => 'deploy',
    mode    => 0644,
    require => File['/run/deploy'],
  }

  ## nginx entry
  #nginx::resource::upstream { $name:
    #ensure  => present,
    #members => ["unix:///var/run/${name}"],
  #}

  #nginx::resource::vhost { $name:
    #ensure      => present,
    #listen_port => 80,
    #www_root    => "${root}/current/public",
  #}

  #nginx::resource::location { $name:
    #ensure   => present,
    #location => '/',
    #vhost    => $name,
    #proxy    => "http://${name}",
  #}

}
