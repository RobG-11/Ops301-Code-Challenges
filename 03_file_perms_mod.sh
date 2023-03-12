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
    # [Bash Scripting – For Loop](https://www.geeksforgeeks.org/bash-scripting-for-loop/)
    # [Nested c-style loops in bash](https://stackoverflow.com/questions/7786342/nested-c-style-loops-in-bash)
    # [Bash Scripting – Write Output of Bash Command into Log File](https://www.geeksforgeeks.org/bash-scripting-write-output-of-bash-command-into-log-file/)
    # [Linux / UNIX: Bash Script Sleep or Delay a Specified Amount of Time](https://www.cyberciti.biz/faq/linux-unix-sleep-bash-scripting/)
    # 

# Main

# Create file-perms_mod.sh log file to store all script actions

touch fpm_log.txt

# Accept user input to create new directories and files (used to test script functionality)

clear

echo "Enter the number of directories (max 5 please!) you would like to create and press ENTER:"
read create_dirs
echo ""
    
echo "Enter the number of files (max 5 please!) you would like to create in each directory and press ENTER:"
read create_files
echo ""

# create_dirs For loop
    # Initializes loop variable i=1
    # For all instances where i <= create_dirs increment i by 1 after each iteration and do...
    # Create directory, name it dir with current i value appended
    # Sends current DTG with action appended to fpm_log.txt file

# Nested create_files For loop
    # Initializes loop variable j=1
    # For all instances where j <= create_files increment j by 1 after each iteration and do...
    # Create file in dir$i, name it file with current j value appended
    # Sends current DTG with action appended to fpm_log.txt file

for ((i=1; i<=create_dirs; i++))
do
    mkdir dir$i
    echo $(date "+%d %b %y %H:%M") - "Directory Created: dir$i">>fpm_log.txt
    for ((j=1; j<=create_files; j++))
    do
        touch dir$i/file$j.txt
        echo $(date "+%d %b %y %H:%M") - "File Created: /dir$i/file$j">>fpm_log.txt
    done
done

# Exit Function:
    # Print successful exit to screen and exit script
    # Log exit timestamp in fpm_log.txt file

exit_func(){
    echo ""
    echo "file_perms_mod.sh exited successfully!"
    echo ""
    echo $(date "+%d %b %y %H:%M") - "file_perms_mod.sh exited successfully!">>fpm_log.txt
    exit
}

# Modify Directory Permissions Function:
    # Uses chmod command to modify permissions of all files in selected directory with permissions input provided by user
    # Logs exit timestamp in fpm_log.txt file
    # Declares variable ls_l_command equal to output of ls $dir_path -l command
    # While loop reads each line and does...
        # Delays two seconds and then prints each line
        # Redirects contents of ls_l_command variable back into loop
    # Uses "Press space bar to continue..." command to ensure user readability

mod_dir_perms(){
    chmod -R $dir_perms $dir_path
    echo ""
    echo $(date "+%d %b %y %H:%M") - "Directory Modified / Permissions: $dir_path / $dir_perms">>fpm_log.txt
    echo "-----------------------------------------------------------------------------"
    echo "Files and folders in selected directory with UPDATED permissions listed below"
    echo "-----------------------------------------------------------------------------"
    echo ""

    ls_l_command=$(ls $dir_path -l)
    while read line; do
       sleep 1
       echo $line
    done <<< "$ls_l_command"

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
    echo ""
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