#!/bin/bash

# Script: 04 - Conditionals in Menu
# Author: Robert Gregor
# Date of latest revision: 121630FMAR23

# Objectives
    # Create a bash script that launches a menu system with the following options:
        # Hello world (prints “Hello world!” to the screen)
        # Ping self (pings this computer’s loopback address)
        # IP info (print the network adapter information for this computer)
        # Exit
    # Next, the user input should be requested
        # Program should next use conditional statement to evaluate user’s input, then act according to what user selected
        # Use a loop to bring up the menu again after the request has been executed

# Code Fellows Sources:
    # [Bash conditional statement](https://linuxhint.com/bash_conditional_statement/)

# My Sources:
    # [Practical Ping Command in Linux Examples](https://adamtheautomator.com/ping-command-in-linux/)
    # [Bash Script – Press Any Key To Continue](https://www.tweaking4all.com/software/linux-software/bash-press-any-key/)
    # [Bash Shell Command to Find or Get IP address](https://www.cyberciti.biz/faq/bash-shell-command-to-find-get-ip-address/)

# Main

# Exit Function:
    # Print successful exit to screen and exit script
    # Log exit timestamp in fpm_log.txt file

exit_func(){
    echo ""
    echo "cond_menu.sh exited successfully!"
    echo ""
    exit
}

# hello_world function:
    # Prints "Hello World!" to screen
    # Uses "Press space bar to continue..." command to ensure user readability

hello_world(){
    echo ""
    echo "Hello World!"
    echo ""
    read -n 1 -r -s -p $'Press space bar to continue...\n'
    echo ""
}

# ping_loopback function:
    # Pings computers loopback address four times and prints output to screen
    # Uses "Press space bar to continue..." command to ensure user readability

ping_loopback(){
    echo ""
    ping -c 4 127.0.0.1
    echo ""
    read -n 1 -r -s -p $'Press space bar to continue...\n'
    echo ""
}

# net_adap_info function:
    # Executes ifconfig -a command and prints output to screen
    # Uses "Press space bar to continue..." command to ensure user readability

net_adap_info(){
    echo ""
    ip addr show
    echo ""
    read -n 1 -r -s -p $'Press space bar to continue...\n'
    echo ""
}

# While loop prints menu and reads option variable input by user
    # Conditionals determine which function above is executed based on option variable input

while true
do
    clear
    echo "1) Print \"Hello World!\" to screen"
    echo "2) Ping loopback address"
    echo "3) Print network adapter information"
    echo "exit) exit script"
    echo ""
    echo "Please select an option:" 
    read option

    if [[ $option == "exit" ]]; then
        exit_func
    fi

    if [[ $option == "1" ]]; then
        hello_world
    elif [[ $option == "2" ]]; then
        ping_loopback
    elif [[ $option == "3" ]]; then
        net_adap_info
    else
        echo "Invalid Input!"
    fi
done

# End