---
title: "Office 365 Client Capabilities - Mobile Application Management"
ms.author: robmazz
author: robmazz
manager: laurawi
ms.date: 5/17/2018
audience: ITPro
ms.topic: article
ms.service: Office 365 Administration
localization_priority: None
ms.collection: Strat_O365_Enterprise
description: "Summary: Understand Office 365 mobile application management"
---

# Office 365 Client Capabilities - Mobile Application Management

Many users access both corporate and personal documents and emails from the same device. When a user is accessing corporate data, your organization needs to be confident that corporate policies will be applied and help protect the corporate data on this device. However, when a user is accessing personal content, that data should be outside of the organization's control. Mobile application managment provides processes and policies for keeping corporate information protected within applications used by your users. For Microsoft Windows platforms, you can enable this control by deploying Windows Information Protection. For iOS, macOS, and Android platforms, you can enable this control by deploying mobile application management in Intune.

- **Mobile Application Management (MAM)** - leveraging the suite of Intune management features, mobile application management lets you publish, push, configure, secure, monitor, and update mobile apps for your users. MAM can protect an organization's data within an application for all devices, whether enrolled in Intune or not. Learn more about [mobile application management](https://docs.microsoft.com/intune/mam-faq).
- **Multi-Identity Mobile Application Management** - helps solve the data protection problem that organizations are facing with devices and apps that support both personal and work accounts while maintaining the end user’s experience and the privacy of his/her personal data. When a user installs and signs into an app that supports multi-identity on an Intune-managed device, Intune will check if the new account matches the enrolled, managed account on the device. If the account is managed, and there is also a MAM policy for the app and the user, then the MAM policy settings protect data in that account. When the user adds personal accounts to the app as well, those accounts will exist outside of Intune management and protection. This enables personal use of the application without compromising corporate protection. Learn more about [multi-identity MAM](https://docs.microsoft.com/intune/app-protection-policy).
- **Windows Information Protection (WIP)** - previously known as enterprise data protection (EDP), WIP helps to protect Windows clients against potential data leakage without otherwise interfering with the employee experience. WIP also helps to protect enterprise apps and data against accidental data leak on enterprise-owned devices and personal devices that employees bring to work without requiring changes to your environment or other apps. Learn more about [Windows Information Protection](https://docs.microsoft.com/windows/security/information-protection/windows-information-protection/protect-enterprise-data-using-wip).

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