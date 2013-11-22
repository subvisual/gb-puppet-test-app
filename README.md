# Group Buddies - Provisioning test repo

## Install

First, download the repo:

    git clone git://github.com/groupbuddies/gb-provisioning
    cd gb-provisioning

Fetch dependencies:

    bundle
    bundle exec librarian-puppet install

And setup the vagrant machine (this should take a while)

    vagrant up

## Deploy

You can now deploy a test app to the vagrant machine, both in production and
staging mode:

    bundle exec cap production deploy # for production app
    bundle exec cap staging deploy    # for staging app

You should be able to go to the following urls and see both app instances
working

    localhost:8443 # production test app
    localhost:8080 # staging test app

Note: It might take a while for the apps to boot, since service restart is
managed by Monit

## Some more random info

* The real juice comes from [this repo](https://github.com/naps62/gb-puppet)
* Both the production and staging apps are instances of [this
repo](https://github.com/naps62/the_well_provisioned_test_app)


