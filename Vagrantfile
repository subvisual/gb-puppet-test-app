# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

GB_BOX_URL="https://dl.dropboxusercontent.com/s/kz0zrd0pys3os61/gb-base-box.box?dl=1"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # dokku test machine
  config.vm.define "dokku" do |dokku|
    dokku.vm.box = "gb-base-box"
    dokku.vm.box_url = GB_BOX_URL

    dokku.vm.network :forwarded_port, host: 8080, guest: 80
    dokku.vm.hostname = 'dokku.me'
    dokku.vm.network :private_network, ip: '10.0.0.2'
    dokku.vm.provider "virtualbox" do |vb|
      vb.customize ['modifyvm', :id, '--memory', '1024']
    end
  end

  # puppet test machine
  config.vm.define "puppet" do |puppet|
    puppet.vm.box = "gb-base-box"
    puppet.vm.box_url = GB_BOX_URL

    config.vm.provider "virtualbox" do |v|
      v.memory = 256
    end

    puppet.vm.hostname = 'gb-puppet'
    puppet.vm.network :forwarded_port, host: 8443, guest: 8443
    puppet.vm.network :forwarded_port, host: 8080, guest: 8080

    puppet.vm.provision :shell, path: 'scripts/upgrade_puppet.sh'
    puppet.vm.provision :puppet do |puppet_conf|
      puppet_conf.module_path = 'modules'
      puppet_conf.manifests_path = 'puppet/manifests'
      puppet_conf.manifest_file = 'gb-provisioning.pp'
      puppet_conf.options = '--hiera_config /vagrant/puppet/hiera.yaml'
    end
  end

  # base box for gb project devs
  config.vm.define "gb-base-box" do |gb|
    gb.vm.box = "raring"
    gb.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-amd64-vagrant-disk1.box"

    gb.vm.provision :shell, path: 'scripts/upgrade_puppet.sh'
    gb.vm.provision :puppet do |puppet_conf|
      puppet_conf.module_path = 'modules'
      puppet_conf.manifests_path = 'puppet/manifests'
      puppet_conf.manifest_file = 'gb-base-box.pp'
    end
  end
end
