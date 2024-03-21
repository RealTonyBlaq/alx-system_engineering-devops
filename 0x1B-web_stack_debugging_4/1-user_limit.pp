# Puppet increases limits for user holberton

exec { 'increase_soft_limits':
    command => 'sed -i "$a\holberton soft nofile 65535" /etc/security/limits.conf',
    path    => '/usr/local/bin/:/bin/',
}

exec { 'increase_hard_limits':
    command => 'sed -i "$a\#holberton hard nofile 65535" /etc/security/limits.conf',
    path    => '/usr/local/bin/:/bin/',
}
