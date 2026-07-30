#!/bin/bash

set -e

OUTPUT="volume_info.txt"

VG_NAME="devops_vg"
LV_NAME="devops_lv"

PV1="/dev/nvme1n1"
PV2="/dev/nvme2n1"
PV3="/dev/nvme3n1"

EXTRA_DISK="/dev/nvme4n1"

LV_SIZE="5G"

MOUNT_POINT="/mnt/devops_data"
EXTRA_MOUNT="/mnt/devops_extra"

echo "===== DEVOPS VOLUME MANAGEMENT ====="

echo "" > $OUTPUT

echo "===== Initial lsblk =====" | tee -a $OUTPUT
lsblk | tee -a $OUTPUT

echo "" | tee -a $OUTPUT
echo "===== Initial df -h =====" | tee -a $OUTPUT
df -h | tee -a $OUTPUT

echo "" | tee -a $OUTPUT
echo "===== Creating Physical Volumes =====" | tee -a $OUTPUT

sudo pvcreate $PV1
sudo pvcreate $PV2
sudo pvcreate $PV3

echo "" | tee -a $OUTPUT
echo "===== Creating Volume Group =====" | tee -a $OUTPUT

sudo vgcreate $VG_NAME $PV1 $PV2 $PV3

echo "" | tee -a $OUTPUT
echo "===== Creating Logical Volume =====" | tee -a $OUTPUT

sudo lvcreate -L $LV_SIZE -n $LV_NAME $VG_NAME

echo "" | tee -a $OUTPUT
echo "===== PV Display =====" | tee -a $OUTPUT
sudo pvdisplay | tee -a $OUTPUT

echo "" | tee -a $OUTPUT
echo "===== VG Display =====" | tee -a $OUTPUT
sudo vgdisplay | tee -a $OUTPUT

echo "" | tee -a $OUTPUT
echo "===== LV Display =====" | tee -a $OUTPUT
sudo lvdisplay | tee -a $OUTPUT

echo "" | tee -a $OUTPUT
echo "===== Creating Filesystem on Logical Volume =====" | tee -a $OUTPUT

sudo mkfs.ext4 /dev/$VG_NAME/$LV_NAME

echo "" | tee -a $OUTPUT
echo "===== Creating Mount Point =====" | tee -a $OUTPUT

sudo mkdir -p $MOUNT_POINT

echo "" | tee -a $OUTPUT
echo "===== Mounting Logical Volume =====" | tee -a $OUTPUT

sudo mount /dev/$VG_NAME/$LV_NAME $MOUNT_POINT

echo "" | tee -a $OUTPUT
echo "===== lsblk After LV Mount =====" | tee -a $OUTPUT

lsblk | tee -a $OUTPUT

echo "" | tee -a $OUTPUT
echo "===== Creating Filesystem on Fourth Disk =====" | tee -a $OUTPUT

sudo mkfs.ext4 $EXTRA_DISK

echo "" | tee -a $OUTPUT
echo "===== Creating Extra Mount Point =====" | tee -a $OUTPUT

sudo mkdir -p $EXTRA_MOUNT

echo "" | tee -a $OUTPUT
echo "===== Mounting Fourth Disk =====" | tee -a $OUTPUT

sudo mount $EXTRA_DISK $EXTRA_MOUNT

echo "" | tee -a $OUTPUT
echo "===== lsblk After Fourth Disk Mount =====" | tee -a $OUTPUT

lsblk | tee -a $OUTPUT

echo "" | tee -a $OUTPUT
echo "===== Extending Logical Volume by 2GB =====" | tee -a $OUTPUT

sudo lvextend -L +2G /dev/$VG_NAME/$LV_NAME

echo "" | tee -a $OUTPUT
echo "===== Resizing Filesystem =====" | tee -a $OUTPUT

sudo resize2fs /dev/$VG_NAME/$LV_NAME

echo "" | tee -a $OUTPUT
echo "===== Final LV Display =====" | tee -a $OUTPUT

sudo lvdisplay | tee -a $OUTPUT

echo "" | tee -a $OUTPUT
echo "===== Final df -h =====" | tee -a $OUTPUT

df -h | tee -a $OUTPUT

echo ""
echo "Completed Successfully."
echo "Output saved in $OUTPUT"
