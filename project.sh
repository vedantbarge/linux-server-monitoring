#!/bin/bash
 echo "==========================================="
 echo "     Linux server Monitoring"
 echo "==========================================="

 echo " Date : $9date) "
 echo ""
 echo " Show Disk Usages "
 df -h /

 echo ""
 echo " Memory usages  "
 free -h

 echo ""
 echo " Top 5 Processes Cousuming Memory "
 ps aux --sort=%mem | head -n 6


echo ""
echo "Disk Alert"

DISK_USAGES=$(df -P / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$DISK_USAGES" -ge 80 ]
then
        echo "Warning! Disk space is ${DISK_USAGES}%" | mail -s "Disk Space alert on $(hostname)" vedantbarge**@gmail.com
else
    echo "Disk Usage is normal"
fi
~
