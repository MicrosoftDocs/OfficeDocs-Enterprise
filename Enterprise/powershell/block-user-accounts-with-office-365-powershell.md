---
title: "Block user accounts with Office 365 PowerShell"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 01/03/2019
audience: Admin
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
  
Blocking access to an Office 365 account prevents anyone from using the account to sign in and access the services and data in your Office 365 organization. You can use Office 365 PowerShell to block access to individual and multiple user accounts.

## Use the Azure Active Directory PowerShell for Graph module

First, [connect to your Office 365 tenant](connect-to-office-365-powershell.md#connect-with-the-azure-active-directory-powershell-for-graph-module).
 
### Block access to individual user accounts

Use the following syntax to block an individual user account:
  
```
Set-​AzureADUser -ObjectID <sign-in name of the user account> -AccountEnabled $false
```

> [!NOTE]
> The -ObjectID parameter in the Set-AzureAD cmdlet accepts either the account sign-in name, also known as the User Principal Name, or the account's object ID. 
  
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
$userName="<display name>"
Write-Host (Get-AzureADUser | where {$_.DisplayName -eq $userName}).UserPrincipalName

```

This example displays the user account UPN for the user named Caleb Sills.
  
```
$userName="Caleb Sills"
Write-Host (Get-AzureADUser | where {$_.DisplayName -eq $userName}).UserPrincipalName
```

To block an account based on the user's display name, use the following commands:
  
```
$userName="<display name>"
Set-AzureADUser -ObjectID (Get-AzureADUser | where {$_.DisplayName -eq $userName}).UserPrincipalName -AccountEnabled $false

```

At any time, you can check the blocked status of a user account with the following command:
  
```
Get-AzureADUser -UserPrincipalName <UPN of user account> | Select DisplayName,AccountEnabled
```

### Block access to multiple user accounts

To block access to multiple user accounts, create a text file that contains one account sign-in name on each line like this:
    
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

## Use the Microsoft Azure Active Directory Module for Windows PowerShell

First, [connect to your Office 365 tenant](connect-to-office-365-powershell.md#connect-with-the-microsoft-azure-active-directory-module-for-windows-powershell).

    
### Block access to individual user accounts

Use the following syntax to block access to an individual user account:
  
```
Set-MsolUser -UserPrincipalName <sign-in name of user account>  -BlockCredential $true
```

This example blocks access to the user account fabricec@litwareinc.com.
  
```
Set-MsolUser -UserPrincipalName fabricec@litwareinc.com -BlockCredential $true
```

To unblock the user account, run the following command:
  
```
Set-MsolUser -UserPrincipalName <sign-in name of user account>  -BlockCredential $false
```

At any time, you can check the blocked status of a user account with the following command:
  
```
Get-MsolUser -UserPrincipalName <sign-in name of user account> | Select DisplayName,BlockCredential
```

### Block access to multiple user accounts

First, create a text file that contains one account on each line like this:
    
  ```
akol@contoso.com
tjohnston@contoso.com
kakers@contoso.com
  ```
In the following commands, the example text file is C:\My Documents\Accounts.txt. Replace this with the path and file name of your text file.
    
To block access to the accounts listed in the text file, run the following command:
    
  ```
  Get-Content "C:\My Documents\Accounts.txt" | ForEach { Set-MsolUser -UserPrincipalName $_ -BlockCredential $true }
  ```
To unblock the accounts listed in the text file, run the following command:
    
  ```
  Get-Content "C:\My Documents\Accounts.txt" | ForEach { Set-MsolUser -UserPrincipalName $_ -BlockCredential $false }
  ```

## See also

[Manage user accounts and licenses with Office 365 PowerShell](manage-user-accounts-and-licenses-with-office-365-powershell.md)
  
[Manage Office 365 with Office 365 PowerShell](manage-office-365-with-office-365-powershell.md)
  
[Getting started with Office 365 PowerShell](getting-started-with-office-365-powershell.md)
