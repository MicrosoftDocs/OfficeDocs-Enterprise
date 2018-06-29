---
title: "Troubleshoot device enrollment with MDM for Office 365"
ms.author: deniseb
author: denisebmsft
manager: laurawi
ms.date: 11/17/2015
ms.audience: Admin
ms.topic: get-started-article
ms.service: o365-administration
localization_priority: Normal
search.appverid:
- MOE150
- MED150
- MBS150
ms.assetid: c863b2bf-45f3-483a-ba05-29fc7f4d6434
description: "If you're running into issues when you try to enroll a device in Mobile Device Management (MDM) for Office 365, try the steps listed here to track down the problem. If the general steps don't fix the issue, see one of the later sections with specific steps for your device type."
---

# Troubleshoot device enrollment with MDM for Office 365

If you're running into issues when you try to enroll a device in Mobile Device Management (MDM) for Office 365, try the steps listed here to track down the problem. If the general steps don't fix the issue, see one of the later sections with specific steps for your device type.
  
## Steps to try first

To start, check the following:
  
- Make sure that the device is not already enrolled with another mobile device management provider, such as Intune.
    
- Make sure that the device is set to the correct date and time.
    
- Switch to a different Wi-Fi or cellular network on the device.
    
- For Android or iOS devices, uninstall and reinstall the Intune Company Portal app on the device.
    
## iOS phone or tablet

- Make sure that you've [set up an APNs certificate](create-an-apns-certificate-for-ios.md).
    
- In **Settings** \> **General** \> **Profile** (or **Device Management**), make sure that a **Management Profile** is not already installed. If it is, remove it. 
    
- If you see the error message, "Device failed to enroll," sign in to Office 365 and make sure that a license that includes Exchange Online has been assigned to the user who is signed in to the device.
    
- If you see the error message, "Profile failed to install," try one of the following:
    
  - Make sure that Safari is the default browser on the device, and that cookies are not disabled.
    
  - Reboot the device, then navigate to portal.manage.microsoft.com, sign in with your Office 365 user ID and password, and attempt to install the profile manually.
    
## Windows RT tablet

- Make sure that your domain is [set up in Office 365 to work with MDM](set-up-mobile-device-management.md).
    
- Make sure that the user is choosing **Turn On** rather than choosing **Join**.
    
## Windows Phone

- Make sure that your domain is [set up in Office 365 to work with MDM](set-up-mobile-device-management.md).
    
- Make sure the device is running Windows 8.1 or later.
    
## Android phone or tablet

- Make sure the device is running Android 4.0 or later.
    
- If you see the error message, "We couldn't enroll this device," sign in to Office 365 and make sure that a license that includes Exchange Online has been assigned to the user who is signed in to the device.
    
- Check the **Notification Area** on the device to see if any required end-user actions are pending, and if they are, complete the actions. 
    

