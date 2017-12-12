---
title: "Delete and restore user accounts with Office 365 PowerShell"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 12/15/2017
ms.audience: Admin
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom:
- DecEntMigration
- PowerShell
- Ent_Office_Other
- O365ITProTrain
ms.assetid: 209c9868-448c-49bc-baae-11e28b923a39
description: "Learn how to use Office 365 PowerShell to delete and restore Office 365 user accounts"
---

# Delete and restore user accounts with Office 365 PowerShell

**Summary:**  Learn how to use Office 365 PowerShell to delete and restore Office 365 user accounts
  
When you use Office 365 PowerShell to delete a user account, the account isn't permanently deleted. You can restore the deleted user account within 30 days.
  
## Before you begin

- The procedures in this topic require you to connect to Office 365 PowerShell. For instructions, see [Connect to Office 365 PowerShell](connect-to-office-365-powershell.md).
    
- If you use the **Get-MsolUser** cmdlet without using the _All_ parameter, only the first 500 accounts are returned.
    
## Use Office 365 PowerShell to block access to individual user accounts
<a name="ShortVersion"> </a>

To delete a user account, use the following syntax:
  
```
Remove-MsolUser -UserPrincipalName <Account>
```

This example deletes the user account BelindaN@litwareinc.com.
  
```
Remove-MsolUser -UserPrincipalName belindan@litwareinc.com
```

To restore a deleted user account within the 30-day grace period, use the following syntax:
  
```
Restore-MsolUser -UserPrincipalName <Account>
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

- If the user account's original user principal name is used by another account, use the  _NewUserPrincipalName_ parameter instead of _UserPrincipalName_ to specify a different user principal name when you restore the user account.
    
## Use the Azure Active Directory V2 PowerShell module to remove a user account
<a name="ShortVersion"> </a>

To use the **Remove-AzureADUser** cmdlet from the Azure Active Directory V2 PowerShell module, you must first connect to your subscription. For the instructions, see[Connect with the Azure Active Directory V2 PowerShell module](https://go.microsoft.com/fwlink/?linkid=842218).
  
After you have connected, use the following syntax to remove an individual user account:
  
```
Remove-AzureADUser -ObjectID <Account>
```

This example removes the user account fabricec@litwareinc.com.
  
```
Remove-AzureADUser -ObjectID fabricec@litwareinc.com
```

> [!NOTE]
> The **-ObjectID** parameter in the **Remove-AzureAD** cmdlet accepts either the account name, also known as the User Principal Name, or the account's object ID.
  
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

To remove an account based on the user's name, use the following commands:
  
```
$userName="<User name>"
Remove-AzureADUser -ObjectID (Get-AzureADUser | where {$_.DisplayName -eq $userName}).UserPrincipalName

```

## See also
<a name="SeeAlso"> </a>

See the following additional topics about managing users with Office 365 PowerShell:
  
- [Create user accounts with Office 365 PowerShell](create-user-accounts-with-office-365-powershell.md)
    
- [Block user accounts with Office 365 PowerShell](block-user-accounts-with-office-365-powershell.md)
    
- [Assign licenses to user accounts with Office 365 PowerShell](assign-licenses-to-user-accounts-with-office-365-powershell.md)
    
- [Remove licenses from user accounts with Office 365 PowerShell](remove-licenses-from-user-accounts-with-office-365-powershell.md)
    
For more information about the cmdlets that are used in these procedures, see the following topics:
  
- [Get-MsolUser](https://go.microsoft.com/fwlink/p/?LinkId=691543)
    
- [Remove-MsolUser](https://go.microsoft.com/fwlink/p/?LinkId=691636)
    
- [Restore-MsolUser](https://go.microsoft.com/fwlink/p/?LinkId=691637)
    
- [New-​Azure​AD​User](https://docs.microsoft.com/powershell/module/azuread/new-azureaduser?view=azureadps-2.0)
    

