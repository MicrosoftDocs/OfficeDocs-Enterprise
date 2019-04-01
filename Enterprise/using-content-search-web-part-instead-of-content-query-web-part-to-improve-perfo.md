---
title: "Using Content Search Web Part instead of Content Query Web Part to improve performance in SharePoint Online"
ms.author: krowley
author: kccross
manager: laurawi
ms.date: 4/20/2015
ms.audience: Admin
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Adm_O365
search.appverid:
- MET150
- SPO160
ms.assetid: e8ce6b72-745b-464a-85c7-cbf6eb53391b
description: "This article describes how to increase performance by replacing the Content Query Web Part with the Content Search Web Part in SharePoint Server 2013 and SharePoint Online."
---

# Using Content Search Web Part instead of Content Query Web Part to improve performance in SharePoint Online

This article describes how to increase performance by replacing the Content Query Web Part with the Content Search Web Part in SharePoint Server 2013 and SharePoint Online.
  
One of the most powerful new features of SharePoint Server 2013 and SharePoint Online is the Content Search Web Part (CSWP). This Web Part uses the search index to quickly retrieve results which are shown to the user. Use the Content Search Web Part instead of the Content Query Web Part (CQWP) in your pages to improve performance for your users.
  
Using a Content Search Web Part over a Content Query Web Part will almost always result in significantly better page load performance on SharePoint Online. There is a little additional configuration to get the right query, but the rewards are improved performance and happier users.
  
## Comparing the performance gain you get from using Content Search Web Part instead of Content Query Web Part

The following examples show the relative performance gains you may receive when you use a Content Search Web Part instead of a Content Query Web Part. The effects are more obvious with a complex site structure and very broad content queries.
  
This example site has the following characteristics:
  
- 8 levels of subsites.
    
- Lists using a custom "fruit" content type.
    
- In the Web Part, the content query is broad, returning all items with the content type of "fruit".
    
- The example only uses 50 items across the 8 sites. The effects will be even more pronounced for sites with more content.
    
Here is a screen shot of the results of the Content Query Web Part.
  
![Graphic showing content query for web part](media/b3d41f20-dfe5-46ed-9c0a-31057e82de33.png)
  
In Internet Explorer, use the **Network** tab of the F12 developer tools to look at the details for the response header. In the following screen shot, the value for the **SPRequestDuration** for this page load is 924 milliseconds. 
  
![Screenshot showing request duration of 924](media/343571f2-a249-4de2-bc11-2cee93498aea.png)
  
 **SPRequestDuration** indicates the amount of work that is done on the server to prepare the page. Switching Content by Query Web Parts with Content by Search Web Parts dramatically reduces the time it takes to render the page. By contrast, a page with an equivalent Content Search Web Part, returning the same number of results has an **SPRequestDuration** value of 106 milliseconds as shown in this screen shot: 
  
![Screen shot showing Request Duration of 106](media/b46387ac-660d-4e5e-a11c-cc430e912962.png)
  
## Adding a Content Search Web Part in SharePoint Online

Adding a Content Search Web Part is very similar to a regular Content Query Web Part. See the section  *"Add a Content Search Web Part"*  in [Configure a Content Search Web Part in SharePoint](https://support.office.com/article/Configure-a-Content-Search-Web-Part-in-SharePoint-0dc16de1-dbe4-462b-babb-bf8338c36c9a).
  
## Creating the right search query for your Content Search Web Part

Once you have added a Content Search Web Part, you can refine the search and return the items you want. As you configure your webpart, pay attention to the loading behavior. There are two choices:
- **Sync option: Issue query from the server** - When the server issues the query, the results will be fetched and returned to the client as part of the initial page response. This ensures that the client is able to immediately present the search results to the user upon page delivery. However, this adds cost and complexity to the server rendering phase of the request. This will ultimately increase the time required to deliver the page. In the event that the search results take longer than expected to return, the entire page is blocked. The client will not be able to begin rendering the page until the results have been retrieved. On pages where the Content Search Web Part is not the primary source of data, this will result in a degraded user experience. 
- **Async option: Issue query from the browser** - Choosing this option will reduce the amount of work required by the server to deliver the page to the client, improving response times. This means that the client will be allowed to begin the work of rendering the page more quickly than under the Sync option. During the client rendering phase, the search query will be executed. This means that any delays retrieving the results will only impact the single webpart. Other controls will be allowed to render independently. This is beneficial on more complicated pages, as no single control blocks others. However, if the user is expecting to interact with or view the results from the search query, their experience may be degraded until the results arrive.

For detailed instructions on how to do this, see the section,  *"Display content by configuring an advanced query in a Content Search Web Part"*  in [Configure a Content Search Web Part in SharePoint](https://support.office.com/article/Configure-a-Content-Search-Web-Part-in-SharePoint-0dc16de1-dbe4-462b-babb-bf8338c36c9a).

For additional information on optimizing SharePoint Online Portals, review [Performance guidance for SharePoint Online portals](https://docs.microsoft.com/en-us/sharepoint/dev/solution-guidance/portal-performance)

  
## Query building and testing tool

For a tool to build and test complex queries, see the [Search Query Tool](https://sp2013searchtool.codeplex.com/) on Codeplex. 
  

