# Puppet sets up Client ssh configuration to read public key
#+ from a file without typing a password

file { '/etc/ssh/ssh_config':
  ensure  => present,
  content => template('your_module/ssh_config.erb'),
}

# ssh_config.erb
<%# Use Augeas to edit the SSH client configuration file %>
<% require 'augeas' %>
<% augeas = Augeas::open(nil, nil, Augeas::NO_MODL_AUTOLOAD) %>
<% augeas.transform(:lens => 'Ssh.lns', :incl => '/etc/ssh/ssh_config') %>
<% augeas.load %>
<% augeas.set('/etc/ssh/ssh_config/Host[1]/IdentityFile', '~/.ssh/school') %>
<% augeas.set('/files/home/your_username/.ssh/config/Host[1]/PasswordAuthentication', 'no') %>
<% augeas.save %>
<% augeas.close %>
