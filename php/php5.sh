docker exec -it php5 bash -c "set -ex \
&& cd ~ \
&& mv /etc/apt/sources.list /etc/apt/sources.list.bak \
&& { \
echo deb http://mirrors.aliyun.com/debian/ jessie main non-free contrib; \
echo deb http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib; \
echo deb-src http://mirrors.aliyun.com/debian/ jessie main non-free contrib; \
echo deb-src http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib; \
} | tee /etc/apt/sources.list \
&& apt-get update \
&& apt-get install -y git \
libpcre3-dev \
libfreetype6-dev \
libjpeg62-turbo-dev \
libmcrypt-dev \
libpng12-dev \
&& docker-php-ext-install -j1 iconv mcrypt \
&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
&& docker-php-ext-install -j1 gd \
&& docker-php-ext-install mysql \
&& docker-php-ext-install mysqli \
&& docker-php-ext-install sockets \
&& docker-php-ext-install pdo_mysql "

