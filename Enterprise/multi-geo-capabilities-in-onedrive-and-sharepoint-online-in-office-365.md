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

Multi-Geo capabilities in OneDrive and SharePoint Online enables control of the country or region where shared resources like SharePoint team sites and Office 365 Group mailboxes are stored at rest.

Each user, Group mailbox, and SharePoint site has a Preferred Data Location (PDL) which denotes the geo location where related data is to be stored. Users' personal data (Exchange mailbox and OneDrive) along with any Office 365 Groups or SharePoint sites that they create can be stored in the specified geo location to meet data residency requirements.

## Managing the multi-geo environment

Setting up and managing your multi-geo environment is done through the SharePoint admin center. 

![Screenshot of geo locations page in the SharePoint admin center](media/sharepoint-multi-geo-admin-center.png)

(Some actions, such as moving a SharePoing site or a OneDrive site require Microsoft PowerShell.)

Users get a seamless experience when using Office 365 services, including Office applications, OneDrive, and Search. See [User experience in a multi-geo environment](multi-geo-user-experience.md) for details.

You can [specify administrators for individual geo locations](add-a-sharepoint-geo-admin.md).


Each user's OneDrive can be provisioned in or moved by an administrator to a satellite location in accordance with the user's PDL. Personal files are then kept in that geo location, though they can be shared with users in other geo locations.

When a user creates a SharePoint group-connected site, their PDL is used to determine the geo location where the site and its associated group mailbox is created. If the user's PDL value hasn't been set, or has been set to geo location that hasn't been configured as a satellite location, then the site and mailbox are created in the central location.

Office 365 services other than Exchange, OneDrive, Groups, and SharePoint are not multi-geo aware. However, Office 365 Groups that are created by other services - such as Teams or Planner - follow the same Group-creation logic discussed above.


## See also

[SharePoint storage quotas in multi-geo environments](sharepoint-multi-geo-storage-quota.md)

[Restrict content to a geo location](restrict-content-to-geo-location.md)

[Administering Exchange Online mailboxes in a multi-geo environment](administering-exchange-online-multi-geo.md)
