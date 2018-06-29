---
title: "IPv6 support in Office 365 services"
ms.author: kvice
author: kelleyvice-msft
manager: laurawi
ms.date: 12/12/2017
ms.audience: ITPro
ms.topic: conceptual
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Adm_O365
search.appverid:
- MOE150
- BCS160
ms.assetid: c08786fb-298e-437c-8222-dab7625fc815
description: "Summary: Describes IPv6 support in Microsoft Office 365 components and in Office 365 government offerings."
---

# IPv6 support in Office 365 services

 **Summary**: Describes IPv6 support in Microsoft Office 365 components and in Office 365 government offerings.
  
Office 365 supports both IPv6 and IPv4; however, not all Office 365 features are fully enabled with IPv6. This means that you must use both IPv4 and IPv6 to connect to Office 365. If you are filtering your outbound traffic to Office 365, the full list of IPv6 addresses that are supported by Office 365 can be found in the article [Office 365 URLs and IP address ranges](https://go.microsoft.com/fwlink/?LinkId=293744). After your network is configured and the appropriate IPv6 addresses are allowed, you can download the [Office 365 IPv6 test plan](https://go.microsoft.com/fwlink/?LinkId=293447) from the Microsoft Download Center. 
  
||
|:-----|
||
| This article is part of [Network planning and performance tuning for Office 365](https://aka.ms/tune)||
   
## IPv6 support in Office 365 subscription service

### Exchange Online and IPv6

If the program that you use to connect to Exchange Online supports IPv6, it will use IPv6 by default on both wired and wireless networks. If you want to control communications to Exchange Online, use the IP address ranges in [Office 365 URLs and IP address ranges](https://go.microsoft.com/fwlink/?LinkId=293744).
  
### SharePoint Online and IPv6

 **Office 365 Government G1/G3/G4/K1** If the program that you use to connect to SharePoint Online supports IPv6, it will attempt to use IPv6 by default. 
  
 **Public multi-tenant cloud** Microsoft enables SharePoint Online IPv6 at your request. You need to provide the CIDR notated IP addresses for your organization's DNS infrastructure. Keep in mind that this DNS infrastructure can't be shared by other organizations for IPv6 to be enabled for your tenant. After IPv6 is enabled, if the program that you use to connect to SharePoint Online supports IPv6, it uses IPv6 by default. 
  
If the program that you use to connect to SharePoint Online supports IPv6, it will use IPv6 by default on both wired and wireless networks. If you want to control communications to SharePoint Online, use the IP address ranges in [Office 365 URLs and IP address ranges](https://go.microsoft.com/fwlink/?LinkId=293744).
  
 **Office 365 Government G1/G3/G4/K1** If the program that you use to connect to SharePoint Online supports IPv6, it will attempt to use IPv6 by default. 
  
### Skype for Business and IPv6

Microsoft will enable IPv6 for Skype for Business at your request in the public multi-tenant cloud and in Office 365 Government G1/G3/G4/K1 subscriptions. After it's enabled, if the program that you use to connect to Skype for Business supports IPv6, it will use IPv6 by default. If you want to control communications to Skype for Business, use the IP address ranges in [Office 365 URLs and IP address ranges](https://go.microsoft.com/fwlink/?LinkId=293744).
  
Please be aware IPv6 is not available in all regions and Microsoft may not be able to activate it for your Tenant at this time.
  
### Exchange Online Protection and IPv6

Exchange Online Protection (EOP) supports IPv6 if the transmission occurs over Transport Layer Security Protocol. For the EOP range, use [Office 365 URLs and IP address ranges](https://go.microsoft.com/fwlink/?LinkId=293744).
  
### IPv6 support for Office 365 government offerings

Office 365 IPv6 support for government offerings conforms to the Office of Management and Budget (OMB) Memorandum for Chief Information Officers of Executive Departments and Agencies, as well as the Federal Government Adoption of Internet Protocol Version 6 (IPv6) memorandum. [Microsoft Office 365 for Government](https://go.microsoft.com/fwlink/p/?LinkId=325414) is a multi-tenant service that stores US government data in a segregated community cloud. Like other Office 365 offerings, it provides productivity and collaboration services, including Exchange Online, Skype for Business, SharePoint Online, and Office Professional Plus. The Microsoft Office 365 government offerings apply only for 2013 and later. For more information about the Office 365 government offerings, see [Announcing Office 365 for Government: A US Government Community Cloud](https://go.microsoft.com/fwlink/p/?LinkId=325414). International Traffic in Arms Regulations (ITAR) is a set of US government regulations that control the export and import of defense-related articles and services on the [United States Munitions List (USML)](https://go.microsoft.com/fwlink/p/?LinkId=325415). Microsoft Office 365 for Enterprises provides dedicated hosting services for Microsoft productivity solutions that support the security, privacy, and regulatory compliance requirements for US federal agencies requiring Federal Information Security Management (FISMA) certification and commercial entities subject to ITAR. 
  
## Things to consider when using IPv6 and Office 365

We recommend that you do not disable IPv6. For more information, see [IPv6 for Microsoft Windows: Frequently Asked Questions](https://go.microsoft.com/fwlink/p/?LinkId=325418). To determine what IP versions are being used on your network, consider the following:
  
- If the display of the IPConfig command at the command prompt contains rows named "IPv6 Address" or "Temporary IPv6 Address," you have IPv6 in your environment.
    
- If all the IPv6 addresses begin with "fe80" and correspond to rows named "Link-Local IPv6 Address," you don't have IPv6 in your environment. 
    
These considerations might apply to your network:
  
- The public subscription service does not support purchase by credit card over IPv6. This does not apply to the Government Community Cloud (GCC) because governments have Enterprise Agreement (EA) licensing.
    
- IPv6 does not support some Rights Management Services (RMS) scenarios.
    
- IPv6 does not support BlackBerry® Enterprise Server (BES) because BlackBerry doesn't support IPv6.
    
Here's a short link you can use to come back: [https://aka.ms/o365ip6](https://aka.ms/o365ip6)
  
## See also

[Microsoft Technology Position Paper](https://go.microsoft.com/fwlink/p/?linkid=525743)
  
[TCP/IP v4 and v6](https://go.microsoft.com/fwlink/p/?LinkID=211898)
  
[IPv6 Survival Guide](https://go.microsoft.com/fwlink/p/?LinkID=237480)

