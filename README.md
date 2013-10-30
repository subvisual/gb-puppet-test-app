# Group Buddies - Puppet

This repository defines the `gb` puppet module to provision our VM's.

## Testing

A `Vagrantfile` and a `manifests/default.pp` are included to easily test the module.

### Step 1: clone the repo

If you're using git version `1.6.5` or above, just run:

```
git clone --recursive git@github.com:groupbuddies/puppet-gb
cd puppet-gb
```

For older versions, this will achieve the same:

```
git clone git@github.com:groupbuddies/puppet-gb
cd puppet-gb
git submodule init
git submodule update
```

### Step 2. Vagrant

Make sure you have `vagrant` and `virtualbox` setup. After that, simply do:

```bash
vagrant up
```
