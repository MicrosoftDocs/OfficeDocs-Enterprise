---
title: "View licensed and unlicensed users with Office 365 PowerShell"
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
- O365ITProTrain
- Ent_Office_Other
- PowerShell
ms.assetid: e4ee53ed-ed36-4993-89f4-5bec11031435
description: "Explains how to use Office 365 PowerShell to view licensed and unlicensed user accounts."
---

# View licensed and unlicensed users with Office 365 PowerShell

**Summary:** Explains how to use Office 365 PowerShell to view licensed and unlicensed user accounts.
  
User accounts in your Office 365 organization may have some, all, or none of the available licenses assigned to them from the licensing plans that are available in your organization. You can use Office 365 PowerShell to quickly find the licensed and unlicensed users in your organization.


## Use the Azure Active Directory PowerShell for Graph module

First, [connect to your Office 365 tenant](connect-to-office-365-powershell.md#connect-with-the-azure-active-directory-powershell-for-graph-module).
 
To view the list of all user accounts in your organization that have NOT been assigned any of your licensing plans (unlicensed users), run the following command:
  
```
Get-AzureAdUser | ForEach{ $licensed=$False ; For ($i=0; $i -le ($_.AssignedLicenses | Measure).Count ; $i++) { If( [string]::IsNullOrEmpty(  $_.AssignedLicenses[$i].disabledplans ) -ne $True) { $licensed=$true } } ; If( $licensed -eq $false) { Write-Host $_.UserPrincipalName} }
```

To view the list of all user accounts in your organization that have been assigned any of your licensing plans (licensed users), run the following command:
  
```
Get-AzureAdUser | ForEach { $licensed=$False ; For ($i=0; $i -le ($_.AssignedLicenses | Measure).Count ; $i++) { If( [string]::IsNullOrEmpty(  $_.AssignedLicenses[$i].disabledplans ) -ne $True) { $licensed=$true } } ; If( $licensed -eq $true) { Write-Host $_.UserPrincipalName} }
```

## Use the Microsoft Azure Active Directory Module for Windows PowerShell

First, [connect to your Office 365 tenant](connect-to-office-365-powershell.md#connect-with-the-microsoft-azure-active-directory-module-for-windows-powershell).

To view the list of all user accounts and their licensing status in your organization, run the following command in Office 365 PowerShell:
  
```
Get-MsolUser -All
```

To view the list of all unlicensed user accounts in your organization, run the following command:
  
```
Get-MsolUser -All -UnlicensedUsersOnly
```

To view the list of all licensed user accounts in your organization, run the following command:
  
```
Get-MsolUser -All | where {$_.isLicensed -eq $true}
```

## See also

[Manage user accounts and licenses with Office 365 PowerShell](manage-user-accounts-and-licenses-with-office-365-powershell.md)
  
[Manage Office 365 with Office 365 PowerShell](manage-office-365-with-office-365-powershell.md)
  
[Getting started with Office 365 PowerShell](getting-started-with-office-365-powershell.md)
