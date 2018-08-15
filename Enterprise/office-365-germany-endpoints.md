---
title: "Office 365 Germany endpoints"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 8/13/2018
ms.audience: ITPro
ms.topic: conceptual
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Adm_O365_Setup
search.appverid: MOE150
ms.assetid: 8a113a50-0071-4155-bb8e-eba5a8dbd4c8
description: "If your organization uses Office 365 and restricts computers on your network from connecting to the Internet, below you'll find the endpoints (FQDNs, Ports, URLs, and IPv4 and IPv6 address ranges) that you should include in your outbound allow lists to ensure your computers can successfully use Office 365."
hideEdit: true
---

# Office 365 Germany endpoints

 *Applies To: Office 365 Admin*

**Summary:** Office 365 requires connectivity to the Internet. The endpoints below should be reachable for customers using **Office 365 Germany** plans only.
  
> [!NOTE]
> Microsoft is developing a REST-based web service for the IP address and FQDN entries on this page. This new service will help you configure and update network perimeter devices such as firewalls and proxy servers. You can download the list of endpoints, the current version of the list, or specific changes. This service will eventually replace the XML document, RSS feed, and the IP address and FQDN entries on this page. To try out this new service, go to [Web service](managing-office-365-endpoints.md#webservice). 
  
 **Office 365 endpoints:** [Worldwide (including GCC)](urls-and-ip-address-ranges.md)  | [Office 365 operated by 21 Vianet](urls-and-ip-address-ranges-21vianet.md)  | *Office 365 Germany* | [Office 365 U.S. Government DoD](office-365-u-s-government-dod-endpoints.md) | [Office 365 U.S. Government GCC High](office-365-u-s-government-gcc-high-endpoints.md)  |
  
|||
|:-----|:-----|
|**Last updated:** 7/2/2018 - ![RSS](media/5dc6bb29-25db-4f44-9580-77c735492c4b.png) [List of changes to the Office 365 Germany endpoints](office-365-germany-endpoints-change-log.md)||
   
Office 365 requires Internet connectivity from every computer connecting to the service. This article serves as a reference for the specific Microsoft and third-party endpoints computers need to be able to reach. Start with our [managing Office 365 endpoints guide](managing-office-365-endpoints.md) to understand how best to use the information here. Except for emergency changes, endpoints are updated at the end of each month. 
  
 **Important:** Destination endpoints may be listed as an IP addresses only, FQDN/URI only, or a combination of the two. Some endpoints are shared within Office 365 and some are shared with consumer services. Pay attention to the introduction for each service, specific guidance that applies only to that service will be included there. Office 365 depends on internet based services such as Microsoft-owned cloud services with dynamic addressing, Domain Name System (DNS), Content Delivery Networks (CDN), Certificate Revocation Lists (CRL), and other third-party services where no IP addresses are available. Where IP or FQDN information is not available, we've marked them as **Not Available (N/A)** in the tables below. 
  
Every Office 365 service depends on the required endpoints in the ***Microsoft 365 Common and Office Online*** section to function. The other endpoints are grouped to make selective service decisions. 
  
Changes for each Office 365 service are combined and published at the end of each month. Occasionally emergency changes will occur outside of the end of month publishing. Expect changes three business days prior to the last business day of the month. You can always refer to the [list of changes to the Office 365 Germany endpoints](office-365-germany-endpoints-change-log.md)
  

[!INCLUDE [Office 365 Germany endpoints](./includes/office-365-germany-endpoints.md)]

 

