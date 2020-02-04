---
title: "Office 365 network assessment (preview)"
ms.author: kvice
author: kelleyvice-msft
manager: laurawi
ms.date: 02/04/2020
audience: Admin
ms.topic: conceptual
ms.service: o365-administration
localization_priority: Normal
search.appverid:
- MET150
ms.collection:
- Ent_O365
- Strat_O365_Enterprise
description: "Office 365 network assessment (preview)"
---

# Office 365 network assessment (preview)

The Office 365 network assessment indicates the relative user experience impact from customer network connectivity. The impact of any Microsoft owned network connectivity is excluded from this to enable customers to optimize network designs for which they are responsible.

It is calculated from measurements that impact user experience in key Office 365 workloads and shown as a percentage with a range of 0 to 100.

A very low network score suggests that Office 365 clients will have significant problems connecting or remaining user responsive. A score of 80% represents network connectivity where you should not expect to receive user complaints about your Office 365 user experience due to your network performance. As network connectivity improvements are made, this score will increase along with user experience.

>[!IMPORTANT]
>Network performance recommendations, insights and assessments in the Microsoft 365 Admin Center is currently in preview status, and is only available for Office 365 tenants that have been enrolled in the feature preview program.

## Exchange Online

For Exchange Online the TCP latency from the client machine to the Exchange front end server is measured. This can be impacted by the distance the network travels over the customers LAN and WAN. It can also be impacted by network intermediary devices or services which delay the connectivity or cause packets to be resent.

## SharePoint Online

For SharePoint Online the download speed available for a user to access a document is measured. This can be impacted by the bandwidth available on network circuits between the client machine and Microsoft’s network. It is also often impacted by network congestion that exists in bottlenecks in complex network devices or in poor coverage Wi-Fi areas.

## Microsoft Teams

For Microsoft Teams the Network quality is measured as UDP latency, UDP jitter, and UDP packet loss. UDP is used for call and conferencing audio and video media connectivity for Microsoft Teams. This can be impacted by the same factors as for latency and download speed in addition to connectivity gaps in a network’s UDP support since UDP is configured separately to the more common TCP protocol.

## Tenant network score and office location network score

A network score measures the design of the network perimeter of an office location to Microsoft’s network. Improvements to the network perimeter is best done at each office location, or where network connectivity is aggregated there may be improvements that impact multiple locations.
We show a network score for the whole Office 365 tenant on the network performance overview page and a specific network score for each detected office location on that location’s summary page.

## Network score panel

Each network score whether for the tenant or for a specific office location shows a panel with details about the score. This panel shows a bar chart of the score both as a percentage and as the total points for each component workload including only workloads where measurement data was received. For an office location network score we also show a benchmark which is the median of all Office 365 clients that reported data in the same City as your office location.

The score breakdown in the panel shows the score for each of the component workloads.

The score history shows the past 30 days of the score and the benchmark.

## Related topics

[Network performance recommendations in the Microsoft 365 Admin Center (preview)](office-365-network-mac-perf-overview.md)

[Office 365 network performance insights (preview)](office-365-network-mac-perf-insights.md)

[Office 365 Network Onboarding Tool in the M365 Admin Center (preview)](office-365-network-mac-perf-onboarding-tool.md)
