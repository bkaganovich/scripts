#!/bin/bash

# File: tar-backup.sh
# Version: 3
# Create gzip tarball archive backup of specified directories and files.

# Prompts for archive name (i.e. myarchive)
# Prompts for full path of target input dir (/home/username/Documents)
# Prompts if to change default backup dir, prompts for new output backup dir

# Default output backup dir (ending with /):
backupdir="$HOME/backups/"

#timestamp format yyyy.mm.dd.hhmmss
today=$(date +'%Y.%m.%d.%H%M%S')

#enter archive name
read -p "Enter archive name: " archive

#enter path of target input dirs
read -p "Enter full path of target input dir: " targetdir
files="$targetdir/"

out_dir () {
    printf "Current output directory: $backupdir\n"
}

out_dir #show current output dir

#prompt for output backup dir
read -p "Change output directory? [y/n] " choice

if [ "$choice" == "y" ] || [ "$choice" == "Y" ];
then
    read -p "Enter full path for output dir (ending with /): " backupdir
    out_dir #show current output dir
fi

#filename formatting
filename="$archive-$today.tar.gz"

#archive operation
tar -czvf $backupdir$filename $files #make archive at destination

#result
printf "\nCreated $backupdir$filename\n"

#timer
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
