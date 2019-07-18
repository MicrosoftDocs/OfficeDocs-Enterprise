---
title: "Office 365 Network Connectivity Principles"
ms.author: kvice
author: kelleyvice-msft
manager: laurawi
ms.date: 6/5/2019
audience: Admin
ms.topic: conceptual
ms.service: o365-administration
localization_priority: Normal
ms.collection:
- Ent_O365
- Strat_O365_Enterprise
search.appverid: MET150
ms.assetid: 76e7f232-917a-4b13-8fe2-4f8dbccfe041
description: "Before you begin planning your network for Office 365 network connectivity, it is important to understand the connectivity principles for securely managing Office 365 traffic and getting the best possible performance. This article will help you understand the most recent guidance for securely optimizing Office 365 network connectivity."
---

# Office 365 Network Connectivity Principles

Before you begin planning your network for Office 365 network connectivity, it is important to understand the connectivity principles for securely managing Office 365 traffic and getting the best possible performance. This article will help you understand the most recent guidance for securely optimizing Office 365 network connectivity.
  
Traditional enterprise networks are designed primarily to provide users access to applications and data hosted in company operated datacenters with strong perimeter security. The traditional model assumes that users will access applications and data from inside the corporate network perimeter, over WAN links from branch offices, or remotely over VPN connections.
  
Adoption of SaaS applications like Office 365 moves some combination of services and data outside the network perimeter. Without optimization, traffic between users and SaaS applications is subject to latency introduced by packet inspection, network hairpins, inadvertent connections to geographically distant endpoints and other factors. You can ensure the best Office 365 performance and reliability by understanding and implementing key optimization guidelines.
  
In this article, you will learn about:
  
