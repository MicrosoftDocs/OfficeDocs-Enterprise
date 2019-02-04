---
title: "Assign roles to user accounts with Office 365 PowerShell"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 01/31/2019
ms.audience: Admin
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: 
- O365ITProTrain
- PowerShell
- Ent_Office_Other
ms.assetid: ede7598c-b5d5-4e3e-a488-195f02f26d93
description: "Summary: Use Office 365 PowerShell to assign roles to user accounts."
---

# Assign roles to user accounts with Office 365 PowerShell

You can quickly and easily assign roles to user accounts using Office 365 PowerShell.

## Use the Azure Active Directory PowerShell for Graph module

First, [connect to your Office 365 tenant](connect-to-office-365-powershell.md#connect-with-the-azure-active-directory-powershell-for-graph-module) using a global administrator account.
  
Next, determine the sign-in name of the user account that you want to add to a role (example: fredsm@contoso.com). This is also known as the user principal name (UPN).

Next, determine the name of the role. Use this command to list the roles that you can assign with PowerShell.

````
Get-AzureADDirectoryRole
````

Next, fill in the sign-in and role names and run these commands.
  
```
$userName="<sign-in name of the account>"
$roleName="<role name>"
Add-AzureADDirectoryRoleMember -ObjectId (Get-AzureADDirectoryRole | Where {$_.DisplayName -eq $roleName}).ObjectID -RefObjectId (Get-AzureADUser | Where {$_.UserPrincipalName -eq $userName}).ObjectID
```

Here is an example of a completed command set:
  
```
$userName="belindan@contoso.com"
$roleName="Lync Service Administrator"
Add-AzureADDirectoryRoleMember -ObjectId (Get-AzureADDirectoryRole | Where {$_.DisplayName -eq $roleName}).ObjectID -RefObjectId (Get-AzureADUser | Where {$_.UserPrincipalName -eq $userName}).ObjectID
```

To display the list of user names for a specific role, use these commands.

```
$roleName="<role name>"
Get-AzureADDirectoryRole | Where { $_.DisplayName -eq $roleName } | Get-AzureADDirectoryRoleMember | Ft DisplayName
```

## Use the Microsoft Azure Active Directory Module for Windows PowerShell

First, [connect to your Office 365 tenant](connect-to-office-365-powershell.md#connect-with-the-microsoft-azure-active-directory-module-for-windows-powershell) using a global administrator account.
  
### For a single role change

Determine the following:
  
- The user account that you want to configure.
    
    To specify the user account, you must determine its Display Name. To get a complete list accounts, use this command:
    
  ```
  Get-MsolUser -All | Sort DisplayName | Select DisplayName | More
  ```

    This command lists the Display Name of your user accounts, sorted by the Display Name, one screen at a time. You can filter the list to a smaller set by using the **Where** cmdlet. Here is an example:
    
  ```
  Get-MsolUser | Where DisplayName -like "John*" | Sort DisplayName | Select DisplayName | More
  ```

    This command lists only the user accounts for which the Display Name starts with "John".
    
- The role you want to assign.
    
    To display the list of available roles that you can assign to user accounts, use this command:
    
  ```
  Get-MsolRole | Sort Name | Select Name,Description
  ```

Once you have determined the Display Name of the account and the Name of the role, use these commands to assign the role to the account:
  
```
$dispName="<The Display Name of the account>"
$roleName="<The role name you want to assign to the account>"
Add-MsolRoleMember -RoleMemberEmailAddress (Get-MsolUser | Where DisplayName -eq $dispName).UserPrincipalName -RoleName $roleName
```

Copy the commands and paste them into Notepad. For the **$dispName** and **$roleName** variables, replace the description text with their values, remove the \< and > characters, and leave the quotes. Copy the modified lines and paste them into your Windows Azure Active Directory Module for Windows PowerShell window to run them. Alternately, you can use the Windows PowerShell Integrated Script Environment (ISE).
  
Here is an example of a completed command set:
  
```
$dispName="Scott Wallace"
$roleName="SharePoint Service Administrator"
Add-MsolRoleMember -RoleMemberEmailAddress (Get-MsolUser | Where DisplayName -eq $dispName).UserPrincipalName -RoleName $roleName
```

### For multiple role changes

Determine the following:
  
- Which user accounts that you want to configure.
    
    To specify the user account, you must determine its Display Name. To get a list accounts, use this command:
    
  ```
  Get-MsolUser -All | Sort DisplayName | Select DisplayName | More
  ```

    This command lists the Display Name of all your user accounts, sorted by the Display Name, one screen at a time. You can filter the list to a smaller set by using the **Where** cmdlet. Here is an example:
    
  ```
  Get-MsolUser | Where DisplayName -like "John*" | Sort DisplayName | Select DisplayName | More
  ```

    This command lists only the user accounts for which the Display Name starts with "John".
    
- Which roles you want to assign to each user account.
    
    To display the list of available roles that you can assign to user accounts, use this command:
    
  ```
  Get-MsolRole | Sort Name | Select Name,Description
  ```

Next, create a comma-separated value (CSV) text file that has the DisplayName and role Name fields. Here is an example:
  
```
DisplayName,RoleName
"Belinda Newman","Billing Administrator"
"John Doe","SharePoint Service Administrator"
"Alice Smithers","Lync Service Administrator"
```

Next, fill in the location of the CSV file and run the resulting commands at the PowerShell command prompt.
  
```
$fileName="<path and file name of the input CSV file that has the role changes, example: C:\admin\RoleUpdates.CSV>"
$roleChanges=Import-Csv $fileName | ForEach {Add-MsolRoleMember -RoleMemberEmailAddress (Get-MsolUser | Where DisplayName -eq $_.DisplayName).UserPrincipalName -RoleName $_.RoleName }

```

## See also

- [Manage user accounts and licenses with Office 365 PowerShell](manage-user-accounts-and-licenses-with-office-365-powershell.md)
- [Manage Office 365 with Office 365 PowerShell](manage-office-365-with-office-365-powershell.md)
- [Getting started with Office 365 PowerShell](getting-started-with-office-365-powershell.md)
