#!/bin/bash
set -e

HOST=${HOST:-"0.0.0.0"}
PORT=${PORT:-"8080"}
USERNAME=${USERNAME:-"admin"}
PASSWORD=${PASSWORD:-"changeme"}
INSTANCE_NAME=${INSTANCE_NAME:-"Instance"}
MODULE=${MODULE:-"ADS"}

if [ -z ${LICENCE+x} ]; then echo "Error: A licence for AMP from cubecoders.com is required and must be specified as --licence_key xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"; exit 1; fi

if [ ! -d ~/.ampdata/instances/$INSTANCE_NAME/ ]; then
    echo "Creating module instance: ampinstmgr CreateInstance $MODULE $INSTANCE_NAME $HOST $PORT $LICENCE $PASSWORD +Core.Login.Username $USERNAME ${EXTRAS[@]}"
    ampinstmgr CreateInstance $MODULE $INSTANCE_NAME $HOST $PORT $LICENCE $PASSWORD +Core.Login.Username $USERNAME ${EXTRAS[@]}
    echo "Starting instance: $INSTANCE_NAME"
    (cd /ampdata/instances/$INSTANCE_NAME && exec ./AMP_Linux_x86_64)
else
    echo "Starting instance: $INSTANCE_NAME"
    (cd /ampdata/instances/$INSTANCE_NAME && ./AMP_Linux_x86_64 +Core.AMP.LicenceKey $LICENCE && exec ./AMP_Linux_x86_64)
fi
