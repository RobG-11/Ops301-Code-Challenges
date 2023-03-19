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
    # [What is `n in Powershell?](https://www.educative.io/answers/what-is-n-in-powershell)
    # [Get-ADUser](https://learn.microsoft.com/en-us/powershell/module/activedirectory/get-aduser?view=windowsserver2022-ps)


# Main

# Main

clear

function Create-NewUser {
    New-ADUser -Name $user_name -Accountpassword $password -DisplayName $full_name -Company $company_name  -Office $office_location -Department $dept_name -Title $job_title -Enabled $true
}

Write-Output "Welcome to the new user account set up program!"
Write-Output "-----------------------------------------------"

$company_name = Read-Host "Please enter the company name: "
$full_name = Read-Host "Please enter new users full name (First Last): "
$office_location = Read-Host "Please enter $user_full_name's office location: "
$dept_name = Read-Host "Please enter $user_full_name's department: "
$job_title = Read-Host "Please enter $user_full_name's job title: "
$user_name = Read-Host "Please enter new users USERNAME: "
$password = Read-Host -AsSecureString "Please enter $user_full_name's secure password: "

Write-Host "Press any key to create user..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

Create-NewUser
Write-Host "New user $user_name created!"
Write-Host "Press any key to verify user was created with Get-ADUser..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

Get-ADUser -Filter "Name -eq '$user_name"

# End