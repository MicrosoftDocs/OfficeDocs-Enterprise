---
title: "Accessible diagram - Microsoft SharePoint 2013 Platform Options"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 12/15/2017
audience: ITPro
ms.topic: article
ms.collection: Ent_O365
ms.service: o365-solutions
localization_priority: Normal
ms.assetid: b88200bf-ced0-4ae6-bbe5-5517377d1be1
description: "This article is an accessible text version of the diagram named Microsoft SharePoint 2013 Platform Options."
---

# Accessible diagram - Microsoft SharePoint 2013 Platform Options

**Summary:** This article is an accessible text version of the diagram named Microsoft SharePoint 2013 Platform Options.
  
What business decision makers (BDMs) and architects need to know about Office 365, Microsoft Azure, and on-premises deployments. 
  
This poster has two sections: 
  
- A comparison of four different deployments for SharePoint 2013: SharePoint in Office 365, a hybrid of Office 365 with an on-premises deployment of SharePoint 2013, Azure, and an on-premises deployment of SharePoint 2013. 
    
- A description of three typical workloads to move to Azure. 
    
## Comparison of four different deployments for the SharePoint 2013 platform

The comparison provides information about each deployment option related to the following areas: 
  
- An overview of the different deployment features 
    
- What each type of deployment is best for 
    
- License requirements 
    
- Architecture tasks required to implement 
    
- IT pro responsibilities for implementation 
    
### Overview

#### SharePoint 2013 in Office 365

Gain efficiency and optimize for cost with Office 365 multitenant plans. 
  
The accompanying diagram shows SharePoint Online with an Azure Active Directory tenant, which synchronizes account names and passwords between the on-premises Active Directory environment and the Azure Active Directory tenant. 
  
Description of features: 
  
- Software as a Service (SaaS). 
    
- Rich feature set is always up to date. 
    
- Includes an Azure Active Directory tenant (can be used with other applications). 
    
- Directory integration includes synchronizing account names and passwords between the on-premises Active Directory environment and the Azure Active Directory tenant. 
    
- If single sign-on (SSO) is a requirement, Active Directory Federation Services (AD FS) can be implemented. 
    
- Client communication over the Internet through encrypted and authenticated access (port 443). 
    
- Data migration is limited to what can be uploaded over the Internet. 
    
- Customizations: Apps for Office, SharePoint, and SharePoint Designer 2013. 
    
#### Hybrid with Office 365

Combine the benefits of Office 365 with an on-premises deployment of SharePoint 2013. 
  
The accompanying diagram shows Office 365 with SharePoint Online using Business Connectivity Services (BCS) to connect to an on-premises SharePoint Server 2013 farm. 
  
Choose which of the following features to integrate: 
  
SharePoint Search 
  
- Users can see search results from both environments. 
    
- Extranet users can remotely log on with an on-premises Active Directory account and use all available hybrid functionality. 
    
BCS
  
From SharePoint Online: Users can perform both read and write operations. The BCS service connects to an on-premises SharePoint Server 2013 farm. The BCS service configured on the on-premises farm brokers the connection to on-premises OData Service endpoints. 
  
Duet Enterprise Online 
  
From SharePoint Online, users can perform read and write operations against an on-premises SAP system. 
  
#### Azure

Take advantage of the cloud while maintaining full control of the platform and features. 
  
The accompanying diagram shows Azure, which contains two cloud services, a SharePoint 2013 farm, and Windows Server Active Directory with DNS connecting to users over the Internet or connecting to on-premises Active Directory via VPN tunnel. 
  
Features include: 
  
-  Azure is a platform that provides the infrastructure and app services needed to host a SharePoint 2013 farm.
    
- Infrastructure Services. 
    
- Best native cloud platform for SQL Server and SharePoint. 
    
- Computing resources are available almost immediately with no commitment. 
    
- Focus on applications, instead of datacenters and infrastructure. 
    
- Inexpensive development and test environments. 
    
- SharePoint solutions can be accessible from the Internet or accessible only from a corporate environment through a site-to-site VPN tunnel. 
    
- Customizations are not limited. 
    
#### On premises

You own everything. 
  
The accompanying diagram shows an on-premises environment with web servers, application servers, and Active Directory communicating with all databases and dedicated application servers for search. 
  
Features include: 
  
- Capacity planning and sizing. 
    
- Server acquisition and setup. 
    
- Deployment. 
    
- Scaling out, patching, and operations. 
    
- Backing up data. 
    
- Maintaining a disaster recovery environment. 
    
- Customizations are not limited. 
    
### Deployment type is best for . . .

#### SharePoint 2013 in Office 365

