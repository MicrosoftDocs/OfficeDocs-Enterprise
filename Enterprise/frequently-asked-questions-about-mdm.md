---
title: "Frequently asked questions about Mobile Device Management for Office 365"
ms.author: deniseb
author: denisebmsft
manager: laurawi
ms.date: 12/30/2016
ms.audience: Admin
ms.topic: reference
ms.service: o365-administration
localization_priority: Normal
search.appverid:
- MOE150
- MED150
- MBS150
ms.assetid: 3871f99c-c9db-4a23-86f9-902c1b02f58d
description: "This article contains frequently asked questions about Mobile Device Management (MDM) for Office 365, a feature that helps you manage and secure mobile devices in Office 365."
---

# Frequently asked questions about Mobile Device Management for Office 365

This article contains frequently asked questions about Mobile Device Management (MDM) for Office 365, a feature that helps you manage and secure mobile devices in Office 365.
  
## FAQs

- [How can I get MDM for Office 365? I don't see it in the Office 365 admin center](frequently-asked-questions-about-mdm.md#BKMK_NeedMDM)
    
- [How can I get started with device management in MDM](frequently-asked-questions-about-mdm.md#BKMK_GetStarted)
    
- [I'm trying to set up MDM but it seems stuck. The Office 365 Service Health has been showing "provisioning" for a while. What can I do?](frequently-asked-questions-about-mdm.md#BKMK_ProvisionHang)
    
- [What can I do if device enrollment fails?](frequently-asked-questions-about-mdm.md#BKMK_EnrollFails)
    
- [What's the difference between Intune and MDM for Office 365?](frequently-asked-questions-about-mdm.md#BKMK_Intune)
    
- [How do policies work for MDM? How do I set them up? Disable them?](frequently-asked-questions-about-mdm.md#BKMK_PoliciesHowTo)
    
- [Can I switch from Exchange ActiveSync device management to MDM for Office 365?](frequently-asked-questions-about-mdm.md#BKMK_SwitchFromEXO)
    
- [I set up MDM but now I want to remove it. What are the steps? ](frequently-asked-questions-about-mdm.md#BKMK_Remove)
    
- [Still need help?](frequently-asked-questions-about-mdm.md#BKMK_NeedHelp)
    
## How can I get MDM for Office 365? I don't see it in the Office 365 admin center

We've completed rolling out this feature to Office 365 customers. Look for the **Device Management** tab in the [Go to the Office 365 Security &amp; Compliance Center](https://support.office.com/article/7e696a40-b86b-4a20-afcc-559218b7b1b8). If you don't see it, please let us know by [Still need help?](frequently-asked-questions-about-mdm.md#BKMK_NeedHelp), and we'll help you get started. 
  
## How can I get started with device management in MDM
<a name="BKMK_GetStarted"> </a>

There are four steps to getting started with MDM for Office 365 (learn details in [Set up Mobile Device Management (MDM) in Office 365](set-up-mobile-device-management.md)):
  
1. **Activate MDM.** Go to the [Go to the Office 365 Security &amp; Compliance Center](https://support.office.com/article/7e696a40-b86b-4a20-afcc-559218b7b1b8) and select **Device management**. Click **Let's get started** to kick off the activation process. 
    
2. **Complete configuration for MDM**. This might require APNs certificate configuration and updates to DNS records for your domain. 
    
3. **Create policies**. Create device management policies, and apply them to groups of users that are [set up in security groups](create-device-security-policies.md). We recommend that you start by deploying the policies to a small test group. In the Security &amp; Compliance Center, select **Device security policies**.
    
4. **Users enroll devices.** Users who have had a policy applied to them are prompted to [enroll their devices](enroll-your-mobile-device.md) when they try to access Office 365 data (by using their email client, for example). 
    
## I'm trying to set up MDM but it seems stuck. The Office 365 Service Health has been showing "provisioning" for a while. What can I do?

It may take some time to get the service ready for you. When provisioning is complete, you'll see the Mobile Device Management for Office 365 page. If you've waited 24 hours and the status is still **Provisioning**, please [Still need help?](frequently-asked-questions-about-mdm.md#BKMK_NeedHelp) and we'll help figure out what the issue is. 
  
## What can I do if device enrollment fails?

If you're having trouble getting a device enrolled, first try checking the following:
  
- Make sure that the device is not already enrolled with another mobile device management provider, such as Intune.
    
- Make sure that the device is set to the correct date and time.
    
- Switch to a different Wi-Fi or cellular network on the device.
    
- For Android or iOS devices, uninstall and reinstall the Intune Company Portal app on the device.
    
If enrollment still isn't working, [try these additional troubleshooting steps](troubleshoot-mdm.md).
  
## What's the difference between Intune and MDM for Office 365?

Both MDM for Office 365 and Intune provide cloud-based solutions for managing devices in your organization. Use this [side-by-side comparison](choose-between-mdm-and-intune.md) of the two services to help you decide if using Intune or MDM for Office 365 is the best fit for you. 
  
## How do policies work for MDM? How do I set them up? Disable them?

After you complete initial setup for MDM for Office 365, you [create policies and apply them to groups of users](create-device-security-policies.md) in [Go to the Office 365 Security &amp; Compliance Center](https://support.office.com/article/7e696a40-b86b-4a20-afcc-559218b7b1b8). For the users that the policies apply to, the policies require users to enroll their devices in MDM for Office 365 before the device can be used to access Office 365 data. The policies that you set up determine settings for mobile devices, for example, how often passwords must be reset or whether data encryption is required. 
  
We provide step by step instructions for [creating and deploying device security policies](create-device-security-policies.md). You create the policies in the Security &amp; Compliance Center, and you can disable one or more policies by returning to the Security &amp; Compliance Center and editing the policy to remove the applied group. Or you can choose not to remove the policy altogether.
  
If you want to exclude a specific group of users from being affected by policies, then you can add a group to the exclusion group. In the Security &amp; Compliance Center, on the **Devices** tab, select **Manage device access settings**, and then add the group to the **Are there any security groups you want to exclude from access control?** section. 
  
## Can I switch from Exchange ActiveSync device management to MDM for Office 365?

If you're already using [Exchange ActiveSync policies](https://go.microsoft.com/fwlink/?LinkId=615145) to manage mobile devices, you can start using MDM for Office 365 by following the steps to [set up Mobile Device Management (MDM) in Office 365](set-up-mobile-device-management.md).
  
When you apply the policies that you create in MDM for Office 365 to groups of users, these policies override Exchange ActiveSync mobile device mailbox policies and device access rules that you've previously created in the Exchange admin center for those users. 
  
After a device is enrolled in MDM for Office 365, any Exchange ActiveSync mobile device mailbox policy or device access rule applied to the device will be ignored.
  
## I set up MDM but now I want to remove it. What are the steps?

Unfortunately, you can't simply "unprovision" MDM for Office 365 after you've set it up. But you can remove it for groups of users by removing user security groups from the device policies you've created. Or, disable it for everyone by removing the device policies so they aren't in place and aren't enforced. See [How to turn off Mobile Device Management in Office 365](turn-off-mdm.md).
  
## Still need help?

[![Get help from the Office 365 community forums](media/12a746cc-184b-4288-908c-f718ce9c4ba5.png)](https://go.microsoft.com/fwlink/p/?LinkId=518605)
  
[![Admins: Sign in and create a service request](media/10862798-181d-47a5-ae4f-3f8d5a2874d4.png)]( https://go.microsoft.com/fwlink/p/?LinkId=519124)
  
[![Admins: Call Support](media/9f262e67-e8c9-4fc0-85c2-b3f4cfbc064e.png)](https://go.microsoft.com/fwlink/p/?LinkID=518322)
  

  

