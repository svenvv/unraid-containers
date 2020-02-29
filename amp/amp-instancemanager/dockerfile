
# Modified From https://hub.docker.com/r/joly0/amp/dockerfile

FROM angleracket/amp-instancemanager-base:latest

ENV AMPUSER=admin
ENV AMPPASSWORD=changeme123
ENV DEBIAN_FRONTEND=noninteractive


#create AMP user
RUN useradd -d /home/AMP -m AMP -s /bin/bash
RUN chown AMP:AMP -R /home

# Install AMP
RUN apt-key adv --fetch-keys http://repo.cubecoders.com/archive.key
RUN apt-add-repository "deb http://repo.cubecoders.com/ debian/"
RUN apt-get update
RUN apt-get -y install ampinstmgr

# cleanup
RUN apt -q autoremove --purge
RUN apt -q autoclean
RUN rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

# setup auto start
RUN su -l AMP -c '(crontab -l ; echo "@reboot ampinstmgr -b")| crontab -'

# setup data folder for volume
RUN mkdir -p /data
RUN touch /data/empty
RUN chown AMP:AMP /data
RUN ln -s /data /home/AMP/.ampdata

# create file /home/start.sh
RUN echo 'if [ -d "/home/AMP/.ampdata/ADS01" ]; then su - AMP -c "ampinstmgr startinstance ADS01 & disown"; exec /bin/bash; else su - AMP -c "ampinstmgr quickstart $AMPUSER $AMPPASSWORD & disown"; exec /bin/bash; fi;' > /home/start.sh
RUN chmod +x /home/start.sh

# docker host exports
EXPOSE 8080
VOLUME ["/data"]


ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/home/start.sh"]