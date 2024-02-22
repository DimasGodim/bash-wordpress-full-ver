#!/bin/bash
apt update
apt install -y wget unzip apache2 mysql-server mysql-client php php-mysql php-xml php-curl php-zip bind9
wget https://wordpress.org/latest.zip
unzip latest.zip
mysql -e "CREATE USER 'dimas'@'localhost' IDENTIFIED BY 'Ukk2024*';"
mysql -e "CREATE DATABASE wordpress;"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'dimas'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"
mv wordpress/ /var/www/html
mv wordpress.conf /etc/apache2/sites-available
chown www-data:www-data -R /var/www/html/wordpress/
chmod -R 755 /var/www/html/wordpress/
a2ensite wordpress.conf
a2enmod rewrite
a2dissite 000-default.conf
systemctl restart apache2
mv dimasgodim.com /etc/bind/
mv dimasgodim.com.reverse /etc/bind/
mv named.conf.local /etc/bind/
mv resolv.conf /etc/
/etc/init.d/named restart