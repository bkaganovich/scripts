#!/bin/bash

# File: get_ip_addresses.sh

# Get the list of network interfaces
interfaces=$(ip -o -4 addr show | awk '{print $2}')

# Use curl to send a request to icanhazip.com
public_ip=$(curl -s icanhazip.com)

# Print the table header
printf "%-20s %-15s %s\n" "Interface" "IP Address" "MAC Address"

# Iterate over the list of interfaces
for interface in $interfaces; do
    # Get the IP address and MAC address of the current interface
    ip_address=$(ip -o -4 addr show "$interface" | awk '{print $4}' | awk -F '/' '{print $1}')
    mac_address=$(ip link show "$interface" | awk '/ether/ {print $2}')
    # Print the interface name, IP address, and MAC address
    printf "%-20s %-15s %s\n" "$interface" "$ip_address" "$mac_address"
done

echo ""
# Print the public IP address
echo "Your public IP address is: $public_ip"
