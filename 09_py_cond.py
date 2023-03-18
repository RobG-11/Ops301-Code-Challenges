# Script: 09 - Python Conditional
# Author: Robert Gregor
# Date of latest revision: 182030FMAR23

# Objectives
    # Create if statements using these logical conditionals below:
        # Each statement should print information to the screen depending on if the condition is met
            # Equals: a == b
            # Not Equals: a != b
            # Less than: a < b
            # Less than or equal to: a <= b
            # Greater than: a > b
            # Greater than or equal to: a >= b
        # Create if statement using logical conditional of your choice and include elif keyword that executes when other conditions are not met
        # Create an if statement that includes both elif and else to execute when both if and elif are not met

# My Sources:
    # [Python Tutorial](https://www.w3schools.com/python/default.asp)
    # [Random Numbers in Python](https://www.geeksforgeeks.org/random-numbers-in-python/)
    # [Python Random randint() Method](https://www.w3schools.com/python/ref_random_randint.asp)

#!/usr/bin/env python3

# Main

# Import libraries

import click
import random

# Uses pythons random library to call randint function which generates a random number 1-10 and stores it in my_num

my_num = random.randint(1, 100)
click.clear()

print("------------------------------------")
print("Welcome to the GUESS MY NUMBER GAME!")
print("------------------------------------")

# Requests user guess and convert input to integer type

user_num = int(input("I am thinking of a number between 1 and 100 whats my number? "))

# While loop - inifinite, only broken when program exits on correct user guess
    # Conditional determines actions based on user input

while True:
    if user_num == my_num:
        print("\nYOUR CORRECT! " + str(user_num) + " IS INDEED MY NUMBER! YOU WIN!\n\nPlease play again soon!\n")
        exit()
    elif user_num > my_num:
        user_num = int(input("\nIncorrect! My number is smaller then " + str(user_num) + "! Next guess? "))
    else:
        user_num = int(input("\nIncorrect! My number is larger then " + str(user_num) + "! Next guess? ")) 
# End



