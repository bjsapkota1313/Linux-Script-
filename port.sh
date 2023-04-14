#!/bin/sh


#Assignement 3
#created by Bijay Sapkota /681990 / 681990@student.inholland.nl 
# this script will take input from user and print the name in upper or lower case as many times as the user wants
#this script will also check if the input was enterd or not 
# this script will aslo check repeat varable if it is integer or not

# taking name as input from user
read -p "Enter your name: " name
#checking if the name is empty or not by string length 
if [ -z "$name" ]
then
    echo "name cannot be left empty inorder to proceed this script"
    exit 1 # exiting the program with status code 1 something went wrong
fi

#taking number of repeats as input from user 
read -p "Enter number of repeats: " repeat
#checking if the repeat  is empty or not 
if [ -z "$repeat" ]
then
    echo "number of repeats cannot be left empty inorder to proceed this script"
    exit 1 # exiting the program with status code 1 something went wrong
fi

#checking if the repeat is integer or not

if ! [ "$repeat" = '^[0-9]$' ]
then
    echo "the enetred no of repeats is not a numberr"
    exit 1 # exiting the program with status code 1 something went wrong
fi

#taking case as input from user to print the name in upper or lower case
read -p "In which cas you want to print your name? (1)Upper case (2)Lower case: " case
#checking if the case variable is left empty or not 
if [ -z "$case" ]
then
    echo "case cannot be left empty inorder to proceed this script"
    exit 1 # exiting the program with status code 1 something went wrong
fi

# checking if the input is valid
i=1; # i is used to count the number of times the loop is executed

#using whil to loop the process until the number of repeat is reached
while [ $i -le $repeat ] #starting from 1 and ending with the number of repeat
do 
    case $case in
            1)
                echo $name | tr '[:lower:]' '[:upper:]'
                ;;
            2)
                echo $name | tr '[:upper:]' '[:lower:]'
                ;;
            *)
                echo "Invalid input please choose 1 or 2"
                break #breaking when the input is invalid
                ;;
    esac
    i=$((i+1)) #incrementing the value of i
done

#asking user input again to run or quit program 
read -p "Enter q to quit or any other key to run again: " choice
if [ "$choice" = "q" ]
 then
    exit 0 # exiting the program with status code 0 evertything is fine
 else
 exec "$0" # re excuting the program as $o is the name of the program itself 
fi

