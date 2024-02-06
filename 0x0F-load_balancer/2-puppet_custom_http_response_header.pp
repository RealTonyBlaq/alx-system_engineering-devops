# Puppet installs Nginx and adds a new header 'X-Served-By'.

package {'nginx':
    ensure  => 'installed',
    ensure  => running;
}

exec {'add_config':
    command  => 'host=$(hostname) && sed -i "45i\\        add_header X-Served-By \"${host}\";" /etc/nginx/sites-available/default',
    provider => 'shell',
    ensure => Package['nginx'],
}
