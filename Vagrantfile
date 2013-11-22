# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.hostname = 'gb-provisioning'
  config.vm.network :forwarded_port, host: 8443, guest: 8443
  config.vm.network :forwarded_port, host: 8080, guest: 8080

  config.vm.provision :shell, path: 'scripts/upgrade_puppet.sh'
  config.vm.provision :puppet do |puppet|
    puppet.module_path = 'modules'
    puppet.manifests_path = 'manifests'
    puppet.manifest_file = 'default.pp'
    puppet.options = '--hiera_config /vagrant/hiera.yaml'
  end
end
