# blacksmith-vagrant

A simple Vagrant + Virtualbox environment for publishing modules on the
[Puppet Forge](https://forge.puppet.com/) with
[puppet-blacksmith](https://github.com/voxpupuli/puppet-blacksmith).

# Preparations

A number of preparatory steps are needed in order to use this repository and to
publish your modules in the Puppet Forge: 

 * Install [Vagrant](https://www.vagrantup.com/)
 * Install [Virtualbox](https://www.virtualbox.org/)
 * Convert your Puppet modules with [Puppet Development Kit](https://puppet.com/docs/pdk/1.x/pdk_install.html)
 * Ensure that license name in metadata.json is on [this list](https://spdx.org/licenses/)
 * Create a [Puppet Forge](https://forge.puppet.com) user account
 * Create "modules" directory to the root of this repository (ignored by Git)

The PDK conversion does not add support for Blacksmith automatically. For that you need to add line

    require 'puppet_blacksmith/rake_tasks'

to the Rakefile. This in turn breaks Travis-CI unless you add this to the Gemfile:

    group :development do
        --- snip ---
        gem "puppet-blacksmith"
    end

Finally you need to add a Puppet Forge config file to vagrant/puppetforge.yml:

    ---
    url: https://forgeapi.puppetlabs.com
    username: my_username
    password: my_password

It is a good practice to have metadata.json match your Forge username when
possible. 

# Pushing a release to the Forge

Create/start the blacksmith VM:

    $ vagrant up

SSH in:

    $ vagrant ssh

Configure Git:

    $ git config --global user.name "John Doe"
    $ git config --global user.email "john.doe@example.org"

Test (with Travis-CI):

    $ cd /vagrant/modules/my_module
    $ git push

Publish:

    $ cd /vagrant/modules/my_module
    $ rake module:bump_commit:patch
    $ rake module:tag
    $ git push --tags
    $ rake module:clean
    $ rake module:push
