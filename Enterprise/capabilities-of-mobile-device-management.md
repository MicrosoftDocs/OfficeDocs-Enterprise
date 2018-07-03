---
title: "Capabilities of built-in Mobile Device Management for Office 365"
ms.author: deniseb
author: denisebmsft
manager: laurawi
ms.date: 6/11/2018
ms.audience: Admin
ms.topic: article
f1_keywords:
- 'ms.o365.cc.DevicePolicySupportedDevice'
ms.service: o365-administration
localization_priority: Normal
search.appverid:
- MOE150
- MED150
- MBS150
ms.assetid: a1da44e5-7475-4992-be91-9ccec25905b0
description: "Mobile Device Management for Office 365 can help you secure and manage mobile devices like iPhones, iPads, Androids, and Windows Phones used in your organization. Create mobile device management policies with settings that can help control access to your organization's Office 365 email and documents for supported mobile devices and apps, and let you wipe a device remotely if it's stolen."
---

# Capabilities of built-in Mobile Device Management for Office 365

Mobile Device Management for Office 365 can help you secure and manage mobile devices like iPhones, iPads, Androids, and Windows Phones used by licensed Office 365 users in your organization. You can create mobile device management policies with settings that can help control access to your organization's Office 365 email and documents for supported mobile devices and apps. If a device is lost or stolen, you can remotely wipe the device to remove sensitive organizational information.
    
Need more functionality than is included in MDM for Office 365? See if Microsoft Intune has what you need: [Choose between MDM for Office 365 and Microsoft Intune](choose-between-mdm-and-intune.md).
  
## Supported devices

You can use MDM for Office 365 to secure and manage the following types of devices.
  
- Windows Phone 8.1+
    
- iOS 7.1 or later versions
    
- Android 4 or later versions
    
- Windows 8.1\*
    
- Windows 8.1 RT\*
    
- Windows 10\*\*
    
- Windows 10 Mobile\*\*
    
\* Access control for Windows 8.1 and Windows 8.1 RT devices is limited to Exchange ActiveSync.
  
\*\* Requires the device to be joined to Azure Active Directory and be enrolled in the mobile device management service of your organization.
  
If people in your organization use mobile devices that aren't supported by Mobile Device Management for Office 365, you might want to block Exchange ActiveSync app access to Office 365 email for those devices, to help make your organization's data more secure. Steps for blocking Exchange ActiveSync: See [Manage device access settings](manage-device-access-settings.md).
  
## Access control for Office 365 email and documents

The supported apps for the different types of mobile devices in the following table will prompt users to enroll in MDM for Office 365 where there is a new mobile device management policy that applies to a user's device and the user hasn't previously enrolled the device. If a user's device doesn't comply with a policy, depending on how you set the policy up, a user might be blocked from accessing Office 365 resources in these apps, or they might have access but Office 365 will report a policy violation.
  
