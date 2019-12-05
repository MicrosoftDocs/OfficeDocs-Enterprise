---
title: "Migration from Microsoft Cloud Germany (Microsoft Cloud Deutschland) to Office 365 services in the new German datacenter regions"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 12/09/2019
audience: ITPro
ms.topic: hub-page
ms.service: o365-solutions
localization_priority: Priority
search.appverid:
- MET150
ms.collection: 
- Ent_O365
- Strat_O365_Enterprise
ms.custom:
- Ent_TLGs
ms.assetid: 706d5449-45e5-4b0c-a012-ab60501899ad
description: "Summary: "
---

## Migration from Microsoft Cloud Germany (Microsoft Cloud Deutschland) to Office 365 services in the new German datacenter regions


>[!Note]
>This article only applies to eligible Microsoft Cloud Germany/Deutschland customers.
>

## Cloud service offerings in Germany

In August 2018, we announced our intention to deliver the complete Microsoft cloud – Azure, Office 365, Dynamics 365 and Power Platform – from new cloud regions in Germany to better enable the digital transformation of our customers. In August 2019, we announced we are now in the process of opening of the new cloud regions in Germany. We announced the availability of Azure in August and Office 365 became available in December.  Dynamics 365 and Power Platform are anticipated to become available in the first quarter of 2020.  

The new regions are designed to address the evolving needs of German customers with the greater flexibly, the latest intelligent cloud services, and full connectivity to our global cloud network as well as customer data residency within Germany.

## Moving to the new German regions

