FROM angleracket/amp-base:latest

EXPOSE 8080-8180
EXPOSE 5678-5688
EXPOSE 7777-7877
EXPOSE 21025-21125
EXPOSE 25565-25665
EXPOSE 27015-27115
EXPOSE 28015-28115
EXPOSE 34197-34297

ENV ANSWER_AMPUSER=admin
ENV ANSWER_AMPPASS=changeme123

RUN export CHANGE_DATE=20200308 && \
    export ANSWER_SYSPASSWORD=$(cat /proc/sys/kernel/random/uuid) && \
    export USE_ANSWERS=1 && \
    export SKIP_INSTALL=1 && \
    bash -c "bash <(wget -qO- https://cubecoders.com/getamp.sh)" && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/home/amp"]

ENTRYPOINT (su -l amp -c "ampinstmgr quick '${ANSWER_AMPUSER}' '${ANSWER_AMPPASS}' && ampinstmgr view ADS true") || bash || tail -f /dev/null