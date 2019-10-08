---
title: "SharePoint Online modern site performance recommendations"
ms.author: kvice
author: kelleyvice-msft
manager: laurawi
ms.date: 10/8/2019
audience: Admin
ms.topic: interactive-tutorial
ms.service: o365-administration
localization_priority: Normal
ms.collection: Strat_O365_Enterprise
ms.custom: Adm_O365
search.appverid: 
- MET150
description: "Learn about performance recommendations for modern sites in SharePoint Online and how these recommendations relate to acceptable performance."
---

# SharePoint Online modern site performance recommendations

This article provides performance recommendations for modern portal sites in SharePoint Online. Use the guidelines in this article to optimize modern portal site performance and avoid common performance issues.

A good rule of thumb for optimizing performance is to avoid making multiple calls to SharePoint to request the same information within a user session. For example, if a site page contains a query to the Microsoft Graph API for user metadata, configure the page to cache the data the first time it is queried rather than making the same query if the page is refreshed.

>[!NOTE]
>Use the [Page Diagnostics for SharePoint tool](https://aka.ms/perftool) as a starting point to analyze specific performance metrics on SharePoint Online site pages.

|**Limit**|**Maximum value**|**Limit type**|**Notes**|
|:-----|:-----|:-----|:-----|
|Pages and news items  <br/> |5,000 per site  <br/> |Threshold  <br/> |We recommend limiting the number of pages and news items in a modern portal site to below 5,000.  <br/> |
|Web parts on a page  <br/> |20 per page  <br/> |Threshold  <br/> |We recommend using 20 or fewer total web parts per page, including both out-of-the-box Microsoft web parts and custom web parts. <br/> For more information, see [Optimize web part performance in SharePoint Online modern site pages](modern-web-part-optimization.md).  <br/> |
|Dynamic web parts on a page  <br/> |4 per page  <br/> |Threshold  <br/> |Dynamic web parts that make one or more queries to SharePoint to fetch the latest data should be limited to 4 per page. The _News_ web part is an example of a dynamic web part. <br/> For more information, see [Optimize web part performance in SharePoint Online modern site pages](modern-web-part-optimization.md).    <br/> |
|Security groups  <br/> |20 per site  <br/> |Threshold  <br/> |The number of security groups affects the scale of many queries in modern portal sites. We recommend that you limit the number of security groups to as small a set as possible, with no more than 20 per site.  <br/> |
|Items in site navigation  <br/> |100 per site  <br/> |Threshold  <br/> |We recommend adding fewer than 100 items to site navigation, and that you make use of out-of-the-box navigation controls.  <br/> For more information, see [Optimize page weight in SharePoint Online modern site pages](modern-page-weight-optimization.md). <br/> |
|Images in the viewport  <br/> |5 per page  <br/> |Threshold  <br/> |The number of images in the viewport (the top of the page that is visible without scrolling) should be limited to 5. Site images should also be hosted in a CDN. <br/>For more information, see [Optimize images in SharePoint Online modern site pages](modern-image-optimization.md).  <br/> |
|Maximum image size  <br/> |300 Kb per image  <br/> |Threshold  <br/> |We recommend limiting the size of images to 300kb or smaller, and using a CDN to host images, stylesheets and scripts. <br/>For more information, see [Optimize images in SharePoint Online modern site pages](modern-image-optimization.md) and [Use the Office 365 Content Delivery Network (CDN) with SharePoint Online](use-office-365-cdn-with-spo.md).  <br/> |
|Users with edit rights  <br/> |200 users per site  <br/> |Threshold  <br/> |SharePoint portal sites are optimized for viewing and consuming content. Edit permissions on a portal should be limited to a restricted group of users because edit permissions download additional controls and will therefore perform slower for those users. An excessive number of users with edit permissions will therefore affect the overall experience. <br/> |
|Third party iFrames  <br/> |2 per page  <br/> |Threshold  <br/> |iFrames are unpredictably slow because they load a separate external page including all associated content such as javascript, CSS and framework elements. If you must use iFrames, limit their number to 2 or fewer per page.<br/> For more information, see [Optimize iFrames in SharePoint Online modern and classic publishing site pages](modern-iframe-optimization.md). <br/> |
|Calls to the UPA service  <br/> |1 per user per hour  <br/> |Threshold  <br/> |We recommend that you make no _per request_ calls to the UPA (User Profile Application) service. The [Microsoft Graph API](https://docs.microsoft.com/en-us/graph/call-api) and [PageContext](https://docs.microsoft.com/en-us/javascript/api/sp-page-context/pagecontext?view=sp-typescript-latest) can be used to query for user information.  <br/> If a UPA service call is necessary, make a single call when required, and then cache the information for reuse in the same session. |
|Calls to the Taxonomy service  <br/> |5 per user per hour  <br/> |Threshold  <br/> |We recommend that you make no _per request_ calls to the Taxonomy service. If Taxonomy service calls are necessary, cache the information for reuse in the same session. <br/> For more information, see [Optimize page calls in SharePoint Online modern and classic publishing site pages](modern-page-call-optimization.md). <br/> |

## Related topics

[Tune SharePoint Online performance](tune-sharepoint-online-performance.md)

[Tune Office 365 performance](tune-office-365-performance.md)

[SharePoint Online limits](https://docs.microsoft.com/en-us/office365/servicedescriptions/sharepoint-online-service-description/sharepoint-online-limits)

[Performance in the modern SharePoint experience](https://docs.microsoft.com/en-us/sharepoint/modern-experience-performance)

[Use the Page Diagnostics for SharePoint tool](https://docs.microsoft.com/en-us/Office365/Enterprise/page-diagnostics-for-spo)
