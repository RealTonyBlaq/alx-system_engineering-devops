# Puppet installs Nginx and adds a new header 'X-Served-By'

file {'

}

exec {'read_hostname':
    command  => 'hostname',
    provider => 'shell',

}

exec { 'get_variable_value':
  command     => '/path/to/your/command',
  logoutput   => true,
  refreshonly => true,
  unless      => 'test -f /path/to/your/flag/file',
  notify      => Notify['variable_notification'],
}

$my_variable = file('/path/to/your/output/file').content
