#!/bin/sh 

#setting the intrepeter as sh 

#assignment 1
#created by Bijay Sapkota /681990 / 681990@student.inholland.nl 

# This script will copy a file from local system to remote system using scp command
# This script will ask user to enter the file location, remote username, remote machine name or IP address and password
# This script will check if the file exists or not and even if the current user has read access to the file
# This script will also check if the fields are empty or not too 
# This script will check if the file is copied to remote system or not by checking the exit status code of scp command

read -p "Enter a file location: " file
if [ -z "$file" ]; then #checking if the file name is provided by user or not 
echo "Enter the file name, it cannot be left empty"
exit 1
fi

# Checking if the user-input file exists or not
if ! [ -e "$file" ]; then #taking  filename from user
   echo "File $file does not exist."
   exit 1 # Exit with status code 1 indicating error
fi

read -p "Enter your username: " host #taking host  from user
#checking if the host name is provided by user or not 
if [ -z "$host" ]; then
echo "Enter the HostName, it cannot be left empty"
exit 1
fi

read -p "Enter your remote machine name or IP address: " remotehost #taking remote  from user 
#checking if the remote host name is provided by user or not
if [ -z "$remotehost" ]; then
echo "Enter the Remote HostName, it cannot be left empty"
exit 1
fi

read -p "Enter your password for remote user: " password
#checking if the password is provided by user or not
if [ -z "$password" ]; then
echo "Enter the Password, it cannot be left empty"
exit 1
fi

# Checking if the current user has access/rights to the local file
if ! [ -r "$file" ]; then
   echo "Current user does not have read access to file $file."
   exit 1 # Exit with status code 1 indicating error
fi

# Copying the file to remote system
scp "$file" "$host@$remotehost:/tmp/" # Scp orgin file to destination file

# Checking the exit status code of scp command
if [ $? -eq 0 ]; then #if exit status code is 0 then file is copied successfully
  echo "File $file has been copied to /tmp directory on remote system $remotehost using remote username $host."
else
  echo "Failed to copy file $file to remote system $remotehost using remote username $host."
  exit 1 # Exit with status code 1 indicating error
fi
