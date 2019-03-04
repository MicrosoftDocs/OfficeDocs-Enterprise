---
title: "How modern authentication works for Office 2013 and Office 2016 client apps"
ms.author: tracyp
author: MSFTTracyP
manager: laurawi
ms.date: 8/1/2017
ms.audience: Admin
ms.topic: conceptual
ms.service: o365-administration
localization_priority: Normal
ms.custom: Adm_O365
search.appverid:
- MET150
- MOE150
- MED150
- GMA150
- GPA150
- GEA150
- BCS160
ms.assetid: e4c45989-4b1a-462e-a81b-2a13191cf517
ms.collection:
- M365-security-compliance
description: "Learn how Office 365 modern authentication works differently for Office 2013 and 2016 client apps."
---

# How modern authentication works for Office 2013 and Office 2016 client apps

Read this article to learn how Office 2013 and Office 2016 client apps use modern authentication features based on the authentication configuration on the Office 365 tenant for Exchange Online, SharePoint Online, and Skype for Business Online.
  
## Availability of modern authentication for Office 365 services

For the Office 365 services, the default state of modern authentication is:
  
- Turned **on** for Exchange Online by default. See [Enable or disable modern authentication in Exchange Online](https://support.office.com/article/58018196-f918-49cd-8238-56f57f38d662) to turn it off or on. 
    
- Turned **on** for SharePoint Online by default. 
    
- Turned **on** for Skype for Business Online by default. See [Enable Skype for Business Online for modern authentication ](https://social.technet.microsoft.com/wiki/contents/articles/34339.skype-for-business-online-enable-your-tenant-for-modern-authentication.aspx)to turn it off or on.
    
## Sign-in behavior of Office client apps

Office 2013 client apps support legacy authentication by default. Legacy means that they support either Microsoft Online Sign-in Assistant or basic authentication. In order for these clients to use modern authentication features, the Windows client has have registry keys set. For instructions, see [Enable Modern Authentication for Office 2013 on Windows devices](https://support.office.com/article/7dc1c01a-090f-4971-9677-f1b192d6c910).
  
Read [How to use Modern Authentication (ADAL) with Skype for Business](https://go.microsoft.com/fwlink/p/?LinkId=785431) to learn about how it works with Skype for Business. 
  
Office 2016 clients support modern authentication by default, and no action is needed for the client to use these new flows. However, explicit action is needed to use legacy authentication.
  
Click the links below to see how Office 2013 and Office 2016 client authentication works with the Office 365 services depending on whether or not modern authentication is turned on.
  
- [Exchange Online](modern-auth-for-office-2013-and-2016.md#BK_EchangeOnline)
    
- [SharePoint Online](modern-auth-for-office-2013-and-2016.md#BK_SharePointOnline)
    
- [Skype for Business Online](modern-auth-for-office-2013-and-2016.md#BK_SFBO)
    
### Exchange Online

The following table describes the authentication behavior for Office 2013 or Office 2016 client apps when they connect to Exchange Online with or without modern authentication.
  
|****Office client app version****|****Registry key present?****|****Modern authentication on?****|****Authentication behavior with modern authentication turned on for the tenant (default)****|****Authentication behavior with modern authentication turned off for the tenant****|
|:-----|:-----|:-----|:-----|:-----|
|Office 2016  <br/> |No, or EnableADAL = 1  <br/> |Yes  <br/> |Modern authentication is attempted first. If the server refuses a modern authentication connection, then basic authentication is used. Server refuses modern authentication when the tenant is not enabled.  <br/> |Modern authentication is attempted first. If the server refuses a modern authentication connection, then basic authentication is used. Server refuses modern authentication when the tenant is not enabled.  <br/> |
|Office 2016  <br/> |Yes, EnableADAL = 1  <br/> |Yes  <br/> |Modern authentication is attempted first. If the server refuses a modern authentication connection, then basic authentication is used. Server refuses modern authentication when the tenant is not enabled.  <br/> |Modern authentication is attempted first. If the server refuses a modern authentication connection, then basic authentication is used. Server refuses modern authentication when the tenant is not enabled.  <br/> |
|Office 2016  <br/> |Yes, EnableADAL=0  <br/> |No  <br/> |Basic authentication  <br/> |Basic authentication  <br/> |
|Office 2013  <br/> |No  <br/> |No  <br/> |Basic authentication  <br/> |Basic authentication  <br/> |
|Office 2013  <br/> |Yes, EnableADAL = 1  <br/> |Yes  <br/> |Modern authentication is attempted first. If the server refuses a modern authentication connection, then basic authentication is used. Server refuses modern authentication when the tenant is not enabled.  <br/> |Modern authentication is attempted first. If the server refuses a modern authentication connection, then basic authentication is used. Server refuses modern authentication when the tenant is not enabled.  <br/> |
   
### SharePoint Online
<a name="BK_SharePointOnline"> </a>

The following table describes the authentication behavior for Office 2013 or Office 2016 client apps when they connect to SharePoint Online with or without modern authentication.
  
|****Office client app version****|****Registry key present?****|****Modern authentication on?****|****Authentication behavior with modern authentication turned on for the tenant (default)****|****Authentication behavior with modern authentication turned off for the tenant****|
|:-----|:-----|:-----|:-----|:-----|
|Office 2016  <br/> |No, or EnableADAL = 1  <br/> |Yes  <br/> |Modern authentication only.  <br/> |Failure to connect.  <br/> |
|Office 2016  <br/> |Yes, EnableADAL = 1  <br/> |Yes  <br/> |Modern authentication only.  <br/> |Failure to connect.  <br/> |
|Office 2016  <br/> |Yes, EnableADAL = 0  <br/> |No  <br/> |Microsoft Online Sign-in Assistant only.  <br/> |Microsoft Online Sign-in Assistant only.  <br/> |
|Office 2013  <br/> |No  <br/> |No  <br/> |Microsoft Online Sign-in Assistant only.  <br/> |Microsoft Online Sign-in Assistant only.  <br/> |
|Office 2013  <br/> |Yes, EnableADAL = 1  <br/> |Yes  <br/> |Modern authentication only.  <br/> |Failure to connect.  <br/> |
   
### Skype for Business Online
<a name="BK_SFBO"> </a>

The following table describes the authentication behavior for Office 2013 or Office 2016 client apps when they connect to Skype for Business Online with or without modern authentication.
  
|****Office client app version****|****Registry key present?****|****Modern authentication on?****|****Authentication behavior with modern authentication turned on for the tenant****|****Authentication behavior with modern authentication turned off for the tenant (default)****|
|:-----|:-----|:-----|:-----|:-----|
|Office 2016  <br/> |No, or EnableADAL = 1  <br/> |Yes  <br/> |Modern authentication is attempted first. If the server refuses a modern authentication connection, then Microsoft Online Sign-in Assistant is used. Server refuses modern authentication when Skype for Business Online tenants are not enabled.  <br/> |Modern authentication is attempted first. If the server refuses a modern authentication connection, then Microsoft Online Sign-in Assistant is used. Server refuses modern authentication when Skype for Business Online tenants are not enabled.  <br/> |
|Office 2016  <br/> |Yes, EnableADAL = 1  <br/> |Yes  <br/> |Modern authentication is attempted first. If the server refuses a modern authentication connection, then Microsoft Online Sign-in Assistant is used. Server refuses modern authentication when Skype for Business Online tenants are not enabled.  <br/> |Modern authentication is attempted first. If the server refuses a modern authentication connection, then Microsoft Online Sign-in Assistant is used. Server refuses modern authentication when Skype for Business Online tenants are not enabled.  <br/> |
|Office 2016  <br/> |Yes, EnableADAL = 0  <br/> |No  <br/> |Microsoft Online Sign-in Assistant only.  <br/> |Microsoft Online Sign-in Assistant only.  <br/> |
|Office 2013  <br/> |No  <br/> |No  <br/> |Microsoft Online Sign-in Assistant only.  <br/> |Microsoft Online Sign-in Assistant only.  <br/> |
|Office 2013  <br/> |Yes, EnableADAL = 1  <br/> |Yes  <br/> |Modern authentication is attempted first. If the server refuses a modern authentication connection, then Microsoft Online Sign-in Assistant is used. Server refuses modern authentication when Skype for Business Online tenants are not enabled.  <br/> |Microsoft Online Sign-in Assistant only.  <br/> |
   
## See also

[Enable Modern Authentication for Office 2013 on Windows devices](https://support.office.com/article/enable-modern-authentication-for-office-2013-on-windows-devices-7dc1c01a-090f-4971-9677-f1b192d6c910)

[Plan for multi-factor authentication for Office 365 Deployments (for Office 365 administrators)](https://support.office.com/article/plan-for-multi-factor-authentication-for-office-365-deployments-043807b2-21db-4d5c-b430-c8a6dee0e6ba)

[Sign in to Office 365 with 2-step verification (for end users)](https://support.office.com/article/sign-in-to-office-365-with-2-step-verification-2b856342-170a-438e-9a4f-3c092394d3cb)