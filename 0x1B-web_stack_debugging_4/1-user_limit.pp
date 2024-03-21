# Puppet increases limits for user holberton

exec { 'increase_limit':
    command  => 'sed -i "$a\holberton soft nofile" 1048576',
    provider => shell,
}
