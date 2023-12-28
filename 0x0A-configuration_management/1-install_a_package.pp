# Puppet installs flask from pip3

package { 'werkzeug':
  ensure => '2.1.1',
}

package { 'python3':
  ensure => '3.8.10',
  require => Package['werkzeug'],
}

package { 'flask':
  ensure => '2.1.0',
  unless => '/usr/bin/pip3 show flask | grep -q "Version: 2.1.0"',
  require => Package['python3'],
}

