# nginx+mysql+php配置

###nginx+mysql+php配置文件


###添加阿里云官方docker源

vim /etc/docker/daemon.json


docker pull php:5-fpm     php5的statble版本
docker pull php:7-fpm     php7的某个版本
docker pull mysql:5.7     mysql5.x稳定版
docker pull nginx:stable  nginx1.7

docker pull 镜像

{
  "registry-mirrors": ["https://x7e3y83k.mirror.aliyuncs.com"]
}


##### 配置目录预设环境

/server

##### mysql配置

docker run -d -e MYSQL_ROOT_PASSWORD=123456 \
--name mysql \
-v /server/mysql/conf/my.cnf:/etc/mysql/conf.d/my.cnf \
-v /data/mysql/data:/var/lib/mysql \
-v /data/mysql/logs:/logs \
-p 3306:3306 mysql:5.7

##### PHP配置

docker run -d -p 9000:9000 --name php5 \
-v /opt/workspace:/www \
-v /server/php/conf/php.ini:/usr/local/etc/php/php.ini \
-v /server/php/conf/www.conf:/usr/local/etc/php-fpm.d/www.conf \
-v /tmp:/tmp \
--link mysql:mysql \
php:5-fpm

##### nginx配置

docker run -d -p 80:80 --name nginx-stable \
-v /server/nginx/conf:/etc/nginx/conf.d \
--link php5:php \
-v /www:/www \
-v /data/logs/nginx:/var/log/nginx \
nginx:stable

##### adminer mysql管理工具

docker run --link mysql:db --name adminer -p 8080:8080 adminer

