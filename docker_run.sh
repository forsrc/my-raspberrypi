# mysql
docker run -itd --name mysql \
           -p 3306:3306 \
           -v /media/nfs/pi/mysql/conf.d:/etc/mysql/conf.d \
           -v /media/nfs/pi/mysql/data:/var/lib/mysql \
           -e MYSQL_ROOT_PASSWORD=root \
           mysql/mysql-server:latest-aarch64


docker run -itd --name postgres \
           -p 5432:5432 \
           -e POSTGRES_PASSWORD=postgres \
           -v /media/nfs/pi/postgres/data:/var/lib/postgresql/data \
           postgres:latest
