# Puppet uses strace to resolve a 500 error from apache

package {'apache2':
    ensure  => 'installed',
}


