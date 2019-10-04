---
title: "Planning your portal launch roll-out plan in SharePoint Online and understanding capacity and load testing limitations"
ms.author: sstewart
author: kelleyvice-msft
manager: laurawi
ms.date: 04/10/2019
audience: Admin
ms.topic: conceptual
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Adm_O365
search.appverid: SPO160
ms.assetid: c932bd9b-fb9a-47ab-a330-6979d03688c0
description: "This article describes how you can plan your portal launch and then deploy in SharePoint Online without performing traditional load testing since it is not permitted."
---

# Planning your portal launch roll-out plan
A portal is a SharePoint site where your default landing page(s) for your company is created. In large organizations there could be several of these. If you expect more than 20% of your users within your organization to access the page, you should consider that a portal page. This shouldn't be confused with a team site your department uses to collaborate and share documents within your team.

This article describes how to plan your deployment and roll-out plan to SharePoint Online as well as approaches to follow as you cannot perform traditional load testing as it is not permitted on SharePoint Online. SharePoint Online is a cloud service and the load capabilities, health and overall balance of load in the service are managed by Microsoft.

The best approach to ensuring the success of launching your portal is to follow basic principles, practices and recommendations and the deployment approach is highlighted below whilst the detailed requirements are highlighted [here](https://go.microsoft.com/fwlink/?linkid=2105838)

## Understanding Capacity planning and why you cannot load test SharePoint Online
With on-premises environments, load testing is used to validate scale assumption and ultimately find the breaking point of a farm; by saturating it with load. With SharePoint Online we need to do things differently. Being a multi-tenant environment, we must protect all tenants in the same farm, so we will automatically throttle any load tests. This means you will receive disappointing and potentially misleading results if you attempt to load test your environment because the farm you tested today will probably have had scale changes during or hours after your testing. 
  
One of the main benefits of SharePoint Online over an on-premises deployment is the elasticity of the cloud as well as optimizations for users in multiple regions. Our large scale environment is set up to service millions of users on a daily basis, so it is important that we handle capacity effectively by balancing and expanding farms. The article also covers approaches for you to use that don't involve load testing but involve following guidelines that will set you up for a successful launch. 
  
While the growth is often unpredictable for any one tenant in any one farm, the aggregated sum of requests is predictable over time. By identifying the growth trends in SharePoint Online, we can plan for future expansion.
  
In order to efficiently use capacity and deal with unexpected growth, in any farm, we have automation that tracks and monitors various elements of the service. Multiple metrics are utilized, with one of the main ones being CPU load, which is used as a signal to scale-up front end servers. Additionally to this though and as you will note further in the article, we recommend a phased / wave approach, as SQL environments will scale according to load and growth over time, and following the phases and waves allows for the correct distribution of that load and growth. 
  
## Optimize pages by following recommended guidelines
Pages from an on-Premise deployment should not simply be moved as they are onto SharePoint Online without reviewing them against recommended guidelines for SharePoint Online. This also applies to a home page for any site or portal in SharePoint Online as that should be optimized, as this is where most users in your organization will access as the starting point for your site.

A few basic factors should be considered:
- On-Premise deployments can leverage traditional server-side caches like object cache, output cache and blob cache.
With the topology differences in the cloud, these options are not necessarily available as the sheer scale differences make them less viable approaches.
- Any pages / features / customizations used for cloud consumption should be optimized for higher latency as well as the distributed locations of users, so that users in different areas or regions have a more consistent experience. Cloud offers optimizations like Content Delivery Networks (CDN) to optimize for a distributed user base as well as for modern SharePoint, the last known good (LKG) is utilized by our out of the box (OOTB) web parts.

What to do:
 - For all site pages in SharePoint Online you can use the [Page Diagnostics tool](https://aka.ms/perftool) which is a Chromium extension which will assist with analyzing and providing guidance. This can be used by site owners, editors, administrators and developers as it is designed to be a starting point for analysis and optimization.
 - Development tools like F12 developer tools in your browser as well as CTRL-F12 in the browser on modern pages or [Fiddler](https://www.telerik.com/download/fiddler) can be used by your development team to review the size weight of the page and the number of calls and elements impacting the overall page load. 

This section was a brief summary for optimizing pages and for greater detail on what to do please review [Creating, launching and maintaining a healthy portal](https://go.microsoft.com/fwlink/?linkid=2105838).

## Follow a Wave / Phased roll-out approach
The traditional big bang approach for site launches don't effectively allow verification that customizations, external sources, services or processes have been tested at the right scale. This doesn't mean that it will take months to launch, but it is recommended over at least several days dependent on your organization size. Following a wave roll-out plan therefore gives you the option to pause and resolve issues before proceeding with the next phase and therefore lowers the potential number of users impacted by any issues. SharePoint as a service scales your capacity based on usage and predicted usage and whilst we don't need you to notify us of your launch, you should follow the guidelines to ensure success.
  
As shown in the following image, often the number of users that are invited is significantly higher than those that actually use the site. This image shows a strategy about how to roll out a release. This method helps identify ways to improve the SharePoint site before the majority of the users see it.
  
![Graph showing invited and active users](media/0bc14a20-9420-4986-b9b9-fbcd2c6e0fb9.png)
  
In the pilot phase, it is good to get feedback from users that the organization trusts and knows will be engaged. This way it is possible to gauge how the system is being used, as well as how it is performing.
  
During each of the waves, gather user feedback around the features as well as the performance during each wave of deployment. This has the advantage of slowly introducing the system and making improvements as the system gets more use. This also allows us to react to the increased load as the site is rolled out to more and more users and combined with following the guidelines for page optimization ensures a positive experience for your users.
