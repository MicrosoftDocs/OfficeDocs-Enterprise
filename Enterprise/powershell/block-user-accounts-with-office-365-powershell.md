---
title: "Block user accounts with Office 365 PowerShell"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 01/10/2018
ms.audience: Admin
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: 
- Ent_Office_Other
- PowerShell
ms.assetid: 04e58c2a-400b-496a-acd4-8ec5d37236dc
description: "Explains how to use Office 365 PowerShell to block and unblock access to Office 365 accounts."
---

# Block user accounts with Office 365 PowerShell

**Summary:**  Explains how to use Office 365 PowerShell to block and unblock access to Office 365 accounts.
  
Blocking access to an Office 365 account prevents anyone from using the account to sign in and access the services and data in your Office 365 organization. When you block access to the account, the user receives the following error message when they attempt to sign in:
  
![Blocked Office 365 account.](images/o365_powershell_account_blocked.png)
  
You can use Office 365 PowerShell to block access to individual and multiple user accounts.
  
## Before you begin

- The procedures in this topic require you to connect to Office 365 PowerShell. For instructions, see [Connect to Office 365 PowerShell](connect-to-office-365-powershell.md).
    
- When you block a user account, it might take as long as 24 hours to take effect on all the user's devices and clients.
    
## Use Office 365 PowerShell to block access to individual user accounts

Use the following syntax to block access to an individual user account:
  
```
Set-MsolUser -UserPrincipalName <UPN of user account>  -BlockCredential $true
```

This example blocks access to the user account fabricec@litwareinc.com.
  
```
Set-MsolUser -UserPrincipalName fabricec@litwareinc.com -BlockCredential $true
```

To unblock the user account, run the following command:
  
```
Set-MsolUser -UserPrincipalName <UPN of user account>  -BlockCredential $false
```

At any time, you can check the blocked status of a user account with the following command:
  
```
Get-MolUser -UserPrincipalName <UPN of user account> | Select DisplayName,BlockCredential
```

## Use Office 365 PowerShell to block access to multiple user accounts

First, create a text file that contains one account on each line like this:
    
  ```
akol@contoso.com
tjohnston@contoso.com
kakers@contoso.com
  ```
In the following commands, the example text file is C:\My Documents\Accounts.txt. Replace this with the path and file name of your text file.
    
To block access to the accounts listed in the text file, run the following command:
    
  ```
  Get-Content Accounts.txt | ForEach { Set-MsolUser -UserPrincipalName $_ -BlockCredential $true }
  ```
To unblock the accounts listed in the text file, run the following command:
    
  ```
  Get-Content Accounts.txt | ForEach { Set-MsolUser -UserPrincipalName $_ -BlockCredential $false }
  ```

## Use the Azure Active Directory V2 PowerShell module to block access to user accounts

To use the **New-AzureADUser** cmdlet from the Azure Active Directory V2 PowerShell module, you must first connect to your subscription. For the instructions, see[Connect with the Azure Active Directory V2 PowerShell module](https://go.microsoft.com/fwlink/?linkid=842218).
  
After you have connected, use the following syntax to block an individual user account:
  
```
Set-​AzureADUser -ObjectID <UPN of user account> -AccountEnabled $false
```

> [!NOTE]
> The -ObjectID parameter in the Set-AzureAD cmdlet accepts either the account name, also known as the User Principal Name, or the account's object ID. 
  
This example blocks access to the user account fabricec@litwareinc.com.
  
```
Set-​AzureADUser -ObjectID fabricec@litwareinc.com -AccountEnabled $false
```

To unblock this user account, run the following command:
  
```
Set-​AzureADUser -ObjectID fabricec@litwareinc.com -AccountEnabled $true
```

To display the user account UPN based on the user's display name, use the following commands:
  
```
$userName="<user account display name>"
Write-Host (Get-AzureADUser | where {$_.DisplayName -eq $userName}).UserPrincipalName

```

This example displays the user account UPN for the user named Caleb Sills.
  
```
$userName="Caleb Sills"
Write-Host (Get-AzureADUser | where {$_.DisplayName -eq $userName}).UserPrincipalName
```

To block an account based on the user's name, use the following commands:
  
```
$userName="<user account display name>"
Set-AzureADUser -ObjectID (Get-AzureADUser | where {$_.DisplayName -eq $userName}).UserPrincipalName -AccountEnabled $false

```

At any time, you can check the blocked status of a user account with the following command:
  
```
Get-AzureADUser -UserPrincipalName <UPN of user account> | Select DisplayName,AccountEnabled
```

To block access to multiple user accounts, create a text file that contains one account name on each line like this:
    
  ```
akol@contoso.com
tjohnston@contoso.com
kakers@contoso.com
  ```

In the following commands, the example text file is C:\My Documents\Accounts.txt. Replace this with the path and file name of your text file.
    
To block access to the accounts listed in the text file, run the following command:
    
```
Get-Content "C:\My Documents\Accounts.txt" | ForEach { Set-​AzureADUSer -ObjectID $_ -AccountEnabled $false }
```

To unblock the accounts listed in the text file, run the following command:
    
```
Get-Content "C:\My Documents\Accounts.txt" | ForEach { Set-​AzureADUSer -ObjectID $_ -AccountEnabled $true }
```

## See also
<a name="SeeAlso"> </a>

See the following additional topics about managing users with Office 365 PowerShell:
  
- [Create user accounts with Office 365 PowerShell](create-user-accounts-with-office-365-powershell.md)
    
- [Delete and restore user accounts with Office 365 PowerShell](delete-and-restore-user-accounts-with-office-365-powershell.md)
    
- [Assign licenses to user accounts with Office 365 PowerShell](assign-licenses-to-user-accounts-with-office-365-powershell.md)
    
- [Remove licenses from user accounts with Office 365 PowerShell](remove-licenses-from-user-accounts-with-office-365-powershell.md)
    
For more information about the cmdlets that are used in these procedures, see the following topics:
  
- [Get-Content](https://go.microsoft.com/fwlink/p/?LinkId=113310)
    
- [Set-MsolUser](https://go.microsoft.com/fwlink/p/?LinkId=691644)
    
- [New-​Azure​AD​User](https://docs.microsoft.com/powershell/module/azuread/new-azureaduser?view=azureadps-2.0)
    

