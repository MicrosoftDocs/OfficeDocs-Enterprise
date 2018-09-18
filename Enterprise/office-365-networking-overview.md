---
title: "Office 365 Network Connectivity Overview"
ms.author: kvice
author: kelleyvice-msft
manager: laurawi
ms.date: 9/12/2018
ms.audience: Admin
ms.topic: conceptual
ms.service: o365-administration
localization_priority: Normal
search.appverid:
- MET150
ms.collection:
- Ent_O365
- Strat_O365_Enterprise
description: "Discusses why networking is important for SaaS services, the goal of Office 365 networking, and how SaaS requires different networking from other workloads."
---

# Office 365 SaaS networking connectivity overview

Office 365 is a distributed Software-as-a-Service (SaaS) cloud that provides productivity and collaboration scenarios through a diverse set of micro-services and applications. Client components of Office 365 such as Outlook, Word and PowerPoint run on user computers and connect to other components of Office 365 that run in Microsoft datacenters. The most significant factor that determines the quality of the Office 365 end user experience is network reliability and low latency between Office 365 clients and Microsoft datacenters.

End user experience is directly related to the performance and responsiveness of the application that they are using. For example, Microsoft Teams relies on low latency so that user phone calls, conferences and shared screen collaborations are glitch-free, and Outlook relies on great networking connectivity for instant search features that leverage server-side indexing and AI capabilities.

## The goal of Office 365 networking

The ultimate goal of Office 365 networking is to optimize the end user experience by enabling the least restrictive access between clients and the closest Office 365 endpoints. When you implement Microsoft SaaS services such as Office 365, traffic between clients and Office 365 endpoints traverses the Internet, and should be treated differently from generic Internet traffic.

The primary goal in the network design should be to minimize latency by reducing the round-trip time (RTT) from your network into the Microsoft Global Network, Microsoft's public network backbone that interconnects all of Microsoft's datacenters with low latency and cloud application entry points spread around the world. You can learn more about the Microsoft Global Network at [How Microsoft builds its fast and reliable global network](https://azure.microsoft.com/en-us/blog/how-microsoft-builds-its-fast-and-reliable-global-network/).

## Traditional network architectures

Traditional network architecture principles for client/server workloads are designed around the assumption that traffic between clients and endpoints does not extend outside the corporate network perimeter. Also, in many enterprise networks, all outbound Internet connections traverse the corporate network, and egress from a central location.

In traditional network architectures, higher latency for generic Internet traffic is a necessary tradeoff in order to maintain perimeter security, and performance optimization for Internet traffic typically involves upgrading or scaling out the equipment at network egress points. However, this approach does not address the specific requirements for optimum Office 365 network performance.

## Why is Office 365 networking different?

Office 365 is designed for optimal performance and security without the need for perimeter security enforcement. Office 365 datacenters are located across the world and the service is designed to use various methods for connecting clients to best available service endpoints. Since user data and processing is distributed between many Microsoft datacenters, there is no single network endpoint to which client machines can connect. In fact, data and services in your Office 365 tenant are dynamically optimized by the Microsoft Global Network to adapt to the geographic locations from which they are accessed by end users.

Shortening the network path to Office 365 entry points by allowing client traffic to egress as close as possible to their geographic location can improve connectivity performance and the end user experience in Office 365, and can also help to reduce the impact of future changes to the network architecture on Office 365 performance and reliability. The optimum connectivity model is to always provide network egress at the user's location, regardless of whether this is on the corporate network or remote locations such as home, hotels, coffee shops and airports. This local direct egress model is represented in the diagram below.

![Local egress network architecture](media/6bc636b0-1234-4ceb-a45a-aadd1044b39c.png)

The local egress architecture has the following benefits over the traditional model:
  
- Provides optimal Office 365 performance by optimizing route length. End user connections are dynamically routed to the nearest Office 365 entry point by the Microsoft Global Network's _Distributed Service Front Door_ infrastructure.
- Reduces the load on corporate network infrastructure by allowing local egress for Office 365 traffic, bypassing proxies and traffic inspection devices.
- Secures connections on both ends by leveraging client endpoint security and cloud security features, avoiding application of redundant security technologies.

## Securing Office 365 connections

The goal of traditional network security is to harden the corporate network perimeter against intrusion and malicious exploits. Most enterprise networks enforce network security for Internet traffic using technologies like proxies, SSL inspection, packet inspection, and data loss prevention systems. These technologies provide important risk mitigation for generic Internet requests but can dramatically reduce performance, scalability and the quality of end user experience when applied to Office 365 endpoints.

Office 365 is designed to help meet your organization's needs for content security and data usage compliance with legal, regulatory and technical standards with built-in security and governance features. For more information about Office 365 security and compliance, see the article [Overview of security and compliance in Office 365](https://support.office.com/en-us/article/overview-of-security-and-compliance-in-office-365-dcb83b2c-ac66-4ced-925d-50eb9698a0b2?ui=en-US&amp;rs=en-US&amp;ad=US).

## Related Topics

[Office 365 Network Connectivity Principles](office-365-network-connectivity-principles.md)

[Office 365 network and performance tuning](network-planning-and-performance.md)

[Office 365 IP Address and URL Web service](office-365-ip-web-service.md)

[Managing Office 365 endpoints](managing-office-365-endpoints.md)

[Office 365 IP Address and URL Web service](office-365-ip-web-service.md)

[Network connectivity to Office 365](network-connectivity.md)

[Office 365 performance tuning using baselines and performance history](performance-tuning-using-baselines-and-history.md)

[Performance troubleshooting plan for Office 365](performance-troubleshooting-plan.md)
