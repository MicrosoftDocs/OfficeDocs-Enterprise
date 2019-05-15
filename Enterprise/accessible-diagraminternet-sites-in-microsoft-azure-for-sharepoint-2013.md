---
title: "Accessible diagram - Internet sites in Microsoft Azure for SharePoint 2013"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 12/15/2017
audience: ITPro
ms.topic: article
ms.collection: Ent_O365
ms.service: o365-solutions
localization_priority: Normal
ms.assetid: 71636974-fb99-487c-ac67-f15e9401acba
description: "This article is an accessible text version of the diagram named Internet sites in Microsoft Azure for SharePoint 2013."
---

# Accessible diagram - Internet sites in Microsoft Azure for SharePoint 2013

**Summary:** This article is an accessible text version of the diagram named Internet sites in Microsoft Azure for SharePoint 2013.
  
This poster describes and illustrates how public-facing Internet sites benefit from cloud elasticity and Azure AD for customer accounts. There are six different scenarios that describe how Internet sites benefit from Azure: 
  
- Design and size the farm topology. 
    
- Fine-tune for Azure. 
    
- Choose the Active Directory model. 
    
- Design for identity management, zones, and authentication. 
    
- Design sites and URLs for cross-site publishing. 
    
- Design the Azure environment. 
    
## Design and size the farm topology

Use the topology, capacity, and performance guidance for SharePoint 2013 on TechNet to design the farm topology. 
  
Ensure the farm you design meets the objectives for capacity and performance. 
  
### Example: Medium Internet Sites farm (~85 page views per second)

This farm provides a fault-tolerant SharePoint 2013 search farm topology that is optimized for a corpus that contains 3,400,000 items. 
  
The example farm processes 100-200 documents per second, depending on the language, and it accommodates 85 page views per second and 100 queries per second. 
  
The accompanying diagram shows a medium internet sites farm with three types of servers: 
  
- Web servers 
    
- Application servers 
    
- Database servers 
    
#### Web servers

In the web servers section, there are three web servers, Host A, Host B, and Host C. Each web server contains a distributed cache, user profiles, managed metadata, and query processing capabilities. They also contain an index partition replica that is in each server. 
  
To scale out, add an additional web server with the same capabilities, which allows for an additional 28 page views per second. 
  
#### Application servers

In the application servers section, there are three application servers, Host D, Host E, and Host F. Host D contains Crawl, Admin, Analytics, and Content processing components. Host E contains Crawl, Admin, and Content processing components. Host F contains Crawl and Content processing components. 
  
To scale out, add one application server with a crawl component and a content processing component to process an additional 40 documents per second. 
  
#### Database servers

In the database servers section, there are two servers, Host G and Host H. The database servers are in paired hosts for fault tolerance. 
  
Host G contains all SharePoint database, including Search admin database, Link database, two Crawl databases, an Analytics database, and all other SharePoint databases. Host H contains all SharePoint databases, including redundant copies of all databases using SQL clustering, mirroring, or SQL Server 2012 AlwaysOn. 
  
## Fine-tune for Azure

The SharePoint farm might need to be fine-tuned for availability sets in the Azure platform. To ensure high availability of all components, ensure that the server roles are all identically configured. 
  
In the example topology in the diagram: 
  
- The web servers and the database servers are identically configured. 
    
- The three application servers are not identically configured. These server roles require fine tuning for availability sets in Azure. 
    
### Before

The top portion of the diagram shows the SharePoint farm before it has been fine-tuned for availability sets in Azure. In the diagram, the three host application servers are not identically configured. The number of components is determined by the performance and capacity targets for the farm. The three servers are configured as follows: 
  
- Host D application server is configured with Crawl, Admin, Analytics, and Content processing roles. 
    
- Host E application server is configured with Crawl, Admin, and Content processing roles. 
    
- Host F application server is configured with Crawl and Content processing roles. 
    
### After

This part of the diagram shows the SharePoint farm after it has been fine-tuned for availability sets in Azure. To adapt this architecture for Azure, we'll replicate the four components across all three servers. This increases the number of components beyond what is necessary for performance and capacity. The tradeoff is that this design ensures high availability of all four components in the Azure platform when these three virtual machines are assigned to an availability set. 
  
The three servers are configured to all have the Crawl, Admin, Analytics, and Content processing roles. 
  
## Choose the Active Directory model

All SharePoint solutions require Windows Active Directory Domain Services (AD DS). At this time, there are two options for SharePoint solutions in Azure. 
  
- Option 1: Dedicated domain — You can deploy a dedicated and isolated domain to Azure to support a SharePoint farm. This is a good choice for public-facing Internet sites. 
    
- Option 2: Extend the on-premises domain through a site-to-site VPN connection. When you extend the on-premises domain through a site-to-site VPN connection, users access the SharePoint farm as if it were hosted on-premises. You can take advantage of your existing Active Directory and DNS implementations. 
    
## Design for identity management, zones, and authentication

### Design for accounts and authentication

Determine how accounts will be managed and which type of authentication will be used. 
  
#### Accounts for site developers and authors

