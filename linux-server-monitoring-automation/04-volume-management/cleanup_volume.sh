#!/bin/bash

set -e

OUTPUT="cleanup_info.txt"

VG_NAME="devops_vg"
LV_NAME="devops_lv"

PV1="/dev/nvme1n1"
PV2="/dev/nvme2n1"
PV3="/dev/nvme3n1"

MOUNT_POINT="/mnt/devops_data"
EXTRA_MOUNT="/mnt/devops_extra"

echo "" > $OUTPUT

echo "===== BEFORE CLEANUP =====" | tee -a $OUTPUT

lsblk | tee -a $OUTPUT

echo "" | tee -a $OUTPUT
df -h | tee -a $OUTPUT

echo "" | tee -a $OUTPUT
mount | tee -a $OUTPUT

echo "" | tee -a $OUTPUT
echo "===== Unmounting Volumes =====" | tee -a $OUTPUT

sudo umount $MOUNT_POINT || true
sudo umount $EXTRA_MOUNT || true

echo "" | tee -a $OUTPUT
echo "===== Removing Logical Volume =====" | tee -a $OUTPUT

sudo lvremove -y /dev/$VG_NAME/$LV_NAME

echo "" | tee -a $OUTPUT
echo "===== Removing Volume Group =====" | tee -a $OUTPUT

sudo vgremove -y $VG_NAME

echo "" | tee -a $OUTPUT
echo "===== Removing Physical Volumes =====" | tee -a $OUTPUT

sudo pvremove -y $PV1
sudo pvremove -y $PV2
sudo pvremove -y $PV3

echo "" | tee -a $OUTPUT
echo "===== Removing Mount Directories =====" | tee -a $OUTPUT

sudo rm -rf $MOUNT_POINT
sudo rm -rf $EXTRA_MOUNT

echo "" | tee -a $OUTPUT
echo "===== Verification =====" | tee -a $OUTPUT

lsblk | tee -a $OUTPUT

echo "" | tee -a $OUTPUT

sudo pvs | tee -a $OUTPUT

echo "" | tee -a $OUTPUT

sudo vgs | tee -a $OUTPUT

echo "" | tee -a $OUTPUT

sudo lvs | tee -a $OUTPUT

echo "" | tee -a $OUTPUT

df -h | tee -a $OUTPUT

echo ""
echo "Cleanup completed successfully."
echo "Log saved in $OUTPUT"
