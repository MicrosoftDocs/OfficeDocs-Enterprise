---
title: "Optimizing page calls in SharePoint Online modern portal pages"
ms.author: kvice
author: kelleyvice-msft
manager: laurawi
ms.date: 9/11/2019
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
description: "Learn about how to optimize modern portal pages in SharePoint Online by limiting the number of calls to SharePoint Online service endpoints."
---

# Optimizing page calls in SharePoint Online modern portal pages

In classic SharePoint Online publishing sites, the SharePoint service executes data requests and other processing operations, returning results and rendered pages to the client. The SharePoint Online modern portal experience is designed to perform certain data requests and processor-intensive operations such as page rendering on the client computer itself.

When a portal page is rendered in a client browser, multiple calls are made from the client computer to various SharePoint Online service endpoints, feature APIs, CDN content and other external endpoints that provide data to be rendered on the page. Each of these calls takes a certain amount of time to receive and process the response, and while some calls may be executed concurrently, the cumulative effect is that every call incrementally increases the time it takes for the page to render. This is also known as **user perceived latency**, and the ultimate goal of most guidance for SharePoint Online performance optimization is to reduce this latency to the least possible amount.

This article will help you understand how to determine the number and impact of external calls in your modern portal pages and how to limit their effect on user perceived latency.

>[!NOTE]
>For more information about performance in SharePoint Online modern portals, see [Performance in the modern SharePoint experience](https://docs.microsoft.com/en-us/sharepoint/modern-experience-performance).

## Use the Page Diagnostic Tool to analyze page calls

The Page Diagnostic Tool is a browser extension for Chrome and the new [Edge Chromium](https://www.microsoftedgeinsider.com/en-us/download?form=MI13E8&OCID=MI13E8) you can use to analyze SharePoint modern portal pages and provide a report showing how the page performs against a set of performance criteria. To install and learn about the Page Diagnostic Tool, visit [Use the Page Diagnostics tool for SharePoint Online](page-diagnostics-for-spo.md).

When you analyze a SharePoint modern portal page with the Page Diagnostic Tool, you can see information about external calls in the **Requests to SharePoint** line of the _Diagnostic tests_ view of the results pane. The line will appear in green if the portal page meets the baseline standard of **20 calls per page**, and red if the page exceeds the baseline number of calls.

![Page Diagnostic Tool results](media/modern-service-request-optimization/pagediag-requests.png)

If the line is red, you can click the **Requests to Sharepoint** line for details, including the total number of calls on the page and a list of the URLs.

![Requests to SharePoint results](media/modern-service-request-optimization/pagediag-requests.png)

## Reduce the number of calls on a page

If a page contains too many calls, you can use the **Requests to Sharepoint** results in the Page Diagnostic Tool to determine whether there are any unnecessary calls and revise the page to omit them. Before you make your revisions, make a note of the page load time in the analysis results. Run the tool again after your revision to see if the new result is within the baseline standard, and check the new page load time to see if there was an improvement.

>[!NOTE]
>Page load time can vary based on a variety of factors such as network load, time of day, and other transient conditions. You should test page load time a few times before and after making changes to help you average the results.

## Related topics

[Tune SharePoint Online performance](tune-sharepoint-online-performance.md)

[Tune Office 365 performance](tune-office-365-performance.md)

[Content delivery networks](content-delivery-networks.md)

[Performance in the modern SharePoint experience](https://docs.microsoft.com/en-us/sharepoint/modern-experience-performance.md)
