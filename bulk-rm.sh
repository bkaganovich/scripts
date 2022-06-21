#!/bin/bash

# File: bulk-rm.sh
# Specifiy file paths for bulk removal.

FILES=(
"/path/to/file"
"/path/to/another"
)

for ((i=0; i < ${#FILES[@]}; i++))
do
    rm -v "${FILES[$i]}"
done
