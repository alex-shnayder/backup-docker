#!/bin/sh

VOLUMES_DIR=/volumes
BACKUP_DIR=/backup

cd $VOLUMES_DIR
date=`date +%Y-%m-%d-%H-%M`

for volume in *; do
  cd $VOLUMES_DIR/$volume
  filename="$volume-$date.tar.gz"
  # Create a new backup of the volume
  tar -cpz -f /backup/$filename * > /dev/null

  cd $BACKUP_DIR
  # Delete all backups of the volume except the last $BACKUPS_TO_KEEP
  ls -1t | grep ^$volume- | tail -n +$((BACKUPS_TO_KEEP+1)) | xargs rm -f
done
