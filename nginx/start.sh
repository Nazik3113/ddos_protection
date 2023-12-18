#!/bin/sh

echo "Disabling UDP..."
iptables -A INPUT -p udp --dport 53 -j DROP
echo "UDP Disabled."
echo "Disabling ICMP..."
iptables -A INPUT --proto icmp -j DROP
echo "ICMP Disabled."
echo "Syncookies status..."
echo $(sysctl -n net.ipv4.tcp_syncookies)
echo "Enabling NGINX2..."
exec nginx -g 'daemon off;'