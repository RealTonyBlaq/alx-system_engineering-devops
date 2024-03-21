# Puppet increases limits for user holberton

exec { 'increase_limit':
    command => 'ulimit -n 1048576',
    path    => '/usr/bin',
}
