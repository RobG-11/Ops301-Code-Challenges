#!/bin/bash

# Script: 05 - Clearing Logs
# Author: Robert Gregor
# Date of latest revision: 121830FMAR23

# Objectives - Write a log clearing bash script
    # Write a bash script that performs the following tasks:
        # Print to screen file size of log files before compression
        # Compress contents of log files listed below to backup directory
            # /var/log/syslog
            # /var/log/wtmp
        # File name should contain time stamp with following format -YYYYMMDDHHMMSS
            # Example: /var/log/backups/syslog-20220928081457.zip
        # Clear contents of log file
        # Print to screen file size of compressed file
        # Compare size of compressed files to size of original log files

# Stretch Goals - How can your script be used to clear tracks?
    # Watch [How To Clear Tracks & Logs On Linux](https://www.youtube.com/watch?v=TgquV_OA-lU)
        # Using knowledge of various logs described in video, expand script; what other system logs can you clear?
    # In comments per log cleared, explain what the log tracks in the Ubuntu system. Why is this log important?

# Code Fellows Sources:
    # [How To Clear Tracks & Logs On Linux](https://www.youtube.com/watch?v=TgquV_OA-lU)

# My Sources:
    # [How to check the file size in Linux/Unix bash shell scripting](https://www.cyberciti.biz/faq/howto-bash-check-file-size-in-linux-unix-scripting/)
    # [How to compress files on Linux 5 ways](https://www.networkworld.com/article/3538471/how-to-compress-files-on-linux-5-ways.html)
    # [Gzip Command in Linux](https://www.geeksforgeeks.org/gzip-command-linux/)
    # [Bash Scripting Tutorial - 4. Arithmetic](https://ryanstutorials.net/bash-scripting-tutorial/bash-arithmetic.php)
    # [5 Ways to Empty or Delete a Large File Content in Linux](https://www.tecmint.com/empty-delete-file-content-linux/)
    # [You don't know Bash: An introduction to Bash arrays](https://opensource.com/article/18/5/you-dont-know-bash-intro-bash-arrays)

# Main

# Exit Function:
    # Print successful exit to screen and exit script

exit_func(){
    echo ""
    echo "log_backup.sh exited successfully!"
    echo ""
    exit
}

# log_operations() function:
    # log_size is determined using stat command, -c %s prints file size in bytes 
        # log_size is printed to screen
    # Space bar functionality to compress log and place .gz file in /var/log/backups folder
        # cur_dtg variable stores current date
        # /var/log/backups directory created with mkdir, "directory already exists" errors are supressed using 2>/dev/null
        # gzip command is used to compress log_file, -k flag used to keep original file
        # mv command moves compressed .gz file to backups folder and appends current date from cur_dtg variable to file name
        # comp_log_size is determined using stat -c %s again
            # Size of .gz file is printed to screen
    # Space bar functionality to determine difference in bytes between original file & compressed backup .gz file
        # log_size_diff calculated and printed to screen
    # Space bar functionality to clear original log file
        # truncate command used to delete all content from original log_file, confirmation printed to screen

log_operations(){
    log_size=$(stat -c %s "/var/log/$log_file")
    echo ""
    echo "Size of $log_file file is $log_size bytes"
    echo ""
    
    read -n 1 -r -s -p $'Press space bar to compress log and place .gz file in /var/log/backups folder...\n'
    echo ""
    cur_dtg=$(date +%m-%d-%Y-%T)
    mkdir /var/log/backups 2>/dev/null
    gzip -k /var/log/$log_file
    mv /var/log/$log_file.gz /var/log/backups/$log_file-$cur_dtg.gz
    comp_log_size=$(stat -c %s "/var/log/backups/$log_file-$cur_dtg.gz")
    echo "Backup compressed $logfile.gz file is $comp_log_size bytes"
    echo ""
   
    read -n 1 -r -s -p $'Press space bar to determine difference in bytes between original file & compressed backup .gz file...\n'
    echo ""
    log_size_diff=$((log_size - comp_log_size))
    echo "$log_file.gz file is $log_size_diff bytes smaller than $log_file file"
    echo ""
    
    read -n 1 -r -s -p $'Press space bar to clear original log file...\n'
    echo ""
    sudo truncate -s 0 /var/log/$log_file
    echo "$log_file file cleared!"
    echo ""
    read -n 1 -r -s -p $'Press space bar to continue...\n'
}

# while loop:
    # Menu functionality used to determine user input (read log_file_selection)
    # Conditional to determine if exit is selected
    # log_array declared with all values for logs within
    # log_file variable declared equal to log_file_selection input, retrieving string in array

while true
do
    clear
    
    echo "In sequence, this script will first print log file size, compress contents to a backup directory"
    echo "Print compressed file size, compare before & after sizes, and then clear original log file and confirm"
    echo "";
    echo "1) System Logging Records (syslog) - non-kernel boot errors, app-related service errors, messages logged during system startup"
    echo "2) Who & When (wtmp) - provides utmp history of user logins & logouts, system events, system status, system boot time"
    echo "3) Login Records (lastlog) - last login attempts"
    echo "4) Authentication Log Records (auth.log) - all authentication related events"
    echo "5) Bootstrap Log Records (bootstrap.log) - booting related info and messages logged during system startup process"
    echo "6) Dmesg Log Records (dmesg) - info related to hardware devices and their drivers";
    echo "7) Kernel Logging Records (kern.log) - information logged by kernel";
    echo "8) Login Failure Records (faillog) - information logged by kernel";
    echo "exit) exit program"
    echo ""
    echo "Please choose a log file to manipulate or type exit to exit program:"
    read log_file_selection

    if [[ $log_file_selection == "exit" ]]; then
        exit_func
    fi

    log_array=("x" "syslog" "wtmp" "lastlog" "auth.log" "bootstrap.log" "dmesg" "kern.log" "faillog")
    log_file=${log_array[$log_file_selection]}
    log_operations
done

# End