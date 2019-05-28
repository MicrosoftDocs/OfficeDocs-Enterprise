---
title: "Tools to manage Office 365 accounts"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
audience: Admin
ms.topic: overview
ms.prod: office-online-server
localization_priority: Normal
ms.custom: Adm_O365
ms.collection:
- Ent_O365
- M365-subscription-management
search.appverid:
- MET150
- MOE150
- MED150
- BCS160
ms.assetid: 98ca5b3f-f720-4d8e-91be-fe656548a25a
description: "Learn what tools to use to manage your Office 365 users, and how what you can use depends on how you manage user identities. "
---

# Tools to manage Office 365 accounts

You can manage Office 365 users in several different ways, depending on your configuration. You can manage users in the [Microsoft 365 admin center](https://admin.microsoft.com), Windows PowerShell, your on-premises directory, or in Azure Active Directory admin portal. As soon as you purchase Office 365, the admin center and Windows PowerShell can be used to manage accounts. When managing cloud identities every person in your organization has a separate user ID and password for Office 365. If you want to integrate with your on-premises infrastructure and have user accounts synchronized with Office 365, you can use Azure Active Directory Connect to provide synchronization of identities and optionally provide password synchronization, or full single sign-on functionality.
  
## Plan for where and how you will manage your user accounts

Where and how you can manage your user accounts depends on the identity model you want to use for your Office 365. The two overall models are cloud authentication and federated authentication.
  
### Cloud authentication

- Cloud authentication - create and manage users in the admin center, you can also use Windows PowerShell, or Azure Active Directory to manage your users. 
    
- Password hash sync with seamless single sign-on - The simplest way to enable authentication for on-premises directory objects in Azure AD. With password hash sync (PHS), you synchronize your on-premises Active Directory user account objects with Office 365 and manage your users on-premises. 
    
- Pass-through authentication with seamless single sign-on - Provides a simple password validation for Azure AD authentication services using a software agent running on one or more on-premises servers to validate the users directly with your on-premises Active Directory. 
    
### Federated authentication

- Federated authentication options - Primarily for large enterprise organizations with more complex authentication requirements, on-premises directory objects are synchronized with Office 365 and users accounts are managed on-premises. 
    
- [Third-party authentication and identity providers](about-office-365-identity.md) - On-premises directory objects may be synchronized to Office 365 and cloud resource access is primarily managed by a third-party identity provider (IdP). 
    
## Managing Accounts

When deciding which way your organization will create and manage accounts, consider the following:
  
- The directory synchronization software needs to be installed on servers within your on-premises environment to connect the identities between Office 365 and your on-premises directory.
    
- Any directory synchronization option, including SSO options, requires your on-premises directory attributes meet standards. The specifics of what attributes are used in your directory and what cleanup (if any) is needed are described in [Prepare to provision users through directory synchronization to Office 365](prepare-for-directory-synchronization.md). See [Download and run the Office 365 IdFix tool](install-and-run-idfix.md) for instruction on how to use IdFix to automate directory cleanup. 
    
- Plan how you are going to create Office 365 accounts.
    
    The following table lists the different account management tools.
    
|**Option**|**Notes**|
|:-----|:-----|
|Admin center  <br/> |[Add users individually or in bulk to Office 365 - Admin Help](https://support.office.com/article/1970f7d6-03b5-442f-b385-5880b9c256ec) <br/>  Provides a simple web interface to add and change user accounts.  <br/>  Can't be used to change users if directory synchronization is enabled (location and license assignment can be set).  <br/>  Can't be used with SSO options.  <br/> |
|Windows PowerShell  <br/> |[Manage Office 365 with Windows PowerShell](https://go.microsoft.com/fwlink/p/?LinkId=698471) <br/>  Allows you to add users in bulk users by using a Windows PowerShell script.  <br/>  Can be used to assign location and licenses to accounts, regardless of how the accounts are created.  <br/> |
|Bulk import  <br/> |[Add several users at the same time to Office 365 - Admin Help](add-several-users-at-the-same-time.md) <br/>  Allows you to import a CSV file to add a group of users to Office 365.  <br/>  Can't be used with SSO options.  <br/> |
|Azure Active Directory  <br/> |You get a free edition of Azure Active Directory with your Office 365 subscription. You can perform functions like self-service password reset for cloud users, and customization of the Sign-in and Access Panel pages by using the free edition. To get enhanced functionality, you can upgrade to either the basic edition, or the premium edition. See [Azure Active Directory editions](https://go.microsoft.com/fwlink/p/?LinkId=698465) for the list of supported features.  <br/> |
|Directory synchronization  <br/> |[Integrating your on-premises identities with Azure Active Directory](https://go.microsoft.com/fwlink/p/?LinkID=624168) <br/>  For directory synchronization with or without password synchronization, use [Azure AD Connect with express settings](https://go.microsoft.com/fwlink/p/?LinkID=698537).  <br/>  For multiple forests and SSO options, use [Custom Installation of Azure AD Connect](https://go.microsoft.com/fwlink/p/?LinkId=698430).  <br/>  Provides the infrastructure that's necessary to enable SSO.  <br/>  Required for many hybrid scenarios:  <br/>  Staged migration  <br/>  Hybrid Exchange  <br/>  Synchronizes security and mail-enabled groups from your on-premises directory.  <br/> |
   
- Regardless of how you intend to add the user accounts to Office 365, you need to manage several account features, such as assigning licenses, specifying location, and so on. These features can be managed long-term from the admin center or you can also [create user accounts with Office 365 PowerShell](https://go.microsoft.com/fwlink/p/?LinkId=717083).
    
    If you choose to add and manage all your users through the admin center, you will specify the location and assign licenses at the same time as creating the Office 365 account. As a result, not much planning is required.
    
    > [!IMPORTANT]
    > Creating accounts in Office 365 without assigning a license (to SharePoint Online, for example) means that the account owner can view the Office 365 portal but can't access any of the services within your company's subscription. After you assign a location and the license, the account is replicated to the service or services that you assigned. The user can sign in to their account and use the services that you assigned to them. 
  
## Next steps

[Office 365 integration with on-premises environments](office-365-integration.md)
  
## See Also

[Manage user accounts in Office 365](https://support.office.com/article/3204162b-0b6c-4838-8a11-394b9bfd31de.aspx)
  

