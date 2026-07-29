# 🔐 File & Directory Permissions

## 📖 Overview

This task demonstrates Linux file and directory permission management.
It covers creating directories and files, changing ownership, modifying permissions, and verifying access using Linux commands.

---

## 🎯 Objective

- Create a directory.
- Create a file inside the directory.
- Change ownership of the directory and file.
- Modify file and directory permissions.
- Verify permission changes.

---

## 🛠 Tasks Performed

- Created a directory named **devops_workspace**.
- Created a file named **project_notes.txt**.
- Changed ownership using `chown`.
- Assigned **755** permissions to the directory.
- Assigned **644** permissions to the file.
- Verified permissions using `ls -l` and `ls -ld`.

---

## 📂 Files

| File | Description |
|------|-------------|
| `file_permissions.sh` | Bash script to automate file and directory permission management |
| `screenshots/` | Screenshots of execution and verification |

---

## 🧰 Commands Used

```bash
mkdir
touch
chown
chmod
ls -l
ls -ld
```

---

## ✅ Verification

Run the following commands:

```bash
ls -ld /home/ec2-user/devops_workspace

ls -l /home/ec2-user/devops_workspace/project_notes.txt

stat /home/ec2-user/devops_workspace/project_notes.txt

- `chmod`
- `chown`
- Permission Verification
