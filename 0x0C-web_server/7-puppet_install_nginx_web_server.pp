# puppet installs nginx and configures it

$str = "Hello World!
"
file {'/var/www/html/index.html':
    enure   => present,
    mode    => '0766'
}

package {'nginx':
    ensure => installed;
}

