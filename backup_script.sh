#!/bin/sh

# Assignment 2
# created by Bijay Sapkota /681990 / 681990@student.inholland.nl
# this script will take a directory as an argument and will create a tarball of that directory and will move it to /tmp directory
# this script checks if the exit code is not equals to 0 because exit code can be 1 - 255 for success

dir="$1" # directory to be backed up which is passed as an argument

#checking if any argument is passed or not by comparing if it is empty or not
if [ -z "$dir" ]; then # -z checks if the string is empty or not
  echo "No directory is passed as an argument"
  exit 1 # exiting the script when no argument is passed
fi

#if  argument is not an empty string then check if the directory exists or not
if [ ! -d "$dir" ]; then
  echo "Directory $dir does not exist"
  exit 1 # exiting the script when directory does not exist
fi

# converting backing up directory to tarball and zipped
tarball="backup_file.tgz" # tarball name so it can be used later to move the tarball to /tmp

tar -czf "$tarball" "$dir"  # creating tarball and zipping it

if [ $? -ne 0 ]; then # checking if the tarball was created successfully or not by status code is not equal to 0
  echo "Error in creating tarball for $dir"
  exit 1 # exiting the script when tarball was not created successfully
fi

# moving the tarball to the /tmp.
destination="/tmp" # destination directory to move the tarball
mv "$tarball" "$destination" # moving the tarball to the destination directory

if [ $? -eq 0 ]; then # checking if the tarball was moved successfully or not
  echo "$tarball was moved sucessfully to $destination" # 
  exit 0 # everthing went well tarball was moved successfully
  else
    echo "Error in moving $tarball to $destination"
    exit 1 # exiting the script when tarball was not moved successfully
fi

# using cron to schedule the script to run every Sunday at 01:00 AM
# crontab -e can be used to edit the cron file
# This line schedules the backup_script.sh to run at 01:00 AM on Sundays
# 0 1 * * 7 /path/to/backup_script.sh /home >> /tmp/backup_error.log 2>&1
# The error output (stderr) of the script is redirected to /tmp/backup_error.log file
