---
title: "Plan for OneDrive for Business Multi-Geo"
ms.author: mikeplum
author: MikePlumleyMSFT
manager: pamgreen
ms.audience: ITPro
ms.topic: article
ms.service: o365-solutions
ms.custom: 
ms.collection: Strat_SP_gtc
localization_priority: Priority
description: "Learn about OneDrive for Business Multi-Geo, how multi-geo works, and what geo-locations are available for data storage."
---

# Plan for OneDrive for Business Multi-Geo

This guidance is designed for administrators of multi-national companies (MNCs) who are preparing their SharePoint Online tenant to be expanded to additional geographies in accordance with the company's presence to meet data residency requirements.

In a OneDrive Multi-Geo configuration, your Office 365 tenant consists of a central location and one or more satellite geo locations. This is a single tenant that spans across multiple geo locations. In OneDrive Multi-Geo, your tenant information, including geo locations, is mastered in Azure Active Directory (AAD). 

Here are some key multi-geo terms to help you understand the basic concepts of the configuration:

-   **Tenant** – An organization's representation in the Office 365 cloud which typically has one or more domains associated with it (for example, http://contoso.sharepoint.com). 

-   **Geo locations** – The geographic locations available to host data in an Office 365 tenant.

-   **Satellite locations** – The geo locations that you have configured to host data in your Office 365 tenant. Multi-geo tenants span more than one geo location, for example, North America and Europe.

-   **Preferred Data Location (PDL)** – The geo location where an individual user's OneDrive data is stored. This can be set by the administrator to any of the Allowed Data Locations that have been configured for the tenant. Note that if you change the PDL for a user who already has a OneDrive site, their OneDrive data is not moved to the new geo location automatically. See [Move a OneDrive library to a different geo-location](move-onedrive-between-geo-locations.md) for more information.

Enabling Multi-Geo requires four key steps:

1.  Work with your account team to add the _Multi-Geo Capabilities in Office 365_ service plan.

2.  Choose your desired satellite location(s) and add them to your tenant.

3.  Set your users' preferred data location to the desired satellite location. When a new OneDrive site is provisioned for a user, it is provisioned to their PDL.

4.  Migrate your users' existing OneDrive sites from the central location to their preferred data location as needed.

See [Configure OneDrive for Business Multi-Geo](multi-geo-tenant-configuration.md) for details on each of these steps.

> [!IMPORTANT]
> Note that Office 365 Multi-Geo is not designed for performance optimization cases, it is designed to meet data residency requirements. For information about performance optimization for Office 365, see [Network planning and performance tuning for Office 365](https://support.office.com/article/e5f1228c-da3c-4654-bf16-d163daee8848) or contact your support group.

You can configure any of the following locations to be satellite locations where you can host OneDrive files. As you plan for multi-geo, make a list of the locations that you want to add to your Office 365 tenant. We recommend starting with one or two satellite locations and then gradually expanding to more geo locations, if needed.

<table>
<thead>
<tr class="header">
<th align="left"><strong>Location</strong></th>
<th align="left"><strong>Code</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Asia-Pacific</td>
<td align="left">APC</td>
</tr>
<tr class="even">
<td align="left">Australia</td>
<td align="left">AUS</td>
</tr>
<tr class="odd">
<td align="left">Canada</td>
<td align="left">CAN</td>
</tr>
<tr class="even">
<td align="left">Europe / Middle East / Africa</td>
<td align="left">EUR</td>
</tr>
<tr class="odd">
<td align="left">France</td>
<td align="left">FRA</td>
</tr>
<tr class="odd">
<td align="left">India</td>
<td align="left">IND</td>
</tr>
<tr class="odd">
<td align="left">Japan</td>
<td align="left">JPN</td>
</tr>
<tr class="even">
<td align="left">Korea</td>
<td align="left">KOR</td>
</tr>
<tr class="odd">
<td align="left">North America</td>
<td align="left">NAM</td>
</tr>
<tr class="odd">
<td align="left">United Kingdom</td>
<td align="left">GBR</td>
</tr>
</tbody>
</table>

When you configure multi-geo, consider taking the opportunity to consolidate your on-premises infrastructure while migrating to Office 365. For example, if you have on-premises farms in Singapore and Malaysia, then you can consolidate them to the APC satellite location, provided data residency requirements allow you to do so.

## Best practices

We recommend that you create a test user in Office 365 to do some initial testing. We'll walk through some testing and verification steps with this user before you proceed to onboard production users into OneDrive Multi-Geo.

Once you've completed testing with the test user, select a pilot group – perhaps from your IT department – to be the first to use OneDrive in a new geo location. For this first group, select users who do not yet have a OneDrive. We recommend no more than five people in this initial group and gradually expand following a batched rollout approach.

Each user should have a *preferred data location* (PDL) set so that Office 365 can determine in which geo location to provision their OneDrive. The user's preferred data location must match one of your chosen satellite locations or your central location. While the PDL field is not mandatory, we recommend that a PDL be set for all users. Workloads of a user without a PDL will be provisioned in the central location.   

Create a list of your users, and include their user principal name (UPN) and the location code for the appropriate preferred data location. Include your test user and your initial pilot group to start with. You'll need this list for the configuration procedures.

If your users are synchronized from an on-premises Active Directory system to Azure Active Directory, you must set the preferred data location for synchronized users by using Azure Active Directory Connect. You cannot directly configure the preferred data location for synchronized users using Azure AD PowerShell. The steps to set up PDL in AD and Synchronize it are covered in [Azure Active Directory Connect sync: Configure preferred data location for Office 365 resources](https://docs.microsoft.com/en-us/azure/active-directory/connect/active-directory-aadconnectsync-feature-preferreddatalocation).

The administration of a multi-geo tenant can differ from a non-multi-geo tenant, as many of the SharePoint and OneDrive settings and services are multi-geo aware. We recommend that you review [Administering a multi-geo environment](administering-a-multi-geo-environment.md) before you proceed with your configuration.

Read [User experience in a multgeo environment](multi-geo-user-experience.md) for details about your end users' experience in a multi-geo environment.

To get started configuring OneDrive for Business Multi-Geo, see [Configure OneDrive for Business Multi-Geo](multi-geo-tenant-configuration.md).

Once you've completed the configuration, remember to [migrate your users' OneDrive libraries](move-onedrive-between-geo-locations.md) as needed to get your users working from their preferred data locations.
