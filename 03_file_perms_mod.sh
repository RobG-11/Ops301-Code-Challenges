#!/bin/bash

# Script: 03 - File Permissions
# Author: Robert Gregor
# Date of latest revision: 120900FMAR23

# Objectives - Create a new bash script that performs the following:
    # Prompts user for input directory path
    # Prompts user for input permissions number (e.g. 777 to perform a chmod 777)
    # Navigates to the directory input by the user and changes all files inside it to the input setting
    # Prints to the screen the directory contents and the new permissions settings of everything in the directory

# Stretch Goals (Optional Objectives)
    # Design your script to output a log file of all actions that were taken by the script
    # Design your script to output to the screen each file changed one by one, with a slight delay between each file changed

# My Sources:
    # [How to Change File Permissions Recursively with chmod in Linux](https://phoenixnap.com/kb/chmod-recursive)

# Main

# Create new directory with three files (used to test script functionality)

mkdir New_Dir
touch New_Dir/file1.txt
touch New_Dir/file2.txt
touch New_Dir/file3.txt

# Each conditional creates a .txt in current working directory and copies selected log content into .txt file
# Prints time stamped comment declaring action completed
# Uses "space bar to continue" functionality for future log selection

exit_func(){
    echo "file_perms_mod.sh exited successfully!"
    echo ""
    exit
}

mod_dir_perms(){
    chmod -R $dir_perms $dir_path
    echo "-----------------------------------------------------------------------------------"
    echo "Files and folders in selected directory with UPDATED permissions listed below"
    echo ""
    ls $dir_path -l
    echo "-----------------------------------------------------------------------------------"
    
    echo ""
    read -n 1 -r -s -p $'Press space bar to continue...\n'
    echo ""
}

while true
do
    clear
    echo "MUST RUN BASH SCRIPT WITH SUDO FOR FULL FUNCTIONALITY"
    echo "-----------------------------------------------------------------------------------"
    echo "Files and folders in current working directory with their permissions listed below:"
    echo ""
    ls -l
    echo "-----------------------------------------------------------------------------------"
    echo ""
    echo "Enter the directory path where you would like to modify the permissions of all files within:"
    echo "Type 'exit' to exit program" 
    read dir_path
    echo "-----------------------------------------------------------------------------------"
    echo "Files and folders in selected directory with their permissions listed below:"
    echo ""
    ls $dir_path -l
    echo "-----------------------------------------------------------------------------------"

    if [[ $dir_path == "exit" ]]; then
        exit_func
    fi

    echo "Input the permissions settings you would like to implement (Ex. 777):"
    echo "Type 'exit' to exit program"  
    read dir_perms
    echo ""

    if [[ $dir_perms == "exit" ]]; then
        exit_func
    fi

    mod_dir_perms
done

echo ""
read -n 1 -r -s -p $'Press space bar to continue...\n'
echo ""

# End