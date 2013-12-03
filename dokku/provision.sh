#!/bin/sh

pub_key=$1
username=$2

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 PUBLIC_KEY USERNAME"
fi

vagrant ssh dokku -c "wget -qO - https://raw.github.com/progrium/dokku/v0.2.0/bootstrap.sh | sudo DOKKU_TAG=v0.2.0 bash"

cat ${pub_key} | vagrant ssh dokku -c "sudo sshcommand acl-add dokku ${username}"
