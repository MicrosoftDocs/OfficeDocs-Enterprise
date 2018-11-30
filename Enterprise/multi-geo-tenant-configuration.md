---
title: "Office 365 Multi-Geo tenant configuration"
ms.author: mikeplum
author: MikePlumleyMSFT
manager: pamgreen
ms.audience: ITPro
ms.topic: article
ms.service: o365-solutions
ms.custom: 
localization_priority: Priority
ms.collection: Strat_SP_gtc
description: "Learn how to configure Office 365 Multi-Geo."
---

# Office 365 Multi-Geo tenant configuration

Before you configure your tenant for Office 365 Multi-Geo, be sure you have read [Plan for Office 365 Multi-Geo](plan-for-multi-geo.md). To follow the steps in this article, you'll need a list of the geo locations that you want to enable as satellite locations, and the test users that you want to provision for those locations.

## Add the Multi-Geo Capabilities in Office 365 plan to your tenant

To use Office 365 Multi-Geo, you need the _Multi-Geo Capabilities in Office 365_ plan. Work with your account team to add this plan to your tenant. Your account team will connect you with the appropriate licensing specialist and get your tenant configured.

Note that the _Multi-Geo Capabilities in Office 365_ plan is a user-level service plan. You need a license for each user that you want to host in a satellite location. You can add more licenses over time as you add users in satellite locations.

Once your tenant has been provisioned with the  _Multi-Geo Capabilities in Office 365_ plan, the **Geo locations** tab will become available in the OneDrive and SharePoint admin centers.

## Add satellite locations to your tenant

You must add a satellite location for each geo location where you want to store data. Available geo locations are shown in the following table:

[!INCLUDE [Office 365 Multi-Geo locations](includes/office-365-multi-geo-locations.md)]

![Screenshot of geo locations page in the SharePoint admin center](media/sharepoint-multi-geo-admin-center.png)

To add a satellite location

1. Open the SharePoint admin center.

2. Navigate to the **Geo locations** tab.

3. Click **Add location**.

4. Select the location that you want to add, and then click **Next**.

5. Type the domain that you want to use with the geo location, and then click **Add**.

6. Click **Close**.

Provisioning may take from a few hours up to 72 hours, depending on the size of your tenant. Once provisioning of a satellite location has completed, you will receive an email confirmation. When the new geo location appears in blue on the map on the **Geo locations** tab in the OneDrive admin center, you can proceed to set users' preferred data location to that geo location. 

> [!IMPORTANT]
> Your new satellite location will be set up with default settings. This will allow you to configure that satellite location as appropriate for your local compliance needs.

## Setting users' preferred data location
<span id="_Setting_a_User's" class="anchor"><span id="_Toc508109326" class="anchor"></span></span> 

Once you enable the needed satellite locations, you can update your user accounts to use the appropriate preferred data location. We recommend that you set a preferred data location for every user, even if that user is staying in the central location.

> [!IMPORTANT]
> If a user's preferred data location is set to a location that has not been configured as a satellite location or the central location, the system will default to the central location when provisioning OneDrive and SharePoint sites and Group mailboxes.

> [!TIP]
> We recommend that you begin validations with a test user or small group of users before rolling out multi-geo to your broader organization.

In Azure Active Directory there are two types of user objects: cloud only users and synchronized users. Please follow the appropriate instructions for your type of user.

### Synchronize user's Preferred Data Location using Azure Active Directory Connect 

If your company’s users are synchronized from an on-premises Active Directory system to Azure Active Directory, their PreferredDataLocation must be populated in AD and synchronized to AAD.
Follow the process in [Azure Active Directory Connect sync: Configure preferred data location for Office 365 resources](/azure/active-directory/hybrid/how-to-connect-sync-feature-preferreddatalocation) to configure Preferred Data Location sync from on-premises Active Directory to Azure Active Directory.

We recommend that you include setting the user's Preferred Data Location as a part of your standard user creation workflow.

> [!IMPORTANT]
> For new users with no OneDrive provisioned, wait at least 24 hours after a user's PDL is synchronized to Azure Active Directory for the changes to propagate before the user logs in to OneDrive for Business. (Setting the preferred data location before the user logs in to provision their OneDrive for Business ensures that the user's new OneDrive will be provisioned in the correct location.)

