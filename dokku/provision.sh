#!/bin/sh

pub_key=$1
username=$2

if [ -z "${pub_key}" ]; then
  pub_key=~/.ssh/id_rsa.pub
fi

if [ -z "${username}" ]; then
  username=$(whoami)
fi

vagrant ssh dokku -c "wget -qO - https://raw.github.com/progrium/dokku/v0.2.0/bootstrap.sh | sudo DOKKU_TAG=v0.2.0 bash"

cat ${pub_key} | ssh vagrant@localhost -p 2222 -i ~/.vagrant.d/insecure_private_key sudo sshcommand acl-add dokku ${username}

vagrant ssh dokku -c "cd /var/lib/dokku/plugins && sudo git clone https://github.com/jeffutter/dokku-postgresql-plugin && sudo dokku plugins-install"