- Secure external sharing and collaboration. (Unique feature!) 
    
- Intranet — Team sites, My Sites, and internal collaboration. 
    
- Document storage and versioning in the cloud. 
    
- Basic public-facing website. 
    
Additional features with Office 365 Dedicated subscription plans: 
  
- Microsoft datacenter equipment that is dedicated to your organization and not shared with any other organization. 
    
- Each customer environment resides in a physically separate network. 
    
- Client communication across an IPSec-secured VPN or customer-owned private connection. Two-factor authentication is optional. 
    
- ITAR-support plans. 
    
#### Hybrid with Office 365

- Use Office 365 for external sharing and collaboration instead of setting up an extranet environment. 
    
- Move My Sites (OneDrive for Business) to the cloud to make it easier for users to access their files remotely. 
    
- Start new team sites in Office 365. 
    
- Integrate an Office 365 site with on-premises BCS SharePoint environment. 
    
#### Azure

- SharePoint for Internet Sites — Public facing sites. Take advantage of Azure AD for customer accounts and authentication. 
    
- Developer, test, and staging environments — Quickly provision and deprovision entire environments. 
    
- Hybrid applications — Applications that span your datacenter and the cloud. 
    
- Disaster recovery environment — Quickly recover from a disaster. Pay only for use. 
    
- Farms that require deep reporting or auditing. 
    
- Web analytics. 
    
- Data encryption at rest (data is encrypted in the SQL databases). 
    
#### Data encryption at rest (data is encrypted in the SQL databases)

- In-country farms (when data is required to reside within a jurisdiction). 
    
- Complex BI solutions that must reside close to BI data. 
    
- Private cloud solutions. 
    
- Highly customized solutions. 
    
- Legacy solutions with third-party components that depend on hardware and software that are not supported on Azure Infrastructure Services. 
    
- Privacy restrictions that prevent synchronization of Active Directory accounts with Azure Active Directory (a requirement for Office 365). 
    
- Organizations that prefer control of the entire platform and solution. 
    
### License requirements

#### SharePoint 2013 in Office 365

Subscription model. No additional licenses needed. 
  
#### Hybrid with Office 365

- Office 365 — Subscription model. No additional licenses needed. 
    
- On-premises — All on-premises licenses apply. 
    
#### Azure

-  Azure subscription (includes the server operating system)
    
- SQL Server 
    
- SharePoint 2013 Server License 
    
- SharePoint 2013 Client Access License 
    
#### On premises

- Server operating system 
    
- SQL Server 
    
- SharePoint 2013 Server License 
    
- SharePoint 2013 Client Access License 
    
### Architecture tasks

#### SharePoint 2013 in Office 365

- Plan and design directory integration. Two options. Either option can be deployed on premises or in Azure: Password sync (requires one 64-bit server). SSO (requires AD FS and multiple servers). 
    
- Ensure network capacity and availability through firewalls, proxy servers, gateways, and across WAN links. 
    
- Acquire third-party SSL certificates to provide enterprise-security for Office 365 service offerings. 
    
- Plan the tenant name, and design the site collection architecture and governance. 
    
- Plan customizations, solutions, and apps for SharePoint Online. 
    
- Decide if you want to connect to Office 365 by using the Internet Protocol 6 (IPv6). This is not common. 
    
#### Hybrid with Office 365

In addition to tasks for both the Office 365 and on-premises environments: 
  
- Determine how much feature integration you want and choose the hybrid topology. See this model poster: Which hybrid topology should I use? 
    
- If required, determine which proxy server device will be used. 
    
#### Azure

Design the Azure network environment: 
  
- Virtual network within Azure, including subnets. 
    
- Domain environment and integration with on-premises servers. 
    
- IP addresses and DNS. 
    
- Affinity groups and storage accounts. 
    
Design the SharePoint environment in Azure: 
  
- SharePoint farm topology and logical architecture. 
    
-  Azure availability sets and update domains.
    
- Virtual machines sizes. 
    
- Load balanced endpoint. 
    
- External endpoints for public access, if that is preferable. 
    
- Disaster recovery environment. 
    
#### On premises

Design the SharePoint environment in an existing on-premises environment: 
  
- SharePoint farm topology and logical architecture. 
    
- Server hardware. 
    
- Virtual environment, if used. 
    
- Load balancing. 
    
- Integration with AD DS and DNS. 
    
- Disaster recovery environment. 
    
### IT pro responsibilities

#### SharePoint 2013 in Office 365

- Ensure user workstations meet Office 365 client prerequisites. 
    
- Implement the directory integration plan. 
    
- Plan and implement internal and external DNS records and routing. 
    