### Setting Preferred Data Location for cloud only users 

If your company's users are not synchronized from an on-premises Active Directory system to Azure Active Directory, meaning they are created in Office 365 or Azure Active Directory, then the PDL must be set using Azure Active Directory PowerShell.

The procedures in this section require the [Microsoft Azure Active Directory Module for Windows PowerShell Module](https://www.powershellgallery.com/packages/MSOnline/1.1.166.0). If you already have Azure Active Directory PowerShell installed, please ensure you update to the latest version.

1.  Open the Microsoft Azure Active Directory Module for Windows PowerShell.

2.  Run `Connect-MsolService` and enter the global administrator credentials for your tenant.

3.  Use the [Set-MsolUser](https://docs.microsoft.com/powershell/msonline/v1/set-msoluser) cmdlet to set the preferred data location for each of your users. For example:

    `Set-MsolUser -userprincipalName Robyn.Buckley@Contoso.com -PreferredDatalocation EUR`

    You can check to confirm that the preferred data location was updated properly by using the Get-MsolUser cmdlet. For example:

    `(Get-MsolUser -userprincipalName Robyn.Buckley@Contoso.com).PreferredDatalocation`

![Screenshot of PowerShell window showing set-msoluser](media/multi-geo-tenant-configuration-image3.png)

We recommend that you include setting the user's Preferred Data Location as a part of your standard user creation workflow.

> [!IMPORTANT]
> For new users with no OneDrive provisioned, wait at least 24 hours after a user's PDL is set for the changes to propagate before the user logs in to OneDrive. (Setting the preferred data location before the user logs in to provision their OneDrive for Business ensures that the user's new OneDrive will be provisioned in the correct location.)

## OneDrive Provisioning and the effect of PDL

If the user already has a OneDrive site created in the tenant, setting their PDL will not automatically move their existing OneDrive. To move a user's OneDrive, see [OneDrive for Business Geo Move](move-onedrive-between-geo-locations.md) please follow the instructions in Moving OneDrive between geo locations. (Note that the user's Exchange mailbox does move automatically when you set the user's PDL.)

If the user does not have a OneDrive site within the tenant, OneDrive will be provisioned for them in accordance to their PDL value, assuming the PDL for the user matches one of the company's satellite locations.

## Configuring Multi-Geo search

Your multi-geo tenant will have aggregate search capabilities allowing a search query to return results from anywhere within the tenant.

By default, searches from these entry points will return aggregate results, even though each search index is located within its relevant geo location:

- OneDrive for business

- Delve

- SharePoint Home

- Search Center

Additionally, multi-geo search capabilities can be configured for your custom search applications that use the SharePoint search API.

Please review [Configure Search for OneDrive for Business Multi-Geo](configure-search-for-multi-geo.md) for instructions including any limitations and differences.

## Validating the Office 365 Multi-Geo configuration

Below are some basic use cases you may wish to include in your validation plan before broadly rolling out Office 365 Multi-Geo to your company. Once you have completed these tests and any additional use cases that are relevant to your company, you may choose to move on to adding the users in your initial pilot group.

**OneDrive for Business**

Select OneDrive from the Office 365 app launcher and confirm that you are automatically directed to the appropriate geo location for the user, based on the user's PDL. OneDrive for Business should now begin provisioning at that location. Once provisioned, try uploading and downloading some documents.

**OneDrive Mobile App**

Log into your OneDrive mobile App with your test account credentials. Confirm that you can see your OneDrive for business files and can interact with them from your mobile device.

**OneDrive sync client**

Confirm that the OneDrive sync client automatically detects your OneDrive for Business geo location upon login. If you need to download the sync client, you can click **Sync** in the OneDrive library.

**Office applications**

Confirm that you can access OneDrive for Business by logging in from an Office application, such as Word. Open the Office application and select "OneDrive – <TenantName>". Office will detect your OneDrive location and show you the files that you can open.

**Sharing**

Try sharing OneDrive files. Confirm that the people picker shows you all your SharePoint online users regardless of their geo location.
