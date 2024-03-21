# Puppet increases limits for user holberton

exec { 'increase_limit':
    command  => 'sed -i "$a" 1048576',
    provider => shell,
}
