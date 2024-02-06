# Puppet installs Nginx and adds a new header 'X-Served-By'

$host_name = exec {'read_hostname':
    command  => 'hostname',
    provider => 'shell',
    logoutput   => true,
}

exec { 'get_variable_value':
  command     => '/path/to/your/command',
  logoutput   => true,
  refreshonly => true,
  unless      => 'test -f /path/to/your/flag/file',
  notify      => Notify['variable_notification'],
}

