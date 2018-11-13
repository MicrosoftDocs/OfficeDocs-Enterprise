---
title: "Restrict content to a geo location"
ms.author: mikeplum
author: MikePlumleyMSFT
manager: pamgreen
ms.audience: ITPro
ms.topic: article
ms.service: o365-solutions
ms.custom: 
ms.collection: Strat_SP_gtc
localization_priority: Priority
description: "Learn how to restrict SharePoint sites to a specified geo location in a multi-geo environment."
---

# Restrict content to a geo location

Under some circumstances a SharePoint Administrator may choose to restrict a site and its file content to be in the geo-location where the site is created, either by restricting site move or restricting the caching of the site’s file content in another geo-location.  
To enable administrators to prevent that SharePoint content is cached outside of the content’s geo-location, we offer the restricted to geo functionality.  
How it will work
A site admin can change the setting of their SPO site to restricted to geo with:

Set-SPOSite -Identity https://contoso.sharepoint.com/sites/RegionRestrictedTeamSite -RestrictedToGeo BlockFull
The following values are possible for this cmdlet 

Restricted to Geo Value 	Description 
Null 	Default value for all SPO sites. If no administrator action is taken before you use the cmdlet the sites will have this value  
0 / NoRestriction	No restriction 
1 / BlockMoveOnly	BlockMoveOnly. Only site move is blocked. The site will not be movable.
2 / BlockFull	BlockMoveAndFullFileCache. Site Move is blocked, also Full File Content is not cached in other geo-locations. Files’ title (harvested from the content), file name and other properties of the file can still be cached in other geo-locations. 

Content stored in the site before it was configured to Restricted to Geo value 2, may continue to be cached in other geo-locations.

