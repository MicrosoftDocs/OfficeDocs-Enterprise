---
title: "Move a SharePoint site to a different geo-location"
ms.author: mikeplum
author: MikePlumleyMSFT
manager: pamgreen
ms.audience: ITPro
ms.topic: article
ms.service: o365-solutions
ms.custom: 
ms.collection: Strat_SP_gtc
localization_priority: Priority
description: "Learn how to move a SharePoint site to a different geo location."
---

# Move a SharePoint site to a different geo-location 

With SharePoint site geo move, you can move SharePoint sites to other geo locations within your multi-geo environment.

Cross-Geo Site Move fast facts
Fact  	Description 
Supported types of sites 	•	

The following types of site can be moved between geo locations:

- Office 365 Group-connected sites
- Modern sites without an Office 365 Group association
- Classic SharePoint sites
- Communication sites

You must be a Global Administrator or SharePoint Administrator to move a site between geo locations.

There is a read-only window during Cross-Geo Site Move (approx. 4-6 hours, depending on site contents)
 
By default, initial URL for the site will change to the URL of the destination geo. You can change the site part of the URL as an option. For example:

https://Contoso.sharepoint.com/sites/projectx to https://Contoso.sharepointEUR.com/sites/projectx

OR with rename

https://Contoso.sharepoint.com/sites/projectx to 
https://Contoso.sharepointEUR.com/sites/projecty

Scheduling 	You can schedule the site moves to happen in the future, we allow you to schedule up to 4,000 at a time. 


Pre-requisites 

1.	The procedures in this article require the latest Microsoft SharePoint Online PowerShell Module
2.	The destination location where you want to move the site to must be in SharePoint Online Multi-Geo mode.
3.	A willing and able Global Admin or SharePoint Online Administrator for your tenant.

## Recommendations / Tips 

1.	Get familiar with the tech by trying a few Cross-Geo Sites Moves on test sites and simple sites. 
2.	Validate whether the site can be moved prior to scheduling or performing the move. 
3.	When possible schedule cross-geo sites moves for outside business hours to reduce user impact.
4.	Communicate with impacted users prior to the sites move. 

## Moving a SharePoint Site across geo locations

Cross-Geo Sites Move requires that you connect and perform the move from the SharePoint Admin URL in the geo location where the site is.

In this example, our site is in https://contosohealthcare.sharepoint.com/sites/Turbines so we will connect to the SharePoint Admin URL at:  
https://contosohealthcare-admin.sharepoint.com
connect-sposervice -url https://contosohealthcare-admin.sharepoint.com
 
## Validating the environment

Before you start a SharePoint site geo move, we recommend that you validate the environment.

To ensure all geo locations are compatible you can run `Get-SPOGeoMoveCompatibilityStatus`. This will display all your geo locations and whether the environment is compatible with the destination geo location.

### Validating the site

We recommend that before scheduling any sites move, you perform a validation to ensure that the site can be moved.

We do not support moving sites with:
-	Business Connectivity Services
-	InfoPath forms 
-	Legal Holds

To perform a validation-only check on your site, use `Start-SPOSiteContentMove` with the `-ValidationOnly` parameter to validate if the site is able to be moved. For example:

```PowerShell
Start-SPOSiteContentMove -SourceSiteUrl <SourceSiteUrl> -ValidationOnly -DestinationDataLocation <DestinationLocation>
```

This will return *Success* if the site is ready to be moved or *Fail* if any of blocked conditions are present.

## Start a Cross-Geo Sites Move (non-O3565 group connected site)

To start the site move, run:

`Start-SPOSiteContentMove -SourceSiteUrl <siteURL> -DestinationDataLocation <DestinationDataLocation>`
 
To schedule a Cross-Geo Site Move for a later time, use one of the following parameters:
- `PreferredMoveBeginDate` – The move will likely begin at this specified time.
- `PreferredMoveEndDate` – The move will likely be completed by this specified time, on a best effort basis. 

Time must be specified in Coordinated Universal Time (UTC) for both parameters.

## Start Cross-Geo Sites Move for an O365 Group Connected site

To move an O365 group connected site, the global administrator must first change the Preferred Data Location (PDL) attribute for the site.

To set the PDL for a group:

```PowerShell
Set-SPOUnifiedGroup -PreferredDataLocation <PDL> -GroupAlias <GroupAlias>
Get-SPOUnifiedGroup -GroupAlias <GroupAlias>
```

To start the move, run: 

```PowerShell
Start-SPOUnifiedGroupMove -GroupAlias <GroupAlias> -DestinationDataLocation <DestinationDataLocation>
```

