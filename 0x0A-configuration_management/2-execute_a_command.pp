# Puppet kills a process named kill me now

exec {'process_killer':
    command => '/usr/bin/pkill -f killmenow',
    onlyif  => '/usr/bin/pgrep killmenow'
}
