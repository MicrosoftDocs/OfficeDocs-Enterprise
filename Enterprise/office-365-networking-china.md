---
title: "Office 365 global tenant performance optimization for China users"
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
description: "This article provides guidance for optimizing network performance for China users of global Office 365 tenants."
---

# Office 365 global tenant performance optimization for China users

>[!IMPORTANT]
>This guidance is specific to usage scenarios in which **enterprise Office 365 users located in China** connect to a **global Office 365 tenant**. This guidance does **not** apply to tenants in Office 365 operated by 21Vianet.

For enterprises with global Office 365 tenants and a corporate presence in China, Office 365 client performance for China-based users can be complicated by factors unique to China's internet architecture and regulatory policies.

China has a private internet that is distinct from the global public internet. China ISPs have offshore connections to the global public Internet that go through a set of network devices commonly referred to as the Great Firewall (GFW), which subjects traffic to packet inspection, DNS blocking and connection termination. This can have a detrimental effect on the performance of network services that are sensitive to latency and packet loss, including Office 365 services such as Teams, Skype for Business and client features such as collaborative editing.

Many enterprises with global Office 365 tenants and users in China have implemented private networks or SD-WANs that carry corporate network traffic between China branch office locations and offshore interconnects in locations such as Hong Kong and Singapore. This kind of private network mitigates the bandwidth, latency and packet loss issues that can be caused by transiting China's internet edge and the GFW.

Enterprise users in China who connect to global Office 365 tenants from remote locations such as homes, coffee shops and hotels may therefore experience relatively poor performance if their Office 365 connectivity must transit China's internet edge. These users face several issues:

- The primary issue is high network congestion/packet loss on the offshore links and GFW.
- The secondary issue is the high packet latency due to complex routing within China carriers.
- Finally, last mile ISP performance can increase congestion/packet loss as well as packet latency.

## Best practices for global Office 365 connectivity from China

There are several best practices that network administrators and users can follow to address performance issues related to the China private internet.

### Corporate network best practices

- It is crucial that all tenants first follow our public network guidance [Network planning and performance tuning for Office 365](https://aka.ms/tune). The primary goal should be to avoid accessing global Office 365 services from China's private internet if possible.
- Implement a private network or SD-WAN that carries corporate network traffic between China branch office locations and offshore egress locations such as Hong Kong and Singapore.
- Configure user devices to access the corporate network over a VPN connection to allow Office 365 traffic to transit the corporate network's private offshore link.
- Optimize the routing of Office 365 traffic to route [Office 365 URLs and IP address ranges](https://docs.microsoft.com/office365/enterprise/urls-and-ip-address-ranges), particularly in the **Optimize** category, across private offshore links that egress at the nearest peering point outside China. 

### User best practices

If cross-border private networks and/or VPN access into the corporate network are not an option, you can still mitigate performance issues by training your China-based users to follow these best practices.

- Utilize rich Office clients that support caching (e.g. Outlook, Teams, OneDrive, etc.), and avoid web-based clients. Office client caching and offline access features can dramatically reduce the impact of network congestion and latency.
- For Teams users:
  - Use mobile clients as they are best suited for network performance issues.
  - Switch to PSTN for audio calls when needed. Fore more information, see [Quick start guide: Configuring Calling Plans in Microsoft Teams](https://docs.microsoft.com/microsoftteams/configuring-teams-calling-quickstartguide).
- If users experience network performance issues, they should report to their IT department for troubleshooting, and escalate to Microsoft support if trouble with Office 365 services is suspected. Not all issues are caused by cross-border network performance.

## FAQ

### Cross-border private networks bypass the Great Firewall. Isn't that illegal in China?

China-based businesses commonly purchase legal cross-border network links for legitimate business purposes.

### Cross-border network link usage is expensive. What can I do to minimize their usage?

Follow the guidance in [Office 365 URLs and IP address ranges](urls-and-ip-address-ranges.md) to configure your network to only route traffic to endpoints categorized as **Optimize**. This will improve performance and minimize bandwidth consumption by limiting optimized traffic to critical services that are most sensitive to high latency and packet loss.

## Related topics

[Network planning and performance tuning for Office 365](https://aka.ms/tune)

[Office 365 network connectivity principles](office-365-network-connectivity-principles.md)

[Office 365 URLs and IP address ranges](urls-and-ip-address-ranges.md)

[Office 365 operated by 21Vianet Office 365 URLs & IPs](https://docs.microsoft.com/office365/enterprise/urls-and-ip-address-ranges-21vianet)

[Yammer group for Office 365 operated by 21Vianet](https://aka.ms/China)
