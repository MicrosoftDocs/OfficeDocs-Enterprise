---
title: "Office 365 single sign-on with third-party browsers"
ms.author: robmazz
author: robmazz
manager: laurawi
ms.date: 12/29/2016
ms.audience: Admin
ms.topic: troubleshooting
ms.prod: office-online-server
localization_priority: Normal
ms.custom: Adm_O365
search.appverid:
- MOE150
- MED150
- BCS160
ms.assetid: 4a6085c7-7227-4ea7-b202-a5aa65af00e4
description: "If your computers have Extended Protection for Authentication, and you use the Firefox, Google Chrome, or Safari browsers, you may not be able to sign on to Office 365, depending upon your operating system. Instead, you will get an access denied message. This is due to the default configuration for Active Directory Federation Services (AD FS) 2.0 and Extended Protection for Authentication."
---

# Office 365 single sign-on with third-party browsers

If your computers have Extended Protection for Authentication, and you use the Firefox, Google Chrome, or Safari browsers, you may not be able to sign on to Office 365, depending upon your operating system. Instead, you will get an access denied message. This is due to the default configuration for Active Directory Federation Services (AD FS) 2.0 and Extended Protection for Authentication.
  
Unless and until Firefox, Google Chrome, and Safari support Extended Protection for Authentication, the recommended option is to install and use Internet Explorer 10 or later.
  
If you want to use single sign-on for Office 365 with Firefox, Google Chrome, or Safari, there are two other solutions:
  
1. Uninstall the Extended Protection patches from your computer.
    
2. Change the Extended Protection setting on the Active Directory Federation Services 2.0 server. See "ExtendedProtectionTokenCheck" on the TechNet [Set-ADFSProperties page](https://go.microsoft.com/fwlink/p/?LinkID=243519) for details. 
    
> [!NOTE]
>  There may be security concerns in taking either of the approaches described above. For more details, see the Microsoft Support article [Microsoft Security Advisory: Extended protection for authentication](https://go.microsoft.com/fwlink/p/?LinkID=243518). 
  

