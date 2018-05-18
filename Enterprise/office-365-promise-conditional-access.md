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

Microsoft’s Modern Authentication capability enables several scenarios for your enterprise customers to authenticate with Office 365 support rich applications and a variety of administrative tools, including:

- **Device-based conditional access** - Microsoft Azure Active Directory (Azure AD) enables single sign-on to devices, apps, and services from anywhere. For certain resources in your environment, granting access to the right users might not be good enough. In addition to the right users, you also might require that access attempts can only be performed using a managed device. Learn more about [device-based conditional access](https://docs.microsoft.com/azure/active-directory/active-directory-conditional-access-policy-connected-applications).
- **Loacation and MFA-based conditional access** - With conditional access based on application sensitivity, you can set multi-factor authentication (MFA) access rules per application. MFA per application provides the ability to block access for users who are not on a trusted network. You can apply MFA rules to all users that are assigned to the application, or only for users within specified security groups. The location is identified by the IP address of the client you have used to connect to Azure Active Directory. When you configure a location conditions, Trusted IPs enables you to distinguish between connections made from your organization's network and all other locations. You can either include all locations or all trused IPs and you can exclude all trusted IPs. Learn more about [location-based](https://docs.microsoft.com/azure/active-directory/active-directory-conditional-access-locations) and [MFA-based](https://docs.microsoft.com/azure/active-directory/active-directory-conditional-access-azure-portal) conditional access.

## Supported platforms

| | | | | | |
|:---:|:---:|:---:|:---:|:---:|:---:|
| ![Windows icon](images/windows_62x62.png) <br> Windows 10 <br> Desktop | ![Windows icon](images/windows_62x62.png) <br> Windows 10 <br> Modern Apps | ![Windows icon](images/windows_62x62.png) <br> Web Browser | ![Android icon](images/android_62x62.png) <br> Android | ![iOS icon](images/ios_62x62.png) <br> iOS | ![Windows icon](images/windows_62x62.png) <br> macOS


## Supported clients

| | | | | |
|:---:|:---:|:---:|:---:|:---:|
| [![Excel icon](images/o365-excel-30x30.png)](https://products.office.com/excel) <br> [Excel](https://products.office.com/excel)| ![OneNote icon](images/o365-onenote-30x30.png) <br> [OneNote](https://support.office.com/onenote) |[![OneDrive for Business icon](images/o365-onedrive-30x30.png)](https://onedrive.live.com/about/business/) <br> [OneDrive](https://onedrive.live.com/about/business/) |[![PowerPoint icon](images/o365-powerpoint-30x30.png)](https://products.office.com/powerpoint) <br> [PowerPoint](https://products.office.com/powerpoint) |[![SharePoint icon](images/o365-sharepoint-30x30.png)](https://docs.microsoft.com/sharepoint/) <br> [SharePoint](https://docs.microsoft.com/sharepoint/) | [![Visio icon](images/o365-visio-30x30.png)](https://products.office.com/visio/flowchart-software) <br> [Visio](https://products.office.com/visio/flowchart-software)
|[![Visio icon](images/o365-visio-30x30.png)](https://products.office.com/visio/flowchart-software) <br> [Visio](https://products.office.com/visio/flowchart-software)|[![Yammer icon](images/o365-yammer-30x30.png)](https://products.office.com/yammer/yammer-overview) <br> [Yammer]((https://products.office.com/yammer/yammer-overview))

> [!NOTE]
> Any exceptions will be called here. 