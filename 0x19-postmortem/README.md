## Postmortem

### Issue Summary

Duration: The outage started at 08:00 GMT and ended at 10:00 GMT after the issue had been resolved.
Impact: Users cannot access the website. Users who were already logged in were logged out, their browsers kept saying that the website was refusing to connect. About 70% of users were affected.
This outage stemmed from a firewall issue from one of the servers. One server was down, and the second server meant to be a backup was denying port 80/TCP.

Timeline:
The outage occurred by 08:00 GMT but was detected 10 minutes afterward.
Our monitoring agent, DataDog sent an alert to my team 3 minutes after they noticed an error with our server but my team’s MTA was longer than usual due to network issues delaying the notification. Customers also reached out to our customer success team with complaints of not being able to access our website, and from there, the issue was escalated.
After the team was alerted, we proceeded to find the root cause of the outage. At first, we thought it was an Nginx-related issue, a configuration error, or even from the load balancer (HAProxy) not balancing traffic between the servers.
We first revived the server that went down and then proceeded to fix the firewall rule that was denying traffic to the second server. My team and I followed due diligence to resolve the issue.

### Root Cause and Resolution:
After a proper check, we discovered that the issue started when the first server went down due to an error in the Nginx configuration. As the server went down, the backup server, unknown to us had a firewall issue. It was denying access from port 80/TCP. It was then that we knew we were on a misleading investigation due to the debugging paths we had followed and what we thought the issue was at the time.

To fix the outage, we accessed the server and read through Nginx's error log in `/var/log/nginx/` to determine which of the configuration files was causing the web-server to break down. After carefully checking, we noticed that in the `/etc/nginx/sites-available/default` file a line of code was commented out so we fixed that. We restarted the server and it was up and running. The backup server on the other hand wasn't running. We updated the firewall rules by allowing access to the server from ports 80/TCP and 8080/TCP. The server was restarted and everything was back to normal.

### Preventive Measures:
To prevent further outages of this nature in future, I suggested that we set up a monitoring agent like DataDog on the backup server to o
