FROM dperson/openvpn-client

RUN apk --no-cache --no-progress add wget unzip && \
    wget https://www.privateinternetaccess.com/openvpn/openvpn.zip && \
    unzip -d /vpn openvpn.zip && \



    ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/openvpn.sh"]