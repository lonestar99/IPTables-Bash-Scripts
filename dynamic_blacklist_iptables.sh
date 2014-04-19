#!/bin/bash

# Dynamic blacklist that will automatrically and temporarily ban IP addresses
# IMPORTANT: If a final DROP ALL rule is in place, this rule must come before it using insert
# Instead of append
# May depend if Thylacine is installed

# Rule to drop any packets from IP addresses found in /proc/net/xt_recent/blacklist_7200 for 2 hrs
sudo iptables -A thyl-blacklist -m recent --name blacklist_7200 --rcheck --seconds 7200 -m comment --comment "DROP packet from IP inserted in blacklist for 2 hours" -j DROP

# Packets sent to these ports will be dropped and IPs blacklisted for 2 hours
sudo iptables -A INPUT -p tcp --dport 1:19 --name blacklist_7200 --set -j DROP
sudo iptables -A INPUT -p tcp --dport 23:79 --name blacklist_7200 --set -j DROP
sudo iptables -A INPUT -p tcp --dport 81:432 --name blacklist_7200 --set -j DROP
sudo iptables -A INPUT -p tcp --dport 444:1337 --name blacklist_7200 --set -j DROP
