---
title: "Removing or disabling Hybrid Modern Authentication from Skype for Business and Exchange"
ms.author: tracyp
author: MSFTTracyP
manager: laurawi
ms.date: 11/3/2017
audience: ITPro
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
search.appverid:
- MET150
ms.assetid: 5a91b9e3-1508-475b-93e0-710fa5d5cd2d
ms.collection:
- M365-security-compliance
description: "If you've enabled Hybrid Modern Authentication (HMA) only to find it's unsuitable for your current environment, you can disable HMA. This article explains how."
---

# Removing or disabling Hybrid Modern Authentication from Skype for Business and Exchange

If you've enabled Hybrid Modern Authentication (HMA) only to find it's unsuitable for your current environment, you can disable HMA. This article explains how.
  
## Who is this article for?

If you've enabled Modern Authentication in Skype for Business Online or On-premises, and/or Exchange Online or On-premises and found you need to disable HMA, these steps are for you.

> [!IMPORTANT]
> See the '[Skype for Business topologies supported with Modern Authentication](https://technet.microsoft.com/en-us/library/mt803262.aspx)' article if you're in Skype for Business Online or On-premises, have a mixed-topology HMA, and need to look at supported topologies before you begin.
  
## How to disable Hybrid Modern Authentication (Exchange)

1. **Exchange On-premises**: Open the Exchange Management Shell and run the following commands: 

```powershell
Set-OrganizationConfig -OAuth2ClientProfileEnabled $false
Set-AuthServer -Identity evoSTS -IsDefaultAuthorizationEndpoint $false
```

2. **Exchange Online**: [Connect to Exchange Online](https://docs.microsoft.com/en-us/powershell/exchange/exchange-online/connect-to-exchange-online-powershell/connect-to-exchange-online-powershell) with Remote PowerShell. Run the following command to turn your  *OAuth2ClientProfileEnabled*  flag to 'false':

```powershell    
Set-OrganizationConfig -OAuth2ClientProfileEnabled:$false
```
    
## How to disable Hybrid Modern Authentication (Skype for Business)

1. **Skype for Business On-premises**: Run the following commands in Skype for Business Management Shell:

```powershell
Set-CsOAuthConfiguration -ClientAuthorizationOAuthServerIdentity ""
```

2. **Skype for Business Online**: [Connect to Skype for Business Online](https://docs.microsoft.com/en-us/office365/enterprise/powershell/manage-skype-for-business-online-with-office-365-powershell) with Remote PowerShell. Run the following command to disable Modern Authentication:

```powershell    
Set-CsOAuthConfiguration -ClientAdalAuthOverride Disallowed
```

[Link back to the Modern Authentication overview](hybrid-modern-auth-overview.md) . 
  

