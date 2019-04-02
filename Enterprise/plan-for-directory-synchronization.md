---
title: "Plan for directory synchronization for Office 365"
ms.author: robmazz
author: robmazz
manager: laurawi
ms.date: 8/21/2018
ms.audience: Admin
ms.topic: conceptual
ms.service: o365-administration
localization_priority: Normal
ms.custom: Adm_O365
ms.collection:
- Ent_O365
- M365-identity-device-management
search.appverid: 
- MOE150
- MET150
ms.assetid: d3577c90-dda5-45ca-afb0-370d2889b10f
description: "Describes directory synchronization with Office 365, Active Directory cleanup, and Azure Active Directory Connect tool."
---

# Plan for directory synchronization for Office 365

Depending on business need and technical requirements, directory synchronization is the most common provisioning choice for enterprise customers who are moving to Office 365. Directory synchronization allows identities to be managed in the on-premises Active Directory and all updates to that identity are synchronized to Office 365.
  
There are a couple of things to keep in mind when you plan an implementation of directory synchronization, including directory preparation, and the requirements and functionality of the Azure Active Directory. Directory preparation covers quite a few areas. They include attribute updates, auditing, and planning domain controller placement. Planning requirements and functionality includes determining the permissions that are required, planning for multi-forest/directory scenarios, capacity planning, and two-way synchronization.
  
## Office 365 identity models

Office 365 uses two main authentication and identity models: cloud authentication and federated authentication.
  
### Cloud authentication

[Cloud identity](about-office-365-identity.md) - create and manage users in the [Microsoft 365 admin center](https://admin.microsoft.com), you can also use Windows PowerShell, or Azure Active Directory to manage your users.
  
[Password hash sync with seamless single sign-on](about-office-365-identity.md) - The simplest way to enable authentication for on-premises directory objects in Azure AD. With password hash sync (PHS), you synchronize your on-premises Active Directory user account objects with Office 365 and manage your users on-premises.
  
[Pass-through authentication with seamless single sign-on](about-office-365-identity.md) - Provides a simple password validation for Azure AD authentication services using a software agent running on one or more on-premises servers to validate the users directly with your on-premises Active Directory.
  
### Federated authentication

[Federated identity with Active Directory Federation Services AD FS](about-office-365-identity.md) - Primarily for large enterprise organizations with more complex authentication requirements, on-premises directory objects are synchronized with Office 365 and users accounts are managed on-premises.
  
[Third-party authentication and identity providers](about-office-365-identity.md) - On-premises directory objects may be synchronized to Office 365 and cloud resource access is primarily managed by a third-party identity provider (IdP).
  
## Active Directory Cleanup

To help ensure a seamless transition to Office 365 by using synchronization, we highly recommend that you prepare your Active Directory forest before you begin your Office 365 directory synchronization deployment.
  
When you [set up directory synchronization in Office 365](set-up-directory-synchronization.md), one of the steps is to [download and run the IdFix tool](install-and-run-idfix.md). You can use the IdFix tool to help with the [directory cleanup](prepare-directory-attributes-for-synch-with-idfix.md).
  
Your directory cleanup should focus on the following tasks:

- Remove duplicate **proxyAddress** and **userPrincipalName** attributes.
- Update blank and invalid **userPrincipalName** attributes with valid **userPrincipalName** attributes.
- Remove invalid and questionable characters in the **givenName**, surname ( **sn** ), **sAMAccountName**, **displayName**, **mail**, **proxyAddresses**, **mailNickname**, and **userPrincipalName** attributes. For details about preparing attributes, see [List of attributes that are synced by the Azure Active Directory Sync Tool](https://go.microsoft.com/fwlink/p/?LinkId=396719).

    > [!NOTE]
    > These are the same attributes that Azure AD Connect syncs. 
  
## Multi-forest Deployment Considerations

For multiple forests and SSO options, use [Custom Installation of Azure AD Connect](https://go.microsoft.com/fwlink/p/?LinkId=698430).
  
If your organization has multiple forests for authentication (logon forests), we highly recommend the following:
  
- **Evaluate consolidating your forests.** In general, there's more overhead required to maintain multiple forests. Unless your organization has security constraints that dictate the need for separate forests, consider simplifying your on-premises environment.
- **Use only in your primary logon forest.** Consider deploying Office 365 only in your primary logon forest for your initial rollout of Office 365. 

If you can't consolidate your multi-forest Active Directory deployment or are using other directory services to manage identities, you may be able to synchronize these with the help of Microsoft or a partner.
  
For more information, see [Multi-forest Directory Sync with Single Sign-On Scenario](https://go.microsoft.com/fwlink/p/?LinkId=525321).
  
## Directory integration tools

Directory synchronization is the synchronization of directory objects (users, groups, and contacts) from your on-premises Active Directory environment to the Office 365 directory infrastructure. See [directory integration tools](https://go.microsoft.com/fwlink/p/?LinkID=510956) for a list of the available tools and their functionality. The recommended tool to use is [Azure Active Directory Connect](https://go.microsoft.com/fwlink/?LinkId=525323).
  
When user accounts are synchronized with the Office 365 directory for the first time, they are marked as non-activated. They cannot send or receive email, and they don't consume subscription licenses. When you're ready to assign Office 365 subscriptions to specific users, you must select and activate them by assigning a valid license.
  
Directory synchronization is required for the following features and functionality:
  
- SSO
- Skype coexistence
- Exchange hybrid deployment, including:
  - Fully shared global address list (GAL) between your on-premises Exchange environment and Office 365.
  - Synchronizing GAL information from different mail systems.
  - The ability to add users to and remove users from Office 365 service offerings. This requires the following:
  - Two-way synchronization must be configured during directory synchronization setup. By default, directory synchronization tools write directory information only to the cloud. When you configure two-way synchronization, you enable write-back functionality so that a limited number of object attributes are copied from the cloud, and then written them back to your local Active Directory. Write-back is also referred to as Exchange hybrid mode. 
  - An on-premises Exchange hybrid deployment
  - The ability to move some user mailboxes to Office 365 while keeping other user mailboxes on-premises.
  - Safe senders and blocked senders on-premises are replicated to Office 365.
  - Basic delegation and send-on-behalf-of email functionality.
  - You have an integrated on-premises smart card or multi-factor authentication solution.
- Synchronization of photos, thumbnails, conference rooms, and security groups