To schedule a Cross-Geo Site Move for a later time, use one of the following parameters:
- `PreferredMoveBeginDate` – The move will likely begin at this specified time.
- `PreferredMoveEndDate` – The move will likely be completed by this specified time, on a best effort basis.

Times for both parameters must be specified in Coordinated Universal Time (UTC).

## Rename the site during site move

You may rename a site as part of site move with the following parameter: -Destinati-DestinationUrl onUrl

## Cancel a Cross-Geo Sites Move

You can step a Cross-Geo sites move, provided the move is not in progress or completed by using the following cmdlet:

## Determining the status of a cross-geo site move

You can determine the status of a cross-geo site move in our out of the geo that you are connected to by using:

- `Get-SPOSiteContentMoveState` (sites move, non-group)
- `Get-SPOUnifiedGroupMoveState` (groups move)

The move statuses are described in the following table.

|Status|Description|
|:-----|:----------|
|Ready to Trigger|The move has not started.|
|Scheduled|The move is in queue but has not yet started.|
|InProgress (n/4)|The move is in progress in one of the following states: Validation (1/4), Backup (2/4), Restore (3/4), Cleanup (4/4).|
|Success|The move has completed successfully.|
|Failed|The move failed.|

To get the status of our sample move:

`Get-SPOSiteContentMoveState -SourceSiteUrl https://contosohealthcare.sharepoint.com/sites/Turbines`

You can also apply the `-Verbose` option to see additional information about the move.

## Communicating to your users

When moving SharePoint sites between geo locations, it's important to communicate to the sites' users (generally anyone with the ability to edit the site) what to expect. This can help reduce user confusion and calls to your help desk. Email your site's users before the move and let them know the following information:

- When the move is expected to start and how long it is expected to take
- What geo location their site is moving to, and the URL to access the new location
- They should close their files and not make edits during the move.
- File permissions and sharing will not change because of the move.
- What to expect from the user experience in a multi-geo environment

Be sure to send your sites' users an email when the move has successfully completed informing them that they can resume working on their sites.

## User experience

Site users should notice minimal disruption when their site is moved to a different geo location. Aside from a brief read-only state during the move, existing links and permissions will continue to work as expected once the move is completed.

### Site

While the move is in progress the site is set to read-only. Once the move is completed, the user is directed to the new site in the new geo location when they click on bookmarks or other links to the site.

### Permissions

Users with permissions to site will continue to have access to the site during the move and after it's complete.

### Sync Client

The sync client will automatically detect and seamlessly transfer syncing to the new site location once the cross-geo site move is complete. The user does not need to sign-in again or take any other action. (Version 17.3.6943.0625 or later of the sync client required.)

If a user updates a file while the move is in progress, the sync client will notify them that file uploads are pending while the move is underway.

### Sharing links

When the SharePoint site geo move completes, the existing shared links for the files that were moved will automatically redirect to the new geo location.

### Most Recent Files in Office (MRU)

The MRU service is updated with the site url and its content URLs once the move completes. This applies to Word, Excel, and PowerPoint.

### OneNote Experience

OneNote win32 client and UWP (Universal) App will automatically detect and seamlessly sync notebooks to the new site location once site move is complete. The user does not need to sign-in again or take any other action. The only visible indicator to the user is notebook sync would fail when site move is in progress. This experience is available on the following OneNote client versions:

- OneNote win32 – Version 16.0.8326.2096 (and later)
- OneNote UWP – Version 16.0.8431.1006 (and later)
- OneNote Mobile App – Version 16.0.8431.1011 (and later)

### Teams (applicable to O365 Group connected sites)

When the SharePoint site geo move completes, users will have access to their Office 365 Group site files on the Teams app. Additionally, files shared via Teams chat from their site prior to geo move will continue to work after move is complete.

### SharePoint Mobile App (iOS/Android)

The SharePoint Mobile App is cross geo compatible and able to detect the site's new geo location.

### SharePoint Flow 2013

SharePoint Flow 2013 will need to be re-published after the site move.

### Apps

If you are moving a site with apps, you must re-instantiate the app in the site's new geo location as the app and its connections may not be available in the destination geo location.

### Flow

In most cases Flows will continue to work after cross-geo sites move.

### PowerApps

PowerApps will need to be recreated in the destination location.

### Data movement between geo locations

SharePoint uses Azure Blob storage for its content, while the metadata associated with sites and its files is stored within SharePoint. After the site is moved from its source geo location to its destination geo location, the service will also move its associated Blob Storage. Blob Storage moves complete in approximately 40 days. 
