#!/bin/bash

if [ "$1" = "-c" ] || [ "$2" = "--create" ];
then
	 read -p "Enter new username: " username
	 if id "$username" &>/dev/null;
	 then echo " user already exists"
		exit 1
	 fi

	  read -s -p "Enter password: " password
   	  echo
    read -s -p "Confirm password: " confirm
    echo


     if [ "$password" != "$confirm" ]; then
        echo "Passwords do not match!"
        exit 1
    fi

    
    sudo useradd -m "$username"

    
    echo "$username:$password" | sudo chpasswd

    echo "User created successfully!"
    
    cat -s /etc/passwd | grep "$username"
else
    echo "Usage: $0 -c | --create"

fi
