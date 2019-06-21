---
title: "Designing networking for Microsoft SaaS"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 11/28/2018
audience: ITPro
ms.topic: conceptual
ms.service: o365-solutions
localization_priority: Normal
search.appverid:
- MET150
ms.collection: Ent_O365
ms.custom: Ent_Architecture
ms.assetid: 4194020a-3847-4259-9f2d-5c556a4510f9
description: "Summary: Understand how to optimize your network for access to Microsoft's SaaS services, including Office 365, Microsoft Intune, and Dynamics 365."
---

# Designing networking for Microsoft SaaS

 **Summary:** Understand how to optimize your network for access to Microsoft's SaaS services, including Office 365, Microsoft Intune, and Dynamics 365.
  
Optimizing your network for Microsoft SaaS services requires the configuration of internal and edge devices to route the different categories of traffic to Microsoft SaaS services.
  
## Steps to prepare your network for Microsoft SaaS services

Follow these steps to optimize your network for Microsoft SaaS services:
  
1. Go through the **Steps to prepare your network for Microsoft cloud services** section in [Common elements of Microsoft cloud connectivity](common-elements-of-microsoft-cloud-connectivity.md).
    
2. Add an Internet connection to each of your offices.
    
3. Ensure that the ISPs for all Internet connections use a DNS server with a local IP address.
    
4. Examine your network hairpins, intermediate destinations such as cloud-based security services, and eliminate them if possible.
    
5. Configure your edge devices to bypass processing for the Optimize and Allow categories of Microsoft SaaS traffic.

## Optimizing traffic to Microsoft’s SaaS services    

There are three categories of Microsoft SaaS traffic:

- Optimize

  Required for connectivity to every Microsoft SaaS service and represent over 75% of Microsoft SaaS bandwidth, connections, and volume of data.

- Allow

  Required for connectivity to specific Microsoft SaaS services and features but are not as sensitive to network performance and latency as those in the Optimize category.

- Default

  Represent Microsoft SaaS services and dependencies that do not require any optimization. You can treat Default category traffic like normal Internet traffic.


**Figure 1: Recommended configuration for Microsoft SaaS traffic for all offices**

![Figure 1: Recommended configuration for Microsoft SaaS traffic for all offices](media/Network-Poster/SaaS1.png)

Figure 1 shows the recommended configuration of all offices, including branch offices and regional or central ones, in which:

- **Default** category and general Internet traffic is routed to offices that have proxy servers and other edge devices to provide protection against Internet-based security risks.
- **Optimize** and **Allow** category traffic is forwarded directly to the edge of the Microsoft network front end nearest to the office containing the connecting user, bypassing proxy servers and other edge devices.

Software-defined wide area network (SD-WAN) devices in branch offices separate traffic so that: 

- **Default** category and general Internet traffic goes to a central or regional office over the WAN backbone. 
- **Optimize** and **Allow** category traffic goes to the ISP providing the local Internet connection.
  
For more information, see:
  
- [Network connectivity principles](https://aka.ms/expressrouteoffice365)

- [Network and migration planning for Office 365](https://aka.ms/tune)
    
## Next step

[Designing networking for Microsoft Azure PaaS](designing-networking-for-microsoft-azure-paas.md)
    
## See also

[Microsoft Cloud Networking for Enterprise Architects](microsoft-cloud-networking-for-enterprise-architects.md)
  
[Microsoft Cloud IT architecture resources](microsoft-cloud-it-architecture-resources.md)

