cmd_/home/pi/git/rtl8821CU/Module.symvers := sed 's/ko$$/o/' /home/pi/git/rtl8821CU/modules.order | scripts/mod/modpost -m -a   -o /home/pi/git/rtl8821CU/Module.symvers -e -i Module.symvers   -T -
