---
title: "Capacity planning and load testing SharePoint Online"
ms.author: krowley
author: kccross
manager: laurawi
ms.date: 03/14/2019
ms.audience: Admin
ms.topic: conceptual
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Adm_O365
search.appverid: SPO160
ms.assetid: c932bd9b-fb9a-47ab-a330-6979d03688c0
description: "This article describes how you can deploy to SharePoint Online without performing traditional load testing since it is not permitted."
---

# Capacity planning and load testing SharePoint Online.

This article describes how you can deploy to SharePoint Online without traditional load testing, since load-testing is not permitted on SharePoint Online. SharePoint Online is a cloud service the load capabilities, health and overall balance of load in the service is managed by Microsoft.
  
The best approach to ensuring the success of launching your site is to follow basic principles, practices and recommendations which are highlighted below.
  
With on-premises environments, load testing is used to validate scale assumption and ultimately find the breaking point of a farm; by saturating it with load. With SharePoint Online we need to do things differently. Being a multi-tenant environment, we must protect all tenants in the same farm, so we will automatically throttle any load tests. This means you will receive disappointing and potentially misleading results if you attempt to load test your environment.
  
One of the main benefits of SharePoint Online over an on-premises deployment is the elasticity of the cloud. Our large scale environment is set up to service millions of users on a daily basis so it is important that we handle capacity effectively by balancing and expanding farms. The article also covers approaches for you to use that don't involve load testing but involve following guidelines that will set you up for a successful launch. 
  
While the growth is unpredictable for any one tenant in any one farm, the aggregated sum of requests is predictable over time. By identifying the growth trends in SharePoint Online, we can plan for future expansion.
  
In order to efficiently use capacity and deal with unexpected growth, in any farm, we have automation that tracks front-end load and scales up, when needed. There are multiple metrics utilized with one of the main ones being CPU load which is used as a signal to scale up front end servers. Additionally to this and as you will note further in the article, we recommend a phased / wave approach as SQL environments will scale according to load and demand and following the phases and waves allows for the correct distribution of load and growth. 
  
## How do I plan for a site launch?

### Optimize pages by following recommended guidelines
Pages from an on-Premise deployment should not simply be taken as they are onto SharePoint Online without reviewing them against recommended guidelines for SharePoint Online.

A few key factors should be considered:
- On-Premise deployments can leverage traditional server-side caches like object cache but with the topology differences in the cloud, these options are not available.
- Any pages / features / customizations used for Cloud consumption should be optimized for multiple locations so users in different areas or regions have a consistent experience. Cloud offers optimizations like Content Delivery Networks (CDN) to optimize for a distributed user base.

For Classic publishing pages in SharePoint Online you can use the [Page Diagnostics tool](https://aka.ms/perftool) Chrome extension which will assist with analyzing the main landing pages used by users.
F12 developer tools in the browser or [Fiddler](https://www.telerik.com/download/fiddler) can be used to review the weight of the page and the number of calls and elements impacting the overall page load should be reviewed and optimized. A list of recommendations including using Content Delivery Networks and other optimizations can be reviewed in the [Tune SharePoint Online Performance](https://aka.ms/spoperformance) article.

### Wave / Phase approach
The traditional big bang approach for site launches don't effectively allow verification that customizations, external sources, services or processes have been tested at the right scale. SharePoint as a service also scales your capacity based on usage and predicted usage and whilst we don't need you to notify of your site launch, you should follow the guidelines below to ensure success.
  
As shown in the following image, often the number of users that are invited is significantly higher than those that actually use the site. This image shows a strategy about how to roll out a release. This method helps identify ways to improve the SharePoint site before the majority of the users see it. It also allows for a rollout to be paused should you encounter issues in any of the phases/waves thereby limiting the potential number of users impacted.
  
![Graph showing invited and active users](media/0bc14a20-9420-4986-b9b9-fbcd2c6e0fb9.png)
  
In the pilot phase, it is good to get feedback from users that the organization trusts and knows will be engaged. This way it is possible to gauge how the system is being used, as well as how it is performing.
  
During each of the waves, gather user feedback around the features as well as the performance during each wave of deployment. This has the advantage of slowly introducing the system and making improvements as the system gets more use. This also allows us to react to the increased load as the site is rolled out to more and more users.
