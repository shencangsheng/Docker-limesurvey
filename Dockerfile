## by shencangsheng
FROM ubuntu:18.04

COPY sources.list /etc/apt/sources.list

RUN apt update

RUN apt install wget unzip -y \
    && wget https://download.limesurvey.org/latest-stable-release/limesurvey5.0.7+210628.zip \
    && unzip limesurvey5.0.7+210628.zip \
    && rm -rf limesurvey5.0.7+210628.zip \
    && mv limesurvey /var/www/html/limesurvey

RUN apt-get install software-properties-common -y \
    && add-apt-repository ppa:ondrej/php \
    && apt-get update

RUN apt-get install -y php7.3 \
    && apt install php7.3-xml/bionic php7.3-gd php7.3-ldap php7.3-zip php7.3-imap php7.3-mysql php7.3-mbstring -y

COPY start.sh /start.sh

EXPOSE 80

ENTRYPOINT ["bash","/start.sh"]