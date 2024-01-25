# Puppet sets up Client ssh configuration to read public key
#+ from a file without typing a password

$config="#! ~/.ssh/config

Host *
    IdentityFile ~/.ssh/school
    PreferredAuthentications publickey
    PasswordAuthentication no
"

file {'/home/tony/con':
    ensure  => present,
    content => $config,
}
