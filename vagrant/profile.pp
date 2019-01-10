notify { 'Setting up shell profile': }

file { $::profile:
  ensure  => present,
  content => 'export PATH=/opt/puppetlabs/bin:/opt/puppetlabs/puppet/bin:$PATH',
  replace => false,
}

