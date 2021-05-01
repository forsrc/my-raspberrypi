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

interface br0

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

