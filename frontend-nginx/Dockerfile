#first proxy-web-server nginx without php
FROM ubuntu
LABEL description="simple webserver based on nginx without php" creator="skiff" side="frontend"
#RUN apt-get -y update && apt-get -y upgrade && apt-get install -y nginx net-tools nano curl wget netcat php php-fpm
#RUN apt-get -y update && apt-get -y upgrade
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/EEST apt-get -y update && apt-get -y upgrade && apt-get -y install tzdata
RUN apt-get install -y net-tools nano curl wget netcat nginx
#php php-fpm

#configuring nginx
COPY ./default /etc/nginx/sites-available/default

#RUN ./install_docker_for_containers.sh
EXPOSE 80
#copy scripts
#COPY ./*.sh /
#RUN chmod 755 /*.sh
#RUN . /put_ip_to_index.sh
#RUN /etc/init.d/php8.1-fpm start
#ENTRYPOINT [ "service", "php8.1-fpm", "start"]
#ENTRYPOINT [ "service", "php8.1-fpm", "start;" ]
CMD ["nginx", "-g", "daemon off;"]