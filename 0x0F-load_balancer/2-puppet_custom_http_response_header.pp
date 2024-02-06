# Puppet installs Nginx and adds a new header 'X-Served-By'

$host_name = exec {'read_hostname':
    command  => 'hostname',
    provider => 'shell',
    logoutput   => true,
}.content

package {'nginx':
    ensure  => 'installed',
}

