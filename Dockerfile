FROM centos:7
MAINTAINER Alair J. Tavares <alairjt@gmail.com>

ENV TZ=America/Sao_Paulo

RUN yum install -y wget && \
    cd ~ && \
    wget --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
    "http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jre-8u60-linux-x64.rpm" && \
    yum localinstall -y jre-8u60-linux-x64.rpm && \
    rm ~/jre-8u60-linux-x64.rpm && \
    yum install -y git bzip2 unzip fontconfig gcc-c++ make openjdk-8-jre && \
    curl --silent --location https://rpm.nodesource.com/setup_6.x  | bash - && \
    yum -y install nodejs && \
    yum clean all -y && \
    npm install -g bower gulp gulp-cli && \
    npm install -g phantomjs-prebuilt && \
    npm install -g protractor@4.0.4  && \
    webdriver-manager update

WORKDIR /app
