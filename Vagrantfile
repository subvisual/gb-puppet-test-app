# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"

  config.vm.provider "virtualbox" do |v|
    v.memory = 256
  end

  config.vm.hostname = 'gb-puppet'
  config.vm.network :forwarded_port, host: 8443, guest: 443
  config.vm.network :forwarded_port, host: 8080, guest: 80

  # config.vm.provision :shell, path: 'scripts/upgrade_puppet.sh'
  config.vm.provision :puppet do |puppet_conf|
    puppet_conf.module_path = 'puppet/modules'
    puppet_conf.manifests_path = 'puppet/manifests'
    puppet_conf.manifest_file = 'gb-provisioning.pp'
    puppet_conf.hiera_config_path = 'puppet/hiera.yaml'
  end
end
