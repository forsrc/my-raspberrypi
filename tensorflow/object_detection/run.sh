
wget https://github.com/google-coral/pycoral/releases/download/v1.0.1/tflite_runtime-2.5.0-cp37-cp37m-linux_armv7l.whl
pip3 install tflite_runtime-2.5.0-cp37-cp37m-linux_armv7l.whl

bash download.sh /tmp

python3 detect_picamera.py   --model /tmp/detect.tflite   --labels /tmp/coco_labels.txt
