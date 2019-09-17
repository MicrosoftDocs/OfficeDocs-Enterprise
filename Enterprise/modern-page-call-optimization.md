---
title: "Optimize page calls in SharePoint Online modern portal and classic publishing site pages"
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
description: "Learn how to optimize modern portal and classic publishing site pages in SharePoint Online by limiting the number of calls to SharePoint Online service endpoints."
---

# Optimize page calls in SharePoint Online modern portal and classic publishing site pages

Both SharePoint Online modern portal pages and classic publishing sites contain links that load data, or make calls, from SharePoint features and CDNs. The more calls made by a page, the longer the page takes to load. This is known as **user perceived latency**.

This article will help you understand how to determine the number and impact of calls in your modern portal and classic publishing site pages and how to limit their effect on user perceived latency.

>[!NOTE]
>For more information about performance in SharePoint Online modern portals, see [Performance in the modern SharePoint experience](https://docs.microsoft.com/en-us/sharepoint/modern-experience-performance).

## Use the Page Diagnostic Tool to analyze page calls

The Page Diagnostic Tool is a browser extension for Chrome and [Microsoft Edge version 77 or later](https://www.microsoftedgeinsider.com/en-us/download?form=MI13E8&OCID=MI13E8) you can use to analyze SharePoint both modern portal pages and classic publishing site pages. The tool provides a report for each analyzed page showing how the page performs against a defined set of performance criteria. To install and learn about the Page Diagnostic Tool, visit [Use the Page Diagnostics tool for SharePoint Online](page-diagnostics-for-spo.md).

When you analyze a SharePoint modern portal page with the Page Diagnostic Tool, you can see information about external calls in the **Requests to SharePoint** result in the _Diagnostic tests_ pane. The line will appear in green if the portal page contains fewer than the baseline number of calls, and red if the page exceeds the baseline number. The baseline number is different for modern and classic pages:

- Modern portal pages should contain no more than **25** calls
- Classic publishing pages should contain no more than **6** calls

Possible results include:

- **Attention required** (red): The page exceeds the baseline number of calls
- **No action required** (green): The page contains fewer than the baseline number of calls

If the **Requests to SharePoint** result appears in the **Attention required** section, you can click the result for details, including the total number of calls on the page and a list of the URLs.

![Requests to SharePoint results](media/modern-portal-optimization/pagediag-requests.png)

## Reduce the number of calls on a page

If a page contains too many calls, you can use the **Requests to Sharepoint** results in the Page Diagnostic Tool to determine whether there are any unnecessary calls and revise the page to omit them. Before you make your revisions, make a note of the page load time in the analysis results. Run the tool again after your revision to see if the new result is within the baseline standard, and check the new page load time to see if there was an improvement.

![Page load time results](media/modern-portal-optimization/pagediag-page-load-time.png)

>[!NOTE]
>Page load time can vary based on a variety of factors such as network load, time of day, and other transient conditions. You should test page load time a few times before and after making changes to help you average the results.

## Related topics

[Tune SharePoint Online performance](tune-sharepoint-online-performance.md)

[Tune Office 365 performance](tune-office-365-performance.md)

[Content delivery networks](content-delivery-networks.md)

[Performance in the modern SharePoint experience](https://docs.microsoft.com/en-us/sharepoint/modern-experience-performance.md)
