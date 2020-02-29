# Modified From https://hub.docker.com/r/joly0/amp/dockerfile
# rebased on full debian 9 image: https://hub.docker.com/r/azul/zulu-openjdk-debian/dockerfile
# changed to apt-get instead of install_packages
# added apt-utils
# re-ordered language section


FROM azul/zulu-openjdk-debian:latest

RUN apt-get -y install apt-utils

# SET LOCALE
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8 
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

RUN touch /etc/inittab
RUN mkdir -p /usr/share/man/man1
RUN apt-get -y install dumb-init cron lib32gcc1 coreutils inetutils-ping tmux socat unzip wget git procps lib32gcc1 lib32stdc++6 software-properties-common dirmngr apt-transport-https software-properties-common dirmngr apt-transport-https gnupg apt-utils vim

RUN export EDITOR=vim

# cleanup
RUN apt -q autoremove --purge
RUN apt -q autoclean
RUN rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

