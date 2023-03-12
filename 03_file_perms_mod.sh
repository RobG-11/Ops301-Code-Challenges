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
    # [Bash Script – Press Any Key To Continue](https://www.tweaking4all.com/software/linux-software/bash-press-any-key/)

# Main

# Create new directory with three files (used to test script functionality)

mkdir New_Dir
touch New_Dir/file1.txt
touch New_Dir/file2.txt
touch New_Dir/file3.txt

# Exit Function:
    # Print successful exit to screen and exit script

exit_func(){
    echo ""
    echo "file_perms_mod.sh exited successfully!"
    echo ""
    exit
}

# Modify Directory Permissions Function:
    # Uses chmod command to modify permissions of all files in selected directory with permissions input provided by user
    # Prints updated permissions for files in selected directory
    # Uses "Press space bar to continue..." command to ensure user readability

mod_dir_perms(){
    chmod -R $dir_perms $dir_path
    echo "-----------------------------------------------------------------------------"
    echo "Files and folders in selected directory with UPDATED permissions listed below"
    echo "-----------------------------------------------------------------------------"
    echo ""
    ls $dir_path -l
    
    echo ""
    read -n 1 -r -s -p $'Press space bar to continue...\n'
    echo ""
}

# While loop used to gather user input for selected directory and permissions modifications
    # While loop runs until user inputs 'exit' command which initiates exit_func() function
    # Once user supplies input mod_dir_perms() function is run

while true
do
    clear
    echo "MUST RUN BASH SCRIPT WITH SUDO FOR FULL FUNCTIONALITY!"
    echo ""
    echo "-----------------------------------------------------------------------------------"
    echo "Files and folders in current working directory with their permissions listed below:"
    echo "-----------------------------------------------------------------------------------"
    echo ""
    ls -l
    
    echo ""
    echo "Enter the directory path where you would like to modify the permissions of all files within:"
    echo "Type 'exit' to exit program" 
    read dir_path

    if [[ $dir_path == "exit" ]]; then
        exit_func
    fi

    echo ""
    echo "----------------------------------------------------------------------------"
    echo "Files and folders in selected directory with their permissions listed below:"
    echo "----------------------------------------------------------------------------"
    ls $dir_path -l
    echo ""
    

    echo "Input the permissions settings you would like to implement (Ex. 777):"
    echo "Type 'exit' to exit program"  
    read dir_perms
    echo ""

    if [[ $dir_perms == "exit" ]]; then
        exit_func
    fi

    mod_dir_perms
done

# End