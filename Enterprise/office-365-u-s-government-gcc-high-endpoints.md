---
title: "Office 365 U.S. Government GCC High endpoints"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 8/13/2018
ms.audience: ITPro
ms.topic: conceptual
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Adm_O365
search.appverid: MET150
ms.assetid: cbd2369c-fd96-464c-bf48-c99826b459ee
description: "If your organization uses Office 365 and restricts computers on your network from connecting to the Internet, below you'll find the endpoints (FQDNs, Ports, URLs, IPv4, and IPv6 address ranges) that you should include in your outbound allow lists to ensure your computers can successfully use Office 365."
hideEdit: true
---

# Office 365 U.S. Government GCC High endpoints

 *Applies To: Office 365 Admin*

**Summary:** Office 365 requires connectivity to the Internet. The endpoints below should be reachable for customers using Office 365 U.S. Government GCC High plans only.
  
> [!NOTE]
> Microsoft is developing a REST-based web service for the IP address and FQDN entries on this page. This new service will help you configure and update network perimeter devices such as firewalls and proxy servers. You can download the list of endpoints, the current version of the list, or specific changes. This service will eventually replace the XML document, RSS feed, and the IP address and FQDN entries on this page. To try out this new service, go to [Web service](managing-office-365-endpoints.md#webservice).
  
 **Office 365 endpoints:** [Worldwide (including GCC)](urls-and-ip-address-ranges.md) | [Office 365 operated by 21 Vianet](urls-and-ip-address-ranges-21vianet.md)  | [Office 365 Germany](office-365-germany-endpoints.md)  | [Office 365 U.S. Government DoD](office-365-u-s-government-dod-endpoints.md) | *Office 365 U.S. Government GCC High* |
  
|||
|:-----|:-----|
|**Last updated:** 7/2/2018 - ![RSS](media/5dc6bb29-25db-4f44-9580-77c735492c4b.png) [Change Log subscription](https://aka.ms/usendpointrss) <br/> |**Download:** the full list in [XML format](https://aka.ms/usdefenseendpoints) <br/> |
   
 Start with [Managing Office 365 endpoints](managing-office-365-endpoints.md) to understand our recommendations. Except for emergency changes, endpoints are updated at the end of each month. 
  
 **Important:** Destination endpoints may be listed as an IP addresses only, FQDN/URI only, or a combination of the two. Office 365 depends on internet based services such as Microsoft-owned cloud services with dynamic addressing, Domain Name System (DNS), Content Delivery Networks (CDN), Certificate Revocation Lists (CRL), and other third-party services where no IP addresses are available. Where IP or FQDN information is not available, we've marked them as **Not Available (N/A)** in the tables below. 

The endpoints listed as a *Yes* in the **ExpressRouteGov for Office 365** column are available both over the internet and over ExpressRoute for Government configured. If you plan to use Azure AD Connect, read the [special considerations section](https://docs.microsoft.com/azure/active-directory/connect/active-directory-AADconnect-instances#microsoft-azure-government-cloud) to ensure you have the appropriate Azure AD Connect configuration.

[!INCLUDE [Office 365 U.S. Government GCC High endpoints](./includes/office-365-u.s.-government-gcc-high-endpoints.md)]

Notes for this table:

- The Security and Compliance Center (SCC) provides support for Azure ExpressRoute for Office 365. The same applies for many features exposed through the SCC such as Reporting, Auditing, Advanced eDiscovery, Unified DLP, and Data Governance. Two specific features, PST Import and eDiscovery Export, currently do not support Azure ExpressRoute with only Office 365 route filters due to their dependency on Azure Blob Storage. To consume those features, you need separate connectivity to Azure Blob Storage using any supportable Azure connectivity options, which include Internet connectivity or Azure ExpressRoute with Azure Public route filters. You have to evaluate establishing such connectivity for both of those features. The Office 365 Information Protection team is aware of this limitation and is actively working to bring support for Azure ExpressRoute for Office 365 as limited to Office 365 route filters for both of those features.

- There are additional optional endpoints for Office 365 ProPlus that are not listed and are not required for users to launch Office 365 ProPlus applications and edit documents. Optional endpoints are hosted in Microsoft datacenters and do not process, transmit, or store customer data. We recommend that user connections to these endpoints be directed to the default Internet egress perimeter.

