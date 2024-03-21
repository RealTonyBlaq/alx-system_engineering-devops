# Puppet increases limits for user holberton

exec { 'increase_limit':
    command  => 'sed -i "$a\holberton soft nofile 65535" /etc/security/limits',
    provider => shell,
}
