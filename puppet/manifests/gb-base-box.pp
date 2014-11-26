class { gb:
  ruby_version    => 'ruby-2.1.5',
  deploy_password => "password",
}

# Vagrant stuff. allow vagrant user to sudo
sudo::conf { 'vagrant':
  priority => 01,
  content  => "
%vagrant ALL = NOPASSWD: ALL",
}

