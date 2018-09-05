---
title: "Data move general FAQ"
ms.author: deniseb
author: denisebmsft
manager: laurawi
ms.date: 09/05/2018
ms.audience: ITPro
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
search.appverid:
- MET150
ms.assetid: 1f01bc6f-5d37-4d14-bdd3-9d94a1e23e14
description: "Here are answers to general questions about moving core data to a new datacenter geo."
---

# Data move general FAQ

Here are answers to general questions about moving core data to a new datacenter geo.
  
 **Q. How do you make sure my customer data is safe during the move and that I won't experience downtime?**
  
A. Data moves are a back-end service operation with minimal impact to end-users. Features that can be impacted are listed in [During and after your data move](during-and-after-your-data-move.md). We adhere to the [Microsoft Online Services Service Level Agreement (SLA)](https://go.microsoft.com/fwlink/p/?LinkId=523897) for availability so there is nothing that customers need to prepare for or to monitor during the move. 
  
All Office 365 services run the same versions in the datacenters, so you can be assured of consistent functionality. Your service is fully supported throughout the process.
  
 **Q. What is the impact of having different services located in different geos?**
  
A. For some existing customers and customers in the middle of the move process, some of the Office 365 services may be located in different geos. Our services run independently of each other and there is no user impact if this is the case.
  
 **Q. Will new Office 365 customers be automatically provisioned in the new datacenter geos?**
  
A. Yes. Once a new datacenter geo is available, new Office 365 for business customers who select a country eligible for the new geo as their country during sign-up will have their core data hosted in the new datacenter geo.
  
 **Q. Where is my data is located?**
  
We publish the location of datacenter geos, datacenters, and location of customer data on the [ Office 365 interactive datacenter maps ](https://o365datacentermap.azurewebsites.net). As of August 1, you will be able to verify the location of your customer data at rest via the Data Location section under your Organization Profile in the Office 365 Admin Center.
  
 **Q. Will existing Office 365 customers be moved to the new datacenter geos?**
  
A. Eligible Office 365 customers can request to have their core data moved to the new geos. Customers will need to submit a request before the deadline for their geo in order to participate. 
  
 **Q. What customers are eligible to request a move?**
  
A. Existing Office 365 commercial customers who selected a country eligible for the new datacenter geo will be able to request a move. 
  
 **Q. When will I be able to request a move?**
  
A. The request period will be announced on the [How to request your data move](request-your-data-move.md) page. 
  
 **Q. How can I request to be moved?**
  
A. Eligible customers will see a page in their [Office 365 Admin Portal](https://portal.office.com/). Please see [How to request your data move](request-your-data-move.md) for instructions on how to request a move. 
  
 **Q. Can I change my selection after requesting a move?**
  
A. It is not possible for us to remove you from the process after you submit your request.
  
 **Q. What happens if I do not request a move before the deadline?**
  
A. We are unable to accept requests to be moved after the deadline in each geo.
  
 **Q. What if I want to move my data in order to get better network performance?**
  
Being close to an Office 365 datacenter is not a guarantee for a better networking performance. There are many factors and components that impact the network performance between the end user and the Office 365 service. For more information about this and performance tuning see [Network planning and performance tuning for Office 365](network-planning-and-performance.md).
  
 **Q. Do all the services move their data on the same day?**
  
A. The services do not move their data at the same time. Each service will move independently and will likely move their data at different times.
  
 **Q. Can I choose when I want my data to be moved?**
  
A. Customers are not able to select a specific date, they cannot delay their move, and we cannot share a specific date or timeframe for the moves.
  
 **Q. Can you share when my data will be be moved?**
  
A. Data moves are a back-end operation with minimal impact to end-users. The complexity, precision and scale at which we need to perform data moves within a globally operated and automated environment prohibit us from sharing when a data move is expected to complete for your tenant or any other single tenant. Customers will receive one confirmation in Message Center per participating service when its data move has completed. 
  
 **Q. What happens if users access services while the data is being moved?**
  
A. See [During and after your data move](during-and-after-your-data-move.md) for a complete list of features that may be limited during portions of the data move for each service. 
  
 **Q. How do I know the move is complete?**
  
A. Watch the Office 365 message center for confirmation that the move of each service's data is complete. When each service's data is moved, we'll post a completion notice so you'll get three completion notices: one each for Exchange Online, SharePoint Online, and Skype for Business Online.
  
If you see any issues after the move, contact [Office 365 Support](https://go.microsoft.com/fwlink/p/?LinkID=522459) to get assistance. 
  
 **Q. What data for Office 365 is stored in the new datacenter geos?**
  
A. If a customer provisions its tenant in one of the new datacenter geos, Microsoft stores the following customer data at rest within the geo:
  
- Exchange Online mailbox content (e-mail body, calendar entries, and the content of email attachments)
    
- SharePoint Online site content and the files stored within that site, including Project Online and Access Online content.
    
In addition, this data is not replicated outside of the geo.
  
 **Q. I am an Office 365 customer in one of the new datacenter geos, but when I signed up, I selected a different country. How can I be moved to the new datacenter geo?**
  
A. Unfortunately, it is not possible to change the country associated with your tenant. Instead, you need to create a new Office 365 tenant with a new subscription and manually move your users and data to the new tenant.
  
 **Q. Will there be any changes on my bill?**
  
A. In most cases there are no changes that customers in will see on their billing statement.
  
Microsoft will charge all Australian customers of Office 365 an additional amount equal to the Australian GST for Office 365 services and will issue tax invoices. This change will occur because Australian GST is payable on taxable supplies of goods and services provided and offered in Australia.
  
 **Q. What happens if we are in process of email data migration to Office 365 during the Exchange Online move?**
  
A. If email migrations are in progress, any individual mailboxes that are currently being migrated will be canceled while the tenant move finalizes, and migration of those mailboxes will automatically restart once the tenant is in the target datacenters.
  
 **Q. After data is moved out of the previous datacenter geo, is it removed from those datacenters?**
  
A. Yes, the old data will be purged after a period of time.
  
 **Q. Can I pilot some users?**
  
A. When your Office 365 tenant is moved to a new datacenter geo, all users are moved at once. You can create a separate trial tenant to test connectivity, but the trial tenant can't be combined in any way with your existing tenant.
  
 **Q. How will I be notified about the move and who at my company will be notified?**
  
A. We'll use the Office 365 message center, which is visible to anyone with any admin permissions in Office 365.
  
 **Q. I don't want to wait for Microsoft to move my data. Can I just create a new tenant and move myself?**
  
A. Yes, however the process will not be as seamless as if Microsoft were to perform the data move.
  
If you create a new tenant after the new datacenter geo is available, the new tenant will be hosted in the new geo. This new tenant is completely separate from your previous tenant and you would be responsible for moving all user mailboxes, site content, domain names, and any other data. Note that you can't move the tenant name from one tenant to another. We recommend that you wait for the move program provided by Microsoft as we'll take care of moving all settings, data, and subscriptions for your users.
  
 **Q. I'm not ready to be moved, can I pick a specific move date?**
  
A. It is not possible for you to change when each service's customer data will be moved. Data moves are a back-end operation with minimal impact to end-users.
  
 **Q. My customer data has already been moved to a new datacenter geo. Can I move back?**
  
A. This is not possible. Customers who have been moved to new geo datacenters cannot be moved back. As a customer in any geo, you will experience the same quality of service, performance, and security controls as you did before.
  
 **Q. Do the new datacenter geos use the same versions of Office 365 services as the current datacenter geos?**
  
A. Yes.
  
 **Q. Will Office 365 tenants hosted in the new datacenters be available to users outside of the country?**
  
A. Yes. Microsoft maintains a large global network with public Internet connections in more than 50 locations in 23 countries around the world with peering agreements with more than 1,500 Internet Service Providers (ISPs). Users will be able to access the datacenters from wherever they are on the Internet.
  
## Related topics

[Moving core data to new Office 365 datacenter geos](moving-data-to-new-datacenter-geos.md)

[How to request your data move](request-your-data-move.md)

[New datacenter geos for Microsoft Dynamics CRM Online](https://go.microsoft.com/fwlink/p/?Linkid=615924)
  
[Azure services by region](https://azure.microsoft.com/en-us/regions/)
