# Puppet creates a user "holberton"

user { 'holberton':
    ensure     => present,
    managehome => true,
}
