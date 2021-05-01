sudo apt install hostapd

sudo systemctl unmask hostapd
sudo systemctl enable hostapd

sudo vim /etc/systemd/network/bridge-br0.netdev

[NetDev]
Name=br0
Kind=bridge


sudo vim /etc/systemd/network/br0-member-eth0.network

[Match]
Name=eth0

[Network]
Bridge=br0

sudo systemctl enable systemd-networkd

sudo vim /etc/dhcpcd.conf

denyinterfaces wlan0 eth0
#interface xxx

interface wlan1
    static ip_address=192.168.10.1/24
    nohook wpa_supplicant

interface br0


sudo vim /etc/sysctl.d/routed-ap.conf

# https://www.raspberrypi.org/documentation/configuration/wireless/access-point-routed.md
# Enable IPv4 routing
net.ipv4.ip_forward=1

sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

sudo rfkill unblock wlan

sudo vim /etc/hostapd/hostapd.conf

country_code=JP
interface=wlan1
bridge=br0
ssid=pi
hw_mode=g
channel=7
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_passphrase=abc123$%
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP


sudo apt-get install dnsmasq

sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.bak
sudo vim /etc/dnsmasq.conf
interface=wlan1 # Listening interface
dhcp-range=192.168.10.2,192.168.10.20,255.255.255.0,24h
                # Pool of IP addresses served via DHCP
domain=wlan     # Local wireless DNS domain
address=/gw.wlan/192.168.10.1
                # Alias for this router

