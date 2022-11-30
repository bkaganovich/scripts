#!/bin/bash

# File: user-sys-info.sh

# Outputs values of $USER, $HOSTNAME, $HOME, 
# $SHELL, operating system, kernel release,
# public IP, and local IP based on chosen interface.

echo -e "Logged in as:\t$USER"
echo -e "Hostname:\t$HOSTNAME"
echo -e "Home directory:\t$HOME"
echo -e "Shell:\t\t$SHELL"
echo -e "OS:\t\t$(uname -o)"
echo -e "Kernel:\t\t$(uname -r)"
echo -e "Public IP:\t$(curl -s ifconfig.me)"

interface="wlo1" #select interface

echo -e "Local IP:\t$(ifconfig | grep $interface -A 1 | grep inet | \
cut -d " " -f 10) ($interface)"