- Configure the proxy or firewall for Office 365 IP address and URL requirements. 
    
- Create and assign permissions to site collections. 
    
- Implement customizations, solutions, and apps for SharePoint Online. 
    
- Monitor network availability and identify possible bottlenecks. 
    
#### Hybrid with Office 365

In addition to tasks for both the Office 365 and on-premises environments: 
  
- Configure the proxy server device, if required. 
    
- Configure the hybrid identity management infrastructure: SSO and server-to-server authentication between the two environments. 
    
- Configure the integration of chosen features: Search, BCS, Duet Enterprise Online. 
    
#### Azure

Deploy and manage the Azure and SharePoint environment: 
  
- Implement and manage the Azure network environment. 
    
- Deploy the SharePoint environment. 
    
- Update SharePoint farm servers. 
    
- Add or shut down virtual machines as needed based on farm utilization. 
    
- Increase or decrease virtual machine sizes, as needed. 
    
- Back up the SharePoint environment. 
    
- Implement the disaster recovery environment and protocol. 
    
#### On premises

Deploy and manage the SharePoint on premises environment: 
  
- Provision servers. 
    
- Deploy the SharePoint environment. 
    
- Update SharePoint farm servers. 
    
- Add or remove farm servers as needed based on farm utilization. 
    
- Back up the SharePoint environment. 
    
- Implement the disaster recovery environment and protocol. 
    
## Three typical workloads to move to Azure

### Office 365 plus Directory Components in Azure

Deploying Office 365 directory integration components in Azure is faster because it can deploy virtual machines on-demand. 
  
#### Directory synchronization server only

Instead of deploying the 64-bit directory synchronization server in your on-premises environment, provision a virtual machine in Azure instead. 
  
The accompanying diagram shows SharePoint Online with an Azure Active Directory tenant, which synchronizes account names and passwords between the on-premises Active Directory environment and the Azure Active Directory tenant. 
  
#### Directory synchronization plus AD FS

This option allows you to support Office 365 federated identities (SSO) without adding hardware to your on-premises infrastructure. It also provides resiliency if the on-premises Active Directory environment is unavailable. 
  
- Directory integration components reside in Azure. 
    
- AD FS is published to the Internet through AD FS proxies in Azure. 
    
- Client authentication traffic, for users that are connecting from any location, is handled by AD FS servers and proxies that are deployed on Azure. 
    
### Public-facing Internet site and Azure AD for customer authentication

Take advantage of the ability to easily scale to demand by placing your Internet site in Azure. Use Azure AD to store customer accounts. 
  
#### Azure advantages for Internet sites

- Pay only for the resources you need by scaling the number of virtual machines based on farm utilization. 
    
- Add deep reporting and web analytics. 
    
- Focus on developing a great site rather than building infrastructure. 
    
#### Azure AD

Azure AD provides identity management and access control capabilities for cloud services. Capabilities include a cloud-based store for directory data and a core set of identity services, including user logon processes, authentication services, and AD FS. The identity services that are included with Azure AD easily integrate with your on-premises Active Directory deployments and fully support third-party identity providers. 
  
The accompanying diagram shows the configuration of zones and authentication that is important for Internet-facing sites. The diagram shows the Azure Active Directory Tenant, which contains a SharePoint Farm on Azure with two zones: 
  
- An Internet zone that interacts with Anonymous and Authenticated visitors and customers outside the network 
    
- A default zone that contains NTLM for Crawl and Windows Authentication that interacts with your on-premises Active Directory deployment over a VPN tunnel. 
    
### On-premises Farm plus Disaster Recovery in Azure

Choose a disaster recovery option that matches your business requirements. Azure provides entry-level options for companies getting started with disaster recovery and advanced options for enterprises with high resiliency requirements. 
  
#### Cold standby

- The farm is fully built, but the virtual machines are stopped. (You're paying only when they're running!) 
    
- Maintaining the environment includes starting the virtual machines from time-to-time, patching, updating, and verifying the environment. 
    
- Start the full environment in the event of a disaster. 
    
#### Warm standby

- This includes a small farm that is provisioned and running. 
    
- The farm can immediately serve users in the event of a failover. 
    
- Scale out the farm quickly to serve the full user base. 
    
#### Hot standby

A fully-sized farm is provisioned and running on standby. 
  
The accompanying diagram shows an on-premises farm interacting with the SharePoint Disaster Recovery Environment on Azure. The on-premises databases use SQL Server Log Shipping over the VPN tunnel to access the SharePoint Disaster Recovery environment, which includes two SQL database servers that contain the SharePoint databases, two Web Front End servers, and two SharePoint Application servers. 
  

