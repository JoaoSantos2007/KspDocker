FROM mono:latest

RUN userdel -r ubuntu 2>/dev/null || true && \
    groupadd -g 1000 ksp && \
    useradd -u 1000 -g 1000 -m -d /home/ksp -s /bin/bash ksp

ENV PUID=1000 \
    PGID=1000

COPY ./scripts /home/ksp/scripts
COPY ./DMPServer/ /home/ksp/server

RUN chmod +x /home/ksp/scripts/*.sh && \
    chown -R 1000:1000 /home/ksp

WORKDIR /home/ksp

VOLUME ["/data/Config", "/data/Universe", "/data/logs"]

EXPOSE 8800/udp

STOPSIGNAL sigint

ENTRYPOINT ["/home/ksp/scripts/init.sh"]
