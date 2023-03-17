# Script: 07 - Directory Creation
# Author: Robert Gregor
# Date of latest revision: 152030FMAR23

# Objectives
    # Create a Python script that generates all directories, sub-directories and files for a user-provided directory path
        # Script must ask the user for a file path and read a user input string into a variable
        # Script must use the os.walk() function from the os library
        # Script must enclose the os.walk() function within a python function that hands it the user input file path

# Stretch Goals
    # Have the script save the output as a .txt file
        # Have the script open the .txt file with Libre Office Writer
    # Add a function to your Python script that performs the following as a first step to prepare a test directory
        # Takes a user input string
        # Creates a directory named the string using os.makdirs function
        # Create sub-directories within the directory named ‘string_01’, ‘string_02’, and ‘string_03’

# My Sources:
    # [Python 3 – input() function](https://www.geeksforgeeks.org/python-3-input-function/)
    # [os.walk() in Python](https://www.geeksforgeeks.org/os-walk-python/)
    # [Python Infinite While Loop](https://www.tutorialkart.com/python/python-while-loop/python-infinite-while-loop/)
    # [Python Write Text File](https://www.pythontutorial.net/python-basics/python-write-text-file/)

#!/usr/bin/env python3

# Import libraries

import os
import click

# Main

# Clears screen

click.clear()

# Declares user_input function:
    # Function prints question, accepts user input, and then returns user_input

def user_input():
    print("Please enter name of directory path to view and press ENTER or type exit to exit dir_reader.py:")
    file_path = input()
    return file_path

file_path = user_input()

for (root, dirs, files) in os.walk(file_path):
    ### Add a print command here to print ==root==
    input("\nPress Enter to view current directory...")
    print("-------------------------------------------------")
    print(root)
    print("-------------------------------------------------")
    ### Add a print command here to print ==dirs==
    input("\nPress Enter to view subdirectories...")
    print("-------------------------------------------------")
    print(dirs)
    print("-------------------------------------------------")
    ### Add a print command here to print ==files==
    input("\nPress Enter to view Files...")
    print("-------------------------------------------------")
    print(files)
    print("-------------------------------------------------")
    input("\nPress Enter to move to next iteration...")
    click.clear()

# End
