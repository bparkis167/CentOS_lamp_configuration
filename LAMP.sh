#!/bin/bash

rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY*

yum -y install epel-release

yum -y install mariadb-server mariadb

systemctl start mariadb.service

systemctl enable mariadb.service

mysql_secure_installation


yum -y install httpd

systemctl start httpd
systemctl enable httpd

firewall-cmd --permanent --zone=public --add-service=http

firewall-cmd --permanent --zone=public --add-service=https

firewall-cmd --reload


yum -y install php

systemctl restart httpd

echo '<? php' > /var/www/html/info.php
echo '<phpinfo();' >> /var/www/html/info.php
echo '?>' >> /var/www/html/info.php

yum -y install php-mysql 
yum -y install php-gd php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-snmp php-soap curl curl-devel

systemctl restart httpd.service
yum install phpMyAdmin
systemctl restart httpd.service

echo "your phpmyadmin configuration files are located in /etc/httpd/conf.d/phpMyAdmin.conf"
echo " you can access your php info through http://yourip/info.php"
