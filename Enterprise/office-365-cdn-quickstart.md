---
title: "Office 365 Content Delivery Network (CDN) Quickstart"
ms.author: kvice
author: kelleyvice-msft
manager: laurawi
ms.date: 05/28/2020
audience: ITPro
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.collection: 
- Ent_O365
- SPO_Content
f1.keywords:
- CSH
ms.custom: Adm_O365
search.appverid:
- MET150
- SPO160
description: "Office 365 Content Delivery Network (CDN) Quickstart"
---

# Office 365 Content Delivery Network (CDN) Quickstart

You can use the built-in Office 365 Content Delivery Network (CDN) to host static assets (images, JavaScript, Stylesheets, WOFF files) to provide better performance for your SharePoint Online pages. The Office 365 CDN improves performance by caching static assets closer to the browsers requesting them, which helps to speed up downloads and reduce latency. Also, the Office 365 CDN uses the HTTP/2 protocol for improved compression and HTTP pipelining. The Office 365 CDN service is included as part of your SharePoint Online subscription.

For more detailed information guidance see (https://docs.microsoft.com/office365/enterprise/use-office-365-cdn-with-spo)

>[!NOTE]
>The Office 365 CDN is only available to tenants in the Production (worldwide) cloud. Tenants in the US Government, China and Germany clouds do not currently support the Office 365 CDN.

## Use the Page Diagnostics for SharePoint tool to identify items not in CDN
The Page Diagnostics for SharePoint tool is a browser extension for the new Microsoft Edge (https://www.microsoft.com/edge) and Chrome browsers that analyzes both SharePoint Online modern portal and classic publishing site pages. The tool provides a report for each analyzed page showing how the page performs against a defined set of performance criteria. To install and learn about the Page Diagnostics for SharePoint tool, visit [Use the Page Diagnostics tool for SharePoint Online](https://aka.ms/perftool).

>[!NOTE]
>The Page Diagnostics tool only works for SharePoint Online, and cannot be used on a SharePoint system page.

## CDN Overview

CDN is used to optimize performance for users and is separated into two basic types: 

- **Public CDN** is designed to be used for JS (JavaScript), CSS (StyleSheets), Web Font File (WOFF, WOFF2) and non-proprietaty images like company logs.
- **Private CDN** is designed to be used for images (PNG, JPG, JPEG, etc.).

## How to enable Public and Private CDN with the default configuration
Before you make changes to the tenant CDN settings, you should verify that it meets the Compliance, Security and Privacy of your organization.

For more detailed configuration settings or if you have already enabled CDN and want to add additional locations (origins) please see
https://docs.microsoft.com/office365/enterprise/use-office-365-cdn-with-spo#set-up-and-configure-the-office-365-cdn-by-using-the-sharepoint-online-management-shell

Connect to your tenant using the SharePoint Online Management Shell:

```PowerShell
Connect-SPOService -Url https://**<YourTenantName>**-admin.sharepoint.com
```
To enable your organization to use both public and private origins with the default configuration, type the following command:

```PowerShell
Set-SPOTenantCdnEnabled -CdnType Both -Enable $true
```
