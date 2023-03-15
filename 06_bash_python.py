# Script: 06 - Bash in Python
# Author: Robert Gregor
# Date of latest revision: 152030FMAR23

# Objectives
    # Create a Python script that executes a few bash commands successfully
        # Indicate in comments how you achieved this
    # Requirements:
        # Python module “os” must be utilized
        # At least three variables must be declared in Python that contain results of bash operations
        # Python function print() must be used at least three times
    # Include execution of the following bash commands inside your Python script:
        # whoami / ip a / lshw -short

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


# Main

# Import subprocess module for shell command functionality
# Import click module for python screen clearing function () click.clear()

import subprocess
import click

# Declare variables equal to the output of running the subprocess.run command on specific bash commands
# capture_output=True ensures the capture of the output of the bash commands
# text=true ensures output is given as a string

who_am_i = subprocess.run(["whoami"], capture_output=True, text=True)
ip_a = subprocess.run(["ip", "a"], capture_output=True, text=True)
lshw_short = subprocess.run(["lshw", "-short"], capture_output=True, text=True)

# Clears screen

click.clear()

# Request user press the ENTER key to execute commands
# Prints the results of each command to the screen using stdout

input("Press Enter to run bash whoami command...")
print()
print(who_am_i.stdout)

input("Press Enter to run bash ip a command...")
print()
print(ip_a.stdout)

input("Press Enter to run bash lshw -short command...")
print()
print(lshw_short.stdout)
print("Script Complete!")

# End