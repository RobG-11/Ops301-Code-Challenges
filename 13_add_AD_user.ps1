# Script: 13 - Powershell AD Automation
# Author: Robert Gregor
# Date of latest revision: 192030FMAR23

# Objectives
    # Write a Powershell script that adds the below person to AD
        # Franz Ferdinand is the TPS Reporting Lead at GlobeX USA in Springfield, OR office
        # Franz is part of the TPS Department
        # Franz’s email is ferdi@GlobeXpower.com
    # Test your script. Verify in ADAC that the user was created with the correct attributes
        # If anything is missing, delete the user in ADAC and re-attempt from Powershell ISE

# Code Fellows Sources:
    # [New-ADUser](https://learn.microsoft.com/en-us/powershell/module/activedirectory/new-aduser?view=windowsserver2022-ps)

# My Sources:
    # [

# Main

# Main

clear

function Get-AnyKeyToContinue {
    Write-Host "Press any key to continue..."
    $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    clear
}

function Create-NewUser {
    New-ADUser -Name $user_name -Accountpassword $password -DisplayName $user_full_name -Title  -Enabled $true

}

Write-Output "Welcome to the new user account set up program!"

$user_full_name = Read-Host "Please enter new users full name (First Last): "
$user_job_title = Read-Host "Please enter $user_full_name's job title: "
$user_name = Read-Host "Please enter new users USERNAME: "
$password = Read-Host -AsSecureString "Please enter $user_full_name's secure password: "

Create-NewUser
