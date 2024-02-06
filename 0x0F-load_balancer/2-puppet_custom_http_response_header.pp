# Puppet installs Nginx and adds a new header 'X-Served-By'


exec { 'update_applist':
        command => '/usr/bin/apt-get update',
}

package { 'nginx':
        ensure  => 'installed',
        require => Exec['update system'],
}

exec {'HTTP header':
        command  => 'sed -i "25i\          add_header X-Served-By \$hostname;" /etc/nginx/sites-available/default',
        provider => 'shell',
}

service {'nginx':
        ensure  => running,
        require => Package['nginx'],
}
