# Puppet installs Nginx and adds a new header 'X-Served-By'.

package {'nginx':
    ensure  => 'installed',
}

exec {'add_config':
    command  => 'host=$(hostname) && sed -i "45i\\        add_header X-Served-By \"${host}\";" /etc/nginx/sites-available/default',
    provider => 'shell',
    re => Package['nginx'],
}

exec {'restart_nginx':
    command => 'service nginx restart',
    ensure  => Exec['add_config'],
}
