sudo python3.7 -m pip install pip

sudo apt-get install -y libhdf5-dev libc-ares-dev libeigen3-dev gcc gfortran libgfortran5 \
                          libatlas3-base libatlas-base-dev libopenblas-dev libopenblas-base libblas-dev \
                          liblapack-dev cython libatlas-base-dev openmpi-bin libopenmpi-dev python3.7-dev
#sudo pip3 install numpy==1.18.5
sudo pip3 install numpy==1.19.5
sudo pip3 install grpcio==1.37.0
#sudo pip3 install scipy 
sudo pip3 install h5py==2.10.0
sudo pip3 install keras_applications==1.0.8 --no-deps
sudo pip3 install keras_preprocessing==1.1.0 --no-deps
#sudo pip3 install --upgrade numpy

sudo pip3 install pybind11
pip3 install -U --user six wheel mock

wget "https://raw.githubusercontent.com/PINTO0309/Tensorflow-bin/master/tensorflow-2.4.0-cp37-none-linux_aarch64_download.sh"
./tensorflow-2.4.0-cp37-none-linux_aarch64_download.sh

wget "https://raw.githubusercontent.com/PINTO0309/Tensorflow-bin/master/tensorflow-2.4.0-cp37-none-linux_armv7l_download.sh"
./tensorflow-2.4.0-cp37-none-linux_armv7l_download.s

sudo pip3 uninstall tensorflow
sudo -H pip3 install tensorflow-2.4.0-cp37-none-linux_aarch64.whl
