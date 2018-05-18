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

Many users access both corporate and personal documents and emails from the same device. When a user is accessing corporate data, the IT pro needs to be confident that corporate policies will be applied and help protect the corporate data on this device. However, when a user is accessing personal content, that data should be outside of IT’s control. For Windows platforms, IT pros can get this control by deploying Windows Information Protection. For iOS, macOS, and Android platforms, IT pros can get this control by deploying Intune MAM.

- **Mobile Application Management (MAM)** - leveraging the suite of Intune management features, mobile application management lets you publish, push, configure, secure, monitor, and update mobile apps for your users. MAM can protect an organization's data within an application for all devices, whether enrolled in Intune or not. Learn more about [mobile application management](https://docs.microsoft.com/intune/mam-faq).
- **Multi-Identity Mobile Application Management** - helps solve the data protection problem that organizations are facing with devices and apps that support both personal and work accounts while maintaining the end user’s experience and the privacy of his/her personal data. When a user installs and signs into an app that supports multi-identity on an Intune-managed device, Intune will check if the new account matches the enrolled, managed account on the device. If the account is managed, and there is also a MAM policy for the app and the user, then the MAM policy settings protect data in that account. When the user adds personal accounts to the app as well, those accounts will exist outside of Intune management and protection. This enables personal use of the application without compromising corporate protection. Learn more about [multi-identity MAM](https://docs.microsoft.com/intune/app-protection-policy).
- **Windows Information Protection (WIP)** - previously known as enterprise data protection (EDP), WIP helps to protect Windows clients against potential data leakage without otherwise interfering with the employee experience. WIP also helps to protect enterprise apps and data against accidental data leak on enterprise-owned devices and personal devices that employees bring to work without requiring changes to your environment or other apps. Learn more about [Windows Information Protection](https://docs.microsoft.com/windows/security/information-protection/windows-information-protection/protect-enterprise-data-using-wip).

## Supported platforms

| | | | | | |
|:---:|:---:|:---:|:---:|:---:|:---:|
| ![Windows icon](images/windows_62x62.png) <br> Windows 10 Desktop | ![Windows icon](images/windows_62x62.png) <br> Windows 10 Modern Apps | | ![Windows icon](images/windows_62x62.png) <br> Web Browser | ![Android icon](images/android_62x62.png) <br> Android | ![iOS icon](images/ios_62x62.png) <br> iOS | ![Windows icon](images/windows_62x62.png) <br> macOS |


## Supported clients

| | | | | |
|:---:|:---:|:---:|:---:|:---:|
| [![Excel icon](images/o365-excel-30x30.png)](https://products.office.com/excel) <br> [Excel](https://products.office.com/excel)| ![OneNote icon](images/o365-onenote-30x30.png) <br> [OneNote](https://support.office.com/onenote) |[![OneDrive for Business icon](images/o365-onedrive-30x30.png)](https://onedrive.live.com/about/business/) <br> [OneDrive](https://onedrive.live.com/about/business/) |[![PowerPoint icon](images/o365-powerpoint-30x30.png)](https://products.office.com/powerpoint) <br> [PowerPoint](https://products.office.com/powerpoint) |[![SharePoint icon](images/o365-sharepoint-30x30.png)](https://docs.microsoft.com/sharepoint/) <br> [SharePoint](https://docs.microsoft.com/sharepoint/) | [![Visio icon](images/o365-visio-30x30.png)](https://products.office.com/visio/flowchart-software) <br> [Visio](https://products.office.com/visio/flowchart-software)
|[![Visio icon](images/o365-visio-30x30.png)](https://products.office.com/visio/flowchart-software) <br> [Visio](https://products.office.com/visio/flowchart-software)|[![Yammer icon](images/o365-yammer-30x30.png)](https://products.office.com/yammer/yammer-overview) <br> [Yammer]((https://products.office.com/yammer/yammer-overview))