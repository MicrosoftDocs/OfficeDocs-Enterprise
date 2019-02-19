---
title: "IdFix excluded and supported objects and attributes"
ms.author: robmazz
author: robmazz
manager: laurawi
ms.date: 8/21/2016
ms.audience: Admin
ms.topic: reference
ms.service: o365-administration
localization_priority: Normal
search.appverid:
- MET150
- MOE150
ms.custom: Adm_O365
ms.collection:
- Ent_O365
- M365-identity-device-management
ms.assetid: cc453ae5-fa9b-4836-b0ce-c7e824b1e36d
description: "Lists the attributes that are excluded and supported by IdFix tool."
---

# IdFix excluded and supported objects and attributes
There are two sets of rules maintained by IdFix; Multi-tenant and Dedicated/ITAR. At this time, the two rule sets exclude the same objects, attributes, and attribute values from its search. This may change in future releases.
  
## Multi-tenant and Dedicated error exclusions used by IdFix
This section lists the objects, attributes, and values that IdFix excludes from its search of the directory. The asterisk (\*) is a wildcard that can be substituted for other characters.
  
### Objects, attributes, and values excluded during an IdFix search

|**Exclusion**|**Example**|
|:-----|:-----|
|Admini\* |Administrator |
|CAS_{\*  |CAS_{fe35fc98e69e4d08} |
|DiscoverySearchMailbox\*  |DiscoverySearchMailbox  |
|FederatedEmail\* |FederatedEmail. *GUID* |
|Guest\* ||
|HTTPConnector\*  |HTTPConnector |
|krbtgt\* |ms-DS-KrbTgt-Link |
|iusr_\* |iusr_ *machinename* |
|iwam\*  |IWAM_ *machinename* |
|msol\* |MSOL_AD_SYNC |
|support_\* ||
|SystemMailbox\* |Systemmailbox{ *GUID*  }|
|WWIOadmini\*  ||
|\*$ ||
|distinguishedName contains "\0ACNF:"|"\0ACNF: *GUID*  " |
|Object contains the IsCriticalSystemObject attribute |See [Attribute isCriticalSystemObject](https://go.microsoft.com/fwlink/p/?LinkId=401169). |
   
## Multi-Tenant and Dedicated objects and attributes checked by IdFix
The attributes that are checked for errors by IdFix are described in the section "Directory object and attribute preparation" in [Prepare directory attributes for synchronization with Office 365 by using the IdFix tool](prepare-directory-attributes-for-synch-with-idfix.md).
  

