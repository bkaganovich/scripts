#!/bin/bash

# File: tar-backup.sh
# Create gzip tarball archive backup of specified directories and files.

today=$(date +'%Y.%m.%d')
filename="usb-$today.tar.gz"
files="code/ documents/ keys/ notes/ photos/ pia.txt"

. ~/b
unmount #~/runz/unmount
mnt #~/runz/mnt
cd /media/usb #change dir to usb

tar -czvf ./backups/$filename $files #make archive

if (( $SECONDS > 3600 )) ; then
    let "hours=SECONDS/3600"
    let "minutes=(SECONDS%3600)/60"
    let "seconds=(SECONDS%3600)%60"
    echo "Completed in $hours hour(s), $minutes minute(s), and $seconds second(s)."
elif (( $SECONDS > 60 )) ; then
    let "minutes=(SECONDS%3600)/60"
    let "seconds=(SECONDS%3600)%60"
    echo "Completed in $minutes minute(s) and $seconds second(s)."
else
    echo "Completed in $SECONDS seconds."
fi
