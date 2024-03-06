# Puppet resolves a 500 error from apache

package { 'apache2':
    ensure  => installed,
}

package { 'strace':
    ensure  => installed,
}

service { 'apache2':
    ensure  => running,
    enable  => true,
    require => Package['apache2'],
}

exec { 'use_strace':
    command => 'strace -c -p \$(pgrep apache2 | head -n 1) -o apache_error.log',
    provider    => 'shell', 
}

# Set the correct permissions for directories
file { '/etc/apache2':
    ensure  => directory,
    recurse => true,
    mode    => '0755',
}

# Set the correct permissions for files
file { '/etc/apache2':
    ensure => file,
    mode   => '0644',
}

exec { 'fix_error':
    command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
    path    => '/usr/local/bin/:/bin/'
}

