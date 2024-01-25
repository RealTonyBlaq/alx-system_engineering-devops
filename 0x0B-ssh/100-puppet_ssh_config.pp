# Puppet sets up Client ssh configuration to read public key
#+ from a file without typing a password

exec {'edit_config':
    command  => 'sed -i "52i\    IdentityFile ~/.ssh/school\n    PasswordAuthentication no" /etc/ssh/ssh_config',
    provider => 'shell',
}
