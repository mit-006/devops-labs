#!/bin/bash

src=$1
dest=$2

timestamp=$(date +%y-%m-%d-%H-%M)

zip -r "$dest/backup-$timestamp.zip" $src

echo -e "\e[32mBackup Completed at $timestamp\e[0m"
