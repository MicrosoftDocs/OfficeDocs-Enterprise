---
title: "Use the Page Diagnostic Tool for SharePoint Online"
ms.author: kvice
author: kelleyvice-msft
manager: laurawi
ms.date: 9/11/2019
audience: Admin
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
search.appverid:
- MET150
- SPO160
- MOE150
- BSA160
description: "Use the Page Diagnostic Tool to analyze SharePoint Online modern portal and classic publishing pages against a pre-defined set of performance criteria."
---

# Use the Page Diagnostics tool for SharePoint Online

This article describes how to use the Page Diagnostic Tool to analyze your SharePoint Online modern portal and classic publishing site pages against a pre-defined set of performance criteria.  

**Note that version 2.0 of the tool has been released**. The new version includes support for modern portal pages in addition to classic publishing site pages. If you are unsure which version of the tool you are using, you can select the **About** link or the ellipses (...) to verify your version.

The Page Diagnostic Tool is a browser extension for Chrome and [Microsoft Edge version 77 and later](https://www.microsoftedgeinsider.com/en-us/download?form=MI13E8&OCID=MI13E8) that analyzes both SharePoint Online modern portal and classic publishing site pages. The tool provides a report for each analyzed page showing how the page performs against a defined set of performance criteria. SharePoint Online administrators and designers can use the tool to troubleshoot performance issues and to ensure that new pages are optimized prior to publishing.

>[!NOTE]
>Team sites that don't have the publishing feature enabled cannot make use of CDNs, but all of the remaining rules are applicable. The publishing feature adds additional overhead and can increase page load times, so it should not be enabled just to allow CDN functionality.

> [!IMPORTANT]
> The Page Diagnostics tool is designed to review SharePoint site pages and not system pages like *allitems.aspx* or *sharepoint.aspx* page. If you attempt to run the tool on a system page, you will receive an error message advising that it cannot be run for that type of page.<br/> ![Must run on a SharePoint page](media/pagediag-Error-StartPage.png)<br/>This is not an error in the tool as there is no value in assessing libraries or system pages. Please navigate to a SharePoint site page to use the tool. If this error occurs on a SharePoint page, please check the master page to ensure that the SharePoint metatags have not been removed.

To provide feedback about the tool, select the [give feedback link](https://go.microsoft.com/fwlink/?linkid=874109) in the **About** tab.
  
## Install the Page Diagnostic Tool

The installation procedure in this section will work for both the Chrome and Microsoft Edge browsers.

> [!IMPORTANT]
> Microsoft does not read data or page content that is analyzed by the Page Diagnostic Tool, and we do not capture any personal information, website or download information. The only information logged by the tool is the tenant name, rule count and whether the support logging option has been enabled when the tool is run. This information is used by Microsoft to understand modern portal and publishing site usage trends and common performance issues to inform product improvements.

1. Using a Chrome or Microsoft Edge browser, open the [link to the tool](https://chrome.google.com/webstore/detail/inahogkhlkbkjkkaleonemeijihmfagi) directly or open the Search in the [Chrome Browser WebStore](https://chrome.google.com/webstore/search/page%20diagnostics%20for%20sharepoint) and install the browser extension. Please review the User Privacy Policy provided on the description page in the store. When adding the tool to your browser, you will see the following permissions notice.

    ![Extension permissions](media/pagediag-add-to-edge.png)

    This notice is in place because a page may contain content from locations outside of SharePoint depending on the webparts and customizations on the page. This means that the tool will read the requests and responses when the start button is clicked and only for the active SharePoint tab where the tool is running. This information is captured locally by the web browser and is available to you via the **Export to JSON** button in the tool's _Network trace_ tab. **The information is not sent to or captured by Microsoft.** (The tool respects the Microsoft privacy policy accessible [here](https://go.microsoft.com/fwlink/p/?linkid=857875).)

    The _Manage your downloads_ permission covers use of the tool's **Export to JSON** functionality. Please follow your company's own privacy guidelines before sharing the JSON file outside of your organization, as the results contain URLs and that can be classified as PII (Personally Identifiable Information).
1. If you want to use the tool in incognito mode, navigate to the extension and click **allow in incognito**.
1. Navigate to the SharePoint site page on SharePoint Online that you would like to review. We have allowed for "delay loading" of items on pages; therefore, the **tool will not stop automatically**. Should you wish to stop collection, select **Stop**. (This is by design to accommodate all page load scenarios.) Make sure that the page load has completed before you stop data collection or you will only capture a partial trace.
1. Click on the extension's toolbar button ![Page Diagnostics for SharePoint logo](media/pagediag-icon32.png) to load the tool and you will be presented with the following extension popup window:

    ![Page Diagnostics tool Popup](media/pagediag-Landing.png)

Select **Start** to begin collecting data for analysis.

## What you'll see in the Page Diagnostics Tool

1. The **About** link, which resembles ellipses (...) in the top right corner will provide general guidance and details regarding the tool including a link back to this article. It also includes a direct link to SharePoint performance recommendations, a third party notice and an option to provide feedback about the tool.  
1. The **Correlation ID, SPRequestDuration, SPIISLatency**, **Page load time**, and **URL** details are informational and can be used for a few purposes.

    ![Page diagnostics details](media/pagediag-details.PNG)

   - **CorrelationID** is an important element when working with Microsoft Support as it allows them to gather additional diagnostic data for the specific page.
   - **SPRequestDuration** is the time taken for SharePoint to process the page. Structural navigation, large images, lots of API calls could all contribute to longer durations.
   - **SPIISLatency** is the time in milliseconds taken for SharePoint Online begin loading the page. This value does not include the time taken for the web application to respond.
   - **Page load time** is the total time recorded by the page from the time of the request to the time the response was received and rendered in the browser. This value is affected by a variety of factors including network latency, the performance of the computer and the time it takes for the browser to load the page.
   - The **Page URL** (Uniform Resource Locator) is the web address of the current page.

1. The [**Diagnostic tests**](#how-to-use-the-diagnostic-tab) tab displays the analysis results in two categories, **Attention required** and **No action required**. Each test result is represented by a line in one of these two categories. Results under **No action required** appear in green and indicate that the result falls within the test's baseline value, while results under **Attention required** are shown in red and indicate that the tested value falls outside the baseline value and could be contributing to performance issues for the page.

    Each failed check has its own "Learn more" link that will take you to the details behind that rule and how to remediate the issue.

    ![Page diagnostics](media/pagediag-DiagnosticTest.PNG)

1. A [**Network trace**](#how-to-use-the-network-trace-tab) tab provides details about page build requests and responses.

## How to use the Diagnostic tests tab

When you analyze a SharePoint modern portal page with the Page Diagnostic Tool, results are analyzed using pre-defined rules that compare results against baseline values. Items highlighted in red in the **Attention required** section indicate areas that should be reviewed against recommended practices. Each item has a _Learn more_ link which will take you directly to the appropriate guidance related to the test.

The information in the Diagnostic tests tab will not tell you how to design pages, but will highlight factors that may impact page performance. The key is to examine the trade-off as some functionality or customizations will impact page performance.

Results under **Attention required** may also indicate web parts that refresh data too frequently. For example, corporate news is not updated every second but custom web parts are often built to fetch the latest news every second instead of implementing caching elements that could improve the overall user experience.

>[!IMPORTANT]
>The rules are updated regularly so please refer to the latest version of the tool for the details of those rules. You can verify the version by managing your extensions and the extension will advise whether an update is available.

## How to use the Network Trace tab

The **Network Trace** tab provides detailed information about both requests to build the page and the responses received from SharePoint.

1. **Look for item load times flagged as red**. The performance of each request and response are color coded, based on their impact on the overall page performance as follows:
    - Green: \< 500ms
    - Yellow: 500-1000ms
    - Red: \> 1000ms

    ![Network Trace](media/pagediag-networktrace.png)

    In the image shown above, the red item pertains to the default page. It will always show red unless the page loads in \< 1000ms (less than 1 second).

2. **Test item load times**. In some cases there will be no time or color indicator because the items have already been cached by the browser. To test this correctly, open the page, clear browser cache, and then click **Start** as that will force a "cold" page load and be a true reflection of the initial page load. This should then be compared to the "warm" page load as that will also help determine what items are being cached on the page.

3. **Share relevant details with others who can help investigate issues**. To share the details or information provided in the tool with your developers or a technical support person, click **Export to JSON** (as shown in the image above). That will enable you to download the results, viewable with a JSON file viewer.

    If you have selected to use the preview feature to *enable Export to HAR* then the export type will change to _Export HAR_ instead of _Export to JSON_.

    ![Network trace](media/pagediag-NetworkTraceHAR.PNG)

> [!IMPORTANT]
> These results contain URLs and that can be classified as PII (Personally Identifiable Information). Make sure to follow your organization's guidelines before distributing that information.

## Engaging with Microsoft Support

We have included a **Microsoft Support level feature** that should only be utilized when working directly on a support case. Utilizing this feature will provide no benefit to you when used without support team engagement, and can make the page perform significantly slower. There is no additional information when using this feature in the tool as the additional information is added to the logging in the service.

No change is visible except that you will be notified that you have enabled it and your page performance will be significantly degraded by 2-3 times slower performance whilst enabled. It will only be relevant for the particular page and that active session. For this reason, this should be used sparingly and only when actively engaged with support.

### To enable the Microsoft Support level feature

1. Open the Page Diagnostics Tool.
2. On your keyboard, press **ALT-Shift-L**. This will display **Enable support level logging**.
3. Select the checkbox, and then click **Start** to reload the page and generate verbose logging.

    ![Support Option Enabled](media/ddef47de-8593-4b28-9346-eb48ebf6cdab.png)
  
An important element for this is the CorrelationID as the support team will then utilize that number to extract the information needed. Please copy the CorrelationID (at the top of the Page Diagnostics tool) and provide that to support as they cannot perform the required work without the complete ID.

## Related topics

[Tune SharePoint Online performance](tune-sharepoint-online-performance.md)

[Tune Office 365 performance](tune-office-365-performance.md)

[Content delivery networks](content-delivery-networks.md)
