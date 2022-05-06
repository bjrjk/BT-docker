FROM ubuntu:20.04
MAINTAINER me@rjk.pub
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /tmp
VOLUME ["/www/wwwroot", "/www/server/data", "/www/backup"]
RUN apt update && apt upgrade -y && apt install wget -y
RUN touch /www/123
RUN wget -O install.sh http://download.bt.cn/install/install-ubuntu_6.0.sh && echo y | bash install.sh ed8484bec
WORKDIR /root
COPY ./entrypoint.sh /root/
ENTRYPOINT ["bash", "/root/entrypoint.sh"]
EXPOSE 20 21 80 443 8888
