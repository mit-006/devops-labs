#!/bin/bash

if [ "$1" = "-r" ] || [ "$1" = "--reset" ];
then
    read -p "Enter username: " username

    if ! id "$username" &>/dev/null;
    then
        echo "User does not exist!"
        exit 1
    fi

    read -s -p "Enter new password: " password
    echo
    read -s -p "Confirm password: " confirm
    echo

    if [ "$password" != "$confirm" ]; then
        echo "Passwords do not match!"
        exit 1
    fi

 
    echo "$username:$password" | sudo chpasswd

    echo "Password for user '$username' has been updated successfully!"

else
    echo "Usage: $0 -r | --reset"
fi
