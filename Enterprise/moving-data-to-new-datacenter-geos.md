---
title: "Moving core data to new Office 365 datacenter geos"
ms.author: deniseb
author: denisebmsft
manager: laurawi
ms.date: 07/25/2019
audience: ITPro
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
search.appverid:
- MET150
ms.assetid: 0a35176a-e585-4dec-a90b-36be8314667f
description: "New datacenter geos add capacity and compute resources to support our ongoing customer demand and usage growth. Additionally, the new datacenter geos offer in-geo data residency for core customer data. Core customer data is a term that refers to a subset of customer data defined in the Microsoft Online Services Terms: Exchange Online mailbox content (email body, calendar entries, and the content of email attachments) and SharePoint Online site content and the files stored within that site, and files uploaded to OneDrive for Business."
---

# Moving core data to new Office 365 datacenter geos

We continue to open new datacenter geos for Office 365 for business services. These new datacenter geos add capacity and compute resources to support our ongoing customer demand and usage growth. Additionally, the new datacenter geos offer in-geo data residency for core customer data. 

Core customer data is a term that refers to a subset of customer data defined in the [Microsoft Online Services Terms](https://go.microsoft.com/fwlink/p/?LinkID=249048): 
- Exchange Online mailbox content (email body, calendar entries, and the content of email attachments)
- SharePoint Online site content and the files stored within that site
- Files uploaded to OneDrive for Business 
  
Existing customers that have their core customer data stored in an already existing datacenter geo are not impacted by the launch of a new datacenter geo. We introduce no unique capabilities, features or compliance certifications with the new datacenter geo. As a customer in any of those two geos, you will experience the same quality of service, performance and security controls as you did before. We offer existing customers listed in the table below an option to request early migration of their organization's core customer data at rest to their new datacenter geo.
  
|****Customers with billing address in****|****Previous datacenter geo****|****New datacenter geo****|****Geo available since****|
|:-----|:-----|:-----|:-----|
|****Japan****| Asia/Pacific | Japan | December 2014 |
|****Australia, New Zealand, Fiji****| Asia/Pacific | Australia | March 2015 |
|****India****| Asia/Pacific | India | October 2015 |
|****Canada****| North America | Canada | May 2016 |
|****United Kingdom****| Europe | United Kingdom | September 2016 |
|****South Korea****| Asia/Pacific | South Korea | April 2017 |
|****France****| Europe | France | March 2018 |
|****United Arab Emirates****| Europe | United Arab Emirates | June 2019 |
|****South Africa****| Europe | South Africa | July 2019 |
  
New customers or Office 365 tenants created after the availability of the new datacenter geo will have their core customer data stored at rest in the new datacenter geo automatically.
  
A complete list of all datacenter geos, datacenters, and the location of customer data at rest is available as part of the [interactive datacenter maps](https://office.com/datamaps). 
  
## Data residency option

We provide a data residency option to existing Office 365 customers who are covered by the datacenter geos listed in the table above. With this option, customers with data residency requirements can request early migration of their organization's core customer data at rest to their new datacenter geo.  Microsoft will offer a committed deadline to all eligible customers who request early migration during the enrollment window.  Review the [How to request your data move](request-your-data-move.md) page for more details about the enrollment window for your geo and the steps to enroll into the program.  Data moves can take up to 24 months after the request period to complete.

Taking no action results in Microsoft being able to move your core customer data at rest to your new datacenter geo over time as part of service management and optimization.  Your core customer data can only potentially move to your new datacenter geo, not to any other geo.  We will notify tenant admins via Message Center when such a service management move has completed and update the data location in Admin Center.
   
We introduce no unique capabilities, features or compliance certifications with the new datacenter geo.
    
The complexity, precision and scale at which we need to perform data moves within a globally operated and automated environment prohibit us from sharing when a data move is expected to complete for your tenant or any other single tenant. Customers will receive one confirmation in Message Center per participating service when its data move has completed. 
    
Data moves are a back-end service operation with minimal impact to end-users. Features that can be impacted are listed on the [During and after your data move](during-and-after-your-data-move.md) page. We adhere to the [Microsoft Online Services Service Level Agreement (SLA)](https://go.microsoft.com/fwlink/p/?LinkId=523897) for availability so there is nothing that customers need to prepare for or to monitor during the move. Notification of any service maintenance is done if needed. 

Data moves to the new datacenter geo are completed at no additional cost to the customer.
    
## Related topics 
 
[How to request your data move](request-your-data-move.md)
    
[Data move general FAQ](data-move-faq.md)
  
[New datacenter geos for Microsoft Dynamics CRM Online](https://go.microsoft.com/fwlink/p/?Linkid=615924)
  
[Azure services by region](https://azure.microsoft.com/en-us/regions/)