- [Office 365 architecture](office-365-network-connectivity-principles.md#BKMK_Architecture) as it applies to customer connectivity to the cloud
- Updated [Office 365 connectivity principles](office-365-network-connectivity-principles.md#BKMK_Principles) and strategies for optimizing network traffic and the end user experience
- The [Office 365 Endpoints web service](office-365-network-connectivity-principles.md#BKMK_WebSvc), which allows network administrators to consume a structured list of endpoints for use in network optimization
- [New Office 365 endpoint categories](office-365-network-connectivity-principles.md#BKMK_Categories) and optimization guidance
- [Comparing network perimeter security with endpoint security](office-365-network-connectivity-principles.md#BKMK_SecurityComparison)
- [Incremental optimization](office-365-network-connectivity-principles.md#BKMK_IncOpt) options for Office 365 traffic
- The [Office 365 Network Onboarding tool](https://aka.ms/netonboard), a new tool for testing basic connectivity to Office 365

## Office 365 architecture
<a name="BKMK_Architecture"> </a>

Office 365 is a distributed Software-as-a-Service (SaaS) cloud that provides productivity and collaboration scenarios through a diverse set of micro-services and applications, such as Exchange Online, SharePoint Online, Skype for Business Online, Microsoft Teams, Exchange Online Protection, Office in a browser, and many others. While specific Office 365 applications may have their unique features as it applies to customer network and connectivity to the cloud, they all share some key principals, goals and architecture patterns. These principals and architecture patterns for connectivity are typical for many other SaaS clouds and at the same time being quite different from the typical deployment models of Platform-as-a-Service and Infrastructure-as-a-Service clouds, such as Microsoft Azure.
  
One of the most significant architectural features of Office 365 (that is often missed or misinterpreted by network planners) is that it is a truly global distributed service, in the context of how users connect to it. The location of the target Office 365 tenant is important to understand the locality of where customer data is stored within the cloud, but the user experience with Office 365 doesn't involve connecting directly to disks containing the data. The user experience with Office 365 (including performance, reliability and other important quality characteristics) involves connectivity through a highly distributed service front doors that are scaled out across hundreds of Microsoft locations worldwide. In the majority of cases, the best user experience is achieved by allowing the customer network to route user requests to the closest Office 365 service entry point, rather than connecting to Office 365 through an egress point in a central location or region.
  
For most customers, Office 365 users are distributed across many locations. To achieve the best results, the principles outlined in this document should be looked at from the scale-out (not scale-up) point of view, focusing on optimizing connectivity to the nearest point of presence in the Microsoft Global Network, not to the geographic location of the Office 365 tenant. In essence, this means that even though Office 365 tenant data may be stored in a specific geographic location, Office 365 experience for that tenant remains distributed and can be present in very close (network) proximity to every end user location that the tenant has.
  
## Office 365 connectivity principles
<a name="BKMK_Principles"> </a>

Microsoft recommends the following principles to achieve optimal Office 365 connectivity and performance. Use these Office 365 connectivity principles to manage your traffic and get the best performance when connecting to Office 365.
  
The primary goal in the network design should be to minimize latency by reducing the round-trip time (RTT) from your network into the Microsoft Global Network, Microsoft's public network backbone that interconnects all of Microsoft's datacenters with low latency and cloud application entry points spread around the world. You can learn more about the Microsoft Global Network at [How Microsoft builds its fast and reliable global network](https://azure.microsoft.com/en-us/blog/how-microsoft-builds-its-fast-and-reliable-global-network/).
  
<a name="BKMK_P1"> </a>
### Identify and differentiate Office 365 traffic

![Identify Office 365 traffic](media/621aaec9-971d-4f19-907a-1ae2ef6d72fc.png)
  
Identifying Office 365 network traffic is the first step in being able to differentiate that traffic from generic Internet-bound network traffic. Office 365 connectivity can be optimized by implementing a combination of approaches like network route optimization, firewall rules, browser proxy settings, and bypass of network inspection devices for certain endpoints.
  
Previous Office 365 optimization guidance divided Office 365 endpoints into two categories, **Required** and **Optional**. As endpoints have been added to support new Office 365 services and features, we have reorganized Office 365 endpoints into three categories: **Optimize**, **Allow** and **Default**. Guidelines for each category applies to all endpoints in the category, making optimizations easier to understand and implement.
  
For more details on Office 365 endpoint categories and optimization methods, see the [New Office 365 endpoint categories](office-365-network-connectivity-principles.md#BKMK_Categories) section.
  
Microsoft now publishes all Office 365 endpoints as a web service and provides guidance on how best to use this data. For more information on how to fetch and work with Office 365 endpoints, see the article [Office 365 URLs and IP address ranges](https://support.office.com/en-us/article/office-365-urls-and-ip-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2?ui=en-US&amp;rs=en-US&amp;ad=US).
  
<a name="BKMK_P2"> </a>
### Egress network connections locally

![Egress network connections locally](media/b42a45be-1ab4-4073-a7dc-fbdfb4aedd24.png)
  
Local DNS and Internet egress is of critical importance for reducing connection latency and ensuring that user connections are made to the nearest point of entry to Office 365 services. In a complex network topology, it is important to implement both local DNS and local Internet egress together. For more information about how Office 365 routes client connections to the nearest point of entry, see the article [Client Connectivity](https://support.office.com/en-us/article/client-connectivity-4232abcf-4ae5-43aa-bfa1-9a078a99c78b).
  
Prior to the advent of cloud services such as Office 365, end user Internet connectivity as a design factor in network architecture was relatively simple. When Internet services and web sites are distributed around the globe, latency between corporate egress points and any given destination endpoint is largely a function of geographical distance.
  
In a traditional network architecture, all outbound Internet connections traverse the corporate network, and egress from a central location. As Microsoft's cloud offerings have matured, a distributed Internet-facing network architecture has become critical for supporting latency-sensitive cloud services. The Microsoft Global Network was designed to accommodate latency requirements with the Distributed Service Front Door infrastructure, a dynamic fabric of global entry points that routes incoming cloud service connections to the closest entry point. This is intended to reduce the length of the "last mile" for Microsoft cloud customers by effectively shortening the route between the customer and the cloud.
  
Enterprise WANs are often designed to backhaul network traffic to a central company head office for inspection before egress to the Internet, usually through one or more proxy servers. The diagram below illustrates such a network topology.
  
![Traditional enterprise network model](media/fc87b8fd-a191-47a7-9704-1e445599813a.png)
  
Because Office 365 runs on the Microsoft Global Network, which includes front end servers around the world, there will often be a front-end server close to the user's location. By providing local Internet egress and by configuring internal DNS servers to provide local name resolution for Office 365 endpoints, network traffic destined for Office 365 can connect to Office 365 front end servers as close as possible to the user. The diagram below shows an example of a network topology that allows users connecting from main office, branch office and remote locations to follow the shortest route to the closest Office 365 entry point.
  
![WAN network model with regional egress points](media/4d4c07cc-a928-42b8-9a54-6c3741380a33.png)
  
Shortening the network path to Office 365 entry points in this way can improve connectivity performance and the end user experience in Office 365, and can also help to reduce the impact of future changes to the network architecture on Office 365 performance and reliability.
  
Also, DNS requests can introduce latency if the responding DNS server is distant or busy. You can minimize name resolution latency by provisioning local DNS servers in branch locations and making sure they are configured to cache DNS records appropriately.
  
While regional egress can work well for Office 365, the optimum connectivity model would be to always provide network egress at the user's location, regardless of whether this is on the corporate network or remote locations such as home, hotels, coffee shops and airports. This local direct egress model is represented in the diagram below.
  
![Local egress network architecture](media/6bc636b0-1234-4ceb-a45a-aadd1044b39c.png)
  
Enterprises who have adopted Office 365 can take advantage of the Microsoft Global Network's Distributed Service Front Door architecture by ensuring that user connections to Office 365 take the shortest possible route to the nearest Microsoft Global Network entry point. The local egress network architecture does this by allowing Office 365 traffic to be routed over the nearest egress, regardless of user location.
  
The local egress architecture has the following benefits over the traditional model:
  
- Provides optimal Office 365 performance by optimizing route length. End user connections are dynamically routed to the nearest Office 365 entry point by the Distributed Service Front Door infrastructure.
- Reduces the load on corporate network infrastructure by allowing local egress.
- Secures connections on both ends by leveraging client endpoint security and cloud security features.

<a name="BKMK_P3"> </a>
### Avoid network hairpins

![Avoid hairpins](media/ee53e8af-f57b-4292-a256-4f36733b263a.png)
  
As a general rule of thumb, the shortest, most direct route between user and closest Office 365 endpoint will offer the best performance. A network hairpin happens when WAN or VPN traffic bound for a particular destination is first directed to another intermediate location (such as security stack, cloud access broker, of cloud based web gateway), introducing latency and potential redirection to a geographically distant endpoint. Network hairpins can also be caused by routing/peering inefficiencies or suboptimal (remote) DNS lookups.
  
To ensure that Office 365 connectivity is not subject to network hairpins even in the local egress case, check whether the ISP that is used to provide Internet egress for the user location has a direct peering relationship with the Microsoft Global Network in close proximity to that location. You may also want to configure egress routing to send trusted Office 365 traffic directly, as opposed to proxying or tunneling through a third-party cloud or cloud-based network security vendor that processes your Internet-bound traffic. Local DNS name resolution of Office 365 endpoints helps to ensure that in addition to direct routing, the closest Office 365 entry points are being used for user connections.
  
If you use cloud-based network or security services for your Office 365 traffic, ensure that the hairpinning effect is evaluated and its impact on Office 365 performance is understood. This can be done by examining the number and locations of service provider locations through which the traffic is forwarded in relationship to number of your branch offices and Microsoft Global Network peering points, quality of the network peering relationship of the service provider with your ISP and Microsoft, and the performance impact of backhauling in the service provider infrastructure.
  
Due to the large number of distributed locations with Office 365 entry points and their proximity to end users, routing Office 365 traffic to any third party network or security provider can have an adverse impact on Office 365 connections if the provider network is not configured for optimal Office 365 peering.
  
<a name="BKMK_P4"> </a>
### Assess bypassing proxies, traffic inspection devices and duplicate security technologies

![Bypass proxies, traffic inspection devices and duplicate security technologies](media/0131930d-c6cb-4ae1-bbff-fe4cf6939a23.png)
  
Enterprise customers should review their network security and risk reduction methods specifically for Office 365 bound traffic and use Office 365 security features to reduce their reliance on intrusive, performance impacting, and expensive network security technologies for Office 365 network traffic.
  
Most enterprise networks enforce network security for Internet traffic using technologies like proxies, SSL inspection, packet inspection, and data loss prevention systems. These technologies provide important risk mitigation for generic Internet requests but can dramatically reduce performance, scalability and the quality of end user experience when applied to Office 365 endpoints.
  
<a name="BKMK_WebSvc"> </a>
#### Office 365 Endpoints web service

Office 365 administrators can use a script or REST call to consume a structured list of endpoints from the Office 365 Endpoints web service and update the configurations of perimeter firewalls and other network devices. This will ensure that traffic bound for Office 365 is identified, treated appropriately and managed differently from network traffic bound for generic and often unknown Internet web sites. For more information on how to use the Office 365 Endpoints web service, see the article [Office 365 URLs and IP address ranges](https://support.office.com/en-us/article/office-365-urls-and-ip-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2?ui=en-US&amp;rs=en-US&amp;ad=US).
  
#### PAC (Proxy Automatic Configuration) scripts
<a name="BKMK_WebSvc"> </a>

Office 365 administrators can create PAC (Proxy Automatic Configuration) scripts that can be delivered to user computers via WPAD or GPO. PAC scripts can be used to bypass proxies for Office 365 requests from WAN or VPN users, allowing Office 365 traffic to use direct Internet connections rather than traversing the corporate network.
  
#### Office 365 security features
<a name="BKMK_WebSvc"> </a>

Microsoft is transparent about datacenter security, operational security and risk reduction around Office 365 servers and the network endpoints that they represent. Office 365 built-in security features are available for reducing network security risk, such as Data Loss Prevention, Anti-Virus, Multi-Factor Authentication, Customer Lock Box, Advanced Threat Protection, Office 365 Threat Intelligence, Office 365 Secure Score, Exchange Online Protection, and Network DDOS Security.
  
For more information on Microsoft datacenter and Global Network security, see the [Microsoft Trust Center](https://www.microsoft.com/en-us/trustcenter/security).
  
## New Office 365 endpoint categories
<a name="BKMK_Categories"> </a>

Office 365 endpoints represent a varied set of network addresses and subnets. Endpoints may be URLs, IP addresses or IP ranges, and some endpoints are listed with specific TCP/UDP ports. URLs can either be a FQDN like  *account.office.net*  , or a wildcard URL like  *\*.office365.com*.
  
> [!NOTE]
> The locations of Office 365 endpoints within the network are not directly related to the location of the Office 365 tenant data. For this reason, customers should look at Office 365 as a distributed and global service and should not attempt to block network connections to Office 365 endpoints based on geographical criteria.
  
In our previous guidance for managing Office 365 traffic, endpoints were organized into two categories, **Required** and **Optional**. Endpoints within each category required different optimizations depending on the criticality of the service, and many customers faced challenges in justifying the application of the same network optimizations to the full list of Office 365 URLs and IP addresses.
  
In the new model, endpoints are segregated into three categories, **Optimize**, **Allow** and **Default**, providing a priority-based pivot on where to focus network optimization efforts to realize the best performance improvements and return on investment. The endpoints are consolidated in the above categories based on the sensitivity of the effective user experience to network quality, volume and performance envelope of scenarios and ease of implementation. Recommended optimizations can be applied the same way to all endpoints in a given category.
  
- **Optimize** endpoints are required for connectivity to every Office 365 service and represent over 75% of Office 365 bandwidth, connections and volume of data. These endpoints represent Office 365 scenarios that are the most sensitive to network performance, latency and availability. All endpoints are hosted in Microsoft datacenters. The rate of change to the endpoints in this category is expected to be much lower than for the endpoints in the other two categories. This category includes a very small (on the order of ~10) set of key URLs and a defined set of IP subnets dedicated to core Office 365 workloads such as Exchange Online, SharePoint Online, Skype for Business Online and Microsoft Teams.

    A condensed list of well defined critical endpoints should help you to plan and implement high value network optimizations for these destinations faster and easier.

    Examples of  *Optimize*  endpoints include  *https://outlook.office365.com*  ,  *https://\<tenant\>.sharepoint.com*  and  *https://\<tenant\>-my.sharepoint.com*  .

    Optimization methods include:

  - Bypass or whitelist  *Optimize*  endpoints on network devices and services that perform traffic interception, SSL decryption, deep packet inspection and content filtering.
  - Bypass on-premises proxy devices and cloud-based proxy services commonly used for generic Internet browsing.
  - Prioritize the evaluation of these endpoints as fully trusted by your network infrastructure and perimeter systems.
  - Prioritize reduction or elimination of WAN backhauling, and facilitate direct distributed Internet based egress for these endpoints as close to users/branch locations as possible.
  - Facilitate direct connectivity to these cloud endpoints for VPN users by implementing split tunneling.
  - Ensure that IP addresses returned by DNS name resolution match the routing egress path for these endpoints.
  - Prioritize these endpoints for SD-WAN integration for direct, minimal latency routing into the nearest Internet peering point of the Microsoft global network.

- **Allow** endpoints are required for connectivity to specific Office 365 services and features, but are not as sensitive to network performance and latency as those in the  *Optimize*  category. The overall network footprint of these endpoints from the standpoint of bandwidth and connection count is also significantly smaller. These endpoints are dedicated to Office 365 and are hosted in Microsoft datacenters. They represent a broad set of Office 365 micro-services and their dependencies (on the order of ~100 URLs) and are expected to change at a higher rate than those in the  *Optimize*  category. Not all endpoints in this category are associated with defined dedicated IP subnets.

    Network optimizations for  *Allow*  endpoints can improve the Office 365 user experience, but some customers may choose to scope those optimizations more narrowly to minimize changes to their network.

    Examples of *Allow* endpoints include *https://\*.protection.outlook.com* and *https://accounts.accesscontrol.windows.net*.

    Optimization methods include:

  - Bypass or whitelist  *Allow*  endpoints on network devices and services that perform traffic interception, SSL decryption, deep packet inspection and content filtering.
  - Prioritize the evaluation of these endpoints as fully trusted by your network infrastructure and perimeter systems.
  - Prioritize reduction or elimination of WAN backhauling, and facilitate direct distributed Internet based egress for these endpoints as close to users/branch locations as possible.
  - Ensure that IP addresses returned by DNS name resolution match the routing egress path for these endpoints.
  - Prioritize these endpoints for SD-WAN integration for direct, minimal latency routing into the nearest Internet peering point of the Microsoft global network.

- **Default** endpoints represent Office 365 services and dependencies that do not require any optimization, and can be treated by customer networks as normal Internet bound traffic. Note that some endpoints in this category may not be hosted in Microsoft datacenters. Examples include  *https://odc.officeapps.live.com*  and  *https://appexsin.stb.s-msn.com*.

For more information about Office 365 network optimization techniques, see the article [Managing Office 365 endpoints](https://support.office.com/en-us/article/managing-office-365-endpoints-99cab9d4-ef59-4207-9f2b-3728eb46bf9a#ID0EAEAAA=0._Overview).
  
## Comparing network perimeter security with endpoint security
<a name="BKMK_SecurityComparison"> </a>

The goal of traditional network security is to harden the corporate network perimeter against intrusion and malicious exploits. As organizations adopt Office 365, some network services and data are partly or completely migrated to the cloud. As does any fundamental change to network architecture, this process requires a reevaluation of network security that takes emerging factors into account:
  
- As cloud services are adopted, network services and data are distributed between on-premises datacenters and the cloud, and perimeter security is no longer adequate on its own.
- Remote users connect to corporate resources both in on-premises datacenters and in the cloud from uncontrolled locations such as homes, hotels and coffee shops.
- Purpose-built security features are increasingly built into cloud services and can potentially supplement or replace existing security systems.

Microsoft offers a wide range of Office 365 security features and provides prescriptive guidance for employing security best practices that can help you to ensure data and network security for Office 365. Recommended best practices include the following:
  
- **Use multi-factor authentication (MFA)**
    MFA adds an additional layer of protection to a strong password strategy by requiring users to acknowledge a phone call, text message, or an app notification on their smart phone after correctly entering their password.

- **Use Microsoft Cloud App Security**
    Set up policies to track anomalous activity and act on it. Set up alerts with Microsoft Cloud App Security so that admins can review unusual or risky user activity, such as downloading large amounts of data, multiple failed sign-in attempts, or connections from a unknown or dangerous IP addresses.

- **Configure Data Loss Prevention (DLP)**
    DLP allows you to identify sensitive data and create policies that help prevent your users from accidentally or intentionally sharing the data. DLP works across Office 365 including Exchange Online, SharePoint Online, and OneDrive so that your users can stay compliant without interrupting their workflow.

- **Use Customer Lockbox**
    As an Office 365 admin, you can use Customer Lockbox to control how a Microsoft support engineer accesses your data during a help session. In cases where the engineer requires access to your data to troubleshoot and fix an issue, Customer Lockbox allows you to approve or reject the access request.

- **Use Office 365 Secure Score**
    Secure Score is a security analytics tool that recommends what you can do to further reduce risk. Secure Score looks at your Office 365 settings and activities and compares them to a baseline established by Microsoft. You'll get a score based on how aligned you are with best security practices.

A holistic approach to enhanced security should include consideration of the following:
  
- Shift emphasis from perimeter security towards endpoint security by applying cloud-based and Office client security features.
  - Shrink the security perimeter to the datacenter
  - Enable equivalent trust for user devices inside the office or at remote locations
  - Focus on securing the data location and the user location
  - Managed user machines have higher trust with endpoint security
- Manage all information security holistically, not focusing solely on the perimeter
  - Redefine WAN and building perimeter network security by allowing trusted traffic to bypass security devices and separating unmanaged devices to guest Wi-Fi networks.
  - Reduces network security requirements of the corporate WAN edge
  - Some network perimeter security devices such as firewalls are still required, but load is decreased
  - Ensures local egress for Office 365 traffic
- Improvements can be addressed incrementally as described in the [Incremental optimization](office-365-network-connectivity-principles.md#BKMK_IncOpt) section. Some optimization techniques may offer better cost/benefit ratios depending on your network architecture, and you should choose optimizations that make the most sense for your organization.

For more information on Office 365 security and compliance, see the article [Overview of security and compliance in Office 365](https://support.office.com/en-us/article/overview-of-security-and-compliance-in-office-365-dcb83b2c-ac66-4ced-925d-50eb9698a0b2?ui=en-US&amp;rs=en-US&amp;ad=US).
  
## Incremental optimization
<a name="BKMK_IncOpt"> </a>

We have represented the ideal network connectivity model for SaaS earlier in this article, but for many large organizations with historically complex network architectures, it will not be practical to directly make all of these changes. In this section, we discuss a number of incremental changes that can help to improve Office 365 performance and reliability.
  
The methods you will use to optimize Office 365 traffic will vary depending on your network topology and the network devices you have implemented. Large enterprises with many locations and complex network security practices will need to develop a strategy that includes most or all of the principles listed in the [Office 365 connectivity principles](office-365-network-connectivity-principles.md#BKMK_Principles) section, while smaller organizations might only need to consider one or two.
  
You can approach optimization as an incremental process, applying each method successively. The following table lists key optimization methods in order of their impact on latency and reliability for the largest number of users.
  
|**Optimization method**|**Description**|**Impact**|
|:-----|:-----|:-----|
|Local DNS resolution and Internet egress  <br/> |Provision local DNS servers in each location and ensure that Office 365 connections egress to the Internet as close as possible to the user's location.  <br/> | Minimize latency  <br/>  Improve reliable connectivity to the closest Office 365 entry point  <br/> |
|Add regional egress points  <br/> |If your corporate network has multiple locations but only one egress point, add regional egress points to enable users to connect to the closest Office 365 entry point.  <br/> | Minimize latency  <br/>  Improve reliable connectivity to the closest Office 365 entry point  <br/> |
|Bypass proxies and inspection devices  <br/> |Configure browsers with PAC files that send Office 365 requests directly to egress points.  <br/> Configure edge routers and firewalls to permit Office 365 traffic without inspection.  <br/> | Minimize latency  <br/>  Reduce load on network devices  <br/> |
|Enable direct connection for VPN users  <br/> |For VPN users, enable Office 365 connections to connect directly from the user's network rather than over the VPN tunnel by implementing split tunneling.  <br/> | Minimize latency  <br/>  Improve reliable connectivity to the closest Office 365 entry point  <br/> |
|Migrate from traditional WAN to SD-WAN  <br/> |SD-WANs (Software Defined Wide Area Networks) simplify WAN management and improve performance by replacing traditional WAN routers with virtual appliances, similar to the virtualization of compute resources using virtual machines (VMs).  <br/> | Improve performance and manageability of WAN traffic  <br/>  Reduce load on network devices  <br/> |

## Related Topics

[Office 365 Network Connectivity Overview](office-365-networking-overview.md)

[Managing Office 365 endpoints](managing-office-365-endpoints.md)

[Office 365 URLs and IP address ranges](urls-and-ip-address-ranges.md)

[Office 365 IP Address and URL Web service](office-365-ip-web-service.md)

[Assessing Office 365 network connectivity](assessing-network-connectivity.md)

[Office 365 network and performance tuning](network-planning-and-performance.md)

[Assessing Office 365 network connectivity](assessing-network-connectivity.md)

[Office 365 performance tuning using baselines and performance history](performance-tuning-using-baselines-and-history.md)

[Performance troubleshooting plan for Office 365](performance-troubleshooting-plan.md)

[Content Delivery Networks](content-delivery-networks.md)

[Office 365 Network Onboarding tool](https://aka.ms/netonboard)

[How Microsoft builds its fast and reliable global network](https://azure.microsoft.com/en-us/blog/how-microsoft-builds-its-fast-and-reliable-global-network/)

[Office 365 Networking blog](https://techcommunity.microsoft.com/t5/Office-365-Networking/bd-p/Office365Networking)
