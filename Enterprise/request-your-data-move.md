---
title: "How to request your data move"
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
ms.assetid: 5bb64310-36fc-473d-b791-a0176f21707f
description: "Existing Office 365 customers will need to submit a request before the deadline for their country in order to have the customer data of their participating Office 365 services moved to their new geo."
---

# How to request your data move

> [!NOTE]
> The information on this page only applies to customers who had existing Office 365 tenants before the new datacenters in their geo launched. 
  
Existing Office 365 customers are eligible to request early migration for their entire organization’s core customer data at rest.  
  
## When can I request a move?

|**Customers with billing address in**|**Request period begins**|**Request deadline**|
|:-----|:-----|:-----|
|Japan  <br/> |August 1, 2016  <br/> |October 31, 2016  <br/> |
|Australia, New Zealand, Fiji  <br/> |August 1, 2016  <br/> |October 31, 2016  <br/> |
|India  <br/> |August 1, 2016  <br/> |October 31, 2016  <br/> |
|Canada  <br/> |August 1, 2016  <br/> |October 31, 2016  <br/> |
|United Kingdom  <br/> |March 15, 2017  <br/> |September 15, 2017  <br/> |
|South Korea  <br/> |May 1, 2017  <br/> |October 31, 2017  <br/> |
|France  <br/> |March 14, 2018  <br/> |September 15, 2018  <br/> |
|United Arab Emirates  <br/> |July 15, 2019  <br/> |January 31, 2020  <br/> |
|South Africa  <br/> |July 25, 2019  <br/> |January 31, 2020  <br/> |
   
## How to request a move

Eligible customers will see a page in their [admin center](https://aka.ms/365admin), which will allow them to request to have their core customer data moved to their new datacenter region.  
  
To access the page in the Microsoft 365 admin center, in the navigation pane on the left, expand **Settings**, and then click **Organization Profile**.
  
![Settings menu with Organizational Profile highlighted](media/22799fac-32b4-4f79-ae60-3f6ffb7cfbd7.png)
  
On the **Organization Profile** page, scroll down to the **Data Residency Option** section. 
  
![Data residency card](media/dataresidencyae.jpg)
  
**You may not see this section if one of the following apply**:
- Your tenant is not eligible for the Office 365 Move Program.  Eligibility is determined by tenant signup country.
- All of your core customer data at rest is already located in the new geo (see Data Location section of the page). 
  
If your organization has data residency requirements and you need to request early migration, click **Opt-in** on the top right of the section. A new section will appear on the right side of your screen explaining the details of the Office 365 Move Program. Select the toggle button next to the text that says **I want my organization's core customer data at rest to migrate**. Then, click **Save**.
  
![Datacenter opt-in action screen](media/dataresidencyflyoutae.jpg)
  
You should see the text on the **Data Residency** section change to indicate **Your organization has requested to move its core customer data.** You'll also have a confirmation message in your message center. This confirms that you have successfully requested a move. 


  
## What happens after requesting a move?

After requesting a move, we will plan to move you as quickly as our operational constraints allow. Due to the unpredictable nature of many of the constraints, we cannot share a specific date or timeframe for the moves. You will see a notification after the move has completed.
  
Moves may take up to 24 months from the request deadline for your country to complete.
  
## Microsoft Teams

Microsoft Teams does not yet support migration of customer content at rest from in-region to in-country data centers where data residency for Microsoft Teams is available.  Therefore, only new customers will have all of their data stored within country in the new regions where Microsoft Teams supports data residency.  Learn more about Office 365 data residency for your company location at [Where is your data located?](https://products.office.com/where-is-your-data-located)   

## Optional actions before you request a move

Perform the following steps as appropriate.
  
### If you use an IP-based firewall, add allow rules for the new IP addresses

We recommend using DNS filtering for firewalls instead of IP addresses. There are no new DNS entries required.
  
If you use an IP-based firewall for Internet connectivity, you must add allow rules for the new IP addresses for the destination datacenter geo. IP addresses for new datacenter geos in addition to new servers are continuously added to [Office 365 URLs and IP Address Ranges](https://go.microsoft.com/fwlink/p/?LinkId=229631).
  
Consult your firewall documentation for information about how to add allow rules (also known as whitelisting.)
  
After adding IP addresses, you may want to test connectivity to the new datacenter geo. To do this, we recommend creating a [new free 30-day trial](https://go.microsoft.com/fwlink/?LinkId=522463) tenant as soon as the new datacenter geo is available. 
  
### Test using a new tenant

If you'd like to test connectivity prior to the move, you can set up a [new free 30-day trial tenant](https://go.microsoft.com/fwlink/?LinkId=522463) after the new datacenter geo is available, and use it to experience Office 365 hosted in the new datacenter geo. 
  
The trial tenant can't be combined with your existing tenant:
  
- Users must use a separate trial account for their testing.
    
- There is no way to move data between tenants.
    
### Notify users to update out-of-date Exchange settings on mobile devices

If users have a mobile device with the Exchange Server set to **m.outlook.com** or **podxxxxx.outlook.com**, we recommend that they switch to **outlook.office365.com**, following the instructions in [Set up a mobile device to synchronize with your account](https://support.office.com/article/c9139caf-01ab-41a0-827c-3c06ee569ed3).

## Related topics

[Moving core data to new Office 365 datacenter geos](moving-data-to-new-datacenter-geos.md)

[Data move general FAQ](data-move-faq.md)

[New datacenter geos for Microsoft Dynamics CRM Online](https://go.microsoft.com/fwlink/p/?Linkid=615924)
  
[Azure services by region](https://azure.microsoft.com/en-us/regions/)
  

