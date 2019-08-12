---
title: "Plan for Office 365 Enterprise"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 08/12/2019
audience: Admin
ms.topic: conceptual
ms.service: o365-administration
localization_priority: Normal
ms.collection: 
- Ent_O365
- M365-subscription-management
ms.custom: Adm_O365
search.appverid:
- MET150
- MOE150
- BCS160
ms.assetid: 712fced7-f9d0-4fde-8b79-286262a5d0bc

description: "Get access to the resources to plan for your Office 365 Enterprise deployment."
---

# Plan for Office 365 Enterprise

When you move an enterprise organization to Office 365, it's important to plan ahead and make the key design decisions that will streamline IT deployment and user adoption. 

## Planning with Office 365 FastTrack

[FastTrack for Office 365](https://docs.microsoft.com/fasttrack/O365-fasttrack-benefit-for-office-365) is the best method for getting help from Microsoft for planning your Office 365 deployment. FastTrack can help you through the most common design considerations and can answer questions along the way. 

>[!Note]
>You can also get help from a [Microsoft partner](https://www.microsoft.com/solution-providers/home).
>

## Do-it-yourself planning for Office 365

To plan for Office 365 on your own, step through the planning and design decisions for these areas:

- Your Office 365 tenant

  Includes planning for your network connections to the Internet, your Office 365 identities, and integration with apps, on-premises, Azure, and other elements. Start [here](subscriptions-licenses-accounts-and-tenants-for-microsoft-cloud-offerings.md).

- Support for your clients

  Includes certificate-based authentication, mobile device management, authentication options, and inter-tenant collaboration. Start [here](office-365-client-support-certificate-based-authentication.md).

- Support for hybrid modern authentication

  Includes planning for modern authentication when using hybrid configurations of key Office 365 workloads. Start [here](hybrid-modern-auth-overview.md).

- Older Office clients and servers

  Includes migration information for Office 2007 and Office 2010 client and server products. Start [here](plan-upgrade-previous-versions-office.md).

>[!Note]
>You can use this process for your [Microsoft 365 Enterprise](https://docs.microsoft.com/microsoft-365/enterprise/microsoft-365-overview) subscription as well.
>

You can also sign in to your Office 365 subscription and use the [Deployment advisors for Office 365 services](deployment-advisors-for-office-365.md).



<!--

This checklist will help your organization as you plan and prepare for a migration to Office 365. The phases and steps in the checklist are aligned with the guidance provided by the [Onboarding Center](https://go.microsoft.com/fwlink/?LinkId=517115). Feel free to adapt this checklist to your organization's needs.

Most organizations don't need to do anything to prepare for Office 365. It's an application on the web and people are able to use it as soon as they have an account. Other organizations have more locations, security practices, or other requirements that create the need for more planning. For enterprise-level organizations, follow the checklist items below to get started with Office 365.
  
If you want help getting Office 365 set up, [FastTrack](https://fasttrack.microsoft.com/office) is the easiest way to deploy Office 365, you can also sign in and use the [Deployment advisors for Office 365 services](deployment-advisors-for-office-365.md).
  
|**Choose one or more to get started:**||
|:-----|:-----|
| [System requirements for Office](https://products.office.com/office-system-requirements) |- Microsoft Office Professional, Office 365, Office 365 ProPlus, and each Office application for Windows, Mac, iOS, and Android all have specific system requirements. Ensure your hardware and software meet the minimum system requirements.|
|**Most** customers connect their on-premises directory to Office 365. Get a head start on directory preparation by [installing and running IdFix on your network](https://www.microsoft.com/download/details.aspx?id=36832). <br> Use the [AAD Connect advisor](https://aka.ms/aadconnectpwsync) and the [Azure AD Premium set up guide](https://aka.ms/aadpguidance) to get customized set up guidance. <br> |- Automated checks against your directory to [validate people's accounts will properly synchronize](https://support.office.com/article/Prepare-to-provision-users-through-directory-synchronization-to-Office-365-01920974-9e6f-4331-a370-13aea4e82b3e). <br> - Recommends changes to directory objects and offers to automate the changes for you. <br> - [More details on using the IdFix tool](prepare-directory-attributes-for-synch-with-idfix.md). |
|**Read** our [network performance guidance](https://aka.ms/tune) and use our tools to ensure you have the connectivity and performance configuration necessary to provide people with the best experience.  <br> | - Ensure you can connect to Office 365, if you filter or scan outbound traffic, you'll want to understand what [managing Office 365 endpoints](https://support.office.com/article/Managing-Office-365-endpoints-99cab9d4-ef59-4207-9f2b-3728eb46bf9a) means for your organization.  <br>  - [Model and test your network capacity](https://support.office.com/article/Network-and-migration-planning-for-Office-365-f5ee6c33-bcd7-4b0b-b0f8-dc1d9fb8d132) or move to an [Azure ExpressRoute for Office 365](https://support.office.com/article/Azure-ExpressRoute-for-Office-365-6d2534a2-c19c-4a99-be5e-33a0cee5d3bd) circuit for a more predictable experience.   |
|**Use** our [planning checklist](https://support.office.com/article/Deployment-planning-checklist-for-Office-365-5fa4f6ef-35ad-4840-91c1-4834df3df5a0) as a starting place for building your own deployment plan.  <br> | - In-depth overview of possible areas you'll need to plan for with links to reference or how-to information to help you plan. |
|**Use** the [Exchange Server Large Item Script](https://gallery.technet.microsoft.com/Exchange-Server-Large-Item-b9546cc6) to find mail items that may be too large to migrate.  <br> | - Uses Exchange Web Services to impersonate, access, scan the mailbox for file sizes you specify, and dumps the results in a CSV file. Read the [detailed instructions on how to use the script](https://blogs.technet.com/b/mikehall/archive/2013/06/27/large-mail-item-script.aspx). |
|**Take** advantage of [Microsoft deployment experts](https://go.microsoft.com/fwlink/?LinkId=517115) who can help you from planning to helping everyone start using the new services and applications.  <br> Use the [Deployment wizards for Office 365 services](https://support.office.com/article/Deployment-wizards-for-Office-365-services-165f46e8-3533-4d76-be57-97f81ebd40f2) to get customized set up guidance.  <br> | - The Onboarding center works directly with customers and with partner organizations. Give them a call today. |
|**Use** the [templates and resources in the Office 365 success center](https://www.microsoft.com/fasttrack/resources) to share your deployment and onboarding plans with the people in your organization.  <br> | - Communication with everyone before, during, and after the transition to Office 365 is critical.  <br> - Use our templates, guides, and handouts to improve your communications. |
|**Read** the article [Office 365 Network Connectivity Principles](https://aka.ms/o365networkingprinciples) to understand the connectivity principles for securely managing Office 365 traffic and getting the best possible performance.  <br> | - This article will help you understand the most recent guidance for securely optimizing Office 365 network connectivity. |
   
Want more resources to help you integrate Office 365 with your broader cloud strategy? Here are the [Microsoft cloud IT architecture resources](https://docs.microsoft.com/en-us/office365/enterprise/microsoft-cloud-it-architecture-resources).
  
## Want to talk with support?

We're here to help, [contact support](https://support.office.com/article/32a17ca7-6fa0-4870-8a8d-e25ba4ccfd4b) for business products.


--> 