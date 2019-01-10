package { ['gcc','g++','make']:
    ensure => 'present',
}

package { ['puppet-blacksmith','puppetlabs_spec_helper']:
    ensure   => 'present',
    provider => 'puppet_gem',
}

file { '/home/vagrant/.puppetforge.yml':
    ensure => 'present',
    source => '/vagrant/vagrant/puppetforge.yml',
    owner  => 'vagrant',
    group  => 'vagrant',
    mode   => '0600',
}
