# mysql
docker run -itd --name mysql \
           -p 3306:3306 \
           -v /media/nfs/pi/mysql/conf.d:/etc/mysql/conf.d \
           -v /media/nfs/pi/mysql/data:/var/lib/mysql \
           -e MYSQL_ROOT_PASSWORD=root \
           mysql/mysql-server:latest-aarch64

docker run -itd --name mysql \
           -p 3306:3306 \
           -v /docker/mysql/conf.d:/etc/mysql/conf.d \
           -v /docker/mysql/data:/var/lib/mysql \
           -e MYSQL_ROOT_PASSWORD=root \
           mysql/mysql-server:latest-aarch64
           
```           
CREATE USER 'root'@'localhost' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
CREATE USER 'root'@'%' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;
CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;
```

docker run --name phpmyadmin -d --link mysql:db -e MYSQL_ROOT_PASSWORD=root -e PMA_USER=root -e PMA_PASSWORD=root -p 8680:80 phpmyadmin




######################################

docker run -itd --name postgres \
           -p 5432:5432 \
           -e POSTGRES_PASSWORD=postgres \
           -v /media/nfs/pi/postgres/data:/var/lib/postgresql/data \
           postgres:latest


docker run -itd --name postgres \
           -p 5432:5432 \
           -e POSTGRES_PASSWORD=postgres \
           -v /docker/postgres/data:/var/lib/postgresql/data \
           postgres:latest
           
############################

docker run -p 6379:6379 --name redis -d redis redis-server --appendonly yes

docker run -it --name redis-cli --link redis:redis --rm redis redis-cli -h redis -p 6379
############################


docker run -d --name elasticsearch -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" arm64v8/elasticsearch:7.14.0
docker run --name kibana -p 5601:5601 --link elasticsearch:elasticsearch -e "ELASTICSEARCH_HOSTS=http://elasticsearch:9200" docker.elastic.co/kibana/kibana:7.14.0


