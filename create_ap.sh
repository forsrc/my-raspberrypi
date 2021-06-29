git clone https://github.com/oblique/create_ap
cd create_ap
sudo make install


sudo systemctl enable create_ap


#cat /etc/create_ap.conf
CHANNEL=default
GATEWAY=10.0.0.1
WPA_VERSION=2
ETC_HOSTS=0
DHCP_DNS=gateway
NO_DNS=0
NO_DNSMASQ=0
HIDDEN=0
MAC_FILTER=0
MAC_FILTER_ACCEPT=/etc/hostapd/hostapd.accept
ISOLATE_CLIENTS=0
SHARE_METHOD=nat
IEEE80211N=0
IEEE80211AC=0
HT_CAPAB=[HT40+]
VHT_CAPAB=
DRIVER=nl80211
NO_VIRT=0
COUNTRY=
FREQ_BAND=2.4
NEW_MACADDR=
DAEMONIZE=0
NO_HAVEGED=0
WIFI_IFACE=wlan1
INTERNET_IFACE=wlan0
SSID=zero
PASSPHRASE=abc123$%
USE_PSK=0



#####################################
wpa_cli -i wlan1 disable_network 0
sudo ifconfig wlan1 down
sudo create_ap --driver=nl80211 wlan1 wlan0 zero abc123$%

##########################
 sudo echo "1">/proc/sys/net/ipv4/ip_forward
 
 sudo nano /etc/sysctl.conf
 net.ipv4.ip_forward = 1
 
 
 sudo sysctl -p
#########################
sudo iptables -F
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -t nat -A POSTROUTING -s  172.17.0.0/16  -o wlan0 -j MASQUERADE


