# 📑 Log Analysis

## 📖 Overview

This task demonstrates Linux log analysis using Grep and AWK.
The script searches authentication failures, filters log entries, counts matching records, and extracts specific fields from log files.

---

## 🎯 Objective

- Search log entries using Grep.
- Count matching records.
- Print log contents using AWK.
- Filter authentication failures.
- Extract required columns.
- Filter logs based on date.

---

## 🛠 Tasks Performed

- Searched "authentication failure" using Grep.
- Counted matching lines using `wc`.
- Displayed complete log file.
- Filtered authentication failures using AWK.
- Printed selected columns.
- Displayed logs for **July 26**.
- Displayed all day values for **July**.
- Used `if` conditions in AWK.

---

## 📂 Files

| File | Description |
|------|-------------|
| `log_analysis.sh` | Bash script for log analysis |
| `log_file.log` | Sample log file |
| `screenshots/` | Execution screenshots |

---

## 🧰 Commands Used

```bash
grep
awk
wc
```

---

## ✅ Verification

Run:

```bash
bash log_analysis.sh
```

Verify that:

- Authentication failures are displayed.
- Matching records are counted.
- Required columns are printed.
- July 26 entries are filtered correctly.

---
