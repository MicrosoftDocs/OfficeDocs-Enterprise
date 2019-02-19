---
title: "Turn off directory synchronization for Office 365"
ms.author: robmazz
author: robmazz
manager: laurawi
ms.date: 8/21/2018
ms.audience: Admin
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.custom: Adm_O365
ms.collection:
- Ent_O365
- M365-identity-device-management
search.appverid:
- MET150
- MOE150
- MED150
ms.assetid: ee5f861e-bd48-4267-83d1-a4ead4b4a00d
description: "Learn how to use PowerShell to turn off directory synchronization for Office 365"
---

# Turn off directory synchronization for Office 365
You can use PowerShell to turn off directory synchronization. However, it is not recommended that you turn off directory synchronization as a troubleshooting step. If you need assistance with troubleshooting directory synchronization, see the [Fixing problems with directory synchronization for Office 365](fix-problems-with-directory-synchronization.md) article. 
  
[Contact support](https://support.office.com/article/32a17ca7-6fa0-4870-8a8d-e25ba4ccfd4b) for business products if needed.
  
## Turn off directory synchronization  
To turn off Directory synchronization:
  
1. First, install the required software and connect to your Office 365 subscription. For instructions for both, see [connect to Office 365 PowerShell](https://go.microsoft.com/fwlink/p/?LinkId=821938).
    
2. Use [Set-MsolDirSyncEnabled](https://go.microsoft.com/fwlink/p/?LinkId=821939) to disable directory synchronization: 
    
  ```
  Set-MsolDirSyncEnabled -EnableDirSync $false
  ```