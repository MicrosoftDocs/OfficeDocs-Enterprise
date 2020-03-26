---
title: "The VPN problem for remote workers in a cloud-first world"
ms.author: kvice
author: kelleyvice-msft
manager: laurawi
ms.date: 3/26/2020
audience: Admin
ms.topic: conceptual
ms.service: o365-administration
localization_priority: Priority
search.appverid:
- MET150
ms.collection:
- Ent_O365
- Strat_O365_Enterprise
f1.keywords:
- NOCSH
description: "The VPN problem for remote workers in a cloud-first world"
---

# The VPN problem for remote workers in a cloud-first world

>[!NOTE]
>This topic is part of a set of topics that address VPN optimization for remote users. To read the main topic, see [Using VPN Split Tunneling with Office 365](office-365-vpn-split-tunnel.md).

For many years enterprises have been using VPNs to support remote experiences for their users. Whilst core workloads remained on-premises, a VPN from the remote client routed through a datacenter on the corporate network was the primary method for remote users to access corporate resources. To safeguard these connections, enterprises build layers of network security solutions along the VPN paths. This was done to protect internal infrastructure as well as to safeguard mobile browsing of external web sites by rerouting traffic into the VPN and then out through the on-premises Internet perimeter. VPNs, network perimeters and associated security infrastructure were often purpose built and scaled for a defined volume of traffic, typically with the majority of connectivity being initiated from within the corporate network, and most of it staying withing the internal network boundaries.

For quite some time, VPN models where all connections from the remote user device are routed back into the on-premises network (known as **forced tunneling**) were largely sustainable as long as the concurrent scale of remote users was modest and the traffic volumes traversing VPN were low.  Some customers continued to use VPN force tunneling as the status quo even after their applications moved from inside the corporate perimeter to public SaaS clouds, Office 365 being a prime example.

The use of forced tunneled VPNs for connecting to distributed and performance sensitive cloud applications is extremely suboptimal, but the negative impact of that may have been accepted by some enterprises so as to maintain the status quo from a security perspective. An example diagram of this scenario can be seen below:

![Split Tunnel VPN configuration](media/vpn-split-tunneling/vpn-ent-challenge.png)

This problem has been growing for a number of years, with many customers reporting a significant shift of network traffic patterns. Traffic which used to stay on premises now connects to external cloud endpoints.

The worldwide COVID-19 pandemic has escalated this problem to require immediate remediation. The COVID-19 situation and the need to ensure employee safety has generated unprecedented demands on enterprise IT to support work-from-home productivity at a massive scale. Microsoft Office 365 is well positioned to help customers fulfil that demand, but high concurrency of users working from home generates a large volume of Office 365 traffic which, if routed through forced tunnel VPN and on-premises network perimeters, causes rapid saturation and runs VPN infrastructure out of capacity. In this new reality, using VPN to access Office 365 is no longer just a performance impediment, but a hard wall which not only impacts Office 365 but critical business operations which still have to rely on the VPN to operate.

