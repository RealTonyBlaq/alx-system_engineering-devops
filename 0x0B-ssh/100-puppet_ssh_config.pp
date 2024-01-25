$config="
#! ~/.ssh/config

Host *
    IdentityFile ~/.ssh/school
    PreferredAuthentications publickey
    PasswordAuthentication no
"

file {'~/.ssh/config':
    ensure  => present,
    content => $config,
}
