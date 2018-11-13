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

Setting up and managing your multi-geo environment is done through the SharePoint admin center. Simply click **Add location**, select the needed satellite location, and then type a namespace URL.

New sites created by users are automatically created in the geo location of their Preferred Data Location.

## OneDrive



## Sites and Office 365 Groups

When a user creates a SharePoint group-connected site, their PDL is used to determine the geo location where the site and its associated mailbox is created. If the user's PDL value hasn't been set, then the site and mailbox are created in the central location.

When a user creates an Office 365 Group in Outlook or Outlook Online, or a team in Teams, the same logic is applied to determine the location of the site and group.

Other Office 365 Group or group-connected site creation experiences not specified above are not multi-geo aware.

## SharePoint Home

SharePoint Home shows a curated list of News roll-up and suggested sites from across geo locations. It is powered by the intelligence of the Office graph, which analyzes the activities and signals from across the global organization and tailors a list for every user.

## Hub sites

SharePoint Hub sites enhances the discovery and engagement with content for employees, while creating a complete and consistent representation of projects, departments or regions. In a multi-geo environment, sites from satellite locations can easily be associated with a hub site regardless of which geo location the hub site is hosted in. Employees can search and get results across the hub through a single search experience, regardless of the geo location of the sites.

## Mobile

For employees on the go, the same great productivity experience is available on rich mobile apps for SharePoint, OneDrive and Outlook. Employees simply sign in with their Office 365 credentials and access content in their Multi-Geo enabled Office 365 tenant, they don't need to remember any geo specific URLs or other information.

 
## Managed metadata

For organizations that use taxonomy enterprise managed metadata to organize their sites and contents, Multi-Geo enables an easy way to centrally manage metadata in a central location and behind the scene these get replicated to all the satellites and ready to use in satellite sites. This doesn't require any additional customization.

## Geo Administrators

The Geo Administrator feature provides the flexibility to Global Administrators and to SharePoint Tenant Administrators to create and designate SharePoint Administration permissions per geo-location to specified users. Only the members of a designated Geo-Admin group will have access to the SPO Admin Center for that geo location. 
See the SharePoint Geo Admin (Multi-Geo) document for configuration details.

Multi-Geo in SharePoint and Groups enables global businesses control the country or region where shared resources like SharePoint Team Sites, Office 365 Groups content (associated SharePoint Sites and Groups mailboxes) are stored at-rest.


