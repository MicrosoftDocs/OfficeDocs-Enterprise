---
title: "Cloud adoption Test Lab Guides (TLGs)"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 12/15/2017
ms.audience: ITPro
ms.topic: hub-page
ms.service: o365-solutions
localization_priority: Normal
ms.collection: Ent_O365
ms.custom:
- Strat_O365_Enterprise
- Ent_TLGs
ms.assetid: 706d5449-45e5-4b0c-a012-ab60501899ad
description: "Summary: Use these cloud adoption Test Lab Guides (TLGs) to set up demonstration, proof of concept, or dev/test environments for Office 365, Enterprise Mobility + Security (EMS), Dynamics 365, and Office Server products."
---

# Cloud adoption Test Lab Guides (TLGs)

 **Summary:** Use these cloud adoption Test Lab Guides (TLGs) to set up demonstration, proof of concept, or dev/test environments for Office 365, Enterprise Mobility + Security (EMS), Dynamics 365, and Office Server products.
  
TLGs help you quickly learn about Microsoft products. They're great for situations where you need to evaluate a technology or configuration before you decide whether it's right for you or before you roll it out to users. The "I built it out myself and it works" hands-on experience helps you understand the deployment requirements of a new product or solution so you can better plan for hosting it in production.
  
TLGs also create representative environments for development and testing of applications, also known as dev/test environments.
  
![Test Lab Guides in the Microsoft Cloud](images/24ad0d1b-3274-40fb-972a-b8188b7268d1.png)
  
See these additional resources before diving in:
  
