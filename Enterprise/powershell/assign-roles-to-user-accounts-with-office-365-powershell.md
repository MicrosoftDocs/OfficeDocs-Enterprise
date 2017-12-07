---
title: "Assign roles to user accounts with Office 365 PowerShell"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 5/19/2017
ms.audience: Admin
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom:
- DecEntMigration
- O365ITProTrain
- PowerShell
- Ent_Office_Other
ms.assetid: ede7598c-b5d5-4e3e-a488-195f02f26d93
description: "Summary: Use Office 365 PowerShell and the Add-MsolRoleMember cmdlet to assign roles to user accounts."
---

# Assign roles to user accounts with Office 365 PowerShell
[]
 **Summary:** Use Office 365 PowerShell and the **Add-MsolRoleMember** cmdlet to assign roles to user accounts.
  
You can quickly and easily assign roles to user accounts using Office 365 PowerShell by identifying the user account's Display Name and the role's Name.
  
## Before you begin

The procedures in this topic require you to connect to Office 365 PowerShell using a global administrator account. For instructions, see [Connect to Office 365 PowerShell](connect-to-office-365-powershell.md).
  
## For a single role change

Determine the following:
  
- The user account that you want to configure.
    
    To specify the user account, you must determine its Display Name. To get a list accounts, use this command:
    
  ```
  Get-MsolUser | Sort DisplayName | Select DisplayName | More
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

Copy the commands and paste them into Notepad. For the **$dispName** and **$roleName** variables, replace the description text with their values, remove the < and > characters, and leave the quotes. Copy the modified lines and paste them into your Windows Azure Active Directory Module for Windows PowerShell window to run them. Alternately, you can use the Windows PowerShell Integrated Script Environment (ISE).
  
Here is an example of a completed command set:
  
```
$dispName="Scott Wallace"
$roleName="SharePoint Service Administrator"
Add-MsolRoleMember -RoleMemberEmailAddress (Get-MsolUser | Where DisplayName -eq $dispName).UserPrincipalName -RoleName $roleName
```

## For multiple role changes

Determine the following:
  
- Which user accounts that you want to configure.
    
    To specify the user account, you must determine its Display Name. To get a list accounts, use this command:
    
  ```
  Get-MsolUser | Sort DisplayName | Select DisplayName | More
  ```

    This command lists the Display Name of your user accounts, sorted by the Display Name, one screen at a time. You can filter the list to a smaller set by using the **Where** cmdlet. Here is an example:
    
  ```
  Get-MsolUser | Where DisplayName -like "John*" | Sort DisplayName | Select DisplayName | More
  ```

    This command lists only the user accounts for which the Display Name starts with "John".
    
- Which roles you want to assign to each user account.
    
    To display the list of available roles that you can assign to user accounts, use this command:
    
  ```
  Get-MsolRole | Sort Name | Select Name,Description
  ```

Next, create a comma-separated value (CSV) text file that contains the DisplayName and role Name fields. Here is an example:
  
```
DisplayName,RoleName
"Belinda Newman","Billing Administrator"
"John Doe","SharePoint Service Administrator"
"Alice Smithers","Lync Service Administrator"
```

Next, fill in the location of the CSV file and run the resulting commands at the PowerShell command prompt.
  
```
$fileName="<path and file name of the input CSV file that contains the role changes, example: C:\\admin\\RoleUpdates.CSV>"
$roleChanges=Import-Csv $fileName | ForEach {Add-MsolRoleMember -RoleMemberEmailAddress (Get-MsolUser | Where DisplayName -eq $_.DisplayName).UserPrincipalName -RoleName $_.RoleName }

```

## See also

#### 

[Manage user accounts and licenses with Office 365 PowerShell](manage-user-accounts-and-licenses-with-office-365-powershell.md)
  
[Manage Office 365 with Office 365 PowerShell](manage-office-365-with-office-365-powershell.md)
  
[Getting started with Office 365 PowerShell](getting-started-with-office-365-powershell.md)
#### 

[Add-MsolRoleMember](https://msdn.microsoft.com/library/dn194120.aspx)

