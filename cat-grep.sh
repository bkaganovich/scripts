#!/bin/bash

# File: cat-grep.sh
# Version: 2
# Search for filename specified as argument vector inside directories specified
# in dirs array and cat their content, save results to ../filename.txt

# Example:
# ./cat-grep.sh filename

# Directories to search
#dirs=('dir1')

fn=$2 

main() {
    printf "Searching for $1...\n" | tee -a ./$1.txt;

    for d in "${dirs[@]}"
    do
        (cd "$d" && printf "\n# $d\n" >> ../$1.txt && cat *.* | grep -a $1 >> ../$1.txt);
    done
}

time main "$@"
