#!/bin/bash

# To do:
# If no data added since last snapshot, skip step
# Pruning of old snapshots

SNAPSHOTDATE=$(date +%d-%m-%y)
FILESYSTEMNAME="myraidz"
LOGFILE="/var/log/backup.log"

echo "Today's date is: $SNAPSHOTDATE"

if (zfs list -rtall | grep "$SNAPSHOTDATE"); then
  echo "$SNAPSHOTDATE Snapshot already exists for $FILESYSTEMNAME." >> $LOGFILE
else 
  # Snapshot for today's date does not exist so create snapshot now
  sudo zfs snapshot $FILESYSTEMNAME@snapshot$SNAPSHOTDATE -r
  echo "$SNAPSHOTDATE - Backup is complete of $FILESYSTEMNAME and subfolders." >> $LOGFILE
fi
	

