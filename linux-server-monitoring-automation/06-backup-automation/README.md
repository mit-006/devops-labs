# 💾 Backup Automation

## 📖 Overview

This task demonstrates backup automation using a Bash script.
The script creates a compressed ZIP archive of a specified source directory, stores it in a destination directory, and generates a timestamped backup file.

---

## 🎯 Objective

- Automate directory backup using Shell Scripting.
- Create timestamp-based backup files.
- Store backups in a specified destination.
- Verify successful backup creation.

---

## 🛠 Tasks Performed

- Accepted source and destination directories as command-line arguments.
- Generated a timestamp using the `date` command.
- Created a ZIP archive using the `zip` command.
- Saved the backup with a unique timestamp.
- Displayed a success message after backup completion.

---

## 📂 Files

| File | Description |
|------|-------------|
| `Automated_backup.sh` | Bash script for backup automation |
| `screenshots/` | Execution screenshots |

---

## 🧰 Commands Used

```bash
zip
date
echo
```

---

## ✅ Verification

Run the following command:

```bash
bash Automated_backup.sh /home/ec2-user/scripts /home/ec2-user/backups
```

Then verify the backup using:

```bash
ls -lh /home/ec2-user/backups

unzip -l /home/ec2-user/backups/backup-*.zip

du -sh /home/ec2-user/backups

date
```
- Backup Automation
- ZIP Archive Creation
- Timestamp Generatio
