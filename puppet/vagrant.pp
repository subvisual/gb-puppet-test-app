$data = hiera('common')

# install ruby 2.1.5
gb::ruby { 'ruby-2.1.5': }

gb::capistrano { ['production', 'staging']: }

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
