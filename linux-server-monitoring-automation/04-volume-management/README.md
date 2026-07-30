# 💾 Volume Management

## 📖 Overview

This task demonstrates Linux Volume Management using LVM (Logical Volume Manager).
It covers creating Physical Volumes (PV), Volume Groups (VG), Logical Volumes (LV), formatting file systems, mounting storage, extending logical volumes, and cleaning up the LVM configuration.

---

## 🎯 Objective

- Create Physical Volumes (PV).
- Create a Volume Group (VG).
- Create a Logical Volume (LV).
- Format the Logical Volume with an ext4 filesystem.
- Mount the Logical Volume.
- Create and mount an additional filesystem.
- Extend the Logical Volume.
- Verify storage configuration.
- Remove the LVM setup.

---

## 🛠 Tasks Performed

- Listed available disks using `lsblk`.
- Checked disk usage using `df -h`.
- Created Physical Volumes.
- Created a Volume Group.
- Created a 5 GB Logical Volume.
- Displayed PV, VG, and LV information.
- Formatted the Logical Volume with ext4.
- Mounted the Logical Volume.
- Formatted and mounted an additional disk.
- Extended the Logical Volume by 2 GB.
- Resized the filesystem.
- Removed the complete LVM configuration using a cleanup script.

---

## 📂 Files

| File | Description |
|------|-------------|
| `volume_management.sh` | Creates the complete LVM setup |
| `cleanup_volume.sh` | Removes the LVM setup |
| `volume_info.txt` | Output generated during volume creation |
| `cleanup_info.txt` | Output generated during cleanup |
| `screenshots/` | Execution screenshots |

---

## 🧰 Commands Used

```bash
lsblk
df -h
pvcreate
vgcreate
lvcreate
pvdisplay
vgdisplay
lvdisplay
mkfs.ext4
mount
lvextend
resize2fs
umount
lvremove
vgremove
pvremove
```

---

## ✅ Verification

Run the following commands after executing the script:

```bash
lsblk

df -h

pvs

vgs

lvs

mount
```

Verify that:

- Physical Volumes are created.
- Volume Group exists.
- Logical Volume is mounted.
- Filesystem is extended successfully.
- Cleanup script removes all LVM components.

- LVM Extension
- Storage Cleanup