||**Windows Phone 8.1+**|**iOS 7.1+**|**Android 4+**|
|:-----|:-----|:-----|:-----|
|**Exchange** <br/> Exchange ActiveSync includes built-in email and third-party apps, like TouchDown, that use Exchange ActiveSync Version 14.1 or later.  <br/> |![Exchange ActiveSync icon](media/b36e36ba-88a5-4b2e-bd1d-7432b751a60c.png)Exchange ActiveSync  <br/> ![Exchange Mail mobile icon](media/5b5312b4-3bfb-4fc7-84ff-d7ab21227c10.png)Exchange Mail  <br/> |![Exchange ActiveSync icon](media/b36e36ba-88a5-4b2e-bd1d-7432b751a60c.png)Exchange ActiveSync  <br/> ![iPhone Mail mobile icon](media/888bdc7a-8354-4013-a0b2-0d4432a9a92e.png)Mail  <br/> |![Exchange ActiveSync icon](media/b36e36ba-88a5-4b2e-bd1d-7432b751a60c.png)Exchange ActiveSync  <br/> ![Android email icon](media/20b48492-4adc-40ce-99cf-1b47bd2b389d.png)Email  <br/> |
|**Office** and **OneDrive for Business** <br/> |No supported apps  <br/> |![iPhone Outlook mobile icon](media/6c63112d-c10c-4040-85cc-feeccc3dd424.png)Outlook  <br/> ![iPhone OneDrive mobile icon](media/560ec187-82d9-4793-b72f-7ba595972bdc.png)OneDrive  <br/> ![iPhone Word mobile icon](media/63a3a749-1f98-402f-b211-e46b9224b655.png)Word  <br/> ![iPhone Excel mobile icon](media/5b8f62c0-96aa-4602-9ed8-f837bbf5fa9e.png)Excel  <br/> ![iPhone PowerPoint mobile icon](media/17c02dca-f60a-4d13-a610-00d576a40943.png)PowerPoint  <br/> |**On phones and tablets:** <br/> ![Android phone and tablet Outlook mobile icon](media/ed2a813d-f481-46e0-acc9-6422f0d16072.png)Outlook  <br/> ![Android phone OneDrive mobile icon](media/64855d02-1684-4795-b4c5-863860f18722.png)OneDrive  <br/> ![Android Word mobile icon](media/f618fe83-b163-4680-b924-fcedc06ab4ba.png)Word  <br/> ![Android Excel mobile icon](media/659c7a5f-5797-4b47-a776-4a0c8f784c89.png)Excel  <br/> ![Android PowerPoint mobile icon](media/35b98bce-d7cb-40ce-87e3-07b9764207b1.png)PowerPoint  <br/> **On phones only:** <br/> ![Office Mobile mobile icon](media/1aa9e978-6eb2-40aa-82da-62fb79cee313.png)Office Mobile  <br/> |
   
> [!NOTE]
>  Support for iOS 7.1 and later versions includes iPhone and iPad devices. >  Management of BlackBerry devices isn't supported by Mobile Device Management for Office 365. Use BlackBerry Business Cloud Services (BBCS) from BlackBerry to manage BlackBerry devices. >  Users won't be prompted to enroll and won't be blocked or reported for policy violation if they use the mobile browser to access Office 365 SharePoint sites, documents in Office Online, or email in Outlook Web App. 
  
The following diagram shows what happens when a user with a new device signs in to an app that supports access control with MDM for Office 365. The user is blocked from accessing Office 365 resources in the app until they enroll their device.
  
![Shows enrollment process for new device.](media/O365_MDM_Capabilities_EnrollmentExample.png)
  
