FROM ubuntu:16.04
MAINTAINER Alair J. Tavares <alairjt@gmail.com>

# Install apt packages
RUN apt-get update && apt-get install -y git  lib32ncurses5 lib32gomp1 lib32z1-dev lib32stdc++6 lib32z1 npm nodejs nodejs-legacy s3cmd build-essential curl openjdk-8-jdk-headless libio-socket-ssl-perl libnet-ssleay-perl build-essential chrpath libssl-dev libxft-dev libfreetype6 libfreetype6-dev libfontconfig1 libfontconfig1-dev && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV PHANTOM_JS phantomjs-1.9.8-linux-x86_64

RUN wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2

RUN tar xvjf $PHANTOM_JS.tar.bz2

RUN mv $PHANTOM_JS /usr/local/share

RUN ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin

RUN phantomjs --version

# Install npm packages
RUN npm i -g gulp gulp-cli bower && npm cache clean

WORKDIR /app

