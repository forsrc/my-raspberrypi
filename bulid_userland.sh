git clone https://github.com/raspberrypi/userland
cd userland
# ./buildme --aarch64
# /opt/{vc,vc64}
cmake clean
cmake -DARM64=ON -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=opt/vc64 -DVMCS_INSTALL_PREFIX=opt/vc64
sudo make install
