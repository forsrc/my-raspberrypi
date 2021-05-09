

https://github.com/SuLingGG/OpenWrt-Rpi




uci set network.lan.ipaddr=192.168.2.200
uci commit network
/etc/init.d/network restart

===========================================


sudo vim /etc/network/interfaces

auto br0 
iface br0 inet static
      address 192.168.2.100
      netmask 255.255.255.0
      bridge_ports eth0
      bridge_stp off 
      bridge_fd 2 
      bridge_maxwait 20

sudo systemctl restart networking
    

lxc-create -t download -n openwrt

sudo vim /var/lib/lxc/openwrt/config

# Template used to create this container: /usr/share/lxc/templates/lxc-download
# Parameters passed to the template: --server mirrors.tuna.tsinghua.edu.cn/lxc-images
# Template script checksum (SHA-1): 273c51343604eb85f7e294c8da0a5eb769d648f3
# For additional config options, please look at lxc.container.conf(5)

# Uncomment the following line to support nesting containers:
#lxc.include = /usr/share/lxc/config/nesting.conf
# (Be aware this has security implications)


# Distribution configuration
lxc.include = /usr/share/lxc/config/common.conf
lxc.arch = arm64

# Container specific configuration
lxc.apparmor.profile = generated
lxc.apparmor.allow_nesting = 1
lxc.rootfs.path = dir:/var/lib/lxc/openwrt/rootfs
lxc.uts.name = openwrt

# Network configuration
lxc.net.0.type=veth
lxc.net.0.link = br0
lxc.net.0.flags = up
lxc.net.0.hwaddr = 00:16:3e:35:10:cd



sudo vim /etc/lxc/default.conf

#/etc/lxc/default.conf 
lxc.apparmor.profile = generated
lxc.apparmor.allow_nesting = 1
lxc.net.0.type=veth
lxc.net.0.link = br0
lxc.net.0.flags = up
lxc.net.0.hwaddr = 00:11:22:xx:xx:xx



cd /var/lib/lxc/openwrt/rootfs/

sudo wget https://openwrt.cc/releases/targets/bcm27xx/bcm2711/openwrt-bcm27xx-bcm2711-rpi-4-rootfs.tar.gz
sudo gzip -d openwrt-bcm27xx-bcm2711-rpi-4-rootfs.tar.gz
sudo tar -xf openwrt-bcm27xx-bcm2711-rpi-4-rootfs.tar
sudo rm openwrt-bcm27xx-bcm2711-rpi-4-rootfs.tar


sudo lxc-start -n openwrt -d

sudo lxc-attach -n openwrt

uci set network.lan.ipaddr=192.168.2.200
uci commit network
/etc/init.d/network restart





