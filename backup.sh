#!/bin/sh

VOLUMES_DIR=/volumes
BACKUP_DIR=/backup

cd $VOLUMES_DIR
date=`date +%y-%m-%d`

for volume in *; do
  cd $VOLUMES_DIR/$volume
  filename="$volume-$date.tar.gz"
  # Create a new backup of the volume
  tar -cpz -f /backup/$filename * > /dev/null

  cd $BACKUP_DIR
  # Delete all backups of the volume except the last 14
  ls -1t | grep ^$volume- | tail -n +15 | xargs rm -f
done
