# puppet installs nginx and configures it

$str = "Hello World!
"
file {'/var/www/html/index.html':
    enure => present;
}

package {'nginx':
    ensure => installed;
}

