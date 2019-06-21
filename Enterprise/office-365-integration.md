---
title: "Office 365 integration with on-premises environments"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
audience: Admin
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.custom: Adm_O365
ms.collection:
- Ent_O365
search.appverid:
- MET150
- LYN150
- SPS150
- MOE150
- MED150
ms.assetid: 263faf8d-aa21-428b-aed3-2021837a4b65
description: "Learn how to integrate Office 365 with your existing directory services."
---

# Office 365 integration with on-premises environments

You can integrate Office 365 with your existing directory services and with an on-premises installation of Exchange Server, Skype for Business Server 2015, or SharePoint Server 2013.
  
 - When you integrate with directory services, you can synchronize and manage user accounts for both environments. You can also add password hash synchronization or single sign-on (SSO) so users can log on to both environments with their on-premises credentials.
 - When you integrate with on-premises server products, you create a hybrid environment. A hybrid environment can help as you migrate users or information to Office 365, or you can continue to have some users or some information on-premises and some in the cloud. For more information about hybrid environments, see [Office 365 hybrid cloud solutions overview](https://support.office.com/article/59616fab-acdb-40e9-b414-cf0c965c80b7).

You can also use the Azure AD advisors for customized setup guidance:
- [Azure AD Connect advisor](https://aka.ms/aadconnectpwsync)
- [AD FS deployment advisor](https://aka.ms/adfsguidance)
- [Azure RMS Deployment Wizard](https://aka.ms/azuremsguidance)
- [Azure AD Premium setup guidance](https://aka.ms/aadpguidance)
   
## Before you begin
Before you integrate Office 365 and an on-premises environment, you also need to attend to [network planning and performance tuning for Office 365](network-planning-and-performance.md). You will also want to understand the available [identity models](about-office-365-identity.md) in Office 365. 

See [where to manage Office 365 user accounts](manage-office-365-accounts.md) for a list of tools you can use to manage Office 365 users and accounts. 
  
## Integrate Office 365 with directory services
If you have existing user accounts in an on-premises directory, you don't want to re-create all of those accounts in Office 365 and risk introducing differences or errors between the environments. Directory synchronization helps you mirror those accounts between your online and on-premises environments. With directory synchronization, your users don't have to remember new information for each environment, and you don't have to create or update accounts twice. You will need to [prepare your on-premises directory](prepare-for-directory-synchronization.md) for directory synchronization, you can do this manually or use the [IdFix tool](install-and-run-idfix.md) (IdFix tool only works with Active Directory). 
  
![Use directory synchronization to keep on-premises and online user account information synchronized](media/a64af0d0-9be6-46b1-8727-277e683abf5e.png)
  
If you want users to be able to log on to Office 365 with their on-premises credentials, you can also configure SSO. With SSO, Office 365 is configured to trust the on-premises environment for user authentication.
  
![With single sign-on, the same account is available in both the on-premises and online environments](media/d76235f2-8a53-405e-b8ef-dfa4cfc208b8.png)
  
Different user account management techniques provide different experiences for your users, as shown in the following table.
 
### **Directory synchronization with or without password hash synchronization or pass-through authentication**
A user logs on to their on-premises environment with their user account (domain\username). When they go to Office 365, they must log on again with their work or school account (user@domain.com). The user name is the same in both environments. When you add password hash sync or pass-through authentication, the user has the same password for both environments, but will have to provide those credentials again when logging on to Office 365. Directory synchronization with password hash sync is the most commonly used directory sync scenario.

To set up directory synchronization, use Azure Active Directory Connect. For instructions, read [Set up directory synchronization for Office 365](set-up-directory-synchronization.md), and [Use Azure AD Connect with express settings](https://go.microsoft.com/fwlink/p/?LinkId=698537).

Learn more about [preparing to provision users through directory synchronization to Office 365](prepare-for-directory-synchronization.md) and [integrating your on-premises identifies with Azure Active Directory](https://go.microsoft.com/fwlink/?LinkId=518101).

### **Directory synchronization with SSO**
A user logs on to their on-premises environment with their user account. When they go to Office 365, they are either logged on automatically, or they log on using the same credentials they use for their on-premises environment (domain\username).

To set up SSO you also use Azure AD Connect. For instructions, read [Use Azure AD Connect with custom settings](https://go.microsoft.com/fwlink/p/?LinkID=698430).

Learn more about [application access and single sign-on with Azure Active Directory](https://go.microsoft.com/fwlink/p/?LinkId=698604).

## Azure AD Connect
Azure AD Connect replaces older versions of identity integration tools such as DirSync and Azure AD Sync. For more information, see [Integrating your on-premises identities with Azure Active Directory](https://go.microsoft.com/fwlink/p/?LinkId=527969). If you want to update from Azure Active Directory Sync to Azure AD Connect, see [the upgrade instructions](https://go.microsoft.com/fwlink/p/?LinkId=733240). See a solution architecture built for [Office 365 Directory Synchronization (DirSync) in Microsoft Azure](https://go.microsoft.com/fwlink/?LinkId=517887).