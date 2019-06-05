---
title: "Accessible diagram - Design sample Internet sites in Microsoft Azure for SharePoint 2013"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 12/15/2017
audience: ITPro
ms.collection: Ent_O365
ms.topic: article
ms.service: o365-solutions
localization_priority: Normal
ms.assetid: b91124bc-c7ec-4929-b77c-d6293db9f15e
description: "This article is an accessible text version of the diagram named Design sample: Internet sites in Microsoft Azure for SharePoint 2013."
---

# Accessible diagram - Design sample: Internet sites in Microsoft Azure for SharePoint 2013

**Summary:** This article is an accessible text version of the diagram named Design sample: Internet sites in Microsoft Azure for SharePoint 2013.
  
Use this design example as a starting point for an Internet-facing site in Azure using SharePoint 2013.
  
This poster shows an example of how to design the following aspects of SharePoint 2013:
  
- Users
    
- Zones and authentication
    
- Server farm
    
- Administration site
    
- Services
    
- Application pools and web applications
    
- Site collections
    
- Sites
    
- Content databases
    
- Zones and URLs
    
## Users, zones and authentication

There are four types of user accounts in this design. Each type of account is associated with a site for access and with a zone that uses a specific type of authentication. 
  
- Anonymous customers — Anonymous customers have access through a site such as http://www.contoso.com. The zone they use is the "Internet zone / anonymous", which uses anonymous authentication.
    
- Authenticated customers — Authenticated customers have access through a site such as https://secure.contoso.com. The zone they use is the "Extranet zone / SAML", which uses Azure Active Directory with SAML authentication.
    
- Site authors and developers — Site authors and developers have access through sites such as http://authoring.contoso.com:8000 or http://www.contoso.com:8000. The zone they use is the "Default zone / Windows integrated", which uses Active Directory Domain Services (AD DS).
    
- Search Crawl Account — The search crawl account has access through sites such as http://authoring.contoso.com:8000 or http://www.contoso.com:8000. The zone it uses is the "Default zone / Windows integrated", which uses AD DS with Windows NTLM authentication.
    
## Server farm

The users access the server farm through Azure. The server farm contains one or more Web servers.
  
## Administration site

The administration site contains several application servers, which communicate with an Application Pool (Application Pool 1 in the example) that uses the web application Central Administration Site. The Central Administration Site provides access to site collections within the organization.
  
The administration site also contains SQL Database servers, which are database servers with SQL Server installed and configured to support SQL clustering, mirroring, or AlwaysOn (AlwaysOn applies to SQL Server 2012 only).
  
## Services

The design example shows an Internet Information Services (IIS) website, SharePoint Web Services. SharePoint Web Services contains an application pool (Application Pool 2) with three services, User Profile, Search, and Managed Metadata.
  
Notes on Services for Internet sites:
  
> Managed Metadata — Be sure to select **This service application is the default storage location for column specific term sets**.
    
> App Management — We do not recommend using apps in a public-facing Internet site in Azure.
    
## Application pools and web applications

The Default Group in Azure shows Application Pool 3, which contains a web application named Contoso Sites. This path-based site collection is located at http://internal:8000.
  
## Site collections and sites

The site collections contained in the application pool include:
  
- Host-named site collection 1 for crawling (example location http://authoring.contoso.com:8000)
    
- Host-named site collection 2 for queries (sample locations http://www.contoso.com, https://secure.contoso.com, http://www.contoso.com:8000)
    
- Host-named site collection 3 for queries (sample locations http://assets.contoso.com, https://secureassets.contoso.com, http://assets.contoso.com:8000)
    
## Content databases

The example shows two content databases. One is for the site collection 1 used for crawling (http://authoring.contoso.com:8000). The other is for the two site collections 2 and 3 used for queries (http://www.contoso.com, https://secure.contoso.com, http://www.contoso.com:8000, or http://assets.contoso.com, https://secureassets.contoso.com, http://assets.contoso.com:8000).
  
## Zones and URLs

The example shows three zones with the associated load-balanced URLs that are used by different user accounts. 
  
The first list of zones and URLs is related to site collection 1, and it contains the following information:
  
- Users - Site authors
    
- Zone - Default
    
- Load-balanced URL - http://authoring.contoso.com:8000
    
The second list of zones and URLs has three different types of users in three different zones. It is related to site collection 2, and it contains the following information:
  
First zone:
  
- Users - Site authors
    
- Zone - Default
    
- Load-balanced URL - http://www.contoso.com:8000
    
Second zone:
  
- Users - Anonymous customers
    
- Zone - Internet
    
- Load-balanced URL - http://www.contoso.com
    
Third zone:
  
- Users - Authenticated customers
    
- Zone - Extranet
    
- Load-balanced URL - https://secure.contoso.com
    
The third list of zones and URLs has three different types of users in three different zones. It is related to site collection 3, and it contains the following information:
  
First zone:
  
- Users - Site authors
    
- Zone - Internet
    
- Load-balanced URL - http://assets.contoso.com:8000
    
Second zone:
  
- Users - Anonymous customers
    
- Zone - Internet
    
- Load-balanced URL - http://assets.contoso.com
    
Third zone:
  
- Users - Authenticated customers
    
- Zone - Extranet
    
- Load-balanced URL - http://secureassets.contoso.com
    