- Add accounts to the domain in Azure. 
    
- Use Active Directory Federation Services (AD FS) on premises to federate the internal accounts to the domain in Azure. 
    
- If the design includes a site-to-site VPN connection, use the internal accounts. 
    
#### Accounts for customers

- Use Azure Active Directory. 
    
- Use a different SAML-based provider. 
    
### Design for zones

In SharePoint 2013, identity management is factored into the configuration of zones and authentication. 
  
This design provides clear separation of customer accounts from all other accounts. 
  
- Use this design if you want customer accounts to be treated entirely different from the internal accounts for authors and site developers. 
    
- By using this design, you can use zone policies to limit customer actions within a web application. 
    
- This design results in different URLs for customer accounts and internal accounts. 
    
In this example: 
  
- Configure the default zone for internal accounts. 
    
- Configure the extranet zone for customer authenticated access. Use Azure Active Directory (AD) for customer accounts, or use a different SAML-based provider. 
    
- Configure the Internet zone for anonymous access. 
    
Don't use a two-zone design in which all authenticated users are configured to use the default zone. 
  
The accompanying diagram shows a three-zone design with separation of internal and customer accounts. 
  
Visitors and customers access the Azure AD Tenant in the SharePoint 2013 farm through web applications in one of two zones. The two zones include: 
  
- Zone: Internet for anonymous users 
    
- Zone: Extranet for authenticated users 
    
Users with internal accounts access the Azure Active Directory Tenant from AD DS and AD FS in the on-premises environment through the VPN tunnel to Azure AD. The Default zone provides Windows Authentication (NTLM). 
  
### Design for connecting to Azure AD

 Azure AD provides identity management and access control capabilities for cloud services. Capabilities include a cloud-based store for directory data and a core set of identity services, including user logon processes, authentication services, and AD FS. The identity services that are included with Azure AD easily integrate with your on-premises AD DS deployments and fully support third-party identity providers.
  
The accompanying diagram shows the following scenario: 
  
When integrating SharePoint 2013 with Azure Active Directory, an Azure Access Control Service (ACS) serves two purposes: 
  
-  Azure AD uses SAML 2.0, and SharePoint only works with SAML 1.1. ACS understands both formats and serves as the intermediary to transform the token formats between SharePoint and Azure AD.
    
- ACS replaces the need for the identity provider security token service (IP-STS) for this SAML scenario. 
    
For more information, see Configure Azure AD with SharePoint 2013 in the TechNet library. 
  
## Design sites and URLs for cross-site publishing

A one web-application design is recommended for publishing scenarios. 
  
- Both authoring and publishing sites are in the same web application. 
    
- Cross-site publishing is used to publish assets. 
    
Use path-based and host-named site collections. 
  
- A root site collection is a requirement. Create this site as a path-based site. 
    
- Create all other site collections as host-named site collections. 
    
Web application and root site URLs 
  
- Use an internal name for the web application URL. SharePoint uses the local machine name as the default name unless a different name is specified. You can use a domain name that is reserved for the internal network environment. 
    
- SharePoint assigns a nonstandard port number when the web application is created. Use this port number instead of port 80 or port 443. Or use a different but nonstandard port number. 
    
- Use the same name and port number for the root site collection, which is a path-based site collection. 
    
The accompanying diagram shows application pool services such as Search interacting with site collections using web applications. The site collections shown include: 
  
- Path-based site collection located at http://internal:8000 (root site). 
    
- Crawl: Host-named site collections located at an address such as https://authoring.contoso.com:8000. 
    
- Queries: 2 separate Host-named site collections located at addresses such as: 
    
  - http://www.contoso.com 
    
  - https://secure.contoso.com 
    
  - http://www.contoso.com:8000 
    
  - http://assets.contoso.com 
    
  - https://secureassets.contoso.com 
    
  - http://assets.contoso.com:8000 
    
## Design the Azure environment

This example architecture includes the following elements: 
  
- A site-to-site VPN connection is optional and extends the on-premises Windows AD DS and DNS environment to the virtual network in Azure. 
    
- Optionally, use a dedicated domain in Azure to support the SharePoint farm. 
    
- Servers are split across Azure cloud services based on role. 
    
- Availability sets ensure high availability of identically configured server roles. 
    
For more information, see the following article on TechNet: Azure Architectures for SharePoint Solutions. 
  
The accompanying diagram shows an example of an on-premises environment connecting with an Azure virtual network. 
  
Included in the on-premises environment, which is an optional element of the Azure environment, are the following components: 
  
- Windows Server 2012 RRAS 
    
- AD DS 
    
- A VPN gateway from Windows Server and AD DS to the Active VPN Gateway subnet 
    
The Azure virtual network environment includes the following components: 
  
- The Active VPN Gateway subnet (overlapping with the on-premises environment, if applicable) 
    
- Cloud service that includes AD DS and DNS availability set (two servers) 
    
- Cloud service that include the front-end server availability set (three SharePoint servers) and the App server availability set (three SharePoint servers) 
    
- Cloud service that contains two database availability sets 
    

