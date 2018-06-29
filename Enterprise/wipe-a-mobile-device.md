---
title: "Wipe a mobile device in Office 365"
ms.author: dianef
author: dianef77
manager: scotv
ms.date: 6/11/2018
ms.audience: Admin
ms.topic: get-started-article
f1_keywords:
- 'O365M_WipeDevice'
- 'O365E_WipeDevice'
ms.service: o365-administration
localization_priority: Normal
search.appverid:
- MOE150
- MED150
- MBS150
ms.assetid: 9d727c7d-8b47-4499-bf24-d046b449214c
description: "You can use built-in mobile device management for Office 365 to do a selective wipe to remove only organizational information, or a full wipe to delete all information from a mobile device and restore it to its factory settings."
---

# Wipe a mobile device in Office 365

 *Last updated 20 October, 2017* 
  
You can use built-in mobile device management for Office 365 to do a selective wipe to remove only organizational information, or a full wipe to delete all information from a mobile device and restore it to its factory settings.
  
## What to know before you begin
<a name="BKMK_Before"> </a>

- Mobile devices can store sensitive organizational information and provide access to your organization's Office 365 resources. To help protect your organization's information, you can do a full wipe or a selective wipe:
    
  - **Full wipe**: Deletes all data on a user's mobile device, including installed applications, photos, and personal information. When the wipe is complete, the device is restored to its factory settings. 
    
  - **Selective wipe**: Removes only organization data and leaves installed applications, photos, and personal information on a user's mobile device. 
    
- When a device is wiped (full wipe or selective wipe), the device is removed from the list of managed devices.
    
- You can set up a mobile device management policy that automatically wipes (full wipe) a device after the user unsuccessfully tries to enter the device's password a specific number of times. Follow the steps in [Create and deploy device security policies](create-device-security-policies.md).
    
- If you want to know what a user will experience when you wipe their device, see [What's the user and device impact?](wipe-a-mobile-device.md#BKMK_Impact).
    
## Wipe a mobile device
<a name="BKMK_Wipe"> </a>

1. 
::: moniker range="o365-worldwide"

Go to the [![Click here to go to the Office 365 admin center.](media/e00ba917-c3fb-4173-b344-43eb5c7eeb15.png)](https://portal.office.com/adminportal/home).

::: moniker-end

::: moniker range="o365-germany"

Go to the [Office 365 admin center](https://portal.office.de/adminportal/home).

::: moniker-end

::: moniker range="o365-21vianet"

Go to the [Office 365 admin center](https://login.partner.microsoftonline.cn).

::: moniker-end

2. Go to [Go to the Office 365 Security &amp; Compliance Center](https://support.office.com/article/7e696a40-b86b-4a20-afcc-559218b7b1b8)\> **Data loss prevention** \> **Device management**.
    
3. Select the device you want to wipe.
    
4. Select the type of remote wipe you want to do.
    
  - To do a selective wipe and delete only Office 365 organization information, in the right pane, select **Selective wipe**.
    
  - To do a full wipe and restore the device to its factory settings, in the right pane, select **Full wipe**.
    
![Select a device, and then choose the wipe type to do.](media/ac940abe-0c4a-404e-a842-a1ad2af13ce3.png)
  
5. Select **Yes** to confirm. 
    
Until the wipe finishes, the **Device status** will show as **RetirePending** or **RetireIssued**.
  
### How do I know it worked?

You'll no longer see the mobile device in the list of managed devices.
  
## Why would you want to wipe a device?
<a name="BKMK_Why"> </a>

There are several reasons for wiping devices:
  
- Mobile devices like smartphones and tablets are becoming more full-featured all the time. This means it's easier for your users to store sensitive corporate information (such as personal identification or confidential communications) and access it on the go. If one of these mobile devices is lost or stolen, wiping the device immediately can help prevent your organization's information from ending up in the wrong hands.
    
- When a user leaves the organization with a personal device that is enrolled in MDM for Office 365, you can help prevent organizational information from going with that user by doing a selective wipe.
    
- If your organization provides mobile devices to users, you might need to reassign devices from time to time. Doing a full wipe on a device before assigning it to a new user helps ensures that any sensitive information from the previous owner is deleted.
    
## What's the user and device impact?
<a name="BKMK_Impact"> </a>

The wipe is sent immediately to the mobile device. The device is also marked as not compliant in AAD.
  
The following table describes what content is removed for each device type when a device is selectively wiped.
  
|**Content impact**|**Windows Phone 8.1**|**iOS 7.1+**|**Android 4+**|
|:-----|:-----|:-----|:-----|
|Company Portal app\* is uninstalled.  <br/> |N/A  <br/> |✔  <br/> |N/A  <br/> |
|Office 365 app data hosted by apps where access control is supported by MDM for Office 365 is removed (currently Outlook and OneDrive for Business). The apps are not removed.  <br/> Outlook for Android does not remove cached emails.  <br/> |✔  <br/> |✔  <br/> |✔  <br/> |
|Policy settings that were applied by MDM for Office 365 to devices are no longer enforced on the device and users can change the settings.  <br/> |✔  <br/> |✔  <br/> |✔  <br/> |
|Email profiles created by MDM for Office 365 are removed and cached email on the device is deleted.  <br/> |N/A  <br/> |✔  <br/> |N/A  <br/> |
   
> [!NOTE]
> \* Company Portal app is available at the App Store for iOS and the Play Store for Android devices. 
  
## Related content
<a name="BKMK_Impact"> </a>

[Manage mobile devices in Office 365](set-up-mobile-device-management.md)
  

