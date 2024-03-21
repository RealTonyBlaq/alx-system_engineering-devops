# Puppet creates a user "holberton" and increases limits

user { 'holberton':
    ensure     => present,
    managehome => true,
}

exec { 'increase_limit':
    command => 'sed -i "/holberton        hard/s/5/100000" /etc/security/limits.conf',
    path    => '/usr/local/bin:/usr/bin',
    require => User['holberton'],
}
