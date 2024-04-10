#!/bin/bash

# Check for empty input
if [ "$1" == "" ]; then
    echo "You forgot an IP address!"
    echo "Syntax: ./Netscan.sh <ip> e.g ./Netscan.sh 192.128.2"

# Validate user input
elif [[ ! $1 =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Invalid IP address"
    echo "Syntax: ./Netscan.sh <ip> e.g ./Netscan.sh 192.128.2"
    exit 1

# Extracts alive IP address from the loop
else
    for ip in `seq 1 254`; do
      ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
    done
    # Wait for all background processes to finish
    wait
    
echo "IP extracted. Thank you 3MTT for this opportunity and the Challange"
fi


