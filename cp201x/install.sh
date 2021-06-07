sudo apt-get install raspberrypi-kernel-headers -y

make ( your cp210x driver )
cp cp210x.ko to /lib/modules//kernel/drivers/usb/serial
#insmod /lib/modules/<kernel-version/kernel/drivers/usb/serial/usbserial.ko
insmod /lib/modules/5.10.17+/kernel/drivers/usb/serial/usbserial.ko
insmod cp210x.ko
