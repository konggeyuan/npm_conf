# npm_conf
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

### mysql配置 ###
