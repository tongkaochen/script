#!/bin/bash

if [ "$1" == "" ]; then
   . $HOME/script/readhistory package_history
   package_name=$CHOOSE_RESULT
else
   package_name=$1
   . $HOME/script/writhistory package_history $1
fi

if [ "$package_name" == "" ]; then
   exit
fi
ps_result=$(adb shell ps -A|grep $package_name)
echo $ps_result
while [ "$ps_result" == "" ]
do
   sleep 1
   ps_result=$(adb shell ps -A|grep $package_name)
done
process_id=$(echo $ps_result | cut -d " " -f2)
#echo -e "\033[32m Killed process: $process_id\033[0m"

log_file_name="$(date +%H%M).log"
adb logcat -b all > $log_file_name & 

adb logcat --pid $process_id | tee pid${process_id}.log

