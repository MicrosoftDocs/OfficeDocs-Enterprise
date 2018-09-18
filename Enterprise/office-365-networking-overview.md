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
description: ""
---

# Office 365 SaaS networking connectivity overview

**Summary:** Discuses why networking is important for SaaS services, what the goal of networking is and how SaaS requires different networking to other workloads.

**Outline and purpose for authors:** _Framing document on networking for SaaS in under 2 pages. Why it matters? What&#39;s the goal of good networking? It&#39;s all about user experience. How networking for SaaS is different from networking for IaaS._

## Office 365 architecture

Office 365 is a distributed Software-as-a-Service (SaaS) cloud that provides productivity and collaboration scenarios through a diverse set of micro-services and applications. Client components of Office 365 such as Outlook, Word and PowerPoint run on user computers, and must connect to other components of Office 365 that run in Microsoft datacenters. The most significant factor that determines the quality of the Office 365 end user experience is network reliability and latency between Office 365 clients and Microsoft datacenters.

End user experience is directly related to the performance and responsiveness of the application that they are using. For example, Microsoft Teams relies on low latency so that user phone calls, conferences and shared screen collaborations are glitch-free, and Outlook relies on great networking connectivity for instant search features that leverage server-side indexing and AI capabilities.

Traditional network architecture principles for client/server workloads are designed around the assumption that traffic between clients and on-premises endpoints does not extend outside the corporate network perimeter. Also, in many enterprise networks, all outbound Internet connections traverse the corporate network, and egress from a central location. When you implement Microsoft SaaS services such as Office 365, traffic between clients and Office 365 endpoints traverses the Internet, and should be treated differently from other Internet-bound traffic.

Office 365 datacenters are located across the world and the service is designed to use various methods for connecting clients to best available service endpoints. Since user data and processing is distributed between many Microsoft datacenters, there is no single network endpoint to which client machines can connect. In fact, data and services in your Office 365 tenant are dynamically optimized by the Microsoft Global Network to adapt to the geographic locations from which they are accessed by end users. Shortening the network path to Office 365 entry points by allowing client traffic to egress as close as possible to their geographic location can improve connectivity performance and the end user experience in Office 365, and can also help to reduce the impact of future changes to the network architecture on Office 365 performance and reliability. The optimum connectivity model is to always provide network egress at the user's location, regardless of whether this is on the corporate network or remote locations such as home, hotels, coffee shops and airports. This local direct egress model is represented in the diagram below.

![Local egress network architecture](media/6bc636b0-1234-4ceb-a45a-aadd1044b39c.png)

The local egress architecture has the following benefits over the traditional model:
  
- Provides optimal Office 365 performance by optimizing route length. End user connections are dynamically routed to the nearest Office 365 entry point by the Microsoft Global Network's _Distributed Service Front Door_ infrastructure.
- Reduces the load on corporate network infrastructure by allowing local egress for Office 365 traffic, bypassing proxies and traffic inspection devices.
- Secures connections on both ends by leveraging client endpoint security and cloud security features, avoiding application of redundant security technologies.

