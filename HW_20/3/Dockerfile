FROM php:apache

ENV APACHE_DOCUMENT_ROOT /var/www/simple-app
ARG mysql_hostname=mysql
ARG database=simple_lamp
ARG username=root
ARG password=root
ARG memcached_hostname=memcached

WORKDIR /var/www

RUN apt update \
&& apt install -y \
git libmemcached-dev libssl-dev zlib1g-dev \
&& pecl install memcached-3.2.0 \
&& docker-php-ext-enable memcached \
&& docker-php-ext-install pdo pdo_mysql

RUN git clone https://github.com/qyjohn/simple-lamp.git

COPY info.php /var/www/simple-lamp

RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini \
&& sed -i \
	   -e 's+$db_hostname = "localhost";+$db_hostname = "'$mysql_hostname'";+g' \
	   -e 's+$db_database = "simple_lamp";+$db_database = "'$database'";;+g' \
	   -e 's+$db_username = "username";+$db_username = "'$username'";+g' \
	   -e 's+$db_password = "password";+$db_password = "'$password'";+g' \
	   -e 's+$enable_cache = false;+$enable_cache = true;+g' \
	   -e 's+$cache_server = "dns-or-ip-of-memcached-server";+$cache_server = "'$memcached_hostname'";+g' \
simple-lamp/config.php \
&& sed -i \
	   -e 's+session.save_handler = files+session.save_handler ='$memcached_hostname'+g' \
	   -e 's+;     session.save_path = "N;/path"+session.save_path = "'$memcached_hostname:11211'"+g' \
/usr/local/etc/php/php.ini \
&& chown -R www-data:www-data simple-lamp/uploads

COPY simple-lamp.conf /etc/apache2/sites-enabled/000-default.conf
