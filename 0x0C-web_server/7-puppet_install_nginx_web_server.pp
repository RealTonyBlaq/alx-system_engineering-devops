# puppet installs nginx and configures it

$str = "Hello World!\n"

exec {'update_app_list':
    command  => 'apt-get update',
    provider => 'shell',
}

file {'/var/www/html/index.html':
    ensure  => present,
    content => '$str',
    require => Package['nginx'],
}

package {'nginx':
    ensure  => installed,
    require => Exec['update_app_list'],
}

exec {'write_to_file':
    command  => 'sed -i "24i\      rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
    provider => 'shell',
    require  => Package['nginx'],
}

service {'nginx':
    ensure  => running,
    require => Package['nginx'],
}
