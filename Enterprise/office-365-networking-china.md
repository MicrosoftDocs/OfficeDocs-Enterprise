---
title: "Network performance optimization for Office 365 operated by 21Vianet"
ms.author: kvice
author: kelleyvice-msft
manager: laurawi
ms.date: 2/11/2020
audience: Admin
ms.topic: conceptual
ms.service: o365-administration
localization_priority: Normal
ms.collection:
- Ent_O365
- Strat_O365_Enterprise
search.appverid: MET150
f1.keywords:
- NOCSH
description: "This article provides the most recent guidance for optimizing network connectivity and performance for Office 365 operated by 21Vianet."
---

# Network performance optimization for Office 365 operated by 21Vianet

Tenants in Office 365 operated by 21Vianet are subject to a unique set of performance considerations due to China's internet architecture and regulatory policies. Most [Office 365 network connectivity principles](office-365-network-connectivity-principles.md) apply to Office 365 operated by 21Vianet, but it is important to understand where China-specific optimization guidance differs from general best practices.

## China-specific network performance considerations

China has a private internet that is distinct from the global public internet. This private internet is dominated by three carriers (China Telecom, China Unicom and China Mobile). Each carrier operates a collection of semi-independent provincial-level ISPs. This creates a complex routing hierarchy and decentralized management of the ISPs in China.

China’s main carriers have offshore connection to the global public Internet. These offshore connections go through a set of network gear commonly referred to as the Great Firewall (GFW).

The GFW provides the Chinese government with an inspection and censorship platform aimed at consumer traffic. In connection with DNS blocking the GFW provides IP address blocking and connection termination. This further strengthens the China government’s ability to manage and censor content available from the China private internet.

China carriers have a wide array of offshore interconnects with global ISPs outside of China. However, these interconnects are often saturated and cause high packet loss. This causes poor performance for many users in smaller countries or cities who access services hosted in China.

## China-specific Office 365 network architecture

Office 365 global services benefit our China users by being “near-shore” in Hong Kong and Singapore, where China carriers have significant bandwidth and premium peering with local providers. This ensures minimal latency to onshore users and generally eliminates carrier interconnect congestion.

Office 365 operated by 21Vianet services have been optimized in several ways to support offshore users. We’ve partnered with global carriers to carry Office 365 traffic to near-shore interconnects where we have in vested in premium channels and priority routing with China carriers. This has largely eliminated packet loss and failures from carrier interconnects with China carriers.

## Best practices for Office 365 operated by 21Vianet

In general there are several best practices that network administrators and users can do address the general performance issues related to the China private internet.

### Customer Networking

It is crucial that all tenants first follow our public network guidance [Network planning and performance tuning for Office 365](https://aka.ms/tune).

Additionally, tenant network admins should optimize the routing of O365 traffic to avoid cross-boarder congestion and optimize peering in the following way depending upon their service instance.

#### Global O365 Tenants

Tenant network admins should configure their networks in China to route all [Global O365 URLs & IPs](https://docs.microsoft.com/office365/enterprise/urls-and-ip-address-ranges) across the border and egress at the nearest peering point outside China.

#### Office 365 operated by 21Vianet O365 Tenants

Tenant network admins should configure their networks outside China to route all [Office 365 operated by 21Vianet O365 URLs & IPs](https://docs.microsoft.com/office365/enterprise/urls-and-ip-address-ranges-21vianet) across the border and egress as close to Beijing or Shanghai as practical.

### User Changes

There are a few things users should almost always do:

1. If users experience network performance issues, they should report to their IT department for troubleshooting. And escalate to Microsoft support if trouble with O365 services is suspected. Not all issues are caused by cross-border network performance.
2. Utilize rich Office clients that support caching (e.g. Outlook, Teams, OneDrive, etc.), and avoid web-based clients. The caching and offline behavior can dramatically reduce the impact of congestion & latency.
3. For Teams users:
 a. Use mobile clients as they is best suited for network performance issues.
 b. Switch to PSTN for audio calls when needed.

#### China users of Global O365

Many global tenants have users who work in or regularly travel to China. These users face several issues:

- The primary issue is high network congestion/packet loss on the offshore links and GFW.
- The secondary issue is the high packet latency due to complex routing within China carriers.
- Finally, last mile ISP performance can increase congestion/packet loss as well as packet latency.

#### Recommendation:

The primary goal is to avoid accessing Global O365 services from China's private internet by using a corporate network's private offshore links instead.

All O365 customers should begin by conforming to our public guidance [Network planning and performance tuning for Office 365](https://aka.ms/tune).

For Global O365 users in China who have access to corporate networks with private offshore links, this can provide optimal performance.

This can be done in several ways:

1. 1)Connecting user's computer directly the corporate network.
2. 2)Connecting user's computer via VPN to their corporate network in China.

### Offshore users of Office 365 operated by 21Vianet O365

Many Office 365 operated by 21Vianet tenants have users who work or travel outside of mainland China. These users face a couple issues:

- The primary issue is high network congestion/packet loss on the interconnects to China carriers.
- Secondarily, the high network congestion/packet loss on the offshore links and GFW.
- Finally, last mile ISP performance can increase congestion/packet loss as well as packet latency.

We've deployed several optimizations to improve the issue between carriers. For most offshore users on most global ISPs, they will route Office 365 traffic through our partner carrier PCCW globally, get handed off to China Telecom in Hong Kong and then take priority paths to or Beijing and Shanghai datacenters.

#### Recommendation:

In general, we don't see many performance issues from these users. Outside of the occasional issues with last-mile issue/outages. However, there are a number if ISPs that still have bad paths to China Telecom, thus avoiding the happy path through PCCW that we've purchased.

For users in locations with persistent performance issues, we recommend using a corporate network's private onshore links instead.

All O365 customers should begin by conforming to our public guidance [Network planning and performance tuning for Office 365](https://aka.ms/tune).

For Office 365 operated by 21Vianet O365 users outside China who have access to corporate network with private onshore links, this can provide optimal performance.

For these users:

1. 1)Connecting user's computer directly the corporate network.
2. 2)Connecting user's computer via VPN to their corporate network outside China.

## FAQ

### Not all customers have cross-border networks, what should they do?

Leverage rich Office clients that support caching and avoid web-based clients.

### Not all customers have VPN access into their corporate network, what should they do?

Leverage rich Office clients that support caching and avoid web-based clients.

### These practices avoid the Great Firewall, isn't that illegal in China?

We cannot give customers any legal advice. However, businesses commonly purchase legal cross-border network links for legitimate business purposes.

### Cross-border network links are expensive, what can customer do to minimize their usage?

In the URL and IP guides, customers can start by just routing the items flagged as &quot;Optimize&quot;, they should see improved performance and minimize bandwidth consumption.
