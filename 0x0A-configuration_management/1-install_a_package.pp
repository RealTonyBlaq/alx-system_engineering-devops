# Puppet installs flask from pip3

package { 'Python3-pip':
    ensure   => 'installed',
}

exec {'install_flask':
    command => '/usr/bin/pip3 install flask==2.1.0',
    unless  => '/usr/bin/pip show flask | pgrep 2.1.0'
    require => Package['Python3-pip']
}
