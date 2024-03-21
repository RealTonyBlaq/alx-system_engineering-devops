# Puppet creates a user "holberton" and increases limits

exec { 'increase_limit':
    command => 'sed -i "/holberton        hard/s/5/100000" /etc/security/limits.conf',
    path    => '/usr/bin',
}

exec { 'increase_soft':
    command => 'sed -i "/holberton        soft/s/4/'
}
