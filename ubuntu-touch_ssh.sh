mkdir ~/.ssh
chmod 700 ~/.ssh
ssh-keygen -t rsa

adb shell android-gadget-service enable 
adb shell mkdir /home/phablet/.ssh
adb push ~/.ssh/id_rsa.pub /home/phablet/.ssh/authorized_keys
adb shell chmod 644 /home/phablet/.ssh/authorized_keys
adb shell chmod 700 /home/phablet/.ssh/
adb shell chown phablet:phablet /home/phablet/.ssh/
