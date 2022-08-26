#!/bin/bash
#скрипт для замены ip на реальный IP
path_to_file_index_php="/var/www/html/index.php"
#path_to_file_index_php="index.php" #for testing and debug
current_ip_address=$(curl ifconfig.io)
internal_ip_address=$(hostname -I)
sed -i "s/internal_ipadress/$internal_ip_address/" $path_to_file_index_php
sed -i "s/ipadress/$current_ip_address/" $path_to_file_index_php
service php8.1-fpm start
ln -s /etc/init.d/php8.1-fpm /etc/systemd/system/php8.1
/etc/init.d/php8.1-fpm start