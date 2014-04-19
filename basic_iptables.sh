#!/bin/bash
# This script sets up basic IPtables rules to only allow input to FTP, SSH, and HTTP ports
# All other connections are dropped

# Accept all previously established connections before rules are made
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Accept input from ports 21, 22, and 80
sudo iptables -A INPUT -p tcp --dport 21 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT

# Drop all other connections
sudo iptables -A INPUT -j DROP

# Loopback NECESSARY
sudo iptables -I INPUT 1 -i lo -j ACCEPT

# Show current iptables rules
iptables -L
