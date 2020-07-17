---
title: "Manage Microsoft Teams with PowerShell for Microsoft 365"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 05/12/2020
audience: ITPro
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
f1.keywords:
- NOCSH
ms.custom: 
ms.assetid: ff93a341-6f0f-4f06-9690-726052e1be64
description: "Summary: Use PowerShell for Microsoft 365 to manage your Microsoft Teams."
---

# Manage Microsoft Teams with PowerShell

You can manage Microsoft Teams with PowerShell.
  
First, install the [Microsoft Teams module](https://www.powershellgallery.com/packages/MicrosoftTeams/).
    
## Sign in with a user name and password

For the Office 365 Worldwide (+GCC) cloud:

```powershell
$cred=Get-Credential
Connect-MicrosoftTeams -Credential $cred
```

For the Office 365 U.S. Government DoD cloud: 

```powershell
$cred=Get-Credential
Connect-MicrosoftTeams -Credential $cred -TeamsEnvironmentName TeamsDOD
```

For the Office 365 U.S. Government GCC High cloud:

```powershell
$cred=Get-Credential
Connect-MicrosoftTeams -Credential $cred -TeamsEnvironmentName TeamsGCCH
```

## Sign in with multi-factor authentication (MFA)

For the Office 365 Worldwide (+GCC) cloud:

```powershell
Connect-MicrosoftTeams
```

For the Office 365 U.S. Government DoD cloud: 

```powershell
Connect-MicrosoftTeams -TeamsEnvironmentName TeamsDOD
```

For the Office 365 U.S. Government GCC High cloud:

```powershell
Connect-MicrosoftTeams -TeamsEnvironmentName TeamsGCCH
```

## Disconnect from Microsoft Teams

Use this command:

```powershell
Disconnect-MicrosoftTeams
```


## See also

[Teams PowerShell Overview](https://docs.microsoft.com/microsoftteams/teams-powershell-overview)
  
[Manage Microsoft 365 with PowerShell](manage-office-365-with-office-365-powershell.md)
  
[Getting started with PowerShell for Microsoft 365](getting-started-with-office-365-powershell.md)

