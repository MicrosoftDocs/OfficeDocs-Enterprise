---
title: "View directory synchronization errors in Office 365"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
audience: Admin
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
- MBS150
- GPA150
ms.assetid: b4fc07a5-97ea-4ca6-9692-108acab74067
description: "Learn how to view directory synchronization errors in Microsoft 365 admin center."
---

# View directory synchronization errors in Office 365

You can view directory synchronization errors in the [Microsoft 365 admin center](https://admin.microsoft.com). Only the User object errors are displayed. To view errors by using PowerShell, see [Identify objects with DirSyncProvisioningErrors](https://docs.microsoft.com/azure/active-directory/hybrid/how-to-connect-syncservice-duplicate-attribute-resiliency).

After viewing, see [fixing problems with directory synchronization for Office 365](fix-problems-with-directory-synchronization.md) to correct any identified issues.
  
## View directory synchronization errors in the admin center

To view any errors in the admin center:
  
1. Sign in to Office 365 with your work or school account. 
    
2. Go to the [About the admin center](https://support.office.com/article/758befc4-0888-4009-9f14-0d147402fd23).
    
3. On the **Home** page you will see the **DirSync Status** tile. 
    
    ![The DirSync Status tile in admin center preview](media/060006e9-de61-49d5-8979-e77cda198e71.png)
  
4. On the tile, choose **DirSync Status** to go to the **Directory Sync Status** page. 
    
    On the bottom of the page you can see if there are DirSync errors.
    
    ![On the Directory Sync Status page you can see if there are DirSync object errors](media/882094a3-80d3-4aae-b90b-78b27047974c.png)
  
    Choose **We found DirSync object errors** to go to a detailed view of the directory synchronization errors. 
    
    > [!NOTE]
    > You can also go to the **DirSync errors** page if you choose **We found DirSync object errors** on the **DirSync status** tile. 
  
![DirSync errors page](media/a6e302d4-6be7-4e3a-b4b5-81c5a2c02952.png)
  
5. On the **DirSync errors** page, choose any of the errors listed to display the details pane with information about the error and tips on how to fix it. 
