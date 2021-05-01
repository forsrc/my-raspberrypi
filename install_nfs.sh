
sudo apt install nfs-kernel-server

sudo apt install nfs-common


sudo vim  /etc/exports

/media/nfs/pi *(rw,sync,no_subtree_check,no_root_squash)


sudo vim /etc/fstab

pi-00:/media/nfs/pi/   /media/nfs/pi   nfs    auto  0  0



sudo vim /etc/network/if-up.d/fstab

#!/bin/sh
mount -a


sudo chmod +x /etc/network/if-up.d/fstab
