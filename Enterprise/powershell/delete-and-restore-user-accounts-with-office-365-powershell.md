---
title: "Delete user accounts with Office 365 PowerShell"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 01/03/2019
ms.audience: Admin
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: 
- PowerShell
- Ent_Office_Other
- O365ITProTrain
ms.assetid: 209c9868-448c-49bc-baae-11e28b923a39
description: "Learn how to use Office 365 PowerShell to delete Office 365 user accounts."
---

# Delete user accounts with Office 365 PowerShell

**Summary:**  Learn how to use Office 365 PowerShell to delete Office 365 user accounts.
  
You can use Office 365 PowerShell to delete a user account.

   
## Use the Azure Active Directory PowerShell for Graph module

First, [connect to your Office 365 tenant](connect-to-office-365-powershell.md#connect-with-the-azure-active-directory-powershell-for-graph-module).

After you have connected, use the following syntax to remove an individual user account:
  
```
Remove-AzureADUser -ObjectID <sign-in name>
```

This example removes the user account fabricec@litwareinc.com.
  
```
Remove-AzureADUser -ObjectID fabricec@litwareinc.com
```

> [!NOTE]
> The **-ObjectID** parameter in the **Remove-AzureAD** cmdlet accepts either the account's sign-in name, also known as the User Principal Name, or the account's object ID.
  
To display the account name based on the user's name, use the following commands:
  
```
$userName="<User name>"
Write-Host (Get-AzureADUser | where {$_.DisplayName -eq $userName}).UserPrincipalName
```

This example displays the account name for the user named Caleb Sills.
  
```
$userName="Caleb Sills"
Write-Host (Get-AzureADUser | where {$_.DisplayName -eq $userName}).UserPrincipalName
```

To remove an account based on the user's display name, use the following commands:
  
```
$userName="<display name>"
Remove-AzureADUser -ObjectID (Get-AzureADUser | where {$_.DisplayName -eq $userName}).UserPrincipalName
```

## Use the Microsoft Azure Active Directory Module for Windows PowerShell

When you delete a user account with the Microsoft Azure Active Directory Module for Windows PowerShell, the account isn't permanently deleted. You can restore the deleted user account within 30 days.

First, [connect to your Office 365 tenant](connect-to-office-365-powershell.md#connect-with-the-microsoft-azure-active-directory-module-for-windows-powershell).


To delete a user account, use the following syntax:
  
```
Remove-MsolUser -UserPrincipalName <sign-in name>
```

This example deletes the user account BelindaN@litwareinc.com.
  
```
Remove-MsolUser -UserPrincipalName belindan@litwareinc.com
```

To restore a deleted user account within the 30-day grace period, use the following syntax:
  
```
Restore-MsolUser -UserPrincipalName <sign-in name>
```

This example restores the deleted account BelindaN@litwareinc.com.
  
```
Restore-MsolUser -UserPrincipalName BelindaN@litwareinc.com
```

 **Notes:**
  
- To see the list of deleted users that can be restored, run the following command:
    
  ```
  Get-MsolUser -All -ReturnDeletedUsers
  ```

- If the user account's original user principal name is used by another account, use the _NewUserPrincipalName_ parameter instead of _UserPrincipalName_ to specify a different user principal name when you restore the user account.


## See also

[Manage user accounts and licenses with Office 365 PowerShell](manage-user-accounts-and-licenses-with-office-365-powershell.md)
  
[Manage Office 365 with Office 365 PowerShell](manage-office-365-with-office-365-powershell.md)
  
[Getting started with Office 365 PowerShell](getting-started-with-office-365-powershell.md)

