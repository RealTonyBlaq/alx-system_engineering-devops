# Puppet increases limits for user holberton

exec { 'increase_limit':
    command => 'sed -i "/holberton        hard/s/5/10000" /etc/security/limits.conf',
    path    => '/usr/bin',
}

exec { 'increase_soft':
    command => 'sed -i "/holberton        soft/s/4/20000" /etc/security/limits.conf',
    path    => '/usr/bin',
}
