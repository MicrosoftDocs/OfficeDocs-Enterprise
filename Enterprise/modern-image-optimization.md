---
title: "Optimize images in SharePoint Online modern portal pages"
ms.author: kvice
author: kelleyvice-msft
manager: laurawi
ms.date: 9/17/2019
audience: ITPro
ms.topic: conceptual
ms.service: o365-administration
localization_priority: Priority
ms.collection: 
- Ent_O365
- Strat_O365_Enterprise
ms.custom: Adm_O365
ms.reviewer: sstewart
search.appverid:
- MET150
description: "Learn how to optimize images in SharePoint Online modern portal pages."
---

# Optimize images in SharePoint Online modern portal pages

This article will help you understand how to optimize images in SharePoint Online modern portal pages.

>[!NOTE]
>For more information about performance in SharePoint Online modern portals, see [Performance in the modern SharePoint experience](https://docs.microsoft.com/en-us/sharepoint/modern-experience-performance).

## Use the Page Diagnostics for SharePoint tool to analyze image optimization

The **Page Diagnostics for SharePoint tool** is a browser extension for Chrome and [Microsoft Edge version 77 or later](https://www.microsoftedgeinsider.com/en-us/download?form=MI13E8&OCID=MI13E8) you can use to analyze SharePoint both modern portal pages and classic publishing site pages. The tool provides a report for each analyzed page showing how the page performs against a defined set of performance criteria. To install and learn about the Page Diagnostics for SharePoint tool, visit [Use the Page Diagnostics tool for SharePoint Online](page-diagnostics-for-spo.md).

When you analyze a SharePoint modern portal page with the Page Diagnostics for SharePoint tool, you can see information about large images in the _Diagnostic tests_ pane.

Possible results include:

- **Attention required** (red): The page contains **one or more** images over 300KB in size
- **No action required** (green): The page contains no images over 300KB in size

If the **Large images detected** result appears in the **Attention required** section of the results, you can click the result to see additional details.

![Page Diagnostics tool results](media/modern-portal-optimization/pagediag-large-images.png)

## Remediate large image issues

If a page contains images over 300KB in size, select the **Large images detected** result to see which images are too large and update them with appropriately sized images. Before you make page revisions to remediate performance issues, make a note of the page load time in the analysis results. Run the tool again after your revision to see if the new result is within the baseline standard, and check the new page load time to see if there was an improvement.

![Page load time results](media/modern-portal-optimization/pagediag-page-load-time.png)

>[!NOTE]
>Page load time can vary based on a variety of factors such as network load, time of day, and other transient conditions. You should test page load time a few times before and after making changes to help you average the results.

<guidance>

## Related topics

[Tune SharePoint Online performance](tune-sharepoint-online-performance.md)

[Tune Office 365 performance](tune-office-365-performance.md)

[Content delivery networks](content-delivery-networks.md)

[Performance in the modern SharePoint experience](https://docs.microsoft.com/en-us/sharepoint/modern-experience-performance.md)
