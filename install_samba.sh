sudo apt-get update

sudo apt-get install samba


sudo mkdir -p /nfs/samba
sudo chmod 777 /nfs/samba

sudo nano /etc/samba/smb.conf

[myshare]
path = /nfs/samba
writeable=Yes
create mask=0777
directory mask=0777
public=yes
browseable=yes




sudo smbpasswd -a pi


sudo systemctl restart smbd
