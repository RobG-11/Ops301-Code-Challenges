# Script: 12 - Python Requests Library
# Author: Robert Gregor
# Date of latest revision: 192030FMAR23

# Objectives
    # Create a Python script that performs the following:
        # Prompt the user to type a string input as the variable for your destination URL
        # Prompt the user to select a HTTP Method of the following options
	        # GET, POST, PUT, DELETE, HEAD, PATCH, OPTIONS
            # Print to screen entire request your script is about to send
            # Ask user to confirm before proceeding
            # Using the requests library, perform a GET request against your lab web server
        # For the given header, translate the codes into plain terms that print to the screen
            # Example: 404 error should print Site not found to the terminal instead of 404
        # For the given URL, print response header information to the screen

# Code Fellows Sources:
    # [Python’s Requests Library (Guide)](https://realpython.com/python-requests/)

# My Sources:
    # [Python Tutorial](https://www.w3schools.com/python/default.asp)
    # [Python – Mapping key values to Dictionary](https://www.geeksforgeeks.org/python-mapping-key-values-to-dictionary/)
    # [response.headers – Python requests](https://www.geeksforgeeks.org/response-headers-python-requests/)
    # [HTTP response status codes](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status)

#!/usr/bin/env python3

# Main

# Import libraries

import click
import requests

# While loop - infinite, only broken if exit is selected by user
    # Clears screen, requests url input to append to https://, conditional determine if exit selected

while True:

    click.clear()
    user_url = "https://" + str(input("Please enter URL (ex. site.com) of website you would like to communicate with or 'exit' to exit program: "))
    print(user_url)

    if user_url == "exit":
            print("\nHTTP_request.py exited successfully!\n")
            exit()

    # Nested While loop - inifinite, broken by exit functionality or return to url input functionality
        # Requests user input to determine HTTP method to perform on url

    while True:

        click.clear()
        print("Type 'exit' to exit program or 'return' to input new url input, otherwise...")

        print("\nget / post / put / delete / head / patch / options\n")

        user_HTTP_method = str(input("Please enter an HTTP method above to it on the URL you have selected: "))

        if user_HTTP_method == "exit":
            print("\nHTTP_request.py exited successfully!\n")
            exit()

        if user_HTTP_method == "return":
            break

        # Prints command to be executed to screen and asks user for confirmation of execution

        print("\nYou have chosen to perform the command below:\n")
        print("requests." + user_HTTP_method + "(" + user_url + ")")
        input("\nPress Enter to confirm...")

        # Declares method_dictionary containing HTTP method strings as keys and HTTP request commands as corresponding values

        method_dictionary = {
            "get": requests.get,
            "post": requests.post,
            "put": requests.put,
            "delete": requests.delete,
            "head": requests.head,
            "patch": requests.patch,
            "options": requests.options,
        }

        # Declares response variable and stores HTTP response based on user input selecting HTTP method from method_dictionary

        response = method_dictionary[user_HTTP_method](user_url)
        print()

        # Conditional determines reponse status code, prints header info, and prints translation of response code
            # continue is used to return to the beginning of nested while loop so user can perform another HTTP method

        if response.status_code == 200:
            print(response.headers)
            print("\nOK, Operation Successful!")
            input("\nPress Enter to select another method...")
            continue
        elif response.status_code == 301:
            print(response.headers)
            print("\nMOVED PERMANENTLY, Operation Successful!")
            input("\nPress Enter to select another method...")
            continue
        elif response.status_code == 400:
            print(response.headers)
            print("\nBAD REQUEST, Operation Failed!")
            input("\nPress Enter to select another method...")
            continue
        elif response.status_code == 401:
            print(response.headers)
            print("\nUNAUTHORIZED, Operation Failed!")
            input("\nPress Enter to select another method...")
            continue
        elif response.status_code == 403:
            print(response.headers)
            print("\nFORBIDDEN, Operation Failed!")
            input("\nPress Enter to select another method...")
            continue
        elif response.status_code == 404:
            print(response.headers)
            print("\nNOT FOUND, Operation Failed!")
            input("\nPress Enter to select another method...")
            continue
        else:
            print("\nInvalid Input!")
            input("\nPress Enter to try again!")
            continue

# End