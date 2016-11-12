FROM alpine:3.4

COPY entry.sh /root/entry.sh
COPY backup.sh /root/backup.sh
COPY crontab /root/crontab
RUN chmod 755 /root/entry.sh && \
    chmod 755 /root/backup.sh && \
    touch /root/backup.log && \
    mkdir /backup
VOLUME /backup

CMD /root/entry.sh
