# Script: 07 - Directory Creation
# Author: Robert Gregor
# Date of latest revision: 152030FMAR23

# Objectives
    # Create a Python script that generates all directories, sub-directories and files for a user-provided directory path
        # Script must ask the user for a file path and read a user input string into a variable
        # Script must use the os.walk() function from the os library
        # Script must enclose the os.walk() function within a python function that hands it the user input file path

# Stretch Goals
    # Instead of the os module, utilize the subprocess module instead
        # Refer to python.org for how this can be achieved

# Code Fellows Sources:
    # [Miscellaneous operating system interfaces](https://docs.python.org/3/library/os.html)
    # [PEP 8 – Style Guide for Python Code](https://peps.python.org/pep-0008/)

# My Sources:
    # [How to run bash script in Python?](https://www.geeksforgeeks.org/how-to-run-bash-script-in-python/)
    # [Running Bash commands in Python](https://stackoverflow.com/questions/4256107/running-bash-commands-in-python)
    # [2 practical ways to use the Python subprocess module](https://www.redhat.com/sysadmin/use-python-subprocess-bash)
    # [Python Tutorial](https://www.w3schools.com/python/)
    # [How do I make python wait for a pressed key](https://www.edureka.co/community/102175/how-do-i-make-python-wait-for-a-pressed-key)
    # [Clear Screen in Python](https://www.stechies.com/clear-screen-in-python/)
    # [How to Execute Shell Commands in Python Using the Subprocess Run Method](https://linuxhint.com/execute_shell_python_subprocess_run_method/)


#!/usr/bin/env python3

# Import libraries

import os

# Declaration of variables

### Read user input here into a variable

# Declaration of functions

### Declare a function here

for (root, dirs, files) in os.walk("testdir"):
    ### Add a print command here to print ==root==
    print(root)
    ### Add a print command here to print ==dirs==
    print(dirs)
    ### Add a print command here to print ==files==
    print(files)

# Main

### Pass the variable into the function here

# End
