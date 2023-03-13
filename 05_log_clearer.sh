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
    # 

# Main

# Exit Function:
    # Print successful exit to screen and exit script

exit_func(){
    echo ""
    echo "cond_menu.sh exited successfully!"
    echo ""
    exit
}

# log_operations() function:
    # 

log_operations(){
    log_size=$(stat -c %s "$log_file")
    echo ""
    echo "Size of $log_file_loc is $log_size bytes"

    echo ""
    read -n 1 -r -s -p $'Press space bar to compress log into backup file...\n'
    echo ""

    mkdir $log_file.tgz
    tar cfz log_file.tgz $log_file
    comp_log_size=$(stat -c %s "$log_file.tgz")
    echo "Backup compressed $logfile.tgz is comp_log size bytes"

    echo ""
    read -n 1 -r -s -p $'Press space bar to determine difference in bytes between original file & compressed backup...\n'
    echo ""

    log_size_diff=$log_size-$comp_log_size
    echo "$log_file.tgz is $log_size_diff bytes smaller than $log_file size "

    echo ""
    read -n 1 -r -s -p $'Press space bar to clear original log file...\n'
    echo ""

    truncate --size 0 $log_file
    echo "$logfile cleared!"
}

while true
do
    clear
    
    echo "In sequence, this script will first print log file size, compress contents to a backup directory"
    echo "Print compressed file size, compare before & after sizes, and then clear original log file and confirm"
    echo "";
    echo "1) System Logging Records (syslog) - non-kernel boot errors, app-related service errors, messages logged during system startup"
    echo "2) Who & When (wtmp) - provides utmp history of user logins & logouts, system events, system status, system boot time"
    echo "exit) exit program"
    echo ""
    echo "Please choose a log file to manipulate or type exit to exit program:"
    read log_file_selection

    if [[ $log_file_selection == "exit" ]]; then
        exit_func
    fi

    if [[ $log_file_selection == "1" ]]; then
        log_file="/var/log/syslog"
        log_operations
    elif [[ $log_file_selection == "2" ]]; then
        log_file="/var/log/wtmp"
        log_operations
    else
        echo "Invalid Input!"
    fi
done

# End