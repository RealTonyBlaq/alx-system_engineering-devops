# Puppet fixes an nginx server to process requests faster

exec { 'fix_nginx':
  command => "/bin/sed -i 's/15/4096/' /etc/default/nginx && sudo service nginx restart",
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/usr/games:/usr/local/games',
}
