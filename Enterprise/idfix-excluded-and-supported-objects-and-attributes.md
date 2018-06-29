---
title: "Reference IdFix excluded and supported objects and attributes"
ms.author: robmazz
author: robmazz
manager: laurawi
ms.date: 12/29/2016
ms.audience: Admin
ms.topic: reference
ms.service: o365-administration
localization_priority: Normal
ms.custom: Adm_O365
search.appverid: MOE150
ms.assetid: cc453ae5-fa9b-4836-b0ce-c7e824b1e36d
description: "Lists the attributes that are excluded and supported by IdFix tool."
---

# Reference: IdFix excluded and supported objects and attributes

There are two sets of rules maintained by IdFix; Multi-tenant and Dedicated/ITAR. At this time, the two rule sets exclude the same objects, attributes, and attribute values from its search. This may change in future releases.
  
## Multi-tenant and Dedicated error exclusions used by IdFix

This section lists the objects, attributes, and values that IdFix excludes from its search of the directory. The asterisk (\*) is a wildcard that can be substituted for other characters.
  
**Objects, attributes, and values excluded during an IdFix search**

|**Exclusion**|**Example**|
|:-----|:-----|
|Admini\*  <br/> |Administrator  <br/> |
|CAS_{\*  <br/> |CAS_{fe35fc98e69e4d08}  <br/> |
|DiscoverySearchMailbox\*  <br/> |DiscoverySearchMailbox  <br/> |
|FederatedEmail\*  <br/> |FederatedEmail. *GUID*  <br/> |
|Guest\*  <br/> ||
|HTTPConnector\*  <br/> |HTTPConnector  <br/> |
|krbtgt\*  <br/> |ms-DS-KrbTgt-Link  <br/> |
|iusr_\*  <br/> |iusr_ *machinename*  <br/> |
|iwam\*  <br/> |IWAM_ *machinename*  <br/> |
|msol\*  <br/> |MSOL_AD_SYNC  <br/> |
|support_\*  <br/> ||
|SystemMailbox\*  <br/> |Systemmailbox{ *GUID*  }  <br/> |
|WWIOadmini\*  <br/> ||
|\*$  <br/> ||
|distinguishedName contains "\0ACNF:"  <br/> |"\0ACNF: *GUID*  "  <br/> |
|Object contains the IsCriticalSystemObject attribute  <br/> |See [Attribute isCriticalSystemObject](https://go.microsoft.com/fwlink/p/?LinkId=401169).  <br/> |
   
## Multi-Tenant and Dedicated objects and attributes checked by IdFix

The attributes that are checked for errors by IdFix are described in the section "Directory object and attribute preparation" in [Prepare directory attributes for synchronization with Office 365 by using the IdFix tool](prepare-directory-attributes-for-synch-with-idfix.md).
  

