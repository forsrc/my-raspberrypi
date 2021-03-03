#!/bin/bash
LOCAL_IFACE=eth0
INET_IFACE=wlan0

# this is where the dhcp info comes in. We need the default gateway
# /var/lib/dhcp/dhclient.wlan0.leases
f=/var/lib/dhcp/dhclient.$INET_IFACE.leases
GATEWAY=$(cat $f| grep "option route" | tail -1 |awk '{print $3}'| sed 's/;//')

IPT=$(which iptables)
# get the wlan address
INET_ADDRESS=$(ifconfig $INET_IFACE |grep "inet addr" |awk '{print $2}' |awk -F$

# Flush the tables
$IPT -F INPUT
$IPT -F OUTPUT
$IPT -F FORWARD
$IPT -t nat -F

$IPT -t nat -P PREROUTING ACCEPT
$IPT -t nat -P POSTROUTING ACCEPT
$IPT -t nat -P OUTPUT ACCEPT

# Allow forwarding packets:
$IPT -A FORWARD -p ALL -i $LOCAL_IFACE -j ACCEPT
$IPT -A FORWARD -i $INET_IFACE -m state --state ESTABLISHED,RELATED -j ACCEPT

# Packet masquerading
$IPT -t nat -A POSTROUTING -o $INET_IFACE  -j SNAT --to-source $INET_ADDRESS
$IPT -t nat -A POSTROUTING -o $LOCAL_IFACE -j MASQUERADE

# save the created tables 
iptables-save > /etc/network/iptables

#cat /proc/sys/net/ipv4/ip_forward
# make sure we are forwarding packets
echo "1" > /proc/sys/net/ipv4/ip_forward
sysctl --system > /dev/nul

#remove the default route, usually on eth0 interface
route del default
#ifdown $INET_IFACE  && ifup $INET_IFACE
#ensure is $INET_IFACE now...
route add default gw $GATEWAY $INET_IFACE
gw=$(route -n -A inet | grep '^0.0.0.0' |awk '{ print $2 }')
echo "default route is now " $gw
