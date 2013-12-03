# Group Buddies - Provisioning test repo

## Setup

First, download the repo:

    git clone git://github.com/groupbuddies/gb-provisioning
    cd gb-provisioning

Fetch dependencies:

    bundle
    bundle exec librarian-puppet install

Now follow one of the installation options:

* [Puppet](#puppet-installation)
* [Dokku](#dokku-installation)

## Puppet installation

Setup the vagrant machine (this should take a while)

    vagrant up puppet

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

## Dokku installation

Setup the vagrant machine (this should take a while)

    vagrant up dokku

Setup your `/etc/hosts` file for easier access to the machine, by adding this
line

    127.0.0.1 gb-provisioning.dokku.me dokku.me

Now install dokku inside the VM:

    vagrant ssh dokku
    wget -qO - https://raw.github.com/progrium/dokku/v0.2.0/bootstrap.sh | sudo DOKKU_TAG=v0.2.0 bash

Send in your public key so you can push to the dokku remote (replace
`YOUR_USERNAME` with your actual desired username):

    cat ~/.ssh/id_rsa.pub | vagrant ssh dokku -c 'sudo sshcommand acl-add dokku
    YOUR_USERNAME'

Install the required plugins for dokku:

    vagrant ssh dokku
    cd /var/lib/dokku/plugins
    sudo git clone http://github.com/Kloadut/dokku-pg-plugin
    dokku plugins-install

Go to the app you want to deploy ([this repo](https://github.com/naps62/the_well_provisioned_test_app)) is a good starting point) and do this:

    git remote add vagrant git@dokku.me:gb-provisioning
    git push vagrant master

## Some more random info

* The real juice comes from [this repo](https://github.com/naps62/gb-puppet)
* Both the production and staging apps are instances of [this
repo](https://github.com/naps62/the_well_provisioned_test_app)


