---
title: "Remove licenses from user accounts with Office 365 PowerShell"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 11/29/2018
ms.audience: Admin
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: 
- PowerShell
- Ent_Office_Other
- LIL_Placement
- O365ITProTrain
ms.assetid: e7e4dc5e-e299-482c-9414-c265e145134f

description: "Explains how to use Office 365 PowerShell to remove Office 365 licenses that were previously assigned to users."
---

# Remove licenses from user accounts with Office 365 PowerShell

**Summary:** Explains how to use Office 365 PowerShell to remove Office 365 licenses that were previously assigned to users.
  
## Before you begin

- The procedures in this topic require you to connect to Office 365 PowerShell. For instructions, see [Connect to Office 365 PowerShell](connect-to-office-365-powershell.md).
    
- To view the licensing plan (**AccountSkuID** ) information in your organization, see the following topics:
    
  - [View licenses and services with Office 365 PowerShell](view-licenses-and-services-with-office-365-powershell.md)
    
  - [View account license and service details with Office 365 PowerShell](view-account-license-and-service-details-with-office-365-powershell.md)
    
- If you use the **Get-MsolUser** cmdlet without using the _-All_ parameter, only the first 500 accounts are returned.
    
## Removing licenses from user accounts

To remove licenses from an existing user account, use the following syntax:
  
```
Set-MsolUserLicense -UserPrincipalName <Account> -RemoveLicenses "<AccountSkuId1>", "<AccountSkuId2>"...
```

This example removes the  `litwareinc:ENTERPRISEPACK` (Office 365 Enterprise E3) license from the user account BelindaN@litwareinc.com.
  
```
Set-MsolUserLicense -UserPrincipalName belindan@litwareinc.com -RemoveLicenses "litwareinc:ENTERPRISEPACK"
```

To remove licenses from a group of existing licensed users, use either of the following methods:
  
- **Filter the accounts based on an existing account attribute** To do this, use the following syntax:
    
```
$x = Get-MsolUser -All <FilterableAttributes> | where {$_.isLicensed -eq $true}
$x | foreach {Set-MsolUserLicense -UserPrincipalName $_.UserPrincipalName -RemoveLicenses "<AccountSkuId1>", "<AccountSkuId2>"...}
```

This example removes the  `litwareinc:ENTERPRISEPACK` (Office 365 Enterprise E3) licenses from all accounts for users in the Sales department in the United States.
    
```
$USSales = Get-MsolUser -All -Department "Sales" -UsageLocation "US" | where {$_.isLicensed -eq $true}
$USSales | foreach {Set-MsolUserLicense -UserPrincipalName $_.UserPrincipalName -RemoveLicenses "litwareinc:ENTERPRISEPACK"}
```

- **Use a list of specific accounts** To do this, perform the following steps:
    
1. Create and save a text file that contains one account on each line like this:
    
  ```
akol@contoso.com
tjohnston@contoso.com
kakers@contoso.com
  ```

2. Use the following syntax:
    
  ```
  Get-Content "<FileNameAndPath>" | Set-MsolUserLicense -UserPrincipalName $_.UserPrincipalName -RemoveLicenses "<AccountSkuId1>", "<AccountSkuId2>"...
  ```

This example removes the  `litwareinc:ENTERPRISEPACK` (Office 365 Enterprise E3) license from the user accounts defined in the text file C:\My Documents\Accounts.txt.
    
  ```
  Get-Content "C:\My Documents\Accounts.txt" | Set-MsolUserLicense -UserPrincipalName $_.UserPrincipalName -RemoveLicenses "litwareinc:ENTERPRISEPACK"
  ```

To remove licenses from all existing user accounts, use the following syntax:
  
```
$x = Get-MsolUser -All  | where {$_.isLicensed -eq $true}
$x | foreach {Set-MsolUserLicense -UserPrincipalName $_.UserPrincipalName -RemoveLicenses "<AccountSkuId1>", "<AccountSkuId2>"...}
```

This example removes the  `litwareinc:ENTERPRISEPACK` (Office 365 Enterprise E3) license from all existing licensed user accounts.
  
```
$x = Get-MsolUser -All  | where {$_.isLicensed -eq $true}
$x | foreach {Set-MsolUserLicense -UserPrincipalName $_.UserPrincipalName -RemoveLicenses "litwareinc:ENTERPRISEPACK"}
```

Another way to free up a license is by deleting the user account. For more information, see [Delete and restore user accounts with Office 365 PowerShell](delete-and-restore-user-accounts-with-office-365-powershell.md).
  
## See also

See the following additional topics about managing users with Office 365 PowerShell:
  
- [Create user accounts with Office 365 PowerShell](create-user-accounts-with-office-365-powershell.md)
    
- [Delete and restore user accounts with Office 365 PowerShell](delete-and-restore-user-accounts-with-office-365-powershell.md)
    
- [Block user accounts with Office 365 PowerShell](block-user-accounts-with-office-365-powershell.md)
    
- [Assign licenses to user accounts with Office 365 PowerShell](assign-licenses-to-user-accounts-with-office-365-powershell.md)
    
For more information about the cmdlets that are used in these procedures, see the following topics:
  
- [Get-Content](https://go.microsoft.com/fwlink/p/?LinkId=289917)
    
- [Get-MsolUser](https://go.microsoft.com/fwlink/p/?LinkId=691543)
    
- [Set-MsolUserLicense](https://go.microsoft.com/fwlink/p/?LinkId=691548)
    
- [ForEach-Object](https://go.microsoft.com/fwlink/p/?LinkId=113300)
    
- [Where-Object](https://go.microsoft.com/fwlink/p/?LinkId=113423)
    
## New to Office 365?

[!INCLUDE [LinkedIn Learning Info](../common/office/linkedin-learning-info.md)]
   

