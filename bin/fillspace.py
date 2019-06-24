#!/usr/bin/python
import os
import sys
import subprocess
import threading
import time


def fill_space(count):
    fill_command = "adb shell dd if=/dev/zero of=/sdcard/fill_test" + time.ctime().split()[3] +" bs=1g" + " count=" + count
    print fill_command
    subprocess.call([fill_command], shell=True)
    print "fill complete"

def check_progress(count):
    while True:
         print count
         total_size_b = count * 1024 * 1024
         print total_size_b
         break
         current_size = subprocess.check_output(["adb shell du -s /sdcard/fill_test" + time.ctime().split()[3]], shell=True)
         current_size = current_size.split("\t")[0]
         print current_size
         progress = current_size / total_size_b * 100
         print ("\r"+ "Current progress: " + progress + "%")
         if(current_size >= total_size_b):
             break

obsire_size = 0
print len(sys.argv)
arg_len = len(sys.argv)

if(arg_len > 1):
    obsire_size = sys.argv[1]

count = obsire_size 
print count
thread = threading.Thread(target=fill_space, args=[count])
thread.start()

#thread_monitor = threading.Thread(target=check_progress, args=count)
#thread_monitor.start()
#subprocess.call([fill_command], shell=True)
thread.join()
#thread_monitor.join()
