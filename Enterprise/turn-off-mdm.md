---
title: "How to turn off Mobile Device Management in Office 365"
ms.author: deniseb
author: denisebmsft
manager: laurawi
ms.date: 6/12/2018
ms.audience: Admin
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
search.appverid:
- MOE150
- MED150
- GPA150
ms.assetid: 2709cafb-0a8b-44bc-8494-7e2fccfa2b19
description: "Follow these steps to stop MDM policies from being enforced for mobile devices in your Office 365 organization."
---

# How to turn off Mobile Device Management in Office 365

To effectively turn off MDM for Office 365, you remove groups of people (defined by security groups) from the device management policies, or remove the policies themselves. 
  
- Remove groups of users by removing user security groups from the device policies you've created. 
    
- Disable MDM for everyone by removing all MDM device policies. 
    
These options will remove MDM enforcement for devices in your organization. Unfortunately, you can't simply "unprovision" MDM for Office 365 after you've set it up.
  
> [!IMPORTANT]
> Be aware of the impact on users' devices when you remove user security groups from policies or remove the policies themselves. For example, email profiles and cached emails may be removed, depending on the device. See: [What happens when you delete a policy or remove a user from the policy?](create-device-security-policies.md#BKMK_ChangeImpact)
  
## Remove user security groups from MDM device policies

1. Go to **Security &amp; Compliance Center**\> **Data loss prevention** \> **Device security polices**.
    
2. Select a device policy, and click ![Edit icon](media/O365_MDM_CreatePolicy_EditIcon.gif) **Edit policy**.
    
3. Under **Deployment**, click **- Remove**.
    
    Under **Groups**, select a security group.
    
4.  Click **Remove**.
    
5. Click **Save**.
    
## Remove MDM device policies

1. Go to **Security &amp; Compliance Center**\> **Security policies** \> **Device security policies**.
    
2. Select a device policy, and then click ![Image of the trash can icon.](media/b8bfa783-c0b5-46d9-9570-8a385088e8fe.png) **Delete policy**.
    
3. In the **Warning** dialog, click **Yes**. 
    

