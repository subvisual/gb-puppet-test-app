# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

PUBLIC_KEY = ENV['PUBLIC_KEY'] || '~/.ssh/id_rsa.pub'
USER       = ENV['USER']

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "raring64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.define "dokku" do |dokku|
    dokku.vm.hostname = 'gb-dokku'
    dokku.vm.network :forwarded_port, host: 8080, guest: 80
    dokku.vm.hostname = 'dokku.me'
    dokku.vm.network :private_network, ip: '10.0.0.2'

    dokku.vm.provision :shell, path: 'dokku/provision.sh', args: "#{PUBLIC_KEY} #{USER}"
  end

  config.vm.define "puppet" do |puppet|
    puppet.vm.hostname = 'gb-puppet'
    puppet.vm.network :forwarded_port, host: 8443, guest: 8443
    puppet.vm.network :forwarded_port, host: 8080, guest: 8080

    puppet.vm.provision :shell, path: 'scripts/upgrade_puppet.sh'
    puppet.vm.provision :puppet do |puppet_conf|
      puppet_conf.module_path = 'puppet/modules'
      puppet_conf.manifests_path = 'puppet/manifests'
      puppet_conf.manifest_file = 'puppet/default.pp'
      puppet_conf.options = '--hiera_config /vagrant/puppet/hiera.yaml'
    end
  end
end
