# Puppet creates a user "holberton"

user { 'holberton':
    ensure     => present,
    managehome => true,
}

exec { 'increase':
    command  => 'ulimit -n 1048576',
    provider => 'shell',
}