> [!NOTE]
> Policies and access rules created in MDM for Office 365 will override Exchange ActiveSync mobile device mailbox policies and device access rules created in the Exchange admin center. After a device is enrolled in MDM for Office 365, any Exchange ActiveSync mobile device mailbox policy or device access rule applied to the device will be ignored. To learn more about Exchange ActiveSync, see [Exchange ActiveSync in Exchange Online](https://go.microsoft.com/fwlink/p/?LinkId=524380). 
  
## Policy settings for mobile devices
<a name="BKMK_PolicySettings"> </a>

If you create a policy to block access with certain settings turned on, users will be blocked from accessing Office 365 resources when using a supported app that is listed in [Access control for Office 365 email and documents](capabilities-of-mobile-device-management.md#BKMK_AccessControl). The settings that can block users from accessing Office 365 resources are in these sections:
  
- Security
    
- Encryption
    
- Jail broken
    
- Managed email profile
    
For example, the following diagram shows what happens when a user with an enrolled device isn't compliant with a security setting in a mobile device management policy that applies to their device. The user signs in to an app that supports access control with MDM for Office 365. They are blocked from accessing Office 365 resources in the app until their device complies with the security setting.
  
![Shows user is blocked when device isn't compliant.](media/O365_MDM_Capabilities_ComplianceExample.png)
  
The following sections list the policy settings you can use to help secure and manage mobile devices that connect to your organization's Office 365 resources. 
  
### Security settings

|**Setting name**|**Windows Phone 8.1+**|**iOS 7.1+**|**Android 4+**|**Samsung Knox**|
|:-----|:-----|:-----|:-----|:-----|
|Require a password  <br/> |✔  <br/> |✔  <br/> |✔  <br/> |✔  <br/> |
|Prevent simple password  <br/> |✔  <br/> |✔  <br/> |✖  <br/> |✖  <br/> |
|Require an alphanumeric password  <br/> |✔  <br/> |✔  <br/> |✖  <br/> |✖  <br/> |
|Minimum password length  <br/> |✔  <br/> |✔  <br/> |✔  <br/> |✔  <br/> |
|Number of sign-in failures before device is wiped  <br/> |✔  <br/> |✔  <br/> |✔  <br/> |✔  <br/> |
|Minutes of inactivity before device is locked  <br/> |✔  <br/> |✔  <br/> |✔  <br/> |✔  <br/> |
|Password expiration (days)  <br/> |✔  <br/> |✔  <br/> |✔  <br/> |✔  <br/> |
|Remember password history and prevent reuse  <br/> |✔  <br/> |✔  <br/> |✔  <br/> |✔  <br/> |
   
### Encryption settings

|**Setting name**|**Windows Phone 8.1+**|**iOS 7.1+**|**Android 4+**|**Samsung Knox**|
|:-----|:-----|:-----|:-----|:-----|
|Require data encryption on devices  <br/> |Windows Phone 8.1 is already encrypted and cannot be unencrypted  <br/> |✖  <br/> |✔  <br/> |✔\*  <br/> |
   
\* With Samsung Knox, you can also require encryption on storage cards.
  
### Jail broken setting

|**Setting name**|**Windows Phone 8.1+**|**iOS 7.1+**|**Android 4+**|**Samsung Knox**|
|:-----|:-----|:-----|:-----|:-----|
|Device cannot be jail broken or rooted  <br/> |✖  <br/> |✔  <br/> |✔  <br/> |✔  <br/> |
   
### Managed email profile option

The following option can block users from accessing their Office 365 email if they're using a manually created email profile. Users on iOS devices must delete their manually created email profile before they can access their email. After they delete the profile, a new profile will be automatically created on the device.
  
|**Setting name**|**Windows Phone 8.1+**|**iOS 7.1+**|**Android 4+**|**Samsung Knox**|
|:-----|:-----|:-----|:-----|:-----|
|Email profile is managed  <br/> |✖  <br/> |✔  <br/> |✖  <br/> |✖  <br/> |
   
### Cloud settings

|**Setting name**|**Windows Phone 8.1+**|**iOS 7.1+**|**Android 4+**|**Samsung Knox**|
|:-----|:-----|:-----|:-----|:-----|
|Require encrypted backup  <br/> |✖  <br/> |✔  <br/> |✖  <br/> |✖  <br/> |
|Block cloud backup  <br/> |✖  <br/> |✔  <br/> |✖  <br/> |✖  <br/> |
|Block document synchronization  <br/> |✖  <br/> |✔  <br/> |✖  <br/> |✖  <br/> |
|Block photo synchronization  <br/> |✖  <br/> |✔  <br/> |✖  <br/> |✖  <br/> |
|Allow Google backup  <br/> |N/A  <br/> |N/A  <br/> |✖  <br/> |✔  <br/> |
|Allow Google account auto sync  <br/> |N/A  <br/> |N/A  <br/> |✖  <br/> |✔  <br/> |
   
### System settings

|**Setting name**|**Windows Phone 8.1+**|**iOS 7.1+**|**Android 4+**|**Samsung Knox**|
|:-----|:-----|:-----|:-----|:-----|
|Block screen capture  <br/> |✔  <br/> |✔  <br/> |✖  <br/> |✔  <br/> |
|Block sending diagnostic data from device  <br/> |✔  <br/> |✔  <br/> |✖  <br/> |✔  <br/> |
   
### Application settings

|**Setting name**|**Windows Phone 8.1+**|**iOS 7.1+**|**Android 4+**|**Samsung Knox**|
|:-----|:-----|:-----|:-----|:-----|
|Block video conferences on device  <br/> |✖  <br/> |✔  <br/> |✖  <br/> |✖  <br/> |
|Block access to application store  <br/> |✔  <br/> |✔  <br/> |✖  <br/> |✔  <br/> |
|Require password when accessing application store  <br/> |✖  <br/> |✔  <br/> |✖  <br/> |✖  <br/> |
   
### Device capabilities settings

|**Setting name**|**Windows Phone 8.1+**|**iOS 7.1+**|**Android 4+**|**Samsung Knox**|
|:-----|:-----|:-----|:-----|:-----|
|Block connection with removable storage  <br/> |✔  <br/> |✖  <br/> |✖  <br/> |✔  <br/> |
|Block Bluetooth connection  <br/> |✔  <br/> |✖  <br/> |✖  <br/> |✔  <br/> |
   
### Additional settings

You can set the following additional policy settings by using PowerShell cmdlets. For more information, see [Office 365 Security &amp; Compliance Center cmdlets](https://go.microsoft.com/fwlink/p/?LinkId=827804).
  
|**Setting name**|**Windows Phone 8.1+**|**iOS 7.1+**|**Android 4+ (including Samsung Knox)**|
|:-----|:-----|:-----|:-----|
|CameraEnabled  <br/> |✔  <br/> |✔  <br/> |✔  <br/> |
|RegionRatings  <br/> |✖  <br/> |✔  <br/> |✖  <br/> |
|MoviesRatings  <br/> |✖  <br/> |✔  <br/> |✖  <br/> |
|TVShowsRating  <br/> |✖  <br/> |✔  <br/> |✖  <br/> |
|AppsRatings  <br/> |✖  <br/> |✔  <br/> |✖  <br/> |
|AllowVoiceDialing  <br/> |✖  <br/> |✔  <br/> |✖  <br/> |
|AllowVoiceAssistant  <br/> |✖  <br/> |✔  <br/> |✖  <br/> |
|AllowAssistantWhileLocked  <br/> |✖  <br/> |✔  <br/> |✖  <br/> |
|AllowPassbookWhileLocked  <br/> |✖  <br/> |✔  <br/> |✖  <br/> |
|MaxPasswordGracePeriod  <br/> |✖  <br/> |✔  <br/> |✖  <br/> |
|PasswordQuality  <br/> |✖  <br/> |✖  <br/> |✔  <br/> |
|SystemSecurityTLS  <br/> |✖  <br/> |✔  <br/> |✖  <br/> |
|WLANEnabled  <br/> |✔  <br/> |✖  <br/> |✖  <br/> |
   
### Settings supported by Windows

You can manage Windows 8.1 and Windows 10 devices by enrolling them as mobile devices. After an applicable policy is deployed, users with Windows 8.1 RT and Windows 10 RT devices will be required to enroll in MDM for Office 365 the first time they use the built-in email app to access their Office 365 email. 
  
The following settings are supported for Windows 8.1 and Windows 10 devices that are enrolled as mobile devices. These setting won't block users from accessing Office 365 resources.
  
 **Security settings**
  
- Require an alphanumeric password
    
- Minimum password length
    
- Number of sign-in failures before device is wiped
    
- Minutes of inactivity before device is locked
    
- Password expiration (days)
    
- Remember password history and prevent reuse
    
 **System settings**
  
Block sending diagnostic data from device
  
 **Additional settings**
  
You can set the following additional policy settings by using PowerShell cmdlets:
  
- AllowConvenienceLogon
    
- UserAccountControlStatus
    
- FirewallStatus
    
- AutoUpdateStatus
    
- AntiVirusStatus
    
- AntiVirusSignatureStatus
    
- SmartScreenEnabled
    
- WorkFoldersSyncUrl
    
## Remotely wipe a mobile device

 If a device is lost or stolen, you can remove sensitive organizational data and help prevent access to your organization's Office 365 resources by doing a wipe from **Security &amp; Complieance center\>Data loss prevention\>Device management**. You can do a selective wipe to remove only organizational data or a full wipe to delete all information from a device and restore it to its factory settings.
  
For more information, see [Wipe a mobile device in Office 365](https://go.microsoft.com/fwlink/p/?LinkId=518157).
  
## See also

[Overview of Mobile Device Management for Office 365](overview-of-mdm.md)
  
[Create and deploy device security policies](create-device-security-policies.md)

