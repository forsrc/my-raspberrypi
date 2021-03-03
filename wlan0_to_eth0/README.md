https://raspberrypi.stackexchange.com/questions/48307/sharing-the-pis-wifi-connection-through-the-ethernet-port


![image](https://i.stack.imgur.com/tPfVC.png)


```
apt-get update
apt-get install network-manager isc-dhcp-server
```
```
# /etc/network/interfaces

auto lo
iface lo inet loopback

iface default inet dhcp

allow-hotplug eth0
iface eth0 inet static
  address 10.10.10.1
  network 10.10.10.0
  netmask 255.255.255.0
  broadcast 10.10.10.255
  gateway 10.10.10.1

auto wlan0
allow-hotplug wlan0
iface wlan0 inet dhcp
  wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf
  up cat /etc/resolv.conf | sed 's/ver /ver 127.0.0.1,/g' > /etc/resolv_local.conf
  up cat /etc/resolv.conf | sed 's/ver /ver 127.0.0.1,/g' > /etc/resolv.conf
```
```
# /etc/dhcp/dhcpd.conf
# configuration for the bridge internal subnet.
subnet 10.10.10.0 netmask 255.255.255.0 {
  range 10.10.10.100 10.10.10.200;
  option domain-name-servers 8.8.8.8;
  option domain-name "domain.local";
  option routers 10.10.10.1;
  default-lease-time 600;
  max-lease-time 7200;
}
```
```
sudo ./bridge.sh
```
