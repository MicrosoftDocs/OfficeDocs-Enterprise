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

Multi-Geo Capabilities in OneDrive and SharePoint Online enables control the country or region where shared resources like SharePoint team sites and Office 365 Group mailboxes are stored at rest.

Setting up and managing your multi-geo environment is done through the SharePoint admin center.

## OneDrive

Each user's OneDrive can be provisioned in or moved to a satellite location in accordance with the user's PDL. Personal files are then kept in that geo location, though they can be shared with users in other geo locations.

## Sites and Office 365 Groups

When a user creates a SharePoint group-connected site, their PDL is used to determine the geo location where the site and its associated mailbox is created. If the user's PDL value hasn't been set, then the site and mailbox are created in the central location.

When a user creates an Office 365 Group in Outlook or Outlook Online, or a team in Teams, the same logic is applied to determine the location of the site and group.

Other Office 365 Group or group-connected site creation experiences not specified above are not multi-geo aware.

## SharePoint Home

SharePoint Home shows a curated list of News roll-up and suggested sites from across geo locations. It is powered by the intelligence of the Office graph, which analyzes the activities and signals from across the global organization and tailors a list for every user.

## Hub sites

SharePoint Hub sites enhances the discovery and engagement with content for employees, while creating a complete and consistent representation of projects, departments or regions. In a multi-geo environment, sites from satellite locations can easily be associated with a hub site regardless the hub site's geo location. Users can search and get results across the hub through a single search experience, regardless of the geo location of the sites.

## Mobile

Users of the SharePoint, OneDrive, and Outlook mobile apps can simply sign in with their Office 365 credentials as they normally would to access content in a multi-geo environment. They don't need to enter any geo-specific URLs or other information.

## Managed metadata

Enterprise managed metadata is maintained in the central location and replicated to the satellite locations. This doesn't require any additional customization.

## Geo administrators

You can specify administrators for individual geo locations. These administrators have SharePoint admin privileges, but only for the specified geo location. For more information, see [Add or remove a geo administrator](add-a-sharepoint-geo-admin.md).
