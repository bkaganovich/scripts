#!/bin/bash

# File: mount-encrypted-device.sh

# Description: Mount an encrypted block device and create a symbolic link to it
# in the /media directory.

# Open the encrypted block device and create a device mapper node
sudo cryptsetup open --type luks UUID=$(cat uuid.txt) sdb1-crypt

# Create the mount point if it doesn't exist
sudo mkdir -p /run/media/usb

# Mount the decrypted block device
sudo mount /dev/mapper/sdb1-crypt /run/media/usb

# Create a symbolic link to the mount point
cd /media && ln -s /run/media/usb/for-backup usb
