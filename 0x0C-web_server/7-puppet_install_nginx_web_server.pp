# puppet installs nginx and configures it

$str = "Hello World!\n"

exec {'update_app_list':
    command => 'sudo apt-get update',
    provider    => 'shell',
}

file {'/var/www/html/index.html':
    ensure  => present,
    mode    => '0644',
    content => '$str',
    require => Package['nginx'],
}

package {'nginx':
    ensure  => 'latest',
    require => Exec['update_app_list'],
}

exec {'write_to_file':
    command => '/bin/sed -i "24i\      rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
    require => Package['nginx'],
}

service {'nginx':
    ensure  => running,
    require => Package['nginx'],
}
