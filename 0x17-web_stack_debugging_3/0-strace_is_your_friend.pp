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



exec { 'fix_error':
    command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
    path    => '/usr/local/bin/:/bin/'
}

