# Puppet installs Nginx and adds a new header 'X-Served-By'.

exec {'apt_update':
    command => 'apt update',
    provider => 'shell',
}

package {'nginx':
    ensure  => 'installed',
    require =>
}

exec {'add_config':
    command  => 'host=$(hostname) && sed -i "45i\\        add_header X-Served-By \"${host}\";" /etc/nginx/sites-available/default',
    provider => 'shell',
    require => Package['nginx'],
}

service {'nginx':
    ensure  => running,
    require => Package['nginx'],
}
