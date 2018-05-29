---
title: "Office 365 Client Capabilities - Conditional Access"
ms.author: robmazz
author: robmazz
manager: laurawi
ms.date: 5/17/2018
audience: ITPro
ms.topic: article
ms.service: Office 365 Administration
localization_priority: None
ms.collection: Strat_O365_Enterprise
description: "Summary: Understand Office 365 conditional access"
---

# Office 365 Client Capabilities - Conditional Access

In the modern workplace, users can access your organization's resources using a variety of devices and apps from virtually anywhere. As a result, just focusing on who can access a resource is not sufficient anymore. Your organization must also support how and where a resource is being accessed into your access control infrastructure. With Azure AD device, location, and multifactor authentication-based conditional access, you can meet this new requirement. Conditional access is a capability of Azure Active Directory that enables you to enforce controls on the access to apps in your environment, all based on specific conditions and managed from a central location.

- **Device-based conditional access** - Microsoft Azure Active Directory (Azure AD) enables single sign-on to devices, apps, and services from anywhere. For certain resources in your environment, granting access to the right users might not be good enough. In addition to the right users, you also might require that access attempts can only be performed using a managed device. Learn more about [device-based conditional access](https://docs.microsoft.com/azure/active-directory/active-directory-conditional-access-policy-connected-applications).
- **Location and MFA-based conditional access** - With conditional access based on application sensitivity, you can set multi-factor authentication (MFA) access rules per application. MFA per application provides the ability to block access for users who are not on a trusted network. You can apply MFA rules to all users that are assigned to the application, or only for users within specified security groups. The location is identified by the IP address of the client you have used to connect to Azure Active Directory. When you configure a location conditions, Trusted IPs enables you to distinguish between connections made from your organization's network and all other locations. You can either include all locations or all trused IPs and you can exclude all trusted IPs. Learn more about [location-based](https://docs.microsoft.com/azure/active-directory/active-directory-conditional-access-locations) and [MFA-based](https://docs.microsoft.com/azure/active-directory/active-directory-conditional-access-conditions#users-and-groups) conditional access.

## Supported platforms

| | | | | | |
|:---:|:---:|:---:|:---:|:---:|:---:|
| ![Windows icon](images/windows_62x62.png) <br> Windows 10 <br> Desktop | ![Windows icon](images/windows_62x62.png) <br> Windows 10 <br> Modern Apps | ![Windows icon](images/windows_62x62.png) <br> Web Browser | ![Android icon](images/android_62x62.png) <br> Android | ![iOS icon](images/ios_62x62.png) <br> iOS | ![Windows icon](images/windows_62x62.png) <br> macOS


## Supported clients

| | | | | | |
|:---:|:---:|:---:|:---:|:---:|:---:|
| ![Excel icon](images/excel_solid_60x60.png) <br> Excel | ![Delve icon](images/delve_solid_60x60.png) <br> Delve | ![OneDrive for Business icon](images/onedriveforbusiness_solid_60x60.png) <br> OneDrive | ![OneNote icon](images/onenote_solid_60x60.png) <br> OneNote | ![Outlook icon](images/outlook_solid_60x60.png) <br> Outlook | ![PowerBI icon](images/powerbi_solid_60x60.png) <br> Power BI
| ![PowerPoint icon](images/powerpoint_solid_60x60.png) <br> PowerPoint | ![SharePoint icon](images/sharepoint_solid_60x60.png) <br> SharePoint | ![Skype for Business icon](images/skypeforbusiness_solid_60x60.png) <br> Skype Business | ![Sway icon](images/sway_solid_60x60.png) <br> Sway | ![Visio icon](images/visio_solid_60x60.png) <br> Visio | ![Word icon](images/word_solid_60x60.png) <br> Word

> [!NOTE]
> Any exceptions will be called out here, will NOT be included if no exception exists. 