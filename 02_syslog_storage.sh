#!/bin/bash

# Script: 02 - Append; Date and Time
# Author: Robert Gregor
# Date of latest revision: 120700FMAR23

# Objectives - Create a bash script that:
    # Copies /var/log/syslog to the current working directory
    # Appends the current date and time to the filename

# Stretch Goals (Optional Objectives)
    # Include in your bash script some timestamped echo statements telling the user what is happening at each stage of the script.

# Code Fellows Resources:
    # [Shell Style Guide](https://google.github.io/styleguide/shellguide.html)
    
# My Sources:
    # [cp command in Linux with examples](https://www.geeksforgeeks.org/cp-command-linux-examples/)
    # [Bash Script – Press Any Key To Continue](https://www.tweaking4all.com/software/linux-software/bash-press-any-key/)
    # [How to use a date shell script](https://www.diskinternals.com/linux-reader/date-shell-script/)

# Main

clear

# Declares cur_dtg variable which stores current date with specific format

cur_dtg=$(date +%m-%d-%Y-%T)

# Creates .txt file with current DTG appended to cur_dtg variable for file name in current working directory
    # Copies syslog content into .txt file

cp /var/log/syslog "$cur_dtg-sys_log.txt"

# Prints time stamped comment declaring action completed

echo $(date) -- "/var/log/syslog copied into current working directory"
echo ""

# Uses "space bar to continue" for future potential functionality

read -n 1 -r -s -p $'Press space bar to continue...\n'
echo ""

# End
