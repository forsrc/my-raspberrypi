sudo su -

cd /etc/polkit-1/localauthority/50-local.d

#vim 10-network-manager.pkla

cat << EOF > 10-network-manager.pkla
[Allow wi-fi scans for all users]
Identity=unix-user:*
Action=org.freedesktop.NetworkManager.wifi.scan
ResultAny=yes
ResultInactive=yes
ResultActive=yes
EOF


service network-manager restart
