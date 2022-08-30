#!/bin/bash
#deprecated - эти директивы содержатся в ENTRYPOINT-скрипте
#скрипт для замены ip на реальный IP
path_to_file_index_php="/var/www/html/index.php"
#path_to_file_index_php="index.php" #for testing and debug
current_ip_address=$(curl ifconfig.io)
internal_ip_address=$(hostname -I)
random_value=$(echo $RANDOM)
echo "random_value: $random_value"
sed -i "s/internal_ipadress/$internal_ip_address/" $path_to_file_index_php
sed -i "s/ipadress/$current_ip_address/" $path_to_file_index_php
sed -i "s/random1/$random_value/" $path_to_file_index_php
sed -i "s/random2/$(echo $RANDOM)/" $path_to_file_index_php
sed -i "s/date_creation/$(date)/" $path_to_file_index_php
service php8.1-fpm start
ln -s /etc/init.d/php8.1-fpm /etc/systemd/system/php8.1
/etc/init.d/php8.1-fpm start