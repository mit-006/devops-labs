#!/bin/bash

if [ "$1" = "-l" ] || [ "$1" = "--list" ];
then
    echo "Username        UID"
    echo "----------------------"
  
    awk -F: '{printf "%-15s %s\n", $1, $3}' /etc/passwd

else
    echo "Usage: $0 -l | --list"
fi
