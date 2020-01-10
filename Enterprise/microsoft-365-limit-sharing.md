---
title: "Limit sharing in Microsoft 365"
ms.author: mikeplum
author: MikePlumleyMSFT
manager: pamgreen
audience: ITPro
ms.topic: article
ms.service: o365-solutions
ms.collection: SPO_Content
ms.custom: 
localization_priority: Priority
description: "Learn about to limit sharing in Microsoft 365."
---

# Limit sharing in Microsoft 365

The methods of sharing files in Microsoft 365 are listed in the table below. Click the link in the **Sharing method** column for detailed information.

|Sharing method|Description|Admin controls|
|:-------------|:----------|:-------------|
|[Office 365 group or team](#office-365-group-or-team)|People granted access to a Microsoft Teams team or Office 365 group have edit access to files in the associated SharePoint site.|If the group or team is private, sharing invitations to join the team go to the owner for approval. Admins can disable guest access to prevent access by people from outside the organization.|
|[SharePoint site](#sharePoint-site)|People can be granted Owner, Member, or Visitor access to a SharePoint site and will have that level of access to files in the site.|Site permissions can be restricted so that only site owners can share the site.|
|[Direct file permissions](#direct-file-permissions)|Site members and people with edit permissions can give direct permissions to others.|Site permissions can be restricted so that only site owners can share files and folders. Direct access sharing by site members goes to site owner for approval.|
|[*Anyone* sharing link](#anyone-sharing-link)|SharePoint site owners and members can share files using *Anyone* links which can be used by people inside or outside the organization to access the file without authentication.|Anyone links can be disabled for the entire organization or for individual sites.|
|[*People in your organization* sharing link](#people-in-your-organization-sharing-link)|SharePoint site owners and members can share files using *People in your organization* links, which will work for anyone inside the organization.|*People in your organization* links can be disabled at the site level.|
|[*Specific people* sharing link](#specific-people-sharing-link)|SharePoint site owners and members can share files using *Specific people* links, which will work only for the people specified.|Site permissions can be restricted so that only site owners can share files and folders. *Specific people* link sharing by site members goes to the site owner for approval.|
|[Email](#email)|People with access to a file can send it to others via email.|Admins can encrypt files by using sensitivity labels to prevent them being shared with unauthorized people.|
|[Download of file copy](#download-of-file-copy)|People with access to a file can download or copy it and share it with others outside the scope of Microsoft 365.|Admins can encrypt files by using sensitivity labels to prevent them being shared with unauthorized people.|

Discussion of the downsides of limiting sharing

## Office 365 group or team

Make the team private

### Guest sharing

Turn off guest sharing for Teams

Turn off guest sharing for Office 365 groups

Turn off guest sharing for a specific group or team

PowerShell - turn off external users for group/team
[Block guest users from a specific group](https://docs.microsoft.com/office365/admin/create-groups/manage-guest-access-in-groups?view=o365-worldwide#block-guest-users-from-a-specific-group)

block domain at SharePoint or Azure AD level

## SharePoint site

Limit sharing of files, folders, and the site to site owners

Turn off access requests

Turn off guest sharing


## Direct file permissions

Limit sharing of files, folders, and the site to site owners


## *Anyone* sharing link

Turn off Anyone links at the organization level

Turn off Anyone links at the site level

## *People in your organization* sharing link

PowerShell - turn off company links for site
Set-SPOSite -Identity https://contoso.sharepoint.com -DisableCompanyWideSharingLinks

## *Specific people* sharing link

Limit sharing of files, folders, and the site to site owners

## Email

Encrypt the content by using sensitivity labels.

## Download or file copy

Encrypt the content by using sensitivity labels.

## Alternatives to limiting sharing

Encrypt
Use DLP to restrict sharing
Domain filtering



Site settings - owners-only sharing
Site settings - Only people in the organization
PowerShell - turn off company links for OneDrive?
Set-SPOSite -Identity https://contoso.sharepoint.com -DisableCompanyWideSharingLinks

At the tenant level
At the team/group level
At the site level
At the OneDrive level



Alternatives


Reporting


## See also

