# Network Information Script

## `get_ip_addresses.sh`

Retrieves and displays information about the network interfaces on a device.

### How to use

1. Make the script executable by running `chmod +x get_ip_addresses.sh`
2. Run the script using `./get_ip_addresses.sh`

### What the script does

1. Retrieves a list of network interfaces using `ip -o -4 addr show`  
2. Sends a request to icanhazip.com using `curl` to get the public IP address  
3. Iterates over the list of interfaces and retrieves the IP address and MAC address for each interface using `ip -o -4 addr show and ip link show`  
4. Prints the public IP address and the interface name, IP address, and MAC address for each interface

### Example output

#### `$ ./get_ip_addresses.sh`

```bash
Your public IP address is: 1.2.3.4
Interface ens3 has IP address 10.0.0.1 and MAC address 00:11:22:33:44:55
Interface lo has IP address 127.0.0.1 and MAC address 00:00:00:00:00:00
```

# Geolocate IP Address

## `geolocate.py`

Retrieves and displays geolocation data for a given IP address using the IPInfo API.

### How to use

1, Install the required libraries by running `pip3 install -r requirements.txt`  
2. Make the script executable by running `chmod +x geolocate.py`  
3. Run the script using `./geolocate.py [OPTION]... [IP ADDRESS]`  


### Options

#### `$ ./geolocate.py --help`

```
Usage: python3 geolocate.py [OPTION]... [IP ADDRESS]
Locate the geolocation data for an IP address using the IPInfo API.

  -h, --help   display this help menu
```

### Example output

#### `$ ./geolocate.py 8.8.8.8`

```bash
IP Address: 8.8.8.8
Hostname: dns.google
City: Mountain View
Region: California
Country: US
Location: 37.4056,-122.0775
Organization: AS15169 Google LLC
Postal Code: 94043
Timezone: America/Los_Angeles
```