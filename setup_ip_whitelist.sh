#!/bin/bash

yum install ipset -y

ipset create whitelist hash:ip

# User IPs
ipset add whitelist 85.191.81.60 
ipset add whitelist 83.85.190.253
ipset add whitelist 92.111.228.8

# Public cluster IPs
ipset add whitelist 147.75.82.183
ipset add whitelist 147.75.205.45
ipset add whitelist 147.75.82.173
ipset add whitelist 147.75.205.79
ipset add whitelist 147.75.205.11	

# Private cluster IPs
ipset add whitelist 10.80.33.137
ipset add whitelist 10.80.33.131
ipset add whitelist 10.80.33.129
ipset add whitelist 10.80.33.133
ipset add whitelist 10.80.33.135

# Loopback
ipset add whitelist 127.0.0.1

# Spartan
ipset add whitelist 198.51.100.1
ipset add whitelist 198.51.100.2
ipset add whitelist 198.51.100.3

# Google DNS
ipset add whitelist 8.8.8.8
ipset add whitelist 8.8.4.4

iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -m set ! --match-set whitelist src -j LOG
iptables -A INPUT -m set ! --match-set whitelist src -j DROP
