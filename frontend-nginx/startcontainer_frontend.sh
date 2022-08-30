#!/bin/bash
#start frontend container
#parameter can be URL to proxy
path_to_file_default_nginx="/etc/nginx/sites-available/default" #path to default nginx
default_domain="proxy-test.aws.someshit.org"
if [ "$1" != "" ] ; then #if parameter exist, then rewrite it
    sed -i "s/proxy_pass http:\/\/$default_domain/proxy_pass http:\/\/$1/" $path_to_file_default_nginx
    echo "rewrite configuration from: $default_domain"
    echo "rewrite configuration to: $1"
fi
nginx -g 'daemon off;'