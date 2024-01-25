# Puppet sets up Client ssh configuration to read public key
#+ from a file without typing a password

file { '/etc/ssh/ssh_config':
  ensure  => present,
  content => template('your_module/ssh_config.erb'),
}

# ssh_config.erb
<% require 'augeas' %>
<% augeas = Augeas::open(nil, nil, Augeas::NO_MODL_AUTOLOAD) %>
<% augeas.transform(:lens => 'Ssh.lns', :incl => '/etc/ssh/ssh_config') %>
<% augeas.load %>
<% augeas.set('/files/etc/ssh/ssh_config/Host[1]/IdentityFile', '~/.ssh/school') %>
<% augeas.set('/files/etc/ssh/ssh_config/Host[1]/PasswordAuthentication', 'no') %>
<% augeas.save %>
<% augeas.close %>
