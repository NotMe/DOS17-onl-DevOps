FROM ubuntu:16.04

ENV MYSQL_PWD mysql
RUN echo "mysql-server mysql-server/root_password password $MYSQL_PWD" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password $MYSQL_PWD" | debconf-set-selections

ARG hostname=localhost
ARG database=simple_lamp
ARG username=root
ARG password=mysql

WORKDIR /var/www

RUN apt update \
&& DEBIAN_FRONTEND=noninteractive \
apt install -y \
git mysql-server apache2 php libapache2-mod-php php-mcrypt php-mysql php-curl php-xml php-memcached supervisor

RUN git clone https://github.com/qyjohn/simple-lamp.git

RUN service mysql start \
&& mysql -u $username -p$password \
&& mysql -e "CREATE DATABASE $database;" \
&& mysql -u $username -p$password $database < simple-lamp/simple_lamp.sql \
&& sed -i \
-e 's+$db_username = "username";+$db_username = "'$username'";+g' \
-e 's+$db_password = "password";+$db_password = "'$password'";+g' \
-e 's+$enable_cache = false;+$enable_cache = true;+g' \
-e 's+$cache_server = "dns-or-ip-of-memcached-server";+$cache_server = "'$hostname'";+g' \
simple-lamp/config.php \
&& sed -i \
-e 's+session.save_handler = files+session.save_handler = memcached+g' \
-e 's+;     session.save_path = "N;/path"+session.save_path = "'$hostname:11211'"+g' \
/etc/php/7.0/apache2/php.ini \
&& sed -i \
-e 's+DocumentRoot /var/www/html+DocumentRoot /var/www/simple-lamp+g' \
/etc/apache2/sites-enabled/000-default.conf \
&& chown -R www-data:www-data simple-lamp/uploads

ADD start-apache2.sh start-mysqld.sh run.sh /

RUN chmod 755 /*.sh

ADD supervisord-apache2.conf supervisord-mysqld.conf supervisord.conf /etc/supervisor/conf.d/

EXPOSE 888

#ENTRYPOINT ["/lib/systemd/systemd"]
CMD ["/run.sh"]
