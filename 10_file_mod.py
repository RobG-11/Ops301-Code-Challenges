# Script: 10 - Python File Handling
# Author: Robert Gregor
# Date of latest revision: 182030FMAR23

# Objectives
    # Using file handling commands, create a Python script that:
        # Creates a new .txt file
        # Appends three lines
	    # Prints to the screen the first line
        # Deletes the .txt file

# My Sources:
    # [Python Tutorial](https://www.w3schools.com/python/default.asp)
    # [Python File Methods](https://www.w3schools.com/python/python_ref_file.asp)
    # [Python File Write](https://www.w3schools.com/python/python_file_write.asp)
    # [With Open in Python – With Statement Syntax Example](https://www.freecodecamp.org/news/with-open-in-python-with-statement-syntax-example/)
    # [Python File readlines() Method](https://www.w3schools.com/python/ref_file_readlines.asp)

#!/usr/bin/env python3

# Main

# Import libraries

import click
import os

# Clear screen, request used input for file name, creates file in current directory

click.clear()
file_name = input("Please enter the name of the text file you would like to create: ")
f = open(file_name + ".txt", "x")
print("\nYou have created the file " + file_name + ".txt")

# Requests user input for lines to be appended to file

line_1 = input("\nPlease enter the first line to add to file: ")
line_2 = input("Please enter the second line to add to file: ")
line_3 = input("Please enter the third line to add to file: ")

# Appends user input lines to file

f.write(line_1 + "\n")
f.write(line_2 + "\n")
f.write(line_3 + "\n")
f.close()

# Requests user input to select line in file to print
    # With the file_name file open, use readlines() function to create line_list list
    # Print user request line, -1 is used as first value in list is 0

print_line = int(input("\nPlease select the number of the line you would like to print: "))
print()
with open(file_name + ".txt", "r") as f:
    line_list = f.readlines()
    print(line_list[print_line - 1])

# os.remove command used to delete created text file

input("Press enter to delete the text file and exit the program...")
os.remove(file_name + ".txt")
print("File " + file_name + ".txt has been deleted\n")

# End
