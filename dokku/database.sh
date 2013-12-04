#!/bin/sh

app_name=$1

if [ -z "${app_name}" ]; then
  app_name="gb-provisioning"
fi

vagrant ssh dokku -c "sudo dokku postgresql:start && sudo dokku postgresql:create ${app_name}"
