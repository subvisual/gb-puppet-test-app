class { gb:
  ruby_version    => 'ruby-2.0.0-p353',
  deploy_password => "password",
}

# Vagrant stuff. allow vagrant user to sudo
sudo::conf { 'vagrant':
  priority => 01,
  content  => "
%vagrant ALL = NOPASSWD: ALL",
}