Microsoft has been working closely with customers and the wider industry for many years to provide effective, modern solutions to these problems from within our own services, and to align with industry best practice. [Connectivity principles](https://aka.ms/pnc) for the Office 365 service have been designed to work efficiently for remote users whilst still allowing an organization to maintain security and control over their connectivity. These solutions can also be implemented very quickly with limited work yet achieve a significant positive impact on the problems outlined above.

Microsoft's recommended strategy for optimizing remote worker's connectivity is focused on rapidly alleviating the problems with the traditional approach and also providing high performance with a few simple steps. These steps adjust the legacy VPN approach for a small number of defined endpoints which bypass bottlenecked VPN servers. An equivalent or even superior security model can be applied at different layers to remove the need to secure all traffic at the egress of the corporate network. In most cases this can be effectively achieved within hours and is then scalable to other workloads as requirements demand and time allows.

## Common Types of VPN scenarios

In the list below you'll see the most common VPN scenarios seen in enterprise environments. Most customers traditionally operate model 1 (VPN Forced Tunnel). This section will help you to quickly and securely transition to **model 2**, which is achievable with relatively little effort, and which has enormous benefits to network performance and user experience.

| **Model** | **Description** |
| --- | --- |
| [1. VPN Forced Tunnel](#1-vpn-forced-tunnel) | 100% of traffic goes into VPN tunnel, including on-premise, Internet and all O365/M365 |
| [2. VPN Forced Tunnel with few exceptions](#2-vpn-forced-tunnel-with-a-small-number-of-trusted-exceptions) | VPN tunnel is used by default (default route points to VPN), with few, most important exempt scenarios that are allowed to go direct |
| [3. VPN Forced Tunnel with broad exceptions](#3-vpn-forced-tunnel-with-broad-exceptions) | VPN tunnel is used by default (default route points to VPN), with broad exceptions that are allowed to go direct (such as all Office 365, All Salesforce, All Zoom) |
| [4. VPN Selective Tunnel](#4-vpn-selective-tunnel) | VPN tunnel is used only for corpnet based services. Default route (Internet and all Internet based services) goes direct. |
| [5. No VPN](#5-no-vpn) | A variation of #2, where instead of legacy VPN, all corpnet services are published through modern security approaches (like Zscaler ZPA, AAD Proxy/MCAS, etc) |

### 1. VPN Forced Tunnel

This is the most common starting scenario for most enterprise customers. A forced VPN is used which means 100% of traffic is directed into the corporate network regardless of the fact the endpoint resides within the corporate network or not. Any external (Internet) bound traffic such as Office 365 or Internet browsing is then hairpinned back out of the on premises security equipment such as proxies. In the current climate with nearly 100% of users working remotely, this model therefore puts extremely high load on the VPN infrastructure and is likely to significantly hinder performance of all corporate traffic and thus the enterprise to operate efficiently at a time of crisis.

![VPN Forced Tunnel model 1](media/vpn-split-tunneling/vpn-model-1.png)

### 2. VPN Forced Tunnel with a small number of trusted exceptions

This model is significantly more efficient for an enterprise to operate under as it allows a small number of controlled and defined endpoints which are very high load and latency sensitive to bypass the VPN tunnel and go direct to the Office 365 service in this example. This significantly improves the performance for the offloaded services, and also decreases the load on the VPN infrastructure, thus allowing elements which still require it to operate with lower contention for resources. It is this model which this article concentrates on assisting with the transition to as it allows for simple, defined actions to be taken very quickly with numerous positive outcomes.

![Split Tunnel VPN model 2](media/vpn-split-tunneling/vpn-model-2.png)

### 3. VPN Forced Tunnel with broad exceptions

The third model broadens the scope of model two as rather than just sending a small group of defined endpoints direct, it instead sends all traffic to trusted services such Office 365, SalesForce etc. direct. This further reduces the load on the corporate VPN infrastructure and improves the performance of the services defined. As this model is likely to take more time to assess the feasibility of and implement, it is likely a step which can be taken iteratively at a later date once model two is successfully in place.

![Split Tunnel VPN model 3](media/vpn-split-tunneling/vpn-model-3.png)

### 4. VPN selective Tunnel

This model reverses the third model in that only traffic identified as having a corporate IP address is sent down the VPN tunnel and thus the Internet path is the default route for everything else. This model requires an organization to be well on the path to [Zero Trust](https://www.microsoft.com/security/zero-trust?rtc=1) in able to safely implement this model. It should be noted that this model or some variation thereof will likely become the necessary default over time as more and more services move away from the corporate network and into the cloud. Microsoft uses this model internally; you can find more information [in this article](https://www.microsoft.com/itshowcase/blog/running-on-vpn-how-microsoft-is-keeping-its-remote-workforce-connected/).

![Split Tunnel VPN model 4](media/vpn-split-tunneling/vpn-model-4.png)

### 5. No VPN

A more advanced version of model number two, whereby any internal services are published through a modern security approach or SDWAN solution such as Azure AD Proxy, MCAS, Zscaler ZPA etc.

![Split Tunnel VPN model 5](media/vpn-split-tunneling/vpn-model-5.png)

## Related topics

[Using VPN Split Tunneling with Office 365](office-365-vpn-split-tunnel.md)

[Alternative ways for security professionals and IT to achieve modern security controls in today's unique remote work scenarios (Microsoft Security Team blog)](https://www.microsoft.com/security/blog/2020/03/26/alternative-security-professionals-it-achieve-modern-security-controls-todays-unique-remote-work-scenarios/)

[Office 365 performance optimization for China users](office-365-networking-china.md)

[Office 365 Network Connectivity Principles](office-365-network-connectivity-principles.md)

[Assessing Office 365 network connectivity](assessing-network-connectivity.md)

[Office 365 network and performance tuning](network-planning-and-performance.md)
