---
title: "Understanding Office 365 identity and Azure Active Directory"
ms.author: robmazz
author: robmazz
manager: laurawi
ms.audience: Admin
ms.topic: overview
ms.service: o365-administration
localization_priority: Normal
ms.collection: 
- Ent_O365
- M365-identity-device-management
- M365-security-compliance
ms.custom: Adm_O365
search.appverid:
- MET150
- MOE150
- BCS160
ms.assetid: 06a189e7-5ec6-4af2-94bf-a22ea225a7a9
description: "Learn how user identity is managed in Office 365."
---

# Understanding Office 365 identity and Azure Active Directory

Office 365 uses the cloud-based user identity and authentication service Azure Active Directory (Azure AD) to manage users. Choosing if identity management is configured between your on-premises organization and Office 365 is an early decision that is one of the foundations of your cloud infrastructure. Because changing this configuration later can be difficult, carefully consider the options to determine what works best for the needs of your organization. You can choose from two main authentication models in Office 365 to set up and manage user accounts; **cloud authentication** and **federated authentication**.
  
It's important to carefully consider which of these authentication and identity models to use to get up and running. Think about the time, existing complexity, and cost to implement and maintain each of the authentication and identity options. These factors are different for every organization; and you should understand the key concepts for the identity options to help you choose the authentication and identity model you want to use for your deployment.
  
## Cloud authentication

Depending if you have or don't have an existing Active Directory environment on-premises, you have several options to manage authentication and identity services for your users with Office 365.
  
### Cloud-only

With the cloud-only model, you manage your user accounts in Office 365 only. No on-premises servers are required; it's all handled in the cloud by Azure AD. You create and manage users in the [Microsoft 365 admin center](https://admin.microsoft.com) or by using Windows PowerShell [PowerShell cmdlets](https://docs.microsoft.com/office365/enterprise/powershell/manage-office-365-with-office-365-powershell) and identity and authentication are handled completely in the cloud by Azure AD. The cloud-only model is typically a good choice if: 
  
- You have no other on-premises user directory.
    
- You have a very complex on-premises directory and simply want to avoid the work to integrate with it.
    
- You have an existing on-premises directory, but you want to run a trial or pilot of Office 365. Later, you can match the cloud users to on-premises users when you are ready to connect to your on-premises directory.
    
To get started with cloud identity, see [Set up Office 365 for business](https://support.office.com/article/6a3a29a0-e616-4713-99d1-15eda62d04fa).
  
### Password hash sync with seamless single sign-on

The simplest way to enable authentication for on-premises directory objects in Azure AD. With password hash sync (PHS), you synchronize your on-premises Active Directory user account objects with Office 365 and manage your users on-premises. Hashes of user passwords are synchronized from your on-premises Active Directory to Azure AD so that the users have the same password on-premises and in the cloud. When passwords are changed or reset on-premises, the new password hashes are synchronized to Azure AD so that your users can always use the same password for cloud resources and on-premises resources. The passwords are never sent to Azure AD or stored in Azure AD in clear text. Some premium features of Azure AD, such as Identity Protection, require PHS regardless of which authentication method is selected. With seamless single sign-on, users are automatically signed in to Azure AD when they are on their corporate devices and connected to your corporate network.
  
Learn more about [choosing password hash sync](https://docs.microsoft.com/azure/security/azure-ad-choose-authn) and [seamless single sign-on](https://docs.microsoft.com/azure/active-directory/connect/active-directory-aadconnect-sso).
  
### Pass-through authentication with seamless single sign-on

Provides a simple password validation for Azure AD authentication services using a software agent running on one or more on-premises servers to validate the users directly with your on-premises Active Directory. With pass-through authentication (PTA), you synchronize on-premises Active Directory user account objects with Office 365 and manage your users on-premises. Allows your users to sign in to both on-premises and Office 365 resources and applications using their on-premises account and password. This configuration validates users passwords directly against your on-premises Active Directory without sending password hashes to Office 365. Companies with a security requirement to immediately enforce on-premises user account states, password policies, and logon hours would use this authentication method. With seamless single sign-on, users are automatically signed in to Azure AD when they are on their corporate devices and connected to your corporate network.
  
Learn more about [choosing pass-through authentication](https://docs.microsoft.com/azure/security/azure-ad-choose-authn) and [seamless single sign-on](https://docs.microsoft.com/azure/active-directory/connect/active-directory-aadconnect-sso).
  
## Federated authentication options

If you have an existing Active Directory environment on-premises, you can integrate Office 365 with your directory by using federated authentication to manage authentication and identity services for your users in Office 365.
  
### Federated identity with Active Directory Federation Services (AD FS)

Primarily for large enterprise organizations with more complex authentication requirements, on-premises directory objects are synchronized with Office 365 and users accounts are managed on-premises. With AD FS, users have the same password on-premises and in the cloud and they do not have to sign in again to use Office 365. This federated authentication model can provide additional authentication requirements, such as smartcard-based authentication or a third-party multi-factor authentication and is typically required when organizations have an authentication requirement not natively supported by Azure AD.
  
Learn more about [choosing federated identity with AD FS](https://docs.microsoft.com/azure/security/azure-ad-choose-authn).
  
### Third-party authentication and identity providers

On-premises directory objects may be synchronized to Office 365 and cloud resource access is primarily managed by a third-party identity provider (IdP). If your organization uses a third-party federation solution, you can configure sign-on with that solution for Office 365 provided that the third-party federation solution is compatible with Azure AD.
  
Learn more about [Azure AD federation compatibility](https://docs.microsoft.com/azure/active-directory/connect/active-directory-aadconnect-federation-compatibility).
  
## Configuring identity and authentication with Office 365

Integrating your on-premises directories with Office 365 and Azure AD has been simplified with [Azure AD Connect](https://docs.microsoft.com/azure/active-directory/connect/active-directory-aadconnect). Azure AD Connect is the best way to connect your directories and is Microsoft's recommendation for organizations to sync their users to the cloud.
  
You can also use the Azure AD advisors: the [Azure AD Connect advisor](https://aka.ms/aadconnectpwsync), the [AD FS deployment advisor](https://aka.ms/adfsguidance), and the [Azure AD Premium setup guide](https://aka.ms/aadpguidance).
  
## Video training

For more information, see the video course [Office 365: Manage Identities Using Azure AD Connect](https://support.office.com/article/90991a1d-c0ab-479a-b413-35c9706f6fed.aspx), brought to you by LinkedIn Learning.
