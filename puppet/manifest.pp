$data = hiera('common')

# Vagrant stuff. allow vagrant user to sudo
sudo::conf { 'vagrant':
  priority => 01,
  content  => "
%vagrant ALL = NOPASSWD: ALL",
}

# install ruby 2.1.5
gb::ruby { 'ruby-2.1.5': }

# create both databases
gb::postgresql { 'production':
  password => $data[production][db_pass],
}

gb::postgresql { 'staging':
  password => $data[staging][db_pass],
}

# set up nginx configs
gb::nginx_conf { 'production':
  path => 'config/nginx.production.conf',
}

gb::nginx_conf { 'staging':
  path => 'config/nginx.staging.conf',
}
