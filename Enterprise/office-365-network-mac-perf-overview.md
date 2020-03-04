---
title: "Network performance recommendations in the Microsoft 365 Admin Center (preview)"
ms.author: kvice
author: kelleyvice-msft
manager: laurawi
ms.date: 03/03/2020
audience: Admin
ms.topic: conceptual
ms.service: o365-administration
localization_priority: Normal
search.appverid:
- MET150
ms.collection:
- Ent_O365
- Strat_O365_Enterprise
description: "Overview of network performance recommendations in the Microsoft 365 Admin Center (preview)"
---

# Network performance recommendations in the Microsoft 365 Admin Center (preview)

The Microsoft 365 Admin Center now shows **Network Insights and performance recommendations**, which are live performance metrics collected from your Office 365 tenant and available to view only by administrative users in your tenant. Insights and recommendations are displayed in the Microsoft 365 Admin Center at <https://portal.microsoft.com/adminportal/home#/networkperformance>. You can find the page in the navigation pane under **Health | Network performance**.

![Network performance page](Media/m365-mac-perf/m365-mac-perf-page-nav.png)

When you first navigate to the network performance page, you will see an overview pane containing a map of global network performance, a network assessment score scoped to the entire tenant, and a list of current issues. From the overview, you can drill down to view specific network performance metrics and issues by location. For more information, see [Network performance overview in the Microsoft 365 Admin Center](#network-performance-overview-in-the-microsoft-365-admin-center).

### How do I use this information?

Network Insights and their related performance recommendations are intended to help in designing network perimeters for your office locations. Each Insight provides live details about the performance characteristics for a specific common issue for each geographic location where users are accessing your tenant.

Recommendations for each Network Insight offer specific network architecture design changes you can make to improve user experience related to Office 365 network connectivity. The network score shows how network connectivity impacts user experience, allowing for comparison of different user location network connections.

Complex enterprises with multiple office locations and non-trivial network perimeter architectures can benefit from this information either during their initial onboarding to Office 365 or to remediate network performance issues discovered with usage growth. This is usually not necessary for small businesses using Office 365, or any enterprises who already have simple and direct network connectivity. Enterprises with over 500 users and multiple office locations are expected to benefit the most.

>[!IMPORTANT]
>Network performance recommendations, Insights and assessments in the Microsoft 365 Admin Center is currently in preview status, and is only available for Office 365 tenants that have been enrolled in the feature preview program.

## Enterprise network connectivity challenges

![Customer network to cloud](Media/m365-mac-perf/m365-mac-perf-first-last-mile.png)

Many enterprises have network perimeter configurations which have grown over time and are primarily designed to accommodate employee Internet web site access where most web sites are not known in advance and are untrusted. The prevailing and necessary focus is avoiding malware and fishing attacks from these unknown web sites. This network configuration strategy, while helpful for security purposes, can lead to degradation of Office 365 user performance and user experience.

## How we can solve these challenges

Enterprises can improve general user experience and secure their environment by following [Office 365 connectivity principles](https://aka.ms/pnc) and by using the Microsoft 365 Admin Center network performance feature. In most cases, following these general principles will have a significant positive impact on end user latency, service reliability and overall performance of Office 365.

Microsoft is sometimes asked to investigate network performance issues with Office 365 for large enterprise customers, and these frequently have a root cause related to the customers network egress infrastructure. When a common root cause of a customer network perimeter issue is found we seek to identify simple test measurements that identifies it. A test with a measurement threshold that identifies a specific problem is valuable because we can test the same measurement at any location, tell whether this root cause is present there and share it as a Network Insight with the administrator.

Some Network Insights will merely indicate a problem that needs further investigation. A Network Insight where we have enough tests to show a specific remediation action to correct the root cause is listed as a **recommended action**. These recommendations, based on live metrics that reveal values that fall outside a predetermined threshold, are much more valuable than general best practice advice since they are specific to your environment and will show the actual improvement once the recommended changes have been made.

## Network performance overview in the Microsoft 365 Admin Center

Microsoft has existing network measurements from several Office desktop and web clients which support the operation of Office 365. These measurements are now being used to provide network architecture design insights and a network performance score which are shown in the **Network performance** page in the Microsoft 365 Admin Center.

By default, approximate location information associated with the network measurements identify the city where client devices are located. The network score at each location is shown with color and the relative number of users at each location is represented by the size of the circle.

![Network Insights overview map](Media/m365-mac-perf/m365-mac-perf-overview-map.png)

The overview page also shows the network score for the customer as a weighted average across all office locations.

![Network score](Media/m365-mac-perf/m365-mac-perf-overview-score.png)

## Specific office location network performance summary and Insights

Selecting an office location opens a location-specific summary page. We show details of the network egress that has been identified from measurements for that office location.

![Network Insights details by location](Media/m365-mac-perf/m365-mac-perf-locations-plan-overview.png)

The office location summary page additionally shows the location's network assessment score, network score history, a comparison of this location's score to other customers in the same city, and a list of specific Insights and recommendations that you can undertake to improve network performance and reliability. Locations with specific recommendations may also include an estimated potential latency improvement.

Comparisons between customers in the same city are based on the expectation that all customers have equal access to network service providers, telecommunications infrastructure, and nearby Microsoft network points of presence.

![Network Insights locations](Media/m365-mac-perf/m365-mac-perf-locations.png)

The details tab on the office location page shows the specific measurement results that were used to come up with any Insights, recommendations, and the network assessment score. This is provided so that network engineers can validate the recommendations and factor in any constraints or specifics in their environment.

![Location-specific details](Media/m365-mac-perf/m365-mac-perf-locations-plan-details-all.png)

For customers who want to improve the accuracy of location-specific metrics and recommendations, we allow for more specific information to be entered. This can reduce the approximations that are inherent in the location information available for network measurements. To edit the address of a specific office location, <functionality not there yet>.

## FAQ

### What is an Office 365 service front door?

The Office 365 service front door is an entry point on Microsoft's global network where Office clients and services terminate their network connection. For an optimal network connection to Office 365, it is recommended that your network connection is terminated into the closest Office 365 front door in your city or metro.

>[!NOTE]
>Office 365 service front door has no direct relationship to the Azure Front Door Service product available in the Azure marketplace.

### What is an optimal Office 365 service front door?

An optimal Office 365 service front door is one that is closest to your network egress, generally in your city or metro area. Use the [Office 365 Network Onboarding Tool](office-365-network-mac-perf-onboarding-tool.md) to determine location of your in-use Office 365 service front door and optimal service front door. If the tool determines your in-use front door is optimal, then you are optimally connecting into Microsoft's global network.

### What is an internet egress location?

The internet egress location is the location where your network traffic exits your enterprise network and connects to the Internet. This is also identified as the location where you have a Network Address Translation (NAT) device and usually where you connect with an Internet Service Provider (ISP). If you see a long distance between your location and your internet egress location, then this may indicate a significant WAN backhaul.

## Related topics

[Office 365 Network Insights (preview)](office-365-network-mac-perf-insights.md)

[Office 365 network assessment (preview)](office-365-network-mac-perf-score.md)

[Office 365 Network Onboarding Tool in the M365 Admin Center (preview)](office-365-network-mac-perf-onboarding-tool.md)

[Office 365 Network Insights Privacy and Terms of Use (preview)](office-365-network-mac-perf-privacy.md)
