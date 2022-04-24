FROM openjdk:8-jdk-buster

ENV TZ Asia/Shanghai

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
RUN echo "\n \
deb https://mirrors.huaweicloud.com/debian/ buster main contrib non-free \n \
deb https://mirrors.huaweicloud.com/debian/ buster-updates main contrib non-free \n \
deb https://mirrors.huaweicloud.com/debian/ buster-backports main contrib non-free \n \
deb https://mirrors.huaweicloud.com/debian-security/ buster/updates main contrib non-free \n \
deb-src https://mirrors.huaweicloud.com/debian/ buster main contrib non-free \n \
deb-src https://mirrors.huaweicloud.com/debian/ buster-updates main contrib non-free \n \
deb-src https://mirrors.huaweicloud.com/debian/ buster-backports main contrib non-free \n \
"> /etc/apt/sources.list

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install --assume-yes apt-utils
RUN apt-get install -y bash locales
RUN echo "zh_CN.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen
RUN echo "export LC_ALL=zh_CN.UTF-8" >> /etc/profile

RUN apt-get autoclean
RUN apt-get autoremove
ENV LC_ALL zh_CN.UTF-8

RUN groupadd -g 1000 devops
RUN useradd -u 1000 devops -g devops