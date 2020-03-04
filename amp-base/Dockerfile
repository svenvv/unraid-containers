FROM debian:10-slim

#set locale
ENV DEBIAN_FRONTEND=noninteractive

#initialization
RUN apt-get update && \
    apt-get install -y apt-utils && \
    touch /etc/inittab && \
    mkdir /usr/share/man/man1

#locale
RUN apt-get install -y locales && \
    locale-gen en_US.UTF-8 && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8 

ENV LANG en_US.UTF-8 
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

#dependencies
RUN apt-get install -y cron lib32gcc1 gnupg coreutils wget inetutils-ping tmux socat unzip git procps lib32gcc1 lib32stdc++6 net-tools nano && \
    export EDITOR=nano

#install adoptOpenJDK8 java runtime
RUN apt-get install -y apt-transport-https ca-certificates wget dirmngr software-properties-common &&\
    wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add - && \    
    add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ && \
    apt update && \
    apt-get install -y adoptopenjdk-8-hotspot

#cleanup
RUN apt -q autoremove --purge && \
    apt -q autoclean && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

