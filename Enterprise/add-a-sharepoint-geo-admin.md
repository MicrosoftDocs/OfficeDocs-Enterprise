---
title: "Add or remove a geo administrator"
ms.author: mikeplum
author: MikePlumleyMSFT
manager: pamgreen
ms.date: 4/3/2018
ms.audience: ITPro
ms.topic: article
ms.service: o365-solutions
localization_priority: Normal
description: "Learn how to add or remove a geo administrator in OneDrive for Business Multi-Geo."
---

# Add or remove a geo administrator in OneDrive for Busniess Multi-Geo

You can configure separate administrators for each geo location that you have in your tenant. These administrators will have access to the SharePoint Online and OneDrive settings that are specific to their geo-location.

Some services - such as the term store - are administered from the central location and replicated to satellite locations. The geo admin for the central location has access to these, whereas geo admins for satellite locations don’t.

Global administrators and SharePoint Online administrators continue to have access to settings in all geo locations.

## Configuring geo administrators

Configuring geo admins requires SharePoint Online PowerShell module.

Use [Connect-SPOService](https://docs.microsoft.com/powershell/module/sharepoint-online/Connect-SPOService) to connect to the admin center of the geo location where you want to add the geo admin. (For example, Connect-SPOService  https://ContosoEUR-admin.sharepoint.com.)

To add a user as a geo admin, run `Add-SPOGeoAdministrator -UserPrincipalName <UPN>`

To view the existing geo admins of a location, run `Get-SPOGeoAdministrators`

To remove a user as a Geo Admin of a location, run  `Remove-SPOGeoAdministrator -UserPrincipalName <UPN>`

## See Also

[Add-SPOGeoAdministrator](https://docs.microsoft.com/powershell/module/sharepoint-online/add-spogeoadministrator)

[Get-SPOGeoAdministrator](https://docs.microsoft.com/powershell/module/sharepoint-online/get-spogeoadministrator)

[Remove-SPOGeoAdministrator](https://docs.microsoft.com/powershell/module/sharepoint-online/remove-spogeoadministrator)