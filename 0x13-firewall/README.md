## Setting up firewall for my servers

### Firewall
A firewall is a network security system that monitors and controls incoming and outgoing network traffic based on predetermined security rules. A firewall typically establishes a barrier between a trusted network and an untrusted network, such as the Internet.

`0-block_all_incoming_traffic_but` contains commands thats sets up a firewall network security system
to deny all incoming traffic from all ports except 80/http, 443/SSL, 22/SSH.

`100-portforwarding` is the configuration file [`before.rules`] in the `/etc/ufw/` directory
which has been configured to redirect traffic to the server from port 8080/tcp to 80/tcp.
