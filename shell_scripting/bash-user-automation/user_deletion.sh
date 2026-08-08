#!/bin/bash

if [ "$1" = "-d" ] || [ "$1" = "--delete" ];
then
    read -p "Enter username to delete: " username

  
    if ! id "$username" &>/dev/null;
    then
        echo "User does not exist!"
        exit 1
    fi

    
    sudo userdel -r "$username"

    echo "User '$username' deleted successfully!"
    cat /etc/passwd
else
    echo "Usage: $0 -d | --delete"
fi
