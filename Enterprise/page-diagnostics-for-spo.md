---
title: "Use the Page Diagnostics tool for SharePoint Online"
ms.author: kvice
author: kelleyvice-msft
manager: laurawi
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
ms.assetid: dbab2593-dc6a-40f7-adfe-031b9baa620f
description: "Use the Page Diagnostics for SharePoint tool to analyze your classic pages against recommended best practices for SharePoint Online."
---

# Use the Page Diagnostics tool for SharePoint Online

This article describes how you can use the Page Diagnostic tool to analyze your classic publishing pages and pages on classic team sites, against a subset of recommended practices in **SharePoint Online**. 
  
Team sites that don't have Publishing enabled cannot make use of CDNs but all of the remaining rules are applicable. Publishing adds additional overhead so do not turn on Publishing just to get the CDN functionality as it will negatively impact page load times.

**Please note that V1.05 has been released so please update your extension if you have it installed already**. 
If you are unsure which version you have then please click the "About" link to verify it.
  
> [!IMPORTANT]
> The Page Diagnostics tool will not run against document libraries or system pages, as the tool is designed to review SharePoint site pages. An  *allitems.aspx*  page is a system page. If you attempt to run the tool on a system page, you will get a message that reads, "This application should only be run on SharePoint pages." <br/> ![Must run on a SharePoint page](media/34aadfff-1009-496b-9c87-4fc2780e017c.png)<br/>This is not an error in the tool as there is no value in assessing libraries or system pages. Please navigate to a non-system SharePoint page to use the tool. If this occurs on a SharePoint page then please check the MasterPage as we have seen Customers remove the SharePoint MetaTags and then the page is no longer a SharePoint page. Should you wish to give feedback about the tool please click the About tab and follow the ﻿[give feedback link](https://go.microsoft.com/fwlink/?linkid=874109). 
  
## Install the Page Diagnostic tool

> [!IMPORTANT]
> Microsoft does not read the data or websites you visit, and we do not capture any personal information, website or download information with this tool. The only information logged by the tool is the Tenant name, Rule count and whether the support logging option has been utilized when the tool is run. This information is for Microsoft to analyze what challenges are being experienced by our Customers and to ensure the Support logging capability is not being misused.

1. Using a Chrome browser, open the [link to the tool](https://chrome.google.com/webstore/detail/inahogkhlkbkjkkaleonemeijihmfagi) directly or open the Search in the [Chrome Browser WebStore](https://chrome.google.com/webstore/search/page%20diagnostics%20for%20sharepoint) and install the browser extension. Please review the User Privacy Policy provided on the description page in the store. When adding the tool to your browser, you will see the following permissions notice.<br/>![Chrome Store permissions](media/e9fbcef0-1171-43ac-8ea8-c2b5be1b7925.png)<br/>   This notice is in place because a page may contain content from locations outside of SharePoint depending on the webparts and customizations on the page. This means that the tool will read the requests and responses when the start button is clicked and only for the active SharePoint tab where the tool is running. That information is captured locally by the web browser and is available to you via the Export to JSON link in the tool. **The information is not sent to or captured by Microsoft.** (The tool respects the Microsoft Privacy policy accessible [here](https://go.microsoft.com/fwlink/p/?linkid=857875).)<br/><br/>The "Export to JSON" functionality in the tool is also why the "Manage your downloads" permission is needed. Please follow your Company's own Privacy guidelines before sharing the JSON file outside of your organization, as the results contain URLs and that can be classified as PII (Personally Identifiable Information).
    
2. (This is optional) If you want to use the tool in Chrome incognito mode, navigate to the extension and click **allow in incognito**.
    
3. Navigate to the SharePoint classic publishing page on SharePoint Online that you would like to review. We have allowed for "delay loading" of items on pages; therefore, the **tool will not stop automatically**. Should you wish to stop collection, you can click **Stop**. (This is by design to cater for all page load scenarios.) Before you click **Stop**, make sure that the network trace data is complete. Otherwise, you will have a partial trace. Additionally, the tool is a Browser Extension, and opening multiple tabs or windows will only allow one active instance of the tool to be run at one time. This is a limitation of extensions in the browser. 
  
4. Click on the Extension logo ![Page Diagnostics for SharePoint logo](media/60a3e44d-1b59-483f-b50f-d580044d921a.png) to load the tool and you will be presented with the following extension popup window:<br/> ![Page Diagnostics tool Popup](media/b01fa00e-c5f3-4c37-91f2-6edd096cf87e.png)<br/>Start and stop operations follow the basic concept of when you click start the page will reload and collection will begin.

Read the following sections to learn more about the information provided in the tool.

## What you'll see in the Page Diagnostics tool
    
1. The **About** link will provide general guidance and details regarding the tool including a link back to this article. It also includes a direct link to SharePoint Performance recommendations, a Third Party notice and an option to provide feedback about the tool. 
    
2. The **Correlation ID, SPRequestDuration, SPIISLatency**, **Page load time**, and **URL** details are informational and can be used for a few purposes. 
    
  - **CorrelationID** is an important element when working with the Microsoft Support Teams as it allows them to pull additional diagnostic data. 
    
  - **SPRequestDuration** is the server time taken to process the page. If this time is long, it does not necessarily mean that the server was performing badly but can also reflect the number of calls and load pushed by the page to the server e.g. Structural Navigation, large images, lots of API calls could all contribute to longer server time. 
    
  - **SPIISLatency** is the time in milliseconds taken on the Web Front End Server when it receives the request to load the page. This is an indicator of latency to start processing the page and does not include the time taken for the web application to respond. 
    
  - **Page load time** is the time recorded by the page from the time of the request to the time the response was received and read by the browser. Any additional time is affected by the performance of the computer and the time it takes for the browser to load. 
    
  - The **URL** (Uniform Resource Locator) is the web address of the current page. 
    
3. The [**Diagnostic** tab](#how-to-use-the-diagnostic-tab) will list the rules and if any of them are marked with a red ![Cross](media/9859ac84-be43-4eae-984c-e0e827f5a228.png), then there are issues identified on the page.<br/>Each rule has its own "more information" link that you click if an item is red. That will take you to the details behind that rule and how to remediate the issue.<br/>![Diagnostics Red - Rule open](media/1598f0f7-3103-4613-8787-dfec6fffd40a.png)

4. A [**Network trace** tab](#how-to-use-the-network-trace-tab) provides details about page build requests and responses.

## How to use the Diagnostic tab

1. **Check Running as Standard User**  Checking page performance should not be performed when logged in as a Service Account, Administrator or Site Collection Administrator, or any account with elevated privileges. Additional scripts and functionality are loaded specifically for those types of accounts, so the results will not be a true representation of page performance.
    
2. **Check Requests to SharePoint**  The amount of data and requests made to the server should be limited as an overloaded page will experience poor performance. This check verifies the number of requests being made to SharePoint and will advise when the requests exceed 6 requests. Most requests should be cached and therefore not called for every page load. Cache should be setup and utilized for at least 15 minutes to reduce the amount of calls to a page by each and every User. This is a common problem and in most cases data only changes daily but the page checks and fetches data each time for each page for each user which is often unnecessary.
    
3. **Check using CDNs**  Content Delivery networks (CDNs) have been provided by Microsoft and the ones referred to here are the SharePoint Online Content Delivery Networks. There are multiple types available as well as different CDN services like SharePoint CDNs and then CDNs in Azure. [Use the following guidance](https://go.microsoft.com/fwlink/?linkid=873250).
    
4. **Check for Large Image Sizes**  Images should be optimized for web by utilizing better web types like PNG. Image renditions should also be utilized and is available in SharePoint directly. Images / image renditions larger than 100kb will be highlighted as not optimized for web. [Use the following guidance for optimizing images](https://go.microsoft.com/fwlink/?linkid=873251).
    
5. **Check for Structural Navigation**  Structural Navigation was originally designed for use in SharePoint on-Premises where object cache could be utilized. Structural Navigation is not recommended for use in SharePoint Online and should be changed to Managed Navigation or a Custom Provider. [Use the following guidance for optimizing navigation.﻿](https://go.microsoft.com/fwlink/?linkid=873247)
    
6. **Check for CBQ WebPart** (CBQ - Content by Query WebPart)  The Content by Query WebPart generates a high SQL load as it traverses all items in the query for each and every page load, for each User. Unlike an on-Premises installation, there is no cache available to limit the number of queries needed to populate this WebPart. As such CBQ performs slowly and impacts overall page performance which is why it should not be utilized. Please use the Content Search WebPart (CSWP) as the replacement for the Content Query WebPart. [Use the following guidance related to the Content Search WebPart](https://go.microsoft.com/fwlink/?linkid=873245).

## How to use the Network Trace tab
    
The **Network Trace** tab provides detailed information about the requests to build the page as well as the responses received. 

1. **Look for item load times flagged as red**. The performance of each request and response are color coded, based on their impact on the overall page performance  as follows:
- Green: \< 500ms
- Yellow: 500-1000ms
- Red: \> 1000ms
<br/>![Network Trace](media/3cfede99-7d31-4041-888d-7bbc275cadc2.png)<br/> 
In the image shown above, the red item pertains to the default page. It will always show red unless the page loads in \< 1000ms (less than 1 second).

2. **Test item load times**. In some cases there will be no time or color indicator because the items have already been cached by the browser. To test this correctly, open the page, clear browser cache, and then click **Start** as that will force a "cold" page load and be a true reflection of the initial page load. This should then be compared to the "warm" page load as that will also help determine what items are being cached on the page. 
    
3. **Share relevant details with others who can help investigate issues**. To share the details or information provided in the tool with your developers or a technical support person, click **Export to JSON** (as shown in the image above). That will enable you to download the results, viewable with a JSON file viewer.

> [!IMPORTANT]
> These results contain URLs and that can be classified as PII (Personally Identifiable Information). Make sure to follow your organization's guidelines before distributing that information. 

## Engaging with Microsoft Support
   
We have included a **Microsoft Support level feature** that should only be utilized when working directly on a Support Case for performance. Utilizing this feature will provide no benefit to you when used without our Support team. It will in fact make the page perform significantly slower and continued use of the feature may be considered "misuse" of the service. There is no additional information when using this feature in the tool as the additional information is added to the logging in the service. 

No change is visible except that you will be notified that you have enabled it and your page performance will be significantly degraded by 2-3 times slower performance whilst that is enabled. It will only be relevant for the particular page and that active session. For this reason, this should be used sparingly and only when actively engaged with our Support Team.

### To enable the Microsoft Support level feature

1. Open the Page Diagnostics tool.
2. On your keyboard, press ALT-Shift-L. This will display **Enable support level logging**. 
3. Select the checkbox, and then click **start** to reload the page and generate verbose logging for Support to analyze.<br/>![Support Option Enabled](media/ddef47de-8593-4b28-9346-eb48ebf6cdab.png)
  
An important element for this is the CorrelationID as the Support team will then utilize that number to extract the information needed. Please copy the CorrelationID (at the top of the Page Diagnostics tool) and provide that to Support as they cannot perform the required work without the complete ID.
    
## Related topics

[Tune SharePoint Online performance](tune-sharepoint-online-performance.md)

[Tune Office 365 performance](tune-office-365-performance.md)

[Content delivery networks](content-delivery-networks.md)
