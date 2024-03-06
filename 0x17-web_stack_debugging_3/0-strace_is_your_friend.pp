# Puppet uses strace to resolve a 500 error from apache

package {'apache2':
    ensure  => 'installed',
}

service {'apache2':
    ensure  => running,
    enable  => true,
    require => Package['apache2'],
}

