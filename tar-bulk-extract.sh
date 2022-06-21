#!/bin/bash

# File: tar-bulk-extract.sh
# Bulk extraction of tarball archives.

for f in *.tar.gz
do
    tar -xvf "$f";
done
