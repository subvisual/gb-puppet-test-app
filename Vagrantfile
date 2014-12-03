# -*- mode: ruby -*-
# vi: set ft=ruby :

GB_PUPPET_SCRIPT_URL = "https://raw.githubusercontent.com/groupbuddies/gb-puppet/master/setup/ubuntu"

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://nitron-vagrant.s3-website-us-east-1.amazonaws.com/vagrant_ubuntu_12.04.3_amd64_virtualbox.box"

  config.vm.provider "virtualbox" do |v|
    v.memory = 256
  end

  config.vm.hostname = 'gb-puppet'
  config.vm.network :forwarded_port, host: 8443, guest: 443
  config.vm.network :forwarded_port, host: 8080, guest: 80

  config.vm.provision :shell, inline: "apt-get update && apt-get install --yes curl"
  config.vm.provision :shell, inline: "curl -s #{GB_PUPPET_SCRIPT_URL} | bash -"
end
