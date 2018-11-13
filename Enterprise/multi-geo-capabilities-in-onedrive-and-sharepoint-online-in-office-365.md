---
title: "Multi-Geo Capabilities in OneDrive and SharePoint Online"
ms.author: mikeplum
author: MikePlumleyMSFT
manager: pamgreen
ms.audience: ITPro
ms.topic: article
ms.service: o365-solutions
ms.custom: 
ms.collection: Strat_SP_gtc
localization_priority: Priority
ms.assetid: 094e86f2-9ff0-40ac-af31-28fcaba00c1d
description: "Expand your Office 365 presence to multiple geographic regions with multi-geo capabilities in OneDrive and SharePoint Online."
---

# Multi-Geo Capabilities in OneDrive and SharePoint Online

Geo-located group site creation – One of the key differences in the SharePoint OneDrive Multi-Geo phase of the Preview is that group based site creation is now Multi-Geo aware. This means that when a user creates a SharePoint group site, their preferred data location (PDL) is used to determine the geo-location where the site is hosted.   

## Outlook Mail Client and Outlook Online O365 Group creation 

When a user creates an O365 Group from Outlook, the corresponding group will inherit the creating user’s PDL. The group PDL will in turn be used to determine the location of the Group site, see user PDL logic for possible provision locations.

## Teams 

When a user creates a team in Teams, an O365 Group will be provisioned bearing the user’s PDL. The group PDL will in turn be used to determine the location of the Group site. user PDL logic for possible provision locations. Likewise, users can create Team’s channels from existing O365 groups, regardless of the group’s geo location. 
Other group creation experiences 
Other group site creation experiences not specified above are not Multi-Geo aware. 

## Video Portal

In a multi-geo tenant, the O365 Video Portal is served only from default geo and all users will be redirected to that central portal url. Hence, the Remote Media Service (RMS) for that region will be used, as follows based on your central location.
Stream is currently available in the following regions:
•	North America, hosted in the United States 
•	Europe
•	Asia Pacific
However, Stream is not yet available in the following regions that are currently supported for Office 365 Video, therefore for these local instances, we will use the RMS that is in the closest supported region.
•	Australia
•	Canada
•	India
•	United Kingdom

## Microsoft Flow

Flows created for the satellite location will use the end point located in the default geo location for the tenant.  Microsoft Flow is not a Multi-Geo service. 
Microsoft PowerApps
PowerApps created for the satellite location will use the end point located in the central location for the tenant. Microsoft PowerApps is not a Multi-Geo service. 

## Geo Administrator

The Geo Administrator feature provides the flexibility to Global Administrators and to SharePoint Tenant Administrators to create and designate SharePoint Administration permissions per geo-location to specified users. Only the members of a designated Geo-Admin group will have access to the SPO Admin Center for that geo location. 
See the SharePoint Geo Admin (Multi-Geo) document for configuration details.

## O365 Group Site Creation

New group sites created in SharePoint will be geo-located based on the user’s preferred data location (PDL), following this logic:
User PDL logic

1.	PDL Match - User’s PDL matches an satellite location where you have extended the SharePoint workload to be Multi-Geo, site direction/creation takes place in that geo-location. This is the recommended state, as you should set PDL’s for all users matching the satellite locations for SharePoint. 
2.	PDL value empty – User does not have a PDL assigned to them, site direction/creation will take place in the central location. We recommend that you build it into your processes to assign a PDL to all users during your user provisioning flow. Note that for synchronized users you must allocate their PDL in your on-premises AD system and synchronize it to Azure Active Directory using AAD Connect, see Enable synchronization of PreferredDataLocation for instructions.

Modern team site creation (O365 Groups Connected Sites) from SharePoint or OneDrive from the user interface
When a user goes to create a “modern” team site from the SharePoint or OneDrive user interface, the PDL for that user is retrieved to determine in which geo-location to provision the site and it is assigned to the O365 group that corresponds to the site. Please refer to the user PDL logic above for possible provision locations. 
