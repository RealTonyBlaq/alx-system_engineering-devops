# Puppet increases limits for user holberton

user { 'holberton':
    ensure     => present,
    managehome => true,
}

exec { 'increase_soft_limits':
    command => 'sed -i "$a\holberton soft nofile 65535" /etc/security/limits.conf',
    path    => '/usr/bin/',
    require => User['holberton'],
}

exec { 'increase_hard_limits':
    command => 'sed -i "$a\holberton hard nofile 65535" /etc/security/limits.conf',
    path    => '/usr/bin/',
    require => User['holberton'],
}
