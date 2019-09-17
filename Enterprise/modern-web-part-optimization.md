---
title: "Optimizing web part performance in SharePoint Online modern portal pages"
ms.author: kvice
author: kelleyvice-msft
manager: laurawi
ms.date: 9/11/2019
audience: Admin
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
description: "Learn about how to optimize the performance of web parts in SharePoint Online modern portal pages."
---

# Optimizing web part performance in SharePoint Online modern portal pages

Both SharePoint Online modern portal pages and classic publishing sites contain web parts that can contribute to overall page load times. This article will help you understand how to determine how web parts in your pages affect user perceived latency, and how to remediate common issues.

>[!NOTE]
>For more information about performance in SharePoint Online modern portals, see [Performance in the modern SharePoint experience](https://docs.microsoft.com/en-us/sharepoint/modern-experience-performance).

## Use the Page Diagnostic Tool to analyze web parts

The Page Diagnostic Tool is a browser extension for Chrome and [Microsoft Edge version 77 or later](https://www.microsoftedgeinsider.com/en-us/download?form=MI13E8&OCID=MI13E8) you can use to analyze SharePoint both modern portal pages and classic publishing site pages. The tool provides a report for each analyzed page showing how the page performs against a defined set of performance criteria. To install and learn about the Page Diagnostic Tool, visit [Use the Page Diagnostics tool for SharePoint Online](page-diagnostics-for-spo.md).

When you analyze a SharePoint modern portal page with the Page Diagnostic Tool, you can see information about web parts in the **No web parts impacting page load time** result in the _Diagnostic tests_ view of the results pane.

Possible results include:

- **No attention required (green)**: No web part takes longer than **2** seconds to return data
- **Attention required (yellow)**: At least one _OOTB_ web part takes longer than **2** seconds to return data
- **Attention required (red)**: At least one _custom_ web part takes longer than **2** seconds to return data

The baseline metric is the same for modern and classic pages.

![Page Diagnostic Tool results](media/modern-service-request-optimization/pagediag-results.png)

If the **No web parts impacting page load time** result appears in red under the **Attention required** section of the results, you can click the result to see the web parts that are slow.

## Remediate web part performance issues

If a page contains any web parts that take longer than 2 seconds to load, you can use the **No web parts impacting page load time** results in the Page Diagnostic Tool to determine which web parts are slow. Before you make your revisions, make a note of the page load time in the analysis results. Run the tool again after your revision to see if the new result is within the baseline standard, and check the new page load time to see if there was an improvement.

![Page load time results](media/modern-service-request-optimization/pagediag-page-load-time.png)

>[!NOTE]
>Page load time can vary based on a variety of factors such as network load, time of day, and other transient conditions. You should test page load time a few times before and after making changes to help you average the results.

There are three categories of possible causes for poor web part performance. Use the information below to determine which issues apply to your scenario.

- Web part script size and dependencies
    - Optimize initial script downloaded necessary to render the mainline scenario for view mode only
    - Move the less frequent scenarios and edit mode code (like property pane) to separate chunks using import() statement
    - Review dependencies of the package.json to remove any dead code completely. Move any test/build only dependencies to devDependencies
    - CDN is required for optimal static resource download. Public is preferable for js/css
    - Reuse frameworks like React and Fabric imports that come as part of spfx
    - Use the latest version of the spfx framework and upgrade as the new ones come out
- Data fetching/caching
    - If the webpart relies on extra server calls to fetch data for display, ensure those server APIs are fast and/or implement client side caching (such as using localStorage or IndexDB for larger sets). 
    - If multiple calls are required to render the critical data consider batching on the server or other ways of minimizing down to a single call. 
    - Alternatively, if some elements of data require a slower API, but it's not critical to initial rendering - decouple that to a separate call that happens after critical data is rendered
    - If multiple parts use the same data, utilize a common data layer to avoid duplicate calls
- Rendering time
    - Any media sources like images / videos should be sized to the container / device / network limitation to avoid downloading unnecessary large assets. See CDN for content dependencies
    - When rendering does occur, avoid API calls that cause re-flow, complex CSS rules or overdone animations. See more in https://developers.google.com/speed/docs/insights/browser-reflow
    - Avoid usage of chained long running tasks - instead break them apart into separate queues. See more at https://developers.google.com/web/fundamentals/performance/rendering/optimize-javascript-execution
    - Reserve corresponding space for asynchronously rendering media or  elements to avoid jank
    - If browser doesn't support a feature used in rendering check for that right away to either load a polyfill or exclude running dependent code if not critical
dispose resources such as event handlers to avoid leaking memory

## Related topics

[Tune SharePoint Online performance](tune-sharepoint-online-performance.md)

[Tune Office 365 performance](tune-office-365-performance.md)

[Content delivery networks](content-delivery-networks.md)

[Performance in the modern SharePoint experience](https://docs.microsoft.com/en-us/sharepoint/modern-experience-performance.md)
