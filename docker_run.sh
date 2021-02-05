docker run -itd --name mysql -p 3306:3306 -v /media/nfs/pi/mysql/conf.d:/etc/mysql/conf.d -v /media/nfs/pi/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root mysql/mysql-server:latest-aarch64
