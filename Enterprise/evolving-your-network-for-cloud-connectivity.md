---
title: "Evolving your network for cloud connectivity"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 11/28/2018
ms.audience: ITPro
ms.topic: conceptual
ms.service: o365-solutions
localization_priority: Normal
search.appverid:
- MET150
ms.collection: Ent_O365
ms.custom: Ent_Architecture
ms.assetid: 83e2859a-c673-47c4-880a-01cdfdadb93e
description: "Summary: Understand how cloud adoption requires a new approach to network infrastructure investments."
---

# Evolving your network for cloud connectivity

 **Summary:** Understand how cloud adoption requires a new approach to network infrastructure investments.
  
Cloud migration changes the volume and nature of traffic flows within and outside a corporate network. It also affects approaches to mitigating security risk.
  
- Before the cloud
    
    Most networking infrastructure investments were spent on ensuring available, reliable, and performant connectivity to on-premises datacenters. For many organizations, Internet connectivity was not critical for internal business operations. Network boundaries were primary defenses against security breaches.
    
- After the cloud
    
    With new and migrated productivity and IT workloads running in the cloud, infrastructure investments shift from on-premises datacenters to Internet connectivity, which is now critical for internal business operations. Federated connectivity shifts security strategy to protecting identities and data as they flow through the network and points of connectivity to Microsoft cloud services.
    
Network infrastructure investments begin with connectivity. Additional investments depend on the category of cloud service.
  
- **Software as a Service (SaaS)** Microsoft SaaS services include Office 365, Microsoft Intune, and Microsoft Dynamics 365. Successful adoption of SaaS services by users depends on highly-available and performant connectivity to the Internet, or directly to Microsoft cloud services.
    
    Network architecture focuses on reliable, redundant connectivity and ample bandwidth. Ongoing investments include performance monitoring and tuning.
    
- **Azure Platform as a Service (PaaS)** In addition to the investments for Microsoft SaaS services, multi-site or geographically distributed PaaS applications might require architecting Azure Traffic Manager to distribute client traffic. Ongoing investments include performance and traffic distribution monitoring and failover testing.
    
- **Azure Infrastructure as a Service (IaaS)** In addition to the investments for Microsoft SaaS and PaaS services, running IT workloads in IaaS requires the design and configuration of Azure virtual networks that host virtual machines, secure connectivity to applications running on them, routing, IP addressing, DNS, and load balancing. Ongoing investments include performance and security monitoring and troubleshooting.

[Microsoft 365](https://www.microsoft.com/microsoft-365) is a combination of Office 365, Enterprise Management + Security (EMS), and Windows 10. Microsoft 365 combines multiple SaaS and Azure services for a complete, intelligent solution that empowers everyone to be creative and work together securely.
    
## Areas of networking investment for success in the cloud

Enterprise organizations benefit from taking a methodical approach to optimizing network throughput across your intranet and to the Internet. You might also benefit from an ExpressRoute connection.
  
### Optimize intranet connectivity to your edge network

Over the years, many organizations have optimized intranet connectivity and performance to applications running in on-premises datacenters. With productivity and IT workloads running in the Microsoft cloud, additional investment must ensure high connectivity availability and that traffic performance between your edge network and your intranet users is optimal.
  
### Optimize throughput at your edge network

As more of your day-to-day productivity traffic travels to the cloud, you should closely examine the set of systems at your edge network to ensure that they are current, provide high availability, and have sufficient capacity to meet peak loads.
  
### For a high SLA to Azure, Office 365, and Dynamics 365, use ExpressRoute

Although you can use your current Internet connection from your edge network, traffic to and from Microsoft cloud services must share the pipe with other intranet traffic going to the Internet. Additionally, your traffic to Microsoft cloud services is subject to Internet traffic congestion.
  
For a high SLA and the best performance, use ExpressRoute, a dedicated WAN connection between your network and Azure, Office 365, Dynamics 365, or all three. 
  
ExpressRoute can leverage your existing network provider for a dedicated connection. Resources connected by ExpressRoute appear as if they are on your WAN, even for geographically-distributed organizations.
  
For more information, see [ExpressRoute for Microsoft cloud connectivity](expressroute-for-microsoft-cloud-connectivity.md).
  
## Scope of network investments

The scope of network investments depend on the category of cloud service. Investing across Microsoft's cloud maximizes the investments of networking teams. For example, investments for IaaS services apply to all investment areas.
  
|||||
|:-----|:-----|:-----|:-----|
|Investment area  <br/> |SaaS  <br/> |PaaS  <br/> |IaaS  <br/> |
|Architect reliable, redundant Internet connectivity with ample bandwidth  <br/> |Applies  <br/> |Applies  <br/> |Applies  <br/> |
|Monitor and tune Internet throughput for performance  <br/> |Applies  <br/> |Applies  <br/> |Applies  <br/> |
|Troubleshoot Internet connectivity and throughput issues  <br/> |Applies  <br/> |Applies  <br/> |Applies  <br/> |
|Design Azure Traffic Manager to load balance traffic to different endpoints  <br/> ||Applies  <br/> |Applies  <br/> |
|Architect reliable, redundant, and performant connectivity to Azure virtual networks  <br/> |||Applies  <br/> |
|Design secure connectivity to Azure virtual machines  <br/> |||Applies  <br/> |
|Design and implement routing between on-premises locations and virtual networks  <br/> |||Applies  <br/> |
|Architect and implement load balancing for internal and Internet-facing IT workloads  <br/> |||Applies  <br/> |
|Troubleshoot virtual machine connectivity and throughput issues  <br/> |||Applies  <br/> |
   
## Next step

[Common elements of Microsoft cloud connectivity](common-elements-of-microsoft-cloud-connectivity.md)

## See also

[Microsoft Cloud Networking for Enterprise Architects](microsoft-cloud-networking-for-enterprise-architects.md)
  
[Microsoft Cloud IT architecture resources](microsoft-cloud-it-architecture-resources.md)



