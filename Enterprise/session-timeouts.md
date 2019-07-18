---
title: "Session timeouts for Office 365"
ms.author: tracyp
author: MSFTTracyP
manager: scotv
ms.date: 6/29/2018
audience: Admin
ms.topic: reference
ms.service: o365-administration
localization_priority: Normal
ms.custom: Adm_O365
search.appverid:
- MET150
- MOE150
- MED150
- MBS150
- BCS160
ms.assetid: 37a5c116-5b07-4f70-8333-5b86fd2c3c40
ms.collection:
- M365-security-compliance
description: "Session timeouts are used to balance security and ease of access  in Office 365 client apps."
---

# Session timeouts for Office 365

Session lifetimes are an important part of authentication for Office 365 and are an important component in balancing security and the number of times users are prompted for their credentials.
  
## Session times for Office 365 services

When users authenticate in any of the Office 365 web apps or mobile apps, a session is established. For the duration of the session, users won't need to re-authenticate. Sessions can expire when users are inactive, when they close the browser or tab, or when their authentication token expires for other reasons such as when their password has been reset. The Office 365 services have different session timeouts to correspond with the typical use of each service.
  
The following table lists the session lifetimes for Office 365 services:
  
|**Office 365 service**|**Session timeout**|
|:-----|:-----|
|Microsoft 365 admin center  <br/> |You are asked to provide credentials for the admin center every 8 hours.  <br/> |
|SharePoint Online  <br/> |5 days of inactivity as long as the users chooses **Keep me signed in**. If the user accesses SharePoint Online again after 24 or more hours have passed from the previous sign-in, the timeout value is reset to 5 days.  <br/> |
|Outlook Web App  <br/> |6 hours.  <br/> You can change this value by using the  _ActivityBasedAuthenticationTimeoutInterval_ parameter in the [Set-OrganizationConfig](https://go.microsoft.com/fwlink/p/?LinkId=615378) cmdlet.  <br/> |
|Azure Active Directory  <br/> (Used by Office 2013 Windows clients with modern authentication enabled)  <br/> | Modern authentication uses access tokens and refresh tokens to grant user access to Office 365 resources using Azure Active Directory. An access token is a JSON Web Token provided after a successful authentication and is valid for 1 hour. A refresh token with a longer lifetime is also provided. When access tokens expire, Office clients use a valid refresh token to obtain a new access token. This exchange succeeds if the user's initial authentication is still valid.  <br/>  Refresh tokens are valid for 90 days, and with continuous use, they can be valid until revoked.  <br/>  Refresh tokens can be invalidated by several events such as :  <br/>  User's password has changed since the refresh token was issued.  <br/>  An administrator can apply conditional access policies which restrict access to the resource the user is trying to access.  <br/> |
|SharePoint and OneDrive mobile apps for Android, iOS, and Windows 10  <br/> |The default lifetime for the access token is 1 hour. The default max inactive time of the refresh token is 90 days.  <br/> [Learn more about tokens and how to configure token lifetimes](https://docs.microsoft.com/en-us/azure/active-directory/active-directory-configurable-token-lifetimes) <br/> To revoke the refresh token, you can reset the user's Office 365 password  <br/> |
|Yammer with Office 365 Sign-In  <br/> |Lifetime of the browser. If users close the browser and access Yammer in a new browser, Yammer will re-authenticate them with Office 365. If users use third-party browsers that cache cookies, they may not need to re-authenticate when they reopen the browser.  <br/> > [!NOTE]> This is valid only for networks using Office 365 Sign-In for Yammer.           |
   

