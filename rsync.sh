#sudo rsync -aqxP /var/lib/docker /media/nfs/pi/pi-01/var/lib/docker
#sudo rsync -aqxP /var/lib/docker /media/nfs/pi/pi-02/var/lib/docker

sudo rsync -axP /var/lib/docker /media/nfs/pi/pi-00/var/lib/docker
sudo rsync -axP /var/lib/docker /media/nfs/pi/pi-01/var/lib/docker
sudo rsync -axP /var/lib/docker /media/nfs/pi/pi-02/var/lib/docker
