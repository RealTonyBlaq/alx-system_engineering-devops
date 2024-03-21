# Puppet increases limits for user holberton

exec { 'increase_soft_limits':
    command => 'sed -i "$a\holberton soft nofile 100000" /etc/security/limits.conf',
    path    => '/usr/local/bin/:/bin/',
}

exec { 'increase_hard_limits':
    command => 'sed -i "$a\holberton hard nofile 100000" /etc/security/limits.conf',
    path    => '/usr/bin',
}
