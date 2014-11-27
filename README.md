# Group Buddies - Provisioning test repo

## Setup

First, download the repo:

    git clone git://github.com/groupbuddies/gb-puppet-test-app
    cd gb-puppet-test-app

Fetch dependencies:

    bundle install
    bundle exec librarian-puppet install

Now follow one of the installation options:

* [Puppet](#puppet-installation)
* [Dokku](#dokku-installation)

## Puppet installation

Setup the vagrant machine (this should take a while)

    vagrant up

You can now deploy a test app to the vagrant machine, both in production and
staging mode:

    bundle exec cap production deploy # for production app
    bundle exec cap staging deploy    # for staging app

You should be able to go to the following urls and see both app instances
working

    localhost:8443 # production test app
    localhost:8080 # staging test app

Note: Be patient if nothing shows up at first. Service restart is managed by
Monit, and may take a couple of minutes.

## Some more random info

* The real juice from puppet comes from [this repo](https://github.com/naps62/gb-puppet)
* Both the production and staging apps are instances of [this
repo](https://github.com/naps62/the_well_provisioned_test_app)


