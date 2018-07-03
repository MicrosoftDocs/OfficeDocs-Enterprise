---
title: "Overview of Mobile Device Management (MDM) for Office 365"
ms.author: deniseb
author: denisebmsft
manager: laurawi
ms.date: 6/29/2018
ms.audience: Admin
ms.topic: overview
f1_keywords:
- 'O365M_MDMConfigDomains'
- 'O365E_MDMConfigDomains'
- 'ms.o365.cc.DevicePolicy'
ms.service: o365-administration
localization_priority: Normal
ms.assetid: faa7d8e5-645d-4d59-839c-c8d4c1869e4a
description: "You can manage and secure mobile devices when they're connected to your Office 365 organization by using Mobile Device Management for Office 365. Mobile devices like smartphones and tablets that are used to access work email, calendar, contacts, and documents play a big part in making sure that employees get their work done anytime, from anywhere. So it's critical that you help protect your organization's information when people use devices. You can use MDM for Office 365 to set device security policies and access rules, and to wipe mobile devices if they're lost or stolen."
---

# Overview of Mobile Device Management (MDM) for Office 365

You can manage and secure mobile devices when they're connected to your Office 365 organization by using Mobile Device Management for Office 365. Mobile devices like smartphones and tablets that are used to access work email, calendar, contacts, and documents play a big part in making sure that employees get their work done anytime, from anywhere. So it's critical that you help protect your organization's information when people use devices. You can use MDM for Office 365 to set device security policies and access rules, and to wipe mobile devices if they're lost or stolen.
  
![MDM on Android phone](media/69b9a9f6-13ac-4e36-99ca-95e82e0375aa.png)
  
## What types of devices can you manage?

You can use MDM for Office 365 to manage many types of mobile devices like Windows Phone, Android, iPhone, and iPad. To manage mobile devices used by people in your organization, each person must have an applicable Office 365 license and their device must be enrolled in MDM for Office 365. 
  
To see what MDM for Office 365 supports for each type of device, see [Capabilities of Mobile Device Management for Office 365](capabilities-of-mobile-device-management.md).
  
## Setup steps for MDM

An Office 365 global admin must complete the following steps to activate and set up MDM for Office 365. Follow the guidance in the topic on [setting up MDM for Office 365](set-up-mobile-device-management.md) to see detailed steps. Here's a quick summary: 
  
> Step 1: Activate MDM for Office 365 by following steps in the [Set up Mobile Device Management (MDM) in Office 365](set-up-mobile-device-management.md).
    
> Step 2: Set up MDM for Office 365 by, for example, creating an APNs certificate to manage iOS devices and adding a Domain Name System (DNS) record for your domain to support Windows phones.
    
> Step 3: Create device policies and apply them to groups of users. When you do this, your users will get an [enrollment message on their device](enroll-your-mobile-device.md). And when they've completed enrollment, their devices will be restricted by the policies you've set up for them.
    
    ![Creating an MDN device policy under Device security policies](media/fbcdbecd-0016-42f1-81a9-9fbad610da90.png)
  
## Device management tasks

After you've got MDM for Office 365 set up and your users have enrolled their devices, you can manage the devices, block access, or wipe a device, if needed. Learn more about [some common device management tasks](manage-devices-in-mdm.md), including where to complete the tasks.
  
## Other ways to manage devices and apps

If you need more functionality than MDM for Office 365 includes, check out this [comparison of MDM and Microsoft Intune features](choose-between-mdm-and-intune.md) to see if an Intune subscription would meet your organization's needs. 
  
If you just need mobile app management (MAM), perhaps for people updating work projects on their own devices, Intune provides another option besides enrolling and managing devices. An Intune subscription allows you to set up MAM policies by using the Azure portal, even if people's devices aren't enrolled in Intune. See [Protect app data using MAM policies](https://go.microsoft.com/fwlink/?LinkId=825439). 
  
## See also

[Get details about devices managed by MDM](get-details-about-mdm-managed-devices.md)

[Set up MDM for Office 365](set-up-mobile-device-management.md)
  
[Enroll mobile devices in MDM](enroll-your-mobile-device.md)
  
[Manage devices enrolled in MDM](manage-devices-in-mdm.md)

