# Script: 07 - Directory Creation
# Author: Robert Gregor
# Date of latest revision: 152030FMAR23

# Objectives
    # Create a Python script that generates all directories, sub-directories and files for a user-provided directory path
        # Script must ask the user for a file path and read a user input string into a variable
        # Script must use the os.walk() function from the os library
        # Script must enclose the os.walk() function within a python function that hands it the user input file path

# My Sources:
    # [Python 3 – input() function](https://www.geeksforgeeks.org/python-3-input-function/)
    # [os.walk() in Python](https://www.geeksforgeeks.org/os-walk-python/)
    # [Python Infinite While Loop](https://www.tutorialkart.com/python/python-while-loop/python-infinite-while-loop/)
    # [Python Write Text File](https://www.pythontutorial.net/python-basics/python-write-text-file/)

#!/usr/bin/env python3

# Import libraries

import os
import click

# Clears screen
click.clear()

# Declare user_input() function:
    # Prints question and accepts user input as file_path variable
    # For loop iterates through file_path directory and prints current directory, subdirectories, and files to terminal

def user_input():
    file_path = input("Please enter name of directory path to view and press ENTER or type exit to exit dir_reader.py:\n")
    for (root, dirs, files) in os.walk(file_path):
        # Add a print command here to print ==root==
        input("\nPress Enter to view current directory...")
        print("-------------------------------------------------")
        print(root)
        print("-------------------------------------------------")
        # Add a print command here to print ==dirs==
        input("\nPress Enter to view subdirectories...")
        print("-------------------------------------------------")
        print(dirs)
        print("-------------------------------------------------")
        # Add a print command here to print ==files==
        input("\nPress Enter to view Files...")
        print("-------------------------------------------------")
        print(files)
        print("-------------------------------------------------")
        input("\nPress Enter to move to next iteration...")
        click.clear()

# Main

# Call user_input() functions

user_input()

# End