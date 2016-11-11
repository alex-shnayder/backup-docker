FROM alpine:3.4

COPY backup.sh /root/backup.sh
COPY crontab /root/crontab
RUN chmod 755 /root/backup.sh && \
    /usr/bin/crontab /root/crontab && \
    touch /root/backup.log && \
    mkdir /backup
VOLUME /backup

CMD crond && tail -f /root/backup.log
