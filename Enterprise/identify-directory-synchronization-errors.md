---
title: "Identify directory synchronization errors in Office 365"
ms.author: robmazz
author: robmazz
manager: laurawi
ms.date: 6/26/2018
ms.audience: Admin
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.custom: Adm_O365
search.appverid:
- MOE150
- MED150
- MBS150
- GPA150
ms.assetid: b4fc07a5-97ea-4ca6-9692-108acab74067
description: "Learn how to view directory synchronization errors in Office 365 admin center."
---

# Identify directory synchronization errors in Office 365

You can view directory synchronization errors in the Office 365 admin center. Only the User object errors are displayed. To view errors by using PowerShell, see [Identify objects with DirSyncProvisioningErrors](https://go.microsoft.com/fwlink/p/?LinkId=798300).
  
## View directory synchronization errors in the admin center

To view any errors in the admin center:
  
1. [Sign in to Office 365](where-to-sign-in.md) with your work or school account. 
    
2. Go to the [About the Office 365 admin center](https://support.office.com/article/758befc4-0888-4009-9f14-0d147402fd23).
    
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
    
## View directory synchronization errors in the old admin center

To view any errors in the old admin center:
  
1. [Sign in to Office 365](where-to-sign-in.md) with your work or school account. 
    
2. Go to the [About the Office 365 admin center](https://support.office.com/article/758befc4-0888-4009-9f14-0d147402fd23#SwitchBack).
    
3. Go to **Users** \> **Active Users**
    
4. A warning on the top of the page is displayed if there are errors.
    
    ![Directory sync error declaration on top of the Active Users page](media/af8b17ec-e2a5-4f91-a554-5bb49d77b74c.png)
  
5. In the **Select a view** drop-down, choose **Users with errors** to list each user that has a directory synchronization error. 
    
    ![Users with errors on the Active users page](media/048624cb-728f-4b6a-af6b-d11331a68db6.png)
  
6. To see more details, select a user and you can see a detailed description of the directory synchronization error on the bottom of the user details pane.
    
    ![Details of a user's directory synchronization error](media/a01fa4b7-a6ec-4d01-81f7-fe007795ae00.png)
  
## See also

[Fixing problems with directory synchronization for Office 365](fix-problems-with-directory-synchronization.md)
  
[Set up directory synchronization for Office 365](set-up-directory-synchronization.md)
  
[Turn off directory synchronization for Office 365](turn-off-directory-synchronization.md)

