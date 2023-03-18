# Script: 10 - Psutil
# Author: Robert Gregor
# Date of latest revision: 182030FMAR23

# Objectives
    # Create a Python script that fetches this information using Psutil:
        # Time spent by normal processes executing in user mode
        # Time spent by processes executing in kernel mode
	    # Time when system was idle
        # Time spent by priority processes executing in user mode
        # Time spent waiting for I/O to complete.
        # Time spent for servicing hardware interrupts
        # Time spent for servicing software interrupts
        # Time spent by other operating systems running in a virtualized environment
        # Time spent running a virtual CPU for guest operating systems under the control of the Linux kernel

# My Sources:
    # [Python Tutorial](https://www.w3schools.com/python/default.asp)
    # [Psutil module in Python](https://www.geeksforgeeks.org/psutil-module-in-python/)
    # [Python getattr() Function](https://www.w3schools.com/python/ref_func_getattr.asp)

#!/usr/bin/env python3

# Main

# Import libraries

import psutil
import click

# While loop - infinite, only broken by user input exit command
    # Declare psutil_list and populate with potential psutil.cpu_times parameters
    # Request user input to determine parameter time in seconds to return
    # Conditional for exit functionality
    # paramter variable set to psutil_list item corresponding to info_item selection
    # results variable set to output of get attibute function
        # get attibute function retrieves value from psutil.cpu_times() based on parameter variable input

while True:

    psutil_list = ["x", "user", "system", "idle", "nice", "iowait", "irq", "softirq", "steal", "guest", "exit"]

    click.clear()
    print("1) user - time spent by normal processes executing in user mode")
    print("2) system - time spent by processes executing in kernel mode")
    print("3) idle - time when system was idle")
    print("4) nice - time spent by priority processes executing in user mode")
    print("5) iowait - time spent waiting for I/O to complete")
    print("6) irq - time spent for servicing hardware interrupts")
    print("7) softirq - time spent for servicing software interrupts")
    print("8) steal - time spent by other operating systems running in a virtualized environment")
    print("9) guest - time spent running a virtual CPU for guest operating systems under the control of the Linux kernel")
    print("0) exit program")
    print("-------------------------------------------------------------------------------")
    info_item = int(input("Please enter the number of the Psutil parameter you would like information on: "))

    if info_item == 0:
        print("\npsutil_info.py exited successfully!\n")
        break

    parameter = psutil_list[info_item]
    results = getattr(psutil.cpu_times(), parameter)
    print()
    print(str(results) + " seconds")

    input("\nPress Enter to view another Psutil parameter...")

# End










