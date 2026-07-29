#!/bin/bash

echo "Creating directory..."
mkdir -p /home/ec2-user/devops_workspace

echo "Creating file..."
touch /home/ec2-user/devops_workspace/project_notes.txt

echo "Changing ownership..."
sudo chown ec2-user:ec2-user /home/ec2-user/devops_workspace/project_notes.txt

echo "Changing directory permission..."
chmod 755 /home/ec2-user/devops_workspace

echo "Changing file permission..."
chmod 644 /home/ec2-user/devops_workspace/project_notes.txt

echo "Checking permissions..."
ls -ld /home/ec2-user/devops_workspace
ls -l /home/ec2-user/devops_workspace/project_notes.txt
