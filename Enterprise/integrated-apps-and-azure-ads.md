---
title: "Integrated Apps and Azure AD for Office 365 administrators"
ms.author: chrfox
author: chrfox
manager: laurawi
ms.audience: Admin
ms.topic: hub-page
ms.service: o365-administration
localization_priority: Normal
ms.custom: Adm_O365
ms.collection: M365-subscription-management
search.appverid:
- MET150
- MOE150
- BCS160
ms.assetid: cb2250e3-451e-416f-bf4e-363549652c2a
description: "Learn how O365 integrated Apps are registered and administered in Azure AD"
---

# Integrated Apps and Azure AD for Office 365 administrators

There's more to managing integrated apps than just [Turning Integrated Apps on or off](https://support.office.com/article/7e453a40-66df-44ab-92a1-96786cb7fb34#__toc379982114). With the advent of the Office 365 REST APIs, users can grant apps access to their Office 365 data, like mail, calendars, contacts, users, groups, files, and folders. By default, users need to individually grant permissions to each app, but this doesn't scale well if you want to authorize an app once at the global administrator level and roll it out to your whole organization through the app launcher. To do this, you must register the app in Azure AD. There are some steps you need to take before you can register an app in Azure AD and some background information you should know that can help you manage apps in your Office 365 organization. This article points you to those resources.
  
## Azure AD resources for Office 365 admins

You have to do these two procedures before you can manage your Office 365 apps in Azure AD.
  
|**Prerequisites**|**Comments**|
|:-----|:-----|
|[Register your free Azure Active Directory subscription](https://go.microsoft.com/fwlink/?LinkId=617127) <br/> |Every paid subscription to Office 365 comes with a free subscription to Azure Active Directory. You can use Azure AD to manage your apps and to create and manage user and group accounts. To activate this subscription and access the Azure management portal, you have to complete a one-time registration process. Afterwards, you can go to Azure AD from the Office 365 admin center.  <br/> |
|[Turning Integrated Apps on or off](https://support.office.com/article/7e453a40-66df-44ab-92a1-96786cb7fb34#__toc379982114) <br/> |You must turn on Integrated Apps for your users to allow third-party apps to access their Office 365 information and for you to register apps in Azure AD. For example, when someone uses a third-party app, that app might ask for permission to access their calendar and to edit files that are in a OneDrive for Business folder.  <br/> |
   
Managing Office 365 apps requires you to have knowledge of apps in Azure AD. These articles help give you the background you need.
  
|**Background article**|**Comments**|
|:-----|:-----|
|[Meet the Office 365 app launcher](https://support.office.com/article/79f12104-6fed-442f-96a0-eb089a3f476a) <br/> |If you're new to the app launcher, you might be wondering what it is and how to use it. The app launcher is designed to help you get to your apps from anywhere in Office 365.  <br/> |
|[Adding, Updating, and Removing an Application](https://go.microsoft.com/fwlink/?LinkId=617137) <br/> |This topic shows you how to add, update, or remove an application in Azure Active Directory. You will learn about the different types of applications that can be integrated with Azure AD and how to configure your applications to access other resources such as web APIs, and more.  <br/> |
|[Have your app appear in the Office 365 app launcher](https://go.microsoft.com/fwlink/?LinkId=617138).  <br/> |The app launcher in Office 365 that makes it easier for users to find and access their apps. This article describes the ways you as a developer can get your apps to appear in users' app launchers and also give them a single sign-on (SSO) experience using their Office 365 credentials.  <br/> |
|[Office 365 APIs platform overview](https://go.microsoft.com/fwlink/?LinkId=617140) <br/> |The Office 365 APIs lets you provide access to your customer's Office 365 data, including the things they care about most—their mail, calendars, contacts, users and groups, files, and folders. There is a good diagram in this article that illustrates the relationship among Office 365 apps, Azure AD, and the data that the apps access.  <br/> |
|[Integrating Applications in Azure Active Directory](https://docs.microsoft.com/azure/active-directory/develop/quickstart-v1-add-azure-ad-app) <br/> | Learn about applications that are integrated with Azure Active Directory, and how to register your application, understand concepts behind a registered application, and learn about branding guidelines for multi tenant applications.  <br/> |
|[Azure Active Directory Integration Tutorials](https://docs.microsoft.com/azure/active-directory/saas-apps/tutorial-list) <br/> |The objective of these tutorials is to show you how to configure Azure AD SSO for third-party SaaS applications.  <br/> |
|[Authentication Scenarios for Azure AD](https://go.microsoft.com/fwlink/?LinkId=617145) <br/> |Azure AD simplifies authentication for developers by providing identity as a service, with support for industry-standard protocols such as OAuth 2.0 and OpenID Connect, as well as open source libraries for different platforms to help you quickly start coding. This document helps you understand the various scenarios Azure AD supports and shows you how to get started.  <br/> |
|[Application access](https://docs.microsoft.com/azure/active-directory/manage-apps/what-is-access-management) <br/> |Azure AD enables easy integration to many of today's popular software as a service (SaaS) applications; it provides identity and access management, and it delivers an Access Panel for users where they can discover what application access they have and where they can use SSO to access their applications. This article provides you with links to the related resources that enable you to learn more about the application access enhancements for Azure AD and how you can contribute to them.  <br/> |
|[Personalize your Office 365 experience](https://support.office.com/article/eb34a21b-52fa-4fbf-a8d5-146132242985) <br/> |You can get quick access to the apps you use every day by adding or removing apps in the Office 365 app launcher.  <br/> |
   

