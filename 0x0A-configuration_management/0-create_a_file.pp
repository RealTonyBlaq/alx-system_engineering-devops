# Puppet creates a file with a content

$str = "I love Puppet
"

file { '/tmp/school':
    ensure  => present,
    mode    => '0744',
    owner   => 'www-data',
    group   => 'www-data',
    content => $str
}
