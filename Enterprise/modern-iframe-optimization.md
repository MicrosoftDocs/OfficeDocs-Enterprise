---
title: "Optimizing iFrames in SharePoint Online modern portal pages"
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
description: "Learn about how to optimize the performance of iFrames in SharePoint Online modern portal pages."
---

# Optimizing iFrames in SharePoint Online modern portal pages

IFrames are useful for previewing rich content such as videos or other media. However, because IFrames load a separate page within the SharePoint site page, content loaded in the IFrame could contain large images, videos or other elements that can contribute to overall page load times. This article will help you understand how to determine how IFrames in your pages affect user perceived latency, and how to remediate common issues.

>[!NOTE]
>For more information about performance in SharePoint Online modern portals, see [Performance in the modern SharePoint experience](https://docs.microsoft.com/en-us/sharepoint/modern-experience-performance).

## Use the Page Diagnostic Tool to analyze web parts using IFrames

The Page Diagnostic Tool is a browser extension for Chrome and [Microsoft Edge version 77 or later](https://www.microsoftedgeinsider.com/en-us/download?form=MI13E8&OCID=MI13E8) you can use to analyze SharePoint both modern portal pages and classic publishing site pages. The tool provides a report for each analyzed page showing how the page performs against a defined set of performance criteria. To install and learn about the Page Diagnostic Tool, visit [Use the Page Diagnostics tool for SharePoint Online](page-diagnostics-for-spo.md).

When you analyze a SharePoint modern portal page with the Page Diagnostic Tool, you can see information about web parts in the **No web parts impacting page load time** result in the _Diagnostic tests_ view of the results pane.

Possible results include:

- **No attention required (green)**: No web part takes longer than **2** seconds to return data
- **Improvement opportunities (yellow)**: At least one _OOTB_ web part takes longer than **2** seconds to return data
- **Attention required (red)**: At least one _custom_ web part takes longer than **2** seconds to return data

The baseline metric is the same for modern and classic pages.

![Page Diagnostic Tool results](media/modern-portal-optimization/pagediag-iframe-yellow.png)

If the **Web parts using Iframes detected** result appears in yellow under the **Improvement opportunities** section of the results, you can click the result to see the web parts that contain IFrames.

## Remediate IFrame performance issues

If a page contains any web parts that use IFrames, you can use the **Web parts using Iframes detected** result in the Page Diagnostic Tool to determine which web parts contain IFrames and may be contributing to slow page load times. Before you make your revisions, make a note of the page load time in the analysis results. Run the tool again after your revision to see if the new result is within the baseline standard, and check the new page load time to see if there was an improvement.

![Page load time results](media/modern-portal-optimization/pagediag-page-load-time.png)

>[!NOTE]
>Page load time can vary based on a variety of factors such as network load, time of day, and other transient conditions. You should test page load time a few times before and after making changes to help you average the results.