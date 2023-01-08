# `mount-encrypted-device.sh`

This bash script is used to mount an encrypted block device and create a symbolic link to it in the `/media` directory.

## Prerequisites

- A block device that is encrypted with LUKS and has a UUID stored in a file called `uuid.txt`.
    - To determine UUID, check `ls -l /dev/disk/by-uuid` and find target device.
    - Then update `uuid.txt` file with device's UUID. For example: 
        ```bash
        echo "e2d4c067-98d0-44f9-b9f2-23c4b4ecbaee" > uuid.txt
        ```
- The `cryptsetup` tool must be installed on your system.

## Explanation

```bash
sudo cryptsetup open --type luks UUID=$(cat uuid.txt) sdb1-crypt
```

Reads the UUID of the encrypted block device from the `uuid.txt` 
file and uses it to open the device and create a device mapper node called 
`sdb1-crypt`. The `--type luks` flag specifies that the block device is 
encrypted with LUKS.


```bash
sudo mkdir -p /run/media/usb
```

Creates the directory `/run/media/usb` if it doesn't already 
exist. The `-p` flag tells the `mkdir` command to create any parent 
directories that don't exist.


```bash
sudo mount /dev/mapper/sdb1-crypt /run/media/usb
```

Mounts the decrypted block device `/dev/mapper/sdb1-crypt` at the 
mount point `/run/media/usb`.

```bash
cd /media && ln -s /run/media/usb/for-backup usb
```

Changes to the `/media` directory and creates a symbolic link 
called `usb` that points to the directory `/run/media/usb/for-backup`.