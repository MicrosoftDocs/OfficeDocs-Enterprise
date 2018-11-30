---
title: "View licensed and unlicensed users with Office 365 PowerShell"
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
- O365ITProTrain
- Ent_Office_Other
- PowerShell
ms.assetid: e4ee53ed-ed36-4993-89f4-5bec11031435
description: "Explains how to use Office 365 PowerShell to view licensed and unlicensed user accounts."
---

# View licensed and unlicensed users with Office 365 PowerShell

**Summary:** Explains how to use Office 365 PowerShell to view licensed and unlicensed user accounts.
  
User accounts in your Office 365 organization may have some, all, or none of the available licenses assigned to them from the licensing plans that are available in your organization. You can use Office 365 PowerShell to quickly find the licensed and unlicensed users in your organization.
  
## Before you begin

- The procedures in this topic require you to connect to Office 365 PowerShell. For instructions, see [Connect to Office 365 PowerShell](connect-to-office-365-powershell.md).
    
- If you use the **Get-MsolUser** cmdlet without using the _-All_ parameter, only the first 500 accounts are returned.
    
## Viewing licensed and unlicensed users

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

For more information about the cmdlets that are used in these procedures, see the following topics:
  
- [Get-MsolUser](https://go.microsoft.com/fwlink/p/?LinkId=691547)
    
- [Where-Object](https://go.microsoft.com/fwlink/p/?LinkId=113423)
    

