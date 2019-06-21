---
title: "Accessible diagram - Microsoft Exchange 2013 Platform Options"
ms.author: josephd
author: JoeDavies-MSFT
ms.date: 12/15/2017
audience: ITPro
ms.topic: article
ms.collection: Ent_O365
ms.service: o365-solutions
localization_priority: Normal
ms.assetid: 129f4e45-647e-4cf1-92a6-4d86d8396e73
description: "This article is an accessible text version of the diagram named Microsoft Exchange 2013 Platform Options, which is available at Technical Diagrams."
---

# Accessible diagram - Microsoft Exchange 2013 Platform Options

**Summary:** This article is an accessible text version of the diagram named Microsoft Exchange 2013 Platform Options, which is available at [Technical Diagrams](http://go.microsoft.com/fwlink/?LinkID=519139&amp;clcid=0x409).
  
This poster describes what business decision makers (BDMs) and architects need to know about Exchange Online and Exchange Server deployments and includes: 
  
- A comparison of four available platform options for Exchange 2013: Exchange Online (Office 365), Exchange Hybrid, Exchange Server on-premises, and Provider-Hosted Exchange. 
    
- Descriptions of three new or updated features in Exchange 2013. 
    
## Comparison of four different deployments for the Exchange 2013 platform

The comparison provides information about each deployment option in the following areas: 
  
- An overview of the different deployment features 
    
- Benefits of implementing each deployment option 
    
- Licensing requirements 
    
- Required architectural tasks 
    
- IT Pro responsibilities for implementing each deployment option 
    
### Overview

#### Exchange Online (Office 365)

You gain efficiency and reduce costs with Office 365.
  
The accompanying diagram shows Exchange Online with an Azure Active Directory tenant which synchronizes account names and passwords between the on-premises Active Directory Domain Services (AD DS) environment and the Azure Active Directory tenant. Active Directory Federation Services (AD FS) is necessary for single sign-on. 
  
Description of features and functionality:
  
- The operation of servers and server software is handled by Microsoft.
    
- Rich feature set of Exchange Server 2013 as a cloud-based service.
    
- Always up-to-date with the newest features.
    
- Exchange Online Protection (EOP) is included for anti-spam/anti-malware protection.
    
- Built-in high availability with a 99.9% Service Level Agreement (SLA).
    
- Directory synchronization including passwords between the on-premises Active Directory Domain Services (AD DS) and the Azure Active Directory tenant. Active Directory Federation Services (AD FS) is necessary for single sign-on.
    
#### Exchange Hybrid

You can leverage the benefits of Office 365 while maintaining Exchange Server on-premises.
  
The accompanying diagram shows Office 365 with Exchange Online where some users are homed on-premises and some users are homed online. It also shows an Azure Active Directory tenant which synchronizes account names and passwords between the on-premises Active Directory Domain Services (AD DS) environment and the Azure Active Directory tenant.
  
Description of features and functionality:
  
- Some users are homed on-premises and some users are homed online, and users share the same e-mail address space.
    
- Leverages your existing Exchange Server infrastructure.
    
- Migrate from Exchange on-premises to Exchange Online over time, on your schedule.
    
- Integrate with other Office 365 applications, including Lync Online and SharePoint Online.
    
#### Exchange Server on-premises

You can design and manage your own Exchange Server 2013 infrastructure.
  
The accompanying diagram shows an Exchange Server infrastructure with an on-premises Active Directory Domain Services (AD DS) environment where users are homed on-premises.
  
Description of features and functionality:
  
- Greatest degree of control and customization for your configuration.
    
- No dependency on maintaining session affinity at the load balancing layer.
    
- Simple high availability and site resilience using database availability groups (DAGs).
    
- Managed availability that helps you maintain a great user experience.
    
- Leverage existing hardware and storage infrastructure.
    
#### Provider-Hosted Exchange

You can outsource your Exchange Server workload to an Exchange Server solutions provider.
  
The accompanying diagram shows an Exchange Server environment that is operated and maintained by a provider.
  
Description of features and functionality:
  
- The operation of servers and server software is handled by your provider.
    
- Planning, sizing, scaling, and maintenance of the Exchange Server infrastructure are delegated to your provider.
    
- Service maintenance is handled by your provider.
    
- The Exchange feature set is limited to the software version deployed by your provider.
    
### Benefits of implementing each deployment option

#### Exchange Online (Office 365)

This deployment option is best for:
  
- Organizations looking to reduce operations costs for on-premises Exchange deployments.
    
- Organizations that plan to leverage other Office 365 offerings, such as SharePoint Online and Lync Online.
    
#### Exchange Hybrid

This deployment option is best for:
  
- Facilitating a migration from Exchange on-premises to Exchange Online.
    
- Supporting remote sites without investing in branch office infrastructure.
    
- Multinational corporations with subsidiaries that require data to reside on-premises.
    
#### Exchange Server on-premises

This deployment option is best for:
  
- Highly customized solutions.
    
- Legacy solutions with third-party components that depend on hardware and software that are not supported by Exchange Online.
    
- Organizations subject to data governance regulations that require data to reside on-premises.
    
- Organizations that wish to retain control of the entire platform and solution.
    
#### Provider-Hosted Exchange

This deployment option is best for:
  
- Organizations that need Exchange Server functionality, but want to outsource its deployment and maintenance.
    
- Organizations that need personalized support options.
    
- Customized solutions and integration with custom applications offered by the provider.
    
- Legacy solutions with third-party components that depend on hardware and software that are not supported by Exchange Online.
    
### License requirements

The following table details the license requirements for each deployment option.
  
|**Deployment option**|**License requirements**|
|:-----|:-----|
|Exchange Online (Office 365)  <br/> |Subscription model  <br/> |
|Exchange Hybrid  <br/> | Office 365 - Subscription model <br/>  On-premises - All on-premises licenses apply (review licenses for Exchanges Server on-premises) <br/>  Hybrid server license* <br/> |
|Exchange Server on-premises  <br/> | Server Operating System <br/>  Exchange 2013 Server License <br/>  Exchange 2013 Client Access License <br/> |
|Provider-Hosted Exchange  <br/> |Costs are based on the agreement with the provider  <br/> |
   
### Architecture tasks

This section lists the architectural tasks for each deployment option.
  
#### Exchange Online (Office 365)

- Plan and design the directory synchronization.
    
- Ensure network capacity and connectivity through firewalls, proxy servers, gateways, and across WAN links.
    
#### Exchange Hybrid

In addition to the architecture tasks for both the Office 365 and on-premises environments:
  
- Decide whether to provide a single-sign on experience.
    
- Decide whether to route inbound Internet mail through an on-premises organization or through Exchange Online Protection.
    
#### Exchange Server on-premises

- Design the Exchange topology.
    
- Plan the capacity for server hardware.
    
- Design the message routing topology.
    
- Design load balancing for Client Access servers.
    
- Plan for high availability using database availability groups.
    
#### Provider-Hosted Exchange

Ensure that the network capacity and availability through firewalls, proxy servers, gateways, and across WAN links are available to your provider.
  
### IT Pro responsibilities

This section lists the IT Pro responsibilities for each deployment option.
  
#### Exchange Online (Office 365)

- Implement the directory synchronization plan.
    
- Plan and implement internal and external DNS records and routing.
    
- Configure the proxy server or firewall for the Office 365 IP address and URL requirements.
    
- Administer the user accounts and the Exchange Online settings.
    
#### Exchange Hybrid

In addition to the IT Pro responsibilities for both the Office 365 and on-premises environments:
  
- Configure Active Directory Federation Services (AD FS) for single-sign on (if desired).
    
- Configure Exchange certificates for secure communications between Exchange 2013 servers and Office 365.
    
- Configure DNS records for the desired inbound Internet mail path.
    
#### Exchange Server on-premises

- Configure the necessary certificates for Exchange services.
    
- Provision the servers.
    
- Implement the Exchange message routing topology.
    
- Implement database availability groups.
    
- Update and maintain Exchange servers.
    
- Depending on utilization, add or remove servers as needed.
    
#### Provider-Hosted Exchange

The provider's responsibilities include:
  
- System and service maintenance.
    
- Feature rollouts.
    
- Data protection and disaster recovery.
    
The IT staff's responsibilities in your organization include creating and managing user accounts.
  
#### More information

To learn more about Exchange Online (Office 365), see the following:
  
- [Exchange Online service description](https://aka.ms/EXOSD)
    
- [Exchange Online library on TechNet](https://aka.ms/EXOTN)
    
- [Exchange Online portal](https://aka.ms/EXO)
    
To learn more about Exchange Hybrid, see the following:
  
- [Exchange 2013 hybrid deployments](https://aka.ms/ExchangeHybrid). You should note that the Hybrid server license is only required for the following scenarios: Exchange 2010 organization with Exchange 2013 hybrid server and Exchange 2007 organization with Exchange 2013 or Exchange 2010 hybrid server.
    
- [Office 365 Sign in](https://aka.ms/HybridKey)
    
To learn more about Exchange Server on-premises, see the following:
  
- [Exchange Server 2013 library on TechNet](https://aka.ms/Ex2013TN)
    
- [Exchange Server 2013 portal](https://aka.ms/Exchange2013)
    
- [Exchange Server 2013 architecture](https://aka.ms/Ex2013SP1ArchPoster)
    
To learn more about Provider-Hosted Exchange, see the following:
  
[Exchange Server 2013 hosting and multi-tenancy solutions and guidance](https://aka.ms/Ex2013Hosting)
  
## Descriptions of three new or updated features in Exchange 2013

### Exchange Online Protection

Exchange Online Protection (EOP) provides anti-spam and anti-malware protection for any deployment by providing a layer of protection features that are deployed across a global network of data centers. This helps you to simplify the management of your messaging environments. EOP is included in Exchange Online subscriptions, but you can also leverage it for hybrid and on-premises deployments.
  
The accompanying diagrams show deployments for Exchange Online, Exchange Hybrid, and Exchange on-premises that include the EOP layer in the global network.
  
### Exchange Server Deployment Assistant

The Exchange Server Deployment Assistant is a web-based tool that asks you a few questions about your current environment, and then generates a custom step-by-step checklist to help you deploy Exchange Server for different types of scenarios. Whether you are migrating from a previous version of Exchange to Exchange 2013, migrating to Exchange Online, or planning a hybrid infrastructure, the Exchange Server Deployment Assistant creates a customized deployment checklist for your scenario.
  
The accompanying screenshot shows an example checklist that was created using the Exchange Server Deployment Assistant.
  
### Integration with Lync and SharePoint

Exchange Server 2013 includes many features that integrate with Lync Server 2013 and SharePoint Server 2013. Together, these products offer a rich suite of features and improve collaboration across your organization. 
  
An accompanying diagram shows the Server-to-Server Authentication poster and includes a link to the poster. 
  
- Archiving, hold and eDiscovery
    
- Site mailboxes
    
- Unified contact store
    
- High-resolution user photos
    
- Lync presence in Outlook and Outlook Web App
    
- Server-to-server authentication
    
- Voicemail
    
- Meeting recordings
    
- Exchange task synchronization
    
An accompanying diagram shows the Exchange Server 2013 SP1 Architecture poster and includes a link to the poster.
  

