# Script: 07 - Directory Creation
# Author: Robert Gregor
# Date of latest revision: 152030FMAR23

# Objectives
    # Create a Python script that includes the following:
        # Assign to a variable a list of ten string elements
        # Print the fourth element of the list
        # Print the sixth through tenth element of the list
        # Change the value of the seventh element to “onion”

# My Sources:
    # [Python Tutorial](https://www.w3schools.com/python/default.asp)
    # [Python | Get a list as input from user](https://www.geeksforgeeks.org/python-get-a-list-as-input-from-user/)
    # [Python break, continue and pass Statements](https://www.tutorialspoint.com/python/python_loop_control.htm)

#!/usr/bin/env python3

# Main

# Import libraries

import click

# Functions
    # print_item() - Prints user_list, takes integer as user input to determine which item in list to print
    # print_item_range() - Print user_list, takes two integers as input to determine range of items to print
    # change_item() - Prints user_list, take integer input to determine it to change and string input for change value

def print_item():
    click.clear()
    print(user_list)
    user_item = int(input("\nPlease enter number of item (left to right) to print: "))
    print()
    print(user_list[user_item-1])

def print_item_range():
    click.clear()
    print(user_list)
    user_item_1 = int(input("\nPlease enter number of first item in range (left to right) to print: "))
    user_item_2 = int(input("Please enter number of last item in range (left to right) to print: "))
    print()
    print(user_list[user_item_1-1:user_item_2])

def change_item():
    click.clear()
    print(user_list)
    user_item = int(input("\nPlease enter number of item (left to right) whose string value you would like to change: "))
    item_value = str(input("Please enter the new string value: "))
    user_list[user_item-1] = item_value
    print("\nBelow is your modified list:\n")
    print(user_list)

# While loop - infinite, only broken by utilizing the 'exit' command
    # Clears screen, creates empty list
    # For loop - runs for 10 iterations storing user list_item input in user_list
        # exit functionality
        # user_list.append is used to add additional items to list
    # User list input is printed to screen

while True:

    click.clear()
    user_list = []

    print("\n-------------------------------------------------------------------------")
    print("Please enter ten strings for manipulation or exit to exit py_list_mod.py:")
    print("-------------------------------------------------------------------------")

    for i in range (0, 10):
        list_item = str(input("Input String and press ENTER: "))
        if list_item == "exit":
            print("\npy_list_mod.py exited successfully!\n")
            exit()
        user_list.append(list_item)

    click.clear()
    print("\n------------------------")
    print("Your list is shown below")
    print("------------------------")
    print(user_list)

    # Nested While loop - infinite, only broken by utilizing the 'exit' command
        # Requests user input to determine list item to modify
        # Conditional used to determine function to call, new list entry, exit functionality, or invalid input

    while True:
              
        print("\n------------------------")
        print("Please choose an option:\n1) Print one item\n2) Print range of items\n3) Change item\n4) Input new list\nexit) exit program")
        user_mod = str(input("------------------------\n"))

        if user_mod == "1":
            print_item()
        elif user_mod == "2":
            print_item_range()
        elif user_mod == "3":
            change_item()
        elif user_mod == "4":
            break
        elif user_mod == "exit":
            print("\npy_list_mod.py exited successfully!\n")
            exit()
        else:
            print("\nInvalid input please try again!")
            continue
# End