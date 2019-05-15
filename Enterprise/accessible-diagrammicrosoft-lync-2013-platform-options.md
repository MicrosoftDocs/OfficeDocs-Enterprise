---
title: "Accessible diagram - Microsoft Lync 2013 Platform Options"
ms.author: josephd
author: JoeDavies-MSFT
ms.date: 12/15/2017
audience: ITPro
ms.topic: article
ms.collection: Ent_O365
ms.service: o365-solutions
localization_priority: Normal
ms.assetid: 2858d1e7-be37-4484-b121-a99779742a38
description: "This article is an accessible text version of the diagram named Microsoft Lync 2013 Platform Options, which is available at Technical Diagrams."
---

# Accessible diagram - Microsoft Lync 2013 Platform Options

**Summary:** This article is an accessible text version of the diagram named Microsoft Lync 2013 Platform Options, which is available at [Technical Diagrams](http://go.microsoft.com/fwlink/?LinkID=519139&amp;clcid=0x409).
  
This poster describes what business decision makers (BDMs) and architects need to know about Lync Online (Office 365) and Lync Server deployments and includes:
  
- A comparison of four different deployment options: Lync Online (Office 365), Lync Online/Server Hybrid, Lync Server, and Provider-Hosted Lync Server. 
    
- Two example scenarios for deploying Lync 2013.
    
## Comparison of four different deployments for the Lync 2013 platform

The comparison provides information about each deployment option in the following areas: 
  
- An overview of the different deployment features
    
- Benefits of implementing each deployment option
    
- Licensing requirements
    
- Required architectural tasks
    
- IT Pro responsibilities for implementing each deployment option
    
### Overview

#### Lync Online (Office 365)

You gain efficiency and optimize for cost with Office 365 multitenant plans.
  
The accompanying diagram shows Lync Online with an Azure Active Directory tenant, which synchronizes account names and passwords between the on-premises Active Directory Domain Services (AD DS) environment and the Azure Active Directory tenant. 
  
Description of features and functionality:
  
- Software as a Service (SaaS).
    
- Rich feature set that is always up to date.
    
- Includes an Azure Active Directory tenant for online accounts, which can be used with other applications. 
    
- Directory integration includes synchronizing account names and passwords between the on-premises Active Directory Domain Services (AD DS) environment and the Azure Active Directory tenant.
    
- If single sign-on (SSO) is a requirement, Active Directory Federation Services (AD FS) must be implemented. 
    
- Client communication over the Internet is encrypted and authenticated.
    
- Legacy phone equipment, public switched telephone network (PSTN), connectivity is available through third-party providers.
    
#### Lync Online/Server Hybrid (split domain)

You can combine the benefits of Office 365 with an on-premises deployment of Lync 2013.
  
The accompanying diagram shows Office 365 with Lync Online where some users are homed on-premises and some users are homed online. An Edge Server that is deployed on-premises is also shown.
  
Description of features and functionality:
  
- Some users are homed on premises and some users are homed online, but the users share the same SIP domain (such as contoso.com).
    
- Leverage your existing Lync Server 2013 infrastructure, including the connections to the PSTN.
    
- Add new Lync Online users easily when they do not require PSTN.
    
- Migrate from Lync on-premises to Lync Online over time, on your schedule.
    
- Integrate with other Office 365 applications, including Exchange Online and SharePoint Online.
    
#### Lync Server

In this deployment, you own everything. The accompanying diagram shows a Lync Server infrastructure with an on-premises Active Directory Domain Services (AD DS) environment where users are homed on-premises.
  
Description of features and functionality:
  
- Capacity planning and sizing.
    
- Server acquisition and setup.
    
- Deployment.
    
- Scaling out, patching, and operations.
    
- Backing up data.
    
- Maintaining failover and disaster recovery.
    
- Connecting your Lync Server 2013 infrastructure to the PSTN.
    
- Integration with existing phone equipment, such as private branch exchanges (PBXs).
    
#### Provider-Hosted Lync Server

In this deployment, your provider owns everything. The accompanying diagram shows a provider's network including their servers and equipment with a connection to an on-premises environment.
  
Description of features and functionality:
  
- Capacity planning and sizing.
    
- Server acquisition and setup.
    
- Deployment.
    
- Scaling out, patching, and operations.
    
- Backing up data.
    
- Maintaining failover and disaster recovery.
    
- Integration with existing phone equipment, such as private branch exchanges (PBXs).
    
- In addition, the provider can:
    
  - Install their servers and equipment in their own network with a connection to your premises (solid line).
    
  - Install their servers on your premises (dotted line).
    
### Benefits of implementing each deployment option

#### Lync Online (Office 365)

- No operational burden of on-premises servers or server software.
    
- Communication capabilities of Lync Server 2013 as a cloud-based service.
    
- Lync presence, instant messaging, audio and video calling, rich online meetings, and extensive web conferencing capabilities.
    
- Used with geographically-dispersed organizations or with primarily mobile employees.
    
#### Lync Online/Server Hybrid (split domain)

- Use Lync Online for remote users and integration with business partners.
    
- Facilitate a migration from Lync on-premises to Lync Online.
    
- Support remote sites without using a branch office appliance.
    
- Ease of adding Lync support for new business acquisitions.
    
#### Lync Server

- Private cloud solutions.
    
- Highly customized solutions.
    
- Legacy solutions with third-party components that depend on hardware and software that are not supported by Lync Online.
    
- Privacy restrictions that prevent synchronization of AD DS accounts with Office 365.
    
- Organizations that desire control of the entire platform and solution.
    
- PBX replacement with Lync Enterprise Voice.
    
#### Provider-Hosted Lync Server

- Organizations that want Lync Server functionality but want to outsource its deployment and maintenance.
    
- Provider-based solutions.
    
- Highly customized solutions.
    
- Legacy solutions with third-party components that depend on hardware and software that are not supported by Lync Online.
    
- PBX replacement with Lync Enterprise Voice.
    
### License requirements

#### Lync Online (Office 365)

Subscription model.
  
#### Lync Online/Server Hybrid (split domain)

- Office 365 — Subscription model. No additional licenses needed. 
    
- On-premises — All on-premises licenses apply. 
    
#### Lync Server

- Server Operating System
    
- SQL Server
    
- Lync 2013 Server License
    
- Lync 2013 Client Access License
    
#### Provider-Hosted Lync Server

Costs are based on the agreement with your Lync solution provider.
  
### Architecture tasks

This section lists the architectural tasks for each deployment option.
  
#### Lync Online (Office 365)

- Plan and design directory synchronization.
    
- Ensure network capacity and availability through firewalls, proxy servers, gateways, and across WAN links.
    
- Acquire third-party SSL certificates to provide enterprise-security for Office 365 service offerings.
    
- Decide if you want to connect to Office 365 with Internet Protocol version 6 (IPv6).
    
#### Lync Online/Server Hybrid (split domain)

In addition to tasks for both the Office 365 and on-premises environments:
  
- Determine how much feature integration you want to use with on-premises and online versions of Exchange Server and SharePoint.
    
- If required, determine which proxy server device will be used for requests from Office 365.
    
#### Lync Server

Design the Lync environment in an existing on-premises environment:
  
- Lync topology for central and branch offices.
    
- Server hardware, including virtualization.
    
- Integration with Active Directory Domain Services (AD DS) and DNS.
    
- Load balancing for Lync server pools.
    
- Failover and disaster recovery.
    
#### Provider-Hosted Lync Server

- For a cloud-based installation, determine the connection to the service provider's network.
    
- For an on-premises installation, determine the placement of the provider's Lync servers on your network.
    
- For both types, determine the integration with AD DS and your PBX equipment.
    
### IT Pro responsibilities

This section lists the IT Pro responsibilities for each deployment option.
  
#### Lync Online (Office 365)

Deploy and manage Lync Online (Office 365):
  
- Implement the directory synchronization plan.
    
- Plan and implement internal and external DNS records and routing.
    
- Configure your proxy or firewall for Office 365 IP address and URL requirements.
    
- Administer user accounts and Lync Online settings.
    
#### Lync Online/Server Hybrid (split domain)

In addition to tasks for both the Office 365 and on-premises environments:
  
- Configure the proxy server device, if required.
    
- Configure the integration of features with on-premises and online versions of Exchange Server and SharePoint.
    
#### Lync Server

Deploy and manage Lync Server in an on-premises environment:
  
- Provision the servers.
    
- Deploy the Lync topology.
    
- Update Lync servers.
    
- Add or remove topology servers as needed based on utilization.
    
- Implement the failover and disaster recovery environment.
    
#### Provider-Hosted Lync Server

Work with the provider to:
  
- Integrate Lync Server into your network.
    
- Integrate Lync Server with other Microsoft products or custom solutions.
    
- Monitor adherence with provider service level agreement (SLA).
    
## Two example scenarios for deploying Lync 2013

### Directory Synchronization components in Microsoft Azure

Deploying Office 365 directory synchronization components in Azure is faster due to the ability to deploy virtual machines on-demand.
  
The accompanying diagram shows Lync Online with an Azure Active Directory tenant, which synchronizes account names and passwords between the on-premises Active Directory environment and the Azure Active Directory tenant.
  
 **Directory synchronization server only**. Instead of deploying the 64-bit directory synchronization server in your on-premises environment, you provision a virtual machine in Azure over the Internet.
  
 **Directory synchronization + AD FS**. This option allows you to support Office 365 federated identities (SSO) without adding hardware to your on-premises infrastructure. It also provides resiliency if the on-premises Active Directory environment is unavailable. The features of this option include:
  
- Directory integration components run as Azure virtual machines.
    
- AD FS is published to the Internet through AD FS proxies running as Azure virtual machines.
    
- Client authentication traffic, for users that are connecting from any location, is handled by AD FS servers and proxies that are deployed as Azure virtual machines.
    
### Lync integration with Exchange and SharePoint in Office 365

#### Lync Server with Exchange Online and SharePoint Online

The accompanying diagram shows Office 365 with Exchange Online and SharePoint Online connected to an on-premises Lync Server 2013 farm.
  
The advantages of this deployment allow you to:
  
- Use the full feature set of Lync Server 2013.
    
- Leverage your existing on-premises phone equipment, such as PBXs.
    
- Use Exchange Online for email, off-loading the burden of on-premises email servers and storage.
    
- Use SharePoint Online for collaboration, off-loading the burden of maintaining on-premises SharePoint servers.
    
- Use Lync, Exchange, and SharePoint integrated features, including Unified Messaging (UM) in Office 365.
    
#### Exchange Server with Lync Online

The accompanying diagram shows Office 365 with Lync Online connected to an on-premises Exchange Server farm.
  
The advantages of this deployment allow you to:
  
- Leverage your existing Exchange infrastructure.
    
- Use Lync Online for presence, instant messaging, and conferencing capabilities.
    

