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

Traditional network architecture principles for client/server workloads are 

But which datacenters? Office 365 is hosted in many datacenters across the world and the service will use various methods for working to get a user to connect the services in Office 365 that they need. Since a users data and processing may occur in many Microsoft datacenters there is no single network cable you can connect from the users PC to once datacenter. Instead, you should optimize for connectivity to Microsoft&#39;s network as close to the user as possible and the service will get the connection to where it needs to go.

So, SaaS networking for Office 365 needs connectivity from each user to the nearest point on Microsoft&#39;s network. To achieve this practically involves making the shortest possible connection from the user to the Internet and then relying on Microsoft&#39;s Internet points of presence.

[Diagram showing customer with many branch locations on the left and Microsoft cloud with many Internet points of presence on the right]

There are a few observations that we can make with this network connectivity model.

First, since there is no single point you can optimize network connectivity to, there is no single logical point where a traditional perimeter network stack can be located. Second, this is a very different model to either resource based IaaS infrastructure connectivity and to standard Internet browsing connectivity.