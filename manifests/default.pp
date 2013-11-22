$data = hiera('gb-provisioning')

class { gb:
  ruby_version    => 'ruby-2.0.0-p247',
  deploy_password => "password",
}

gb::app::rails { 'production':
  port    => 8443,
  db_pass => $data[production][db_pass],
  url     => 'blog.groupbuddies.com',
}

gb::app::rails { 'staging':
  port      => 8080,
  db_pass   => 'password',
  url       => $data[staging][db_pass],
  rails_env => 'staging',
}

# Vagrant stuff. allow vagrant user to sudo
sudo::conf { 'exempt':
  priority => 13,
  content  => "
Defaults env_reset
Defaults exempt_group=vagrant",
}

