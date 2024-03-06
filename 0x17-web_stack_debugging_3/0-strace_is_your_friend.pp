# Puppet uses strace to resolve a 500 error from apache

package {'apache2':
    ensure  => 'installed',
}

service {'apache2':
    ensure  => running,
    enable  => true,
    require => Package['apache2'],
}

exec { 'strace_apache':
    command     => "strace -f -o /tmp/apache_strace.log -p \$(pidof $apache_service)",
  refreshonly => true,
  subscribe   => Service[$apache_service],
}
