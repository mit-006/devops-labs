#! /bin/bash
#
#

echo " finding authentication failure in log file using grep"
grep -i "authentication failure" log_file.log
echo " log found"
echo "total lines and word count of output"
grep -i "authentication failure" log_file.log | wc

echo "printing all log"
awk '{print}' log_file.log

echo "finding authentication failure using awk"
awk '/authentication failure/{print}' log_file.log

echo "print 1 8 9 4 and 5th column"
awk '/authentication failure/ {print $1 , $8,$9,$4,$5}'  log_file.log

echo " now only jul 26 row will print with auth. fail filter"
awk  '/authentication failure/ { if ($1 == "Jul" && $2 == 26) print}' log_file.log

echo " now all second column of jul will print without auth. fail filter"
awk '{if ($1 == "Jul") {print $2} }' log_file.log

echo " if-else awk"
awk '/authentication failure/ {
    if ($1=="Jul" && $2==26)
        print

    if ($1=="Jul" && $2==25)
        print
}' log_file.log