Existing Microsoft Cloud Germany (Microsoft Cloud Deutschland) customers can now begin to migrate their Office 365, Dynamics 365 Customer Engagement, and Power Platform BI customers.  The first step is to [opt-in to a Microsoft-led migration](https://aka.ms/office365germanymoveoptin) to our new German datacenter regions.

For organizations who opt-in to the Microsoft-driven approach, migrations are expected to take place in 2020. As a result of the migration, core customer data and subscriptions are moved to the new German regions. 

Note that after the subscription migration completes, pricing will decrease to reflect the public cloud pricing. Direct customers will see a new subscription will be extended to a new 12-month term, and the migration completion date will be your new annual renewal date. The following services will be migrated as part of the Microsoft-driven approach:

- Azure Active Directory
- Exchange Online
- Exchange Online Protection
- SharePoint Online
- OneDrive for Business
- Skype for Business Online

  As part of the migration from Microsoft Cloud Germany to the German region, existing Skype for Business Online customers will transition to Microsoft Teams. See [https://aka.ms/SkypeToTeams-Home](https://aka.ms/SkypeToTeams-Home) for more information.

- Office 365 Groups
- Dynamics 365 / Power Platform

  Pre-requisites and impact of migration for these services are described in the [Dynamics 365 Customer engagement](https://docs.microsoft.com/dynamics365/customerengagement/on-premises/overview) article.

>[!Reviewer]
>Please check Dynamics 365 link.
>

## How to prepare for migration to Office 365 services in the new German datacenter regions

The first step is to notify Microsoft so that we have your permission to migrate your subscription and data from Microsoft Cloud Germany/Deutschland to Office 365 services in the new German datacenter regions.  Please refer to the [opt-in process](ms-cloud-germany-migration-opt-in.md) for instructions.

- All migrating customers need to verify connectivity to the worldwide [Office 365 URLs and IP addresses](urls-and-ip-address-ranges.md), which include the new German datacenter regions.
- Review the Office 365 platform service description to understand which features and services will become available to your organization following the completion to the German region. 
- Cancel any unused trial subscriptions in your organization, the migration only will transition paid subscriptions

Tenant migrations are executed as back-end service operations with minimal customer interaction required.  Any additional customer-led tasks and overall migration status will be communicated via Message Center during the migration process.  Example of tasks may include customer managed DNS updates or reconfiguration of hybrid setup for Exchange hybrid customers.

## Customer experience during the migration to Office 365 services in the new German datacenter regions

Tenant migrations are executed as back-end service operations with minimal impact to end customers or actions required by administrators.  However, there are considerations for each workload.  

### Azure Active Directory

Office/Dynamics subscriptions from Microsoft Cloud Germany are transitioned to the German region with the Azure Active Directory (Azure AD) relocation. The organization is then updated to reflect new worldwide service subscriptions. During the brief subscription transfer process, changes to subscriptions will be blocked.

### Exchange Online

Exchange Online Hybrid customers must re-run the Hybrid Configuration Wizard to update on-premises configuration against Microsoft Cloud Germany before the transition, and re-execution of the HCW upon cleanup against the worldwide service. Additional DNS updates may be required for customers with custom domains.

Mailboxes are migrated as a backend process, users in your organization may be in either Microsoft Cloud Germany or German region during the transition and are part of the same Exchange organization (GAL)

### Exchange Online Protection

Backend Exchange Online Protection features are copied to new Germany region

### SharePoint Online

Upon completion of the SharePoint Online migration to the German region, data indexes are rebuilt. Features dependent on search indexes may be impacted while reindexing completes.

Existing sharepoint.de URLs are preserved for transitioned organizations.

### OneDrive for Business

Upon completion of the OneDrive for Business migration to the German region, data indexes are rebuilt. Features dependent on search indexes may be impacted while reindexing completes.

### Skype for Business Online

Existing Skype for Business Online customers will transition to Microsoft Teams. See [https://aka.ms/SkypeToTeams-Home](https://aka.ms/SkypeToTeams-Home) for more information


## Key differences between Microsoft Cloud Germany (Microsoft Cloud Deutschland) and Office 365 services in the new German datacenter regions

||||
|:-------|:-----|:-----|
|  | Microsoft Cloud Germany (Microsoft Cloud Deutschland) | Office 365 services in the new German datacenter regions |
| Microsoft 365 services available for subscription with just one Office 365 tenant | <ul><li>Exchange Online</li><li>Customer Lockbox (Exchange Online)</li><li>Groups (Modern groups)</li><li>Delve Profile</li><li>Exchange Online Protection</li><li>Advanced Threat Protection (ATP)</li><li>Advanced eDiscovery</li><li>Advance Data Governance</li><li>SharePoint Online</li><li>Customer Lockbox (SharePoint Online)</li><li>OneDrive for Business</li><li>Skype for Business</li><li>Word Online, Excel Online, PowerPoint, OneNote, Visio Online</li><li>Office 365 Pro Plus</li><li>Outlook Mobile</li></ul>	 | <ul><li>Exchange Online</li><li>Customer Lockbox (Exchange Online)</li><li>Groups (Modern groups)</li><li>Delve Profile</li><li>MyAnalytics</li><li>Workplace Analytics</li><li>Exchange Online Protection</li><li>Advanced Threat Protection (ATP)</li><li>Advanced eDiscovery</li><li>Advanced Security Management</li><li>Information Rights Management</li><li>Advance Data Governance</li><li>SharePoint Online</li><li>Customer Lockbox (SharePoint Online)</li><li>OneDrive for Business</li><li>Microsoft Stream</li><li>Skype for Business (will transition to Microsoft Teams)</li><li>Cloud PBX</li><li>PSTN Conferencing</li><li>PSTN calling</li><li>Microsoft Teams</li><li>Admin Reports / Usage Reports</li><li>Word Online, Excel Online, PowerPoint, OneNote, Visio Online</li><li>Planner</li><li>Sway</li><li>Office 365 Pro Plus</li><li>Outlook Mobile</li><li>EMS E3 (Azure Active Directory Premium P1 + Intune + Rights Management Service)</li><li>Yammer Online</li></ul> |
| New features | No new features are available. | New features will be available consistent with global Office 365 services. |
| Data trustee | Yes | No |
| Cross-tenant collaboration with global Office 365 tenants | No | Yes |
| Customer data residency | Customer Data will be stored solely within German Data Centers. | Microsoft will store the following Customer Data at rest exclusively within Germany: Exchange Online mailbox content (e-mail body, calendar entries, and the content of e-mail attachments), SharePoint Online site content and the files stored within that site, and files uploaded to OneDrive for Business. |
| Applicable terms | [Online Services Terms](https://www.microsoftvolumelicensing.com/DocumentSearch.aspx?Mode=3&DocumentTypeId=46) with [supplement](https://www.microsoftvolumelicensing.com/DocumentSearch.aspx?Mode=3&DocumentTypeId=64) | [Online Services Terms](https://www.microsoftvolumelicensing.com/DocumentSearch.aspx?Mode=3&DocumentTypeId=46) |
||||

## Frequently Asked Questions

### Is migration required?

We recommend that all customers opt-in for migration, but it is not required.  We are no longer accepting new customers or deploying any new features or services in Microsoft Cloud Germany. Besides that, the new regions in Germany:

- Offer market competitive pricing for [Azure](https://azure.microsoft.com/pricing/calculator/), [Office 365](https://www.microsoft.com/microsoft-365/business/compare-more-office-365-for-business-plans), [Dynamics 365 Customer Engagement](https://dynamics.microsoft.com/pricing/), and [Power BI](https://powerbi.microsoft.com/pricing/). 
- Are connected to Microsoft global network, offering hundreds of network edge sites, peering locations, and egress points to deliver a robust user experience anywhere in the world. 
- Help you meet local customer data residency requirements within Germany. 
- Deliver our full featured global cloud offering, including the latest version of our services and new capabilities including Microsoft Teams and Multi-Geo in Office 365. Compare products by region for [Azure](https://azure.microsoft.com/global-infrastructure/services/?products=all&regions=germany-non-regional,germany-central,germany-north,germany-northeast,germany-west-central), [Office 365](https://products.office.com/en-us/where-is-your-data-located), and [Dynamics 365](https://docs.microsoft.com/dynamics365/get-started/availability).
- Offer full functionality, enterprise-grade security, and comprehensive features to help customers meet compliance and regulatory requirements. 
- Are accessible through existing online services contracts.

### When will migration happen?

- Azure 

 You can begin [migrating](https://docs.microsoft.com/azure/germany/germany-migration-main) your Azure resources to another region today. If you have Azure with Office 365, Dynamics 365, and/or Power BI, please follow the steps below.

- Office 365

  [Opt-in](https://aka.ms/office365germanymoveoptin) to the Microsoft-driven migration today. When we are ready to start your migration, we will inform you through the [Message Center](https://docs.microsoft.com/office365/admin/manage/message-center?view=o365-worldwide) in the Microsoft 365 admin center.

- Dynamics 365 and Power BI

  Opt-in to the Microsoft-driven migration for [Dynamics 365 Customer Engagement](https://aka.ms/D365ceOptIn) and [Power BI today](https://aka.ms/PBIOptIn). When we are ready to start your migration, we will inform you through the [Message center](https://docs.microsoft.com/office365/admin/manage/message-center?view=o365-worldwide) in the Microsoft 365 admin center.

### Will the price change for the Office services that I use?

Yes, pricing in Microsoft’s global cloud regions (including the new datacenter regions) is generally lower.

### For direct customers: Once licensing migration is completed, my subscription will extend to a new 12-month term. However, I prefer to subscribe for a shorter period. Can I cancel before the end of the term without paying cancellations fees?

- Cancelation within 24 hours of new purchase or renewal: You get your full money back.

- Cancelation between 1 day and the end of first month of new purchase or renewal: You get prorated money back. Proration is based on purchase price.

- Cancelation after 1 month of new purchase or renewal: This is allowed but you don't get any money back (i.e. 100% ETF). This rate can be adjusted by Office by Product/Geo/Segment.

### How do I get help from Microsoft to migrate to a new region or answer support questions?

If you have questions, you can contact us as follows, or through your partner:

- For Azure, you can submit [new support requests](https://portal.microsoftazure.de/#blade/Microsoft_Azure_Support/HelpAndSupportBlade/newsupportrequest) in the Azure portal.
- For Office 365, you may submit questions using the “Need Help?” link of the [Microsoft 365 admin center](https://portal.office.de/).
- For Dynamics 365 Customer Engagement and Power BI customer who also have Office 365, you may submit questions using the “Need Help?” link of the [Microsoft 365 admin center](https://portal.office.de/). Dynamics 365 Customer Engagement support options are located [here](https://docs.microsoft.com/dynamics365/get-started/support/). Power BI support options are located [here](https://powerbi.microsoft.com/support/).

## More information

- Microsoft Cloud Deutschland Migration Assistance at [https://aka.ms/germanymigrateassist](https://aka.ms/germanymigrateassist)
- How to opt-in for migration at [https://aka.ms/office365germanymoveoptin](https://aka.ms/office365germanymoveoptin)
- Dynamics 365 migration at [https://aka.ms/d365ceoptin](https://aka.ms/d365ceoptin)
- Power Apps Power BI migration at [https://aka.ms/pbioptin](https://aka.ms/pbioptin)
- Office 365 URLs and IP address ranges at [https://aka.ms/o365endpoints](https://aka.ms/o365endpoints)
- Office 365 Hybrid Configuration Wizard at [https://aka.ms/HybridWizard](https://aka.ms/HybridWizard)
