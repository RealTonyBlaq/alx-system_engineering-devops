# Puppet installs flask from pip3

package { 'Python3':
    ensure   => '',
}

package {'flask':
    ensure  => '2.1.0',
    unless  => '/usr/bin/pip show flask | pgrep 2.1.0'
    require => Package['Python3-pip']
}
