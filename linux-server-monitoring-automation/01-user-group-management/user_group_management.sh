#! /bin/bash

GROUP_NAME="devops_team"
USER_NAME1="devops_user1"
USER_NAME2="devops_user2"

echo "Creating group..."
sudo groupadd "$GROUP_NAME"
echo "$GROUP_NAME group created"

echo "Creating users..."
sudo useradd "$USER_NAME1"
sudo useradd "$USER_NAME2"
echo "$USER_NAME1 & $USER_NAME2 users created"

echo "Adding users to group by usermod"

sudo usermod -aG "$GROUP_NAME" "$USER_NAME1"
echo "$USER_NAME1 added in $GROUP_NAME"

echo "Adding users to group by gpasswd"

sudo gpasswd -a "$USER_NAME2" "$GROUP_NAME"
echo "$USER_NAME2 added in $GROUP_NAME"


