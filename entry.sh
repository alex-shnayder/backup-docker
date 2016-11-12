#!/bin/sh

echo "$SCHEDULE /root/backup.sh 2>>/root/backup.log" >> /root/crontab
/usr/bin/crontab /root/crontab
crond && tail -f /root/backup.log
