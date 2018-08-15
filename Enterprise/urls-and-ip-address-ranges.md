---
title: "Office 365 URLs and IP address ranges"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 8/13/2018
ms.audience: Admin
ms.topic: conceptual
ms.service: o365-administration
localization_priority: Priority
ms.collection:
- Ent_O365
- Strat_O365_Enterprise
ms.custom: Adm_O365
search.appverid:
- MET150
- MOE150
- MED150
- MBS150
- MOM160
- BCS160
ms.assetid: 8548a211-3fe7-47cb-abb1-355ea5aa88a2
description: "Summary: Office 365 requires connectivity to the Internet. The endpoints below should be reachable for customers using Office 365 plans, including Government Community Cloud (GCC)."
hideEdit: true
---

# Office 365 URLs and IP address ranges

 **Summary:** Office 365 requires connectivity to the Internet. The endpoints below should be reachable for customers using Office 365 plans, including Government Community Cloud (GCC).
  
> [!NOTE]
> Microsoft is developing a REST-based web service for the IP address and FQDN entries on this page. This new service will help you configure and update network perimeter devices such as firewalls and proxy servers. You can download the list of endpoints, the current version of the list, or specific changes. This service will eventually replace the XML document, RSS feed, and the IP address and FQDN entries on this page. To try out this new service, go to [Web service](managing-office-365-endpoints.md#webservice). 
  
*Office 365 Worldwide (+GCC)* | [Office 365 operated by 21 Vianet](urls-and-ip-address-ranges-21vianet.md) | [Office 365 Germany](office-365-germany-endpoints.md) | [Office 365 U.S. Government DoD](office-365-u-s-government-dod-endpoints.md)  | [Office 365 U.S. Government GCC High](office-365-u-s-government-gcc-high-endpoints.md) |
  
||||
|:-----|:-----|:-----|
|**Last updated:** 8/1/2018 - ![RSS](media/5dc6bb29-25db-4f44-9580-77c735492c4b.png) [Change Log subscription](https://go.microsoft.com/fwlink/p/?linkid=236301) <br/> |**Download:** all required and optional destinations in one [XML formatted](https://go.microsoft.com/fwlink/?LinkId=533185) list.  <br/> | **Use:** our proxy [PAC files](managing-office-365-endpoints.md#pacfiles) <br/> |
   
 Start with [Managing Office 365 endpoints](managing-office-365-endpoints.md) to understand our recommendations. Except for emergency changes, endpoints are updated at the end of each month. 
  
Please read each service introduction for more info. Wildcards represent all levels under the root domain and we use N/A when information is not available. Destinations are listed with  *FQDN/domain only*,  *CIDR prefixes only*, or a pairing of FQDNs that represent specific CIDR prefixes along with port information. Use our [PAC files](managing-office-365-endpoints.md#pacfiles) to implement the principles below. 
  
- Bypass your proxy for all *FQDN/CIDR* paired and *CIDR prefix only* destinations. 
   
- Bypass your proxy or remove inspection, authentication, and reputation lookup services for any *FQDNs marked required without a CIDR prefix*. 
   
- For any remaining optional FQDNs, wildcards, DNS, CDN, CRL, or other unpublished destinations requested by Office 365 services, ensure clients can access them over the Internet.
    
[!INCLUDE [Office 365 worldwide endpoints](./includes/office-365-worldwide-endpoints.md)]

## Related Topics

[Managing Office 365 endpoints](managing-office-365-endpoints.md)
  
[Troubleshooting Office 365 connectivity](https://support.office.com/article/d4088321-1c89-4b96-9c99-54c75cae2e6d.aspx)
  
[Client connectivity](https://support.office.com/article/client-connectivity-4232abcf-4ae5-43aa-bfa1-9a078a99c78b)
  
[Content delivery networks](https://support.office.com/article/content-delivery-networks-0140f704-6614-49bb-aa6c-89b75dcd7f1f)
  
[Microsoft Azure Datacenter IP Ranges](https://www.microsoft.com/download/details.aspx?id=41653)
  
[Microsoft Public IP Space](https://www.microsoft.com/download/details.aspx?id=53602)
  

