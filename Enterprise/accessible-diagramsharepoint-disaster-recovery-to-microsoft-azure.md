---
title: "Accessible diagram - SharePoint Disaster Recovery to Microsoft Azure"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 12/15/2017
audience: ITPro
ms.topic: article
ms.collection: Ent_O365
ms.service: o365-solutions
localization_priority: Normal
ms.assetid: 4b855224-8e67-4efa-a3a4-908ee0ca6412
description: "This article is an accessible text version of the diagram named SharePoint Disaster Recovery to Microsoft Azure."
---

# Accessible diagram - SharePoint Disaster Recovery to Microsoft Azure

**Summary:** This article is an accessible text version of the diagram named SharePoint Disaster Recovery to Microsoft Azure.
  
This poster provides examples of architectures for building a recovery environment in Azure. 
  
## On-premises environment with an Azure recovery environment

The diagram shows an example of architecture used for the production environment of an on-premises environment that uses Azure for recovery. 
  
### On-premises production environment

The accompanying diagram shows a live production environment with four tiers of servers in a server farm. 
  
#### Tier 1

There are two servers for front-end services and query processing. There is an index partition that provides a replica of both servers. 
  
#### Tier 2

There are two servers for distributed cache in this tier. 
  
#### Tier 3

There are three servers in this tier. Each server provides the following services: 
  
- Backend services 
    
- Admin 
    
- Workflow manager 
    
- Crawl 
    
- Content processing 
    
- Analytics 
    
#### Tier 4

There are two servers in this tier. Both servers have three availability groups, as follows: 
  
- Availability group #1 provides search capabilities. 
    
- Availability group #2 provides content, configuration, and service applications. 
    
- Availability group #3 provides content. 
    
There is also a file sharing server in this tier. The tier 4 servers use log shipping to communicate with this server. This server, in turn, communicates over Distributed File System Replication (DFSR) to a file share server in the Azure warm standby recovery environment, as described in the following section. 
  
### Azure recovery environment

#### Warm standby environment running virtual machines

The accompanying diagram shows the on-premises environment replicated exactly in the Azure recovery environment. The file share server in this environment is linked to the on-premises environment through DFSR. DFSR transfers logs from the production environment to the recovery environment through the file share server. 
  
### Overview

The disaster recovery environment for an on-premises SharePoint 2013 farm can be hosted in Azure. 
  
-  Azure Infrastructure Services provides a secondary datacenter.
    
- Pay only for the resources you use. 
    
- Small recovery farms can be scaled out after a disaster to meet scale and capacity targets. 
    
The recovery farm in Azure is configured as identically as possible to the production on-premises farm. 
  
- Same representation of server roles. 
    
- Same configuration of customizations. 
    
- Same configuration of search features (these can be on a smaller version of the production farm). 
    
Log shipping and DFSR are used to copy database backups and transaction logs to the Azure farm. 
  
- DFSR is used to transfer logs from the production environment to the recovery environment. In a WAN scenario, DFSR is more efficient than shipping the logs directly to the secondary server in Azure. 
    
- Logs are replayed to the Azure-based SQL Server computers. 
    
- Log-shipped databases are not attached to the farm until a recovery exercise is performed. 
    
Failover procedures: 
  
1. Stop log shipping. 
    
2. Stop accepting traffic to the primary farm. 
    
3. Replay the final transaction logs. 
    
4. Attach the content databases to the farm. 
    
5. Start a full crawl. 
    
6. Restore service applications from the replicated services databases. 
    
Recovery objectives provided by this solution include: 
  
- Sites and content 
    
- Search (re-crawled, no search history) 
    
- Services
    
Additional items that can be addressed by Microsoft Consulting Services or a partner: 
  
- Synchronizing custom farm solutions 
    
- Connections to data sources on premises (Business Data Connectivity (BDC) and search content sources) 
    
- Search restore scenarios 
    
- Recovery Time Objectives (RTO) and Recovery Point Objectives (RPO) 
    
#### Cold standby environment running virtual machines

Cold standby environments take longer to start but are less expensive. 
  
- The farm is fully built, but the virtual machines are stopped after the farm is created. You pay only processing costs when the virtual machines are running, but storage and network data transfer costs apply. 
    
- In the event of a disaster, all the virtual machines in the farm are started and patched. 
    
- Backups and transaction logs are applied to the farm databases. 
    
The following list describes additional procedures for cold standby environments: 
  
- Turn on virtual machines regularly to patch, update, and verify the environment. 
    
- Run procedures to refresh DNS and IP addresses. 
    
- Set up SQL AlwaysOn after a failover. 
    
The accompanying diagram shows a replicated recovery environment on virtual machines. After failover to a cold standby environment, all virtual machines are started, and the availability groups are configured using replay logs to make the database servers available. 
  
## SharePoint recovery environment in Azure

Design and build the failover environment in Azure. 
  
- Create a virtual network in Azure. 
    
- Connect the on-premises network with the virtual network in Azure with a site-to-site VPN connection. This connection uses a dynamic gateway in Azure. 
    
- Deploy one or more domain controllers to the Azure virtual network, and configure these to work with your on-premises domain. These domain controllers are catalog servers. 
    
- Adapt the SharePoint farm for cloud services and availability sets. 
    
- Deploy the SharePoint farm plus a file server to host file shares. 
    
- Set up log shipping and DFSR between the on-premises environment and the Azure-based recovery environment. 
    
The accompanying diagram shows the on-premises environment and the Azure virtual network with the following features: 
  
### On-premises environment

- Windows Server 2012 RRAS 
    
- Active Directory server 
    
The on-premises network interfaces with the Azure virtual network over a virtual private network (VPN) gateway. 
  
### Azure virtual network

The VPN gateway interfaces with an active VPN gateway subnet. 
  
There are three cloud services in the Azure virtual network: 
  
- The first cloud service has two Active Directory and DNS servers with an availability set. 
    
- The second cloud service has three sets of servers: Two distributed cache servers with an availability set. Two front-end servers with an availability set. Three backend servers with an availability set.
    
- The third cloud service has three database servers with an availability set. One of these database servers is a file share for log shipping and a third node of a node majority for SQL Server AlwaysOn. 
    
### Build the AD DS hybrid environment

The configuration of AD DS for this solution constitutes a hybrid deployment scenario in which AD DS is partly deployed on-premises and partly deployed on Azure virtual machines. 
  
Important — Before you deploy AD DS in Azure, read Guidelines for Deploying Windows Server Active Directory on Microsoft Azure Virtual Machines (http://msdn.microsoft.com/en-us/library/windowsazure/jj156090.aspx). 
  
For complete guidance on designing and deploying Active Directory environments, see http://TechNet.microsoft.com. 
  
This reference architecture includes two virtual machines configured as domain controllers. Each is configured as follows: 
  
- Size — Small. 
    
- Operating system — Windows Server 2012. 
    
- Role — AD DS domain controller designated as a global catalog server. This configuration reduces egress traffic across the VPN connection. In a multi-domain environment with high rates of change, configure domain controllers on-premises to not sync with the global catalog servers in Azure. 
    
- Data disks — Place the AD DS database, logs, and SYSVOL on Azure data disks. Do not place these on the operating system disk or the temporary disks provided by Azure. This is important. 
    
- Role — Install and configure Windows DNS on the domain controllers. 
    
- IP addresses — Use dynamic IP addresses. This requires you to create an Azure Virtual Network. 
    

