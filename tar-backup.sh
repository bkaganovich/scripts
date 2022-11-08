#!/bin/bash

# File: tar-backup.sh
# Version: 2
# Create gzip tarball archive backup of specified directories and files.

today=$(date +'%Y.%m.%d')


#enter archive name
filename="directory-$today.tar.gz"

#enter path of target dir
files="directory/"

cd /media/usb/documents/ #change dir

tar -czvf /home/benny/backups/$filename $files #make archive at destination

#tar -czvf ./backups/$filename $files #make archive

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