- View the [Experience the Microsoft Cloud with Cloud Adoption Test Lab Guides](https://mva.microsoft.com/en-US/training-courses/experience-the-microsoft-cloud-with-cloud-adoption-test-lab-guides-17960?l=LXNRdhSLE_1000115881 ) Microsoft Virtual Academy session (only 22 minutes).
    
- Click [here](http://aka.ms/catlgstack) for a visual map to all the articles in the One Microsoft Cloud Test Lab Guide stack.
    
## Office 365 dev/test environment
<a name="O365"> </a>

Use these articles to build your Office 365 dev/test environment:
  
- [Base Configuration dev/test environment](base-configuration-dev-test-environment.md)
    
    Create a simplified intranet running in Microsoft Azure infrastructure services. This is an optional step if you want to build a simulated enterprise configuration.
    
- [Office 365 dev/test environment](office-365-dev-test-environment.md)
    
    Create an Office 365 Enterprise E5 trial subscription, which you can do from your computer or from a simplified intranet running in Azure infrastructure services.
    
- [DirSync for your Office 365 dev/test environment](dirsync-for-your-office-365-dev-test-environment.md)
    
    Install and configure Azure AD Connect for directory synchronization with password synchronization. This is an optional step if you want to build a simulated enterprise configuration.
    
For your Office 365 dev/test environment, use these articles to demonstrate enterprise features of Office 365:
  
- [Multi-factor authentication for your Office 365 dev/test environment](multi-factor-authentication-for-your-office-365-dev-test-environment.md)
    
    Configure and test secondary authentication using a text message sent to your smart phone for an account in your Office 365 subscription.
    
- [Federated identity for your Office 365 dev/test environment](federated-identity-for-your-office-365-dev-test-environment.md)
    
    Configure and demonstrate federated authentication with the accounts of a Windows Server Active Directory domain.
    
- [Cloud App Security for your Office 365 dev/test environment](cloud-app-security-for-your-office-365-dev-test-environment.md)
    
    Configure and demonstrate Office 365 Cloud App Security, which allows you to create policies that monitor for and inform you of suspicious activities in your Office 365 subscription.
    
- [Advanced Threat Protection for your Office 365 dev/test environment](advanced-threat-protection-for-your-office-365-dev-test-environment.md)
    
    Configure and demonstrate Advanced Threat Protection, which is a feature of Exchange Online Protection (EOP) that helps keep malware out of your email.
    
- [Advanced eDiscovery for your Office 365 dev/test environment](advanced-ediscovery-for-your-office-365-dev-test-environment.md)
    
    Add example data and demonstrate Advanced eDiscovery, which allows you to quickly find and analyze the data that is stored in Office 365, including email and documents.
    
- [Sensitive file protection in the Office 365 dev/test environment](sensitive-file-protection-in-the-office-365-dev-test-environment.md)
    
    Demonstrate how you can use Office 365 Information Rights Management to protect the data in sensitive documents, even when they are accidentally posted in the wrong document folders.
    
- [Data classification and labeling in the Office 365 dev/test environment](data-classification-and-labeling-in-the-office-365-dev-test-environment.md)
    
    Demonstrate how the Azure Information Protection (AIP) client can be used to classify documents with various levels of security.
    
- [Isolated SharePoint Online team site dev/test environment](isolated-sharepoint-online-team-site-dev-test-environment.md)
    
    Demonstrate how to create a SharePoint Online team site that is isolated from the rest of the organization for sensitive or highly confidential resources.
    
## The Microsoft 365 Enterprise dev/test environment
<a name="O365"> </a>

Create a dev/test environment for [Microsoft 365 Enterprise](https://docs.microsoft.com/microsoft-365-enterprise/) scenarios with these articles:
  
- [The Microsoft 365 Enterprise dev/test environment](the-microsoft-365-enterprise-dev-test-environment.md)
    
    Create the initial environment that includes Office 365 E5, EMS E5, and a computer running Windows 10 Enterprise.
    
- [MAM policies for your Microsoft 365 Enterprise dev/test environment](mam-policies-for-your-microsoft-365-enterprise-dev-test-environment.md)
    
    Create user groups and mobile application management (MAM) policies for ioS and Android devices.
    
- [Enroll iOS and Android devices in your Microsoft Enterprise 365 dev/test environment](enroll-ios-and-android-devices-in-your-microsoft-enterprise-365-dev-test-environ.md)
    
    Enroll iOS or Android devices and manage them remotely.
    
## Office 365 and Dynamics 365 dev/test environment
<a name="O365_D365"> </a>

Add a Dynamics 365 trial subscription and test Office 365 and Dynamics 365 integrated features and scenarios with these articles:
  
- [Office 365 and Dynamics 365 dev/test environment](office-365-and-dynamics-365-dev-test-environment.md)
    
    Add a Dynamics 365 trial subscription and Dynamics 365 licences and permissions to your user accounts.
    
- [Exchange Online integration for your Office 365 and Dynamics 365 dev/test environment](exchange-online-integration-for-your-office-365-and-dynamics-365-dev-test-enviro.md)
    
    Configure and then demonstrate how Office 365 and Dynamics 365 work together in Exchange Online mailboxes.
    
## The One Microsoft Cloud dev/test environment
<a name="O365_D365"> </a>

Create a dev/test environment that includes all of Microsoft's cloud offerings: Office 365, Azure, EMS, and Dynamics 365. See [The One Microsoft Cloud dev/test environment](the-one-microsoft-cloud-dev-test-environment.md) for the step-by-step instructions.
  
## Simulated cross-premises dev/test environments
<a name="O365_D365"> </a>

You can create a cross-premises dev/test environment, which includes an Azure virtual network and a simulated on-premises network, with these articles:
  
- [Simulated cross-premises virtual network in Azure](simulated-cross-premises-virtual-network-in-azure.md)
    
    Create a simulated intranet connected to an Azure virtual network in a hybrid cloud configuration.
    
- [Intranet SharePoint Server 2016 in Azure dev/test environment](https://technet.microsoft.com/library/mt806351%28v=office.16%29.aspx)
    
    Create a single-server SharePoint Server 2016 farm in the Azure virtual network and test connectivity and administration from the simulated on-premises network.
    
## Additional cloud-based dev/test environments
<a name="ADD_TLGs"> </a>

Here are additional cloud-based dev/test environments that you can create in Azure infrastructure services:
  
- [SharePoint Server 2016 dev/test environment in Azure](https://technet.microsoft.com/library/mt723354.aspx)
    
    Build a single-server SharePoint Server 2016 farm in Azure infrastructure services.
    
- [Exchange 2016 dev/test environment in Azure](https://technet.microsoft.com/library/mt733070%28v=exchg.160%29.aspx)
    
    Build a single Exchange 2016 server in Azure infrastructure services.
    
- [SharePoint Server 2013 dev/test environments in Azure](http://technet.microsoft.com/library/165de4d5-8fe6-4fbb-a15b-39a8b0a0eb23.aspx)
    
    Build basic and high-availability SharePoint Server 2013 farms in Azure infrastructure services.
    
**Join the discussion**

|**Contact us**|**Description**|
|:-----|:-----|
|**What cloud adoption content do you need?** <br/> |We are creating content for cloud adoption that spans multiple Microsoft cloud platforms and services. Let us know what you think about our cloud adoption content, or ask for specific content by sending email to [cloudadopt@microsoft.com](mailto:cloudadopt@microsoft.com?Subject=[Cloud%20Adoption%20Content%20Feedback]:%20).  <br/> |
|**Join the cloud adoption discussion** <br/> |If you are passionate about cloud-based solutions, consider joining the Cloud Adoption Advisory Board (CAAB) to connect with a larger, vibrant community of Microsoft content developers, industry professionals, and customers from around the globe. To join, add yourself as a member of the [CAAB (Cloud Adoption Advisory Board) space](https://aka.ms/caab) of the Microsoft Tech Community and send us a quick email at [CAAB@microsoft.com](mailto:caab@microsoft.com?Subject=I%20just%20joined%20the%20Cloud%20Adoption%20Advisory%20Board!). Anyone can read community-related content on the [CAAB blog](https://blogs.technet.com/b/solutions_advisory_board/). However, CAAB members get invitations to private webinars that describe new cloud adoption resources and solutions.  <br/> |
|**Get the art you see here** <br/> |If you want an editable copy of the art you see in this article, we'll be glad to send it to you. Email your request, including the URL and title of the art, to [cloudadopt@microsoft.com](mailto:cloudadopt@microsoft.com?subject=[Art%20Request]:%20).  <br/> |
   
## See Also

<a name="ADD_TLGs"> </a>

[Cloud adoption and hybrid solutions](cloud-adoption-and-hybrid-solutions.md)
  
[Microsoft Cloud IT architecture resources](microsoft-cloud-it-architecture-resources.md)
  
[Architectural models for SharePoint, Exchange, Skype for Business, and Lync](architectural-models-for-sharepoint-exchange-skype-for-business-and-lync.md)
  
[Hybrid solutions](hybrid-solutions.md)


