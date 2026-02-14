#!/bin/bash

set -e

# Set file permissions
PUID=${PUID:-1000}
PGID=${PGID:-1000}

echo "Using UID: $PUID  GID: $PGID"
groupmod -o -g "$PGID" ksp
usermod  -o -u "$PUID" ksp
chown -R "$PUID:$PGID" /home/ksp /data 2>/dev/null || true

exec su -s /bin/bash ksp -c '
    cp -rn /home/ksp/server/* /data/

    cd /data
    exec mono DMPServer.exe
'