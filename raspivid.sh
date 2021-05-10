raspivid -t 0 -b 25000000 -fps 30 -w 800 -h 600 -o - | nc -lkv4 8080
