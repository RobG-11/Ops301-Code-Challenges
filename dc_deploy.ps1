# Script: Automate Domain Contoller Deployment
# Author: Robert Gregor
# Date of latest revision: 192031FMAR23

# Objectives
    # Write a Powershell script that...
        # Assigns the Windows Server VM a static IPv4 address
        # Assigns the Windows Server VM a DNS
        # Renames the Windows Server VM
        # Installs AD-Domain-Services
        # Creates an AD Forest
        # Creates Organizational Units (OU)
        # Creates users

# My Sources:
    # [Rename-Computer](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/rename-computer?view=powershell-7.3)
    # [PowerTip: Use PowerShell to Get Computer Name](https://devblogs.microsoft.com/scripting/powertip-use-powershell-to-get-computer-name/)
    # [Get-ADUser](https://learn.microsoft.com/en-us/powershell/module/activedirectory/get-aduser?view=windowsserver2022-ps)
    # [Format-Table](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/format-table?view=powershell-7.3)

# Main

Import-Module ActiveDirectory

clear

# Create-NewUser function - Adds new active directory user with eight property values

function New-Computer-Name{
    clear
    Write-Host ""
    Write-Host "Your current computer name is $env:computername"
    Write-Host ""
    $new_comp_name = Read-Host "Please provide the new computer name and press enter"

    Rename-Computer -NewName $new_comp_name
    Write-Host ""
    Write-Host "Your computer name has been changed to $new_comp_name"
    Write-Host ""
    Read-Host "Press any key to continue..."
    exit
}



function Create-NewUser {
    clear
    Write-Host ""
    Write-Host "Welcome to new user account set up"
    Write-Host "----------------------------------"

    $full_name = Read-Host "Please enter new users full name (First Last)"
    $user_name = Read-Host "Please enter new users USERNAME"
    $password = Read-Host -AsSecureString "Please enter $user_full_name's secure password"
    $company_name = Read-Host "Please enter the company name"
    $office_location = Read-Host "Please enter $user_full_name's office location"
    $dept_name = Read-Host "Please enter $user_full_name's department"
    $job_title = Read-Host "Please enter $user_full_name's job title"
    Write-Host ""

    Read-Host "Press any key to create user..."

    New-ADUser -Name $full_name -SamAccountName $user_name -Accountpassword $password -Company $company_name  -Office $office_location -Department $dept_name -Title $job_title -Enabled $true

    Read-Host "New user $user_name created! Press any key to verify..."
    
    # Verifies new user was created and prints formatted table with all eight properties to screen

    Get-ADUser -Filter "Name -eq '$user_name'" | Format-Table Name, SamAccountName, Created, Company, Office, Department, Title, Enabled

    Read-Host "Press any key to continue..."
    exit
}

