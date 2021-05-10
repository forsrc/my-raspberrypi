raspivid -t 0 -b 25000000 -fps 30 -w 800 -h 600 -o - | nc -lkv4 8080


raspivid -o - -t 0 -b 25000000 -n -w 800 -h 600 -fps 30 | cvlc -vvv stream:///dev/stdin --sout '#rtp{sdp=rtsp://:8554/}' :demux=h264

