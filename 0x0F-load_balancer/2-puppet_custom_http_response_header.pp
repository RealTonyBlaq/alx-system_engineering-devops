# Puppet installs Nginx and adds a new header 'X-Served-By'.

$host_name = exec {'read_hostname':
    command   => 'hostname',
    provider  => 'shell',
    logoutput => true,
}

package {'nginx':
    ensure  => 'installed',
}

exec {'add_config':
    command  => 'host=$(hostname) && sed -i "45i\\        add_header X-Served-By \"${host}\";" /etc/nginx/sites-available/default',
    provider => 'shell',
    ensure => Package['nginx'],
}
