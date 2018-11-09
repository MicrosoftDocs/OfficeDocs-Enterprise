---
title: "Administering a multi-geo environment"
ms.author: mikeplum
author: MikePlumleyMSFT
manager: pamgreen
ms.audience: ITPro
ms.topic: article
ms.service: o365-solutions
ms.custom: 
ms.collection: Strat_SP_gtc
localization_priority: Priority
description: "Learn about administering SharePoint and OneDrive services in a multi-geo environment."
---

# Administering a multi-geo environment

Here's a look at how OneDrive and SharePoint services work in a multi-geo environment.

#### OneDrive Administrator Experience

The [OneDrive admin center](https://admin.onedrive.com) has a **Geo locations** tab in the left navigation which features a geo locations map where you can view and manage your geo locations. Use this page to add or delete geo locations for your tenant.

#### Taxonomy

We support a unified [taxonomy](https://support.office.com/article/A180FA28-6405-4679-9EC3-81D2028C4EFC) for enterprise managed metadata across geo locations, with the master being hosted in the central location for your company. We recommend that you manage your global taxonomy from the central location and only add location-specific terms to the satellite location’s Taxonomy. Global taxonomy terms will synchronize to the satellite locations.

#### Sharing

Administrators can set and manage sharing policies for each of their locations. The OneDrive sites in each geo location will honor only the corresponding geo specific sharing settings. (For example, you can allow [external sharing](https://support.office.com/article/C8A462EB-0723-4B0B-8D0A-70FEAFE4BE85) for your central location, but not for your satellite location or vice versa.) Note that the sharing settings do not allow configuring sharing limitations between geo locations.

For OneDrive Multi-Geo, you must manage your sharing settings at each geo location as these are not synchronized across the tenant. To manage sharing visit the [OneDrive admin center sharing settings](https://admin.onedrive.com/?v=SharingSettings) page. By default external sharing is enabled with Anyone in each satellite location.

#### User Profile Application

There is a [user profile application](https://support.office.com/article/494bec9c-6654-41f0-920f-f7f937ea9723) in each geo location. Each user’s profile information is hosted in their geo location and available to the administrator for that geo location.

If you have custom profile properties, then we recommend that you use the same profile schema across geographies and populate your custom profile properties either in all geo locations or where needed. For guidance regarding how to populate user profile data programmatically, please refer to the [Bulk User Profile Update API](https://docs.microsoft.com/en-us/sharepoint/dev/solution-guidance/bulk-user-profile-update-api-for-sharepoint-online)

#### BCS, Secure Store, Apps

BCS, Secure Store, and Apps all have separate instances in each satellite location, therefore the SharePoint Online administrator should manage and configure these services separately from each satellite location.

#### Security and Compliance Admin Center

There is one central compliance center for a multi-geo tenant: [Office 365 Security & Compliance Center](https://protection.office.com/?rfr=AdminCenter\#/homepage).

#### Information Protection (IP) Data Loss Prevention (DLP) Policy

You can set your IP DLP policies for OneDrive for Business in the Security and Compliance center, scoping policies as needed to the whole tenant or to applicable users. For example: If you wish to select a policy for a OneDrive user in a satellite location, select to apply the policy to a specific OneDrive and enter the user’s OneDrive url. See [Overview of data loss prevention policies](https://support.office.com/article/1966b2a7-d1e2-4d92-ab61-42efbb137f5e) for general guidance in creating DLP policies.

The DLP policies are automatically synchronized based on their applicability to each geo location.

Implementing Information Protection and Data Loss prevention policies to all users in a geo location is not an option available in the UI, instead you must select the applicable OneDrive accounts for the policy or apply the policy globally to all OneDrive accounts.

#### eDiscovery 

By default, an eDiscovery Manager or Administrator of a multi-geo tenant will be able to conduct eDiscovery only in the central location of that tenant. To support the ability to conduct eDiscovery for satellite locations, a new Compliance Security Filter parameter called “Region” is available via PowerShell.

The Office 365 global administrator must assign eDiscovery Manager permissions to allow others to perform eDiscovery and assign a “Region” parameter in their applicable Compliance Security Filter to specify the region for conducting eDiscovery as satellite location, otherwise no eDiscovery will be carried out for the satellite location.

When the eDiscovery Manager or Administrator role is set for a particular satellite location, the eDiscovery Manager or Administrator will only be able to perform eDiscovery search actions against the SharePoint sites and OneDrive sites located in that satellite location. If an eDiscovery Manager or Administrator attempts to search SharePoint or OneDrive sites outside the specified satellite location, no results will be returned. Also, when the eDiscovery Manager or Administrator for a satellite location triggers an export, data is exported to the Azure instance of that region. This helps organizations stay in compliance by not allowing content to be exported across controlled borders.

> [!NOTE]
> If it's necessary for an eDiscovery Manager to search across multiple SharePoint satellite locations, another user account will need to be created for the eDiscovery Manager which specifies the alternate satellite location where the OneDrive or SharePoint sites are located.

[!INCLUDE [Office 365 Multi-Geo locations](includes/office-365-multi-geo-locations.md)]

To set the Compliance Security Filter for a Region:

1.  Open Windows PowerShell

2.  Enter  
    $s = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri <https://ps.compliance.protection.outlook.com/powershell-liveid> -Credential $cred -Authentication Basic -AllowRedirection -SessionOption (New-PSSessionOption -SkipCACheck -SkipCNCheck -SkipRevocationCheck)

    $a = Import-PSSession $s -AllowClobber  

3.  **New-ComplianceSecurityFilter** **-Action** ALL **-FilterName** EnterTheNameYouWantToAssign **-Region** EnterTheRegionParameter **-Users** EnterTheUserPrincipalName

    For Example: **New-ComplianceSecurityFilter -Action** ALL **-FilterName** NAMEDISCOVERYMANAGERS **-Region** NAM **-Users** adwood@contosodemosx.onmicrosoft.com

See the [New-ComplianceSecurityFilter](https://technet.microsoft.com/library/mt210915(v=exchg.160).aspx) article for additional parameters and syntax

#### Audit log search

A unified [Audit log](https://support.office.com/article/0d4d0f35-390b-4518-800e-0c7ec95e946c) for all your satellite locations is available from the Office 365 audit log search page. You can see all the audit log entries from across geos, for example, NAM & EUR geo users’ activities will show up in one org view and then you can apply existing filters to see specific user’s activities.
