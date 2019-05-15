---
title: "Azure integration with Office 365"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
audience: Admin
ms.topic: overview
ms.service: o365-administration
localization_priority: Normal
ms.collection: 
- Ent_O365
- M365-identity-device-management
ms.custom: Adm_O365
search.appverid:
- MET150
- MOE150
- MED150
- BCS160
ms.assetid: a5efce5d-9c9c-4190-b61b-fd273c1d425f
description: "Your Office 365 subscription includes a subscription to Azure AD. Integrate Office 365 with Azure AD if you want password sync or single sign-on with your on-premises environment."
---

# Azure integration with Office 365

Office 365 uses Azure Active Directory (Azure AD) to manage user identities behind the scenes. Your Office 365 subscription includes a free subscription to Azure AD so that you can integrate Office 365 with Azure AD if you want to sync passwords or set up single sign-on with your on-premises environment. You can also buy advanced features to better manage your accounts.
  
Azure also offers other functionality, like managing integrated apps, that you can use to extend and customize your Office 365 subscriptions.
  
You can use the Azure AD deployment advisors for a guided setup and configuration experience:
 - [Azure AD Connect advisor](https://aka.ms/aadconnectpwsync)
 - [AD FS deployment advisor](https://aka.ms/adfsguidance)
 - [Azure RMS Deployment Wizard](https://aka.ms/azuremsguidance)
 - [Azure AD Premium setup guide](https://aka.ms/aadpguidance)
  
## Azure AD editions and Office 365 identity management

If you have a paid subscription to Office 365, you also have a free subscription to Azure AD. You can use Azure AD to create and manage user and group accounts. To activate this subscription you have to complete a one-time registration. Afterward, you can access Azure AD from your Office 365 admin portal. For instructions, see [register your free Azure AD subscription](https://go.microsoft.com/fwlink/p/?LinkId=617127). 
  
> [!TIP]
> Follow the instructions above to register the free Azure AD subscription that comes with your subscription to Office 365. Don't go directly to azure.microsoft.com to sign up or you'll end up with a trial or paid subscription to Microsoft Azure that is separate from your free one for Office 365. 
  
With the free subscription you can synchronize with on-premises directories, set up single sign-on, and synchronize with many software as service applications, such as Salesforce, DropBox and many more.
  
If you want enhanced AD DS functionality, bi-directional synchronization, and other management capabilities, you can upgrade your free subscription to a paid premium subscription. For details see [Azure Active Directory editions](https://docs.microsoft.com/azure/active-directory/fundamentals/active-directory-whatis).
  
For more information about Office 365 and Azure AD, see [Understanding Office 365 Identity and Azure Active Directory](https://support.office.com/article/06a189e7-5ec6-4af2-94bf-a22ea225a7a9).
  
## Extend the capabilities of your Office 365 tenant

|**Feature**|**Description**|
|:-----|:-----|
|Integrated apps  <br/> |You can grant individual apps access to your Office 365 data, like mail, calendars, contacts, users, groups, files, and folders. You can also authorize these apps at global admin level and make them available to your entire company by registering the apps in Azure AD. For details see [Integrated Apps and Azure AD for Office 365 administrators](https://support.office.com/article/cb2250e3-451e-416f-bf4e-363549652c2a).  <br/> See also [Azure AD application gallery and single-sign-on](https://go.microsoft.com/fwlink/p/?LinkId=698604).  <br/> |
|PowerApps  <br/> | Power apps are focused apps for mobile devices that can connect to your existing data sources like SharePoint lists, and other data apps. See [Create a PowerApp for a list in SharePoint Online](https://support.office.com/article/9338b2d2-67ac-4b81-8e67-97da27e5e9ab) and [PowerApps page](https://powerapps.microsoft.com/) for details.  <br/> |
   
For other resources about the Microsoft Cloud and Office 365, see these resources:
  
- [Microsoft Cloud Identity for Enterprise Architects](https://go.microsoft.com/fwlink/p/?LinkId=524586)
    
- [Deploy Office 365 Directory Synchronization (DirSync) in Microsoft Azure](https://go.microsoft.com/fwlink/p/?LinkId=517887)
    

Learn more at [Integrated Apps and Azure AD for Office 365 administrators](integrated-apps-and-azure-ads.md) and [Azure AD application gallery and single-sign-on](https://docs.microsoft.com/azure/active-directory/manage-apps/what-is-single-sign-on).

### Power Apps
Power apps are focused apps for mobile devices that can connect to your existing data sources like SharePoint lists, and other data apps. See [Create a PowerApp for a list in SharePoint Online](https://support.office.com/article/9338b2d2-67ac-4b81-8e67-97da27e5e9ab) and [PowerApps page](https://powerapps.microsoft.com/) for details.