sudo apt-get install raspberrypi-kernel-headers -y

make ( your cp210x driver )
#cp cp210x.ko to /lib/modules/5.10.17+/kernel/drivers/usb/serial
sudo cp cp210x.ko /lib/modules/5.10.17+/kernel/drivers/usb/serial
#insmod /lib/modules/<kernel-version/kernel/drivers/usb/serial/usbserial.ko
sudo insmod /lib/modules/5.10.17+/kernel/drivers/usb/serial/usbserial.ko
sudo insmod cp210x.ko
