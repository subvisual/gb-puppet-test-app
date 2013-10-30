# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.hostname = "vagrant.example.com"

  config.vm.network :public_network
  config.vm.network :forwarded_port, host: 3001, guest: 3001
  config.vm.network :forwarded_port, host: 3002, guest: 3002

  config.vm.provision :puppet do |puppet|
    puppet.module_path = 'manifests/modules'
    puppet.manifests_path = 'manifests'
    puppet.manifest_file = 'default.pp'
  end
end
