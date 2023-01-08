#!/usr/bin/env python3

# File: geolocate.py

import ipaddress
import requests
import sys

def print_usage():
    print("Usage: python3 geolocate.py [OPTION]... [IP ADDRESS]")
    print("Locate the geolocation data for an IP address using the IPInfo API.")
    print()
    print("  -h, --help   display this help menu")

# Check for the -h or --help option
if '-h' in sys.argv or '--help' in sys.argv:
    print_usage()
    exit(0)

# Get the IP address from the command line arguments or prompt the user
if len(sys.argv) > 1:
    ip_address = sys.argv[-1]
else:
    ip_address = input("Enter an IP address: ")

# Validate the IP address
try:
    ip = ipaddress.ip_address(ip_address)
except ValueError:
    print("Invalid IP address")
    exit(1)

# Make a request to the IPInfo API
response = requests.get(f'https://ipinfo.io/{ip}/json')

# Parse the response
data = response.json()

# Print the IP address, hostname, city, region, country, location, organization, postal code, and timezone if they are found
if 'ip' in data:
    print(f"IP Address: {data['ip']}")
if 'hostname' in data:
    print(f"Hostname: {data['hostname']}")
if 'city' in data:
    print(f"City: {data['city']}")
if 'region' in data:
    print(f"Region: {data['region']}")
if 'country' in data:
    print(f"Country: {data['country']}")
if 'loc' in data:
    print(f"Location: {data['loc']}")
if 'org' in data:
    print(f"Organization: {data['org']}")
if 'postal' in data:
    print(f"Postal Code: {data['postal']}")
if 'timezone' in data:
    print(f"Timezone: {data['timezone']}")

if 'ip' not in data and 'hostname' not in data and 'city' not in data and 'region' not in data and 'country' not in data and 'loc' not in data and 'org' not in data and 'postal' not in data and 'timezone' not in data:
    print("Geolocation data not found")