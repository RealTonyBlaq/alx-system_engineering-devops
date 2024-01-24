# puppet installs nginx and configures it

$str = "Hello World!
"
file {'/var/www/html/index.html':
    enure   => present,
    mode    => '0766',
    content => $str
}

package {'nginx':
    ensure => installed;
}

exec 
