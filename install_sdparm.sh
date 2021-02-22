sudo apt-get install -y sdparm
sudo sdparm --command=start /dev/sda

#sudo crontab -e
# 00 */1 * * * sdparm --command=start /dev/sda
# */30 * * * * date > /tmp/date.log
