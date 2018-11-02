---
title: "Set up your network for Office 365"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 11/01/2018
ms.audience: ITPro
ms.topic: hub-page
ms.service: o365-solutions
localization_priority: Priority
search.appverid:
- MET150
ms.collection: 
- Ent_O365
- Strat_O365_Enterprise
ms.custom:
- Ent_TLGs
ms.assetid: 
description: "Summary: See these articles to understand networking for Office 365."
---

# Set up your network for Office 365

**Summary:** See these articles to understand networking for Office 365.
  
An important part of your overall onboarding is to first ensure that your network and Internet connections are set up for optimized access to Office 365. Configuring your on-premises network to access a globally distributed Software-as-a-Service (SaaS) application is different from a traditional network that is optimized for traffic to on-premises datacenters. 

Use these articles to understand the key differences and to modify your network, edge devices, and client computers to get the best performance for your users.

## How Office 365 networking works

See these articles for an overview of connectivity for Office 365:

- [Office 365 networking connectivity overview](office-365-networking-overview.md)
- [Office 365 Network Connectivity Principles](office-365-network-connectivity-principles.md)
- [Network connectivity to Office 365](network-connectivity.md)

For advice on enhancing performance, see [Network planning and performance tuning for Office 365](network-planning-and-performance.md).

## How to support Office 365 networking as a network equipment vendor

If you are a network equipment vendor, join the [Office 365 Networking Partner Program](office-365-networking-partner-program.md) to enroll in a program to build Office 365 network connectivity principles into your products and solutions. 

## Office 365 endpoints

Endpoints are the set of destination IP addresses, DNS domain names, and URLs for Office 365 traffic on the Internet. 

To optimize performance to Office 365 cloud-based services, you need to add these endpoints for special handling to your client browsers and network devices in your edge network. These devices include firewalls, SSL Break and Inspect, and packet inspection devices, and data loss prevention systems.

See [Managing Office 365 endpoints](managing-office-365-endpoints.md) for the details.

There are five different Office 365 clouds currently available. This table takes you to the list of endpoints for each one.

|||
|:-------|:-----|
| [Worldwide endpoints](urls-and-ip-address-ranges.md) | The endpoints for worldwide Office 365 subscriptions. |
| [U.S. Government DoD endpoints](office-365-u-s-government-dod-endpoints.md) | The endpoints for worldwide Office 365 subscriptions. |
| [U.S. Government GCC High endpoints](office-365-u-s-government-gcc-high-endpoints.md) | The endpoints for worldwide Office 365 subscriptions. |
| [Office 365 operated by 21Vianet endpoints](urls-and-ip-address-ranges-21vianet.md) | The endpoints for worldwide Office 365 subscriptions. |
| [Office 365 Germany endpoints](office-365-germany-endpoints.md) | The endpoints for subscriptions in the Office 365 cloud in Germany. |
|||

Here are articles for additional endpoints:

- [Additional endpoints not included in the Web service](additional-office365-ip-addresses-and-urls.md)
- [Network requests in Office 2016 for Mac](network-requests-in-office-2016-for-mac.md)

To automate obtaining the latest list of endpoints for your Office 365 cloud, see [Office 365 IP Address and URL Web service](office-365-ip-web-service.md).

## Additional topics for Office 365 networking

See these articles for specialized topics in Office 365 networking:

- [Content delivery networks](content-delivery-networks.md)
- [IPv6 support in Office 365 services](ipv6-support.md)
- [NAT support with Office 365](nat-support-with-office-365.md)

## ExpressRoute for Office 365

See these articles for information on the use of ExpressRoute for Office 365 traffic:

- [Azure ExpressRoute for Office 365](azure-expressroute.md)
- [Implementing ExpressRoute for Office 365](implementing-expressroute.md)
- [Network planning with ExpressRoute for Office 365](network-planning-with-expressroute.md)
- [Routing with ExpressRoute for Office 365](routing-with-expressroute.md)

