# puppet installs nginx and configures it

$str = "Hello World!
"
file {'/var/www/html/index.html':
    enure   => present,
    mode    => '0766',
    content => $str,
    ensure  => Package['nginx'],
}

package {'nginx':
    ensure => installed;
}

exec {'write_to_file':
    command => 'sudo sed -i '24i\      rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;' /etc/nginx/sites-available/default',
    require => Package['nginx'],
}

service {'ngin}
