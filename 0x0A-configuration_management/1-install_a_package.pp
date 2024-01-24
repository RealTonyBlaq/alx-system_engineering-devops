# Puppet installs flask from pip3

package {'python3':
    ensure   => '3.8.10',
}

package {'flask':
    ensure  => '2.1.0',
    unless  => '/usr/bin/pip show flask | grep "Version: 2.1.0"',
    require => Package['python3'],
}
