sudo apt update
sudo apt install snapd
sudo snap install core

sudo snap install lxd


sudo lxd init --network-address 0.0.0.0 --network-port 8443 --auto

##################


sudo systemctl status snap-lxd-19390.mount
sudo systemctl status snap.lxd.activate.service
sudo systemctl status snap.lxd.daemon.unix.socket
sudo systemctl status snap.lxd.daemon.service




sudo systemctl stop snap.lxd.daemon.unix.socket
sudo systemctl stop snap.lxd.daemon.service
sudo systemctl stop snap-lxd-19390.mount
sudo systemctl stop snap.lxd.activate.service

sudo systemctl disable snap-lxd-19390.mount
sudo systemctl disable snap.lxd.activate.service
sudo systemctl disable snap.lxd.daemon.unix.socket
sudo systemctl disable snap.lxd.daemon.service
