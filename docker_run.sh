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


############################

docker run -itd --privileged  \
-v /docker/dind/:/var/lib/docker \
-p 2376:2376 \
--name dind \
forsrc/raspbian:docker

docker exec dind sh -c "sed -i 's@fd://@tcp://0.0.0.0:2376@g' /lib/systemd/system/docker.service"
docker restart dind
docker -H tcp://172.17.0.1:2376 ps

############################
sudo mkdir -p /docker/jenkins
sudo chmod -R 777 /docker/jenkins
docker run --name jenkins -v /docker/jenkins:/var/jenkins_home -p 6080:8080 -p 5000:5000 --privileged --env DOCKER_HOST=tcp://172.17.0.1:2376 jenkins/jenkins:jdk11
############################


sudo docker run -d --privileged \
  --hostname gitlab \
  --publish 7443:443 --publish 7080:80 --publish 7022:22 \
  --name gitlab \
  --volume /docker/gitlab/logs:/var/log/gitlab \
  --volume /docker/gitlab/data:/var/opt/gitlab \
  forsrc/raspbian:gitlab
  
docker exec gitlab sh -c "gitlab-ctl reconfigure"
docker exec gitlab sh -c "systemctl enable gitlab-runsvdir.service"
docker exec gitlab sh -c "cat /etc/gitlab/initial_root_password"

```
/usr/lib/systemd/system/gitlab-runsvdir.service

[Unit]
Description=GitLab Runit supervision process
After=multi-user.target

[Service]
ExecStart=/opt/gitlab/embedded/bin/runsvdir-start
Restart=always
TasksMax=4915

[Install]
WantedBy=multi-user.target
```

#####################################

docker run -dit -p 9080:8080 \
   --name vscode \
   -h vscode \
   -u root \
   -v /docker/vscode/home:/home \
   -v /docker/vscode/root:/root \
   -e PASSWORD=vscode \
   codercom/code-server



#################
docker run -p 389:389 --name openldap --network bridge --hostname openldap --env LDAP_ORGANISATION="forsrc" --env LDAP_DOMAIN="forsrc.com" --env LDAP_ADMIN_PASSWORD="admin" --detach osixia/openldap
