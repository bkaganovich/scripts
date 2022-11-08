#!/usr/bin/env python3

# File: remove-numbers.py
# Removes numbers (0-9) from specified string.

import re

def main():
    string = input("Enter string: ")
    result = re.sub(r'[0-9]+', '', string) #replace 0-9 with nothing
    print(result.upper()) #uppercase result

main()
