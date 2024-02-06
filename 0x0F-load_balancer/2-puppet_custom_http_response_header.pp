# Puppet installs Nginx and adds a new header 'X-Served-By'.

exec 
}

package {'nginx':
    ensure  => 'installed',
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
