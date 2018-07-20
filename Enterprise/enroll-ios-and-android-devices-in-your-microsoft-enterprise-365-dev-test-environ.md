---
title: "Enroll iOS and Android devices in your Microsoft 365 Enterprise dev/test environment"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 07/20/2018
ms.audience: ITPro
ms.topic: article
ms.service: o365-solutions
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_TLGs
ms.assetid: 49c7758a-1c01-4153-9b63-5eae3f6305ce
description: "Summary: Use this Test Lab Guide to enroll devices in your Microsoft 365 dev/test environment and manage them remotely."
---

# Enroll iOS and Android devices in your Microsoft 365 Enterprise dev/test environment

 **Summary:** Use this Test Lab Guide to enroll devices in your Microsoft 365 dev/test environment and manage them remotely.
  
The Microsoft Enterprise Mobility Suite (EMS) helps keep your employees productive using their favorite apps and devices while protecting your organization's data. For more information, see [Enterprise Mobility + Security (EMS)](https://www.microsoft.com/cloud-platform/enterprise-mobility-security).
  
If you need to apply security at the device level, you must enroll devices into Microsoft Intune. Device enrollment not only helps you to manage organization-owned devices, but also personal (BYOD) and shared devices, depending on your organization's legal policies.
  
By following the instructions provided in this article, you'll be able to enroll and test basic mobile device management capabilities for iOS and Android devices in your Microsoft 365 dev/test environment.
  
## Phase 1: Create your Microsoft 365 dev/test environment

Follow the instructions in [The Microsoft 365 Enterprise dev/test environment](the-microsoft-365-enterprise-dev-test-environment.md).
  
## Phase 2: Enroll your iOS and Android devices

First, use the instructions in [Install and sign in to the Company Portal app](https://docs.microsoft.com/intune-user-help/install-and-sign-in-to-the-intune-company-portal-app-ios) to customize the Microsoft Intune Company Portal app for your test environment.

Next, use the instructions in [Set up access to your company resources](https://docs.microsoft.com/intune-user-help/enroll-your-device-in-intune-ios) to enroll an iOS device.

Next, use the instructions in [Enroll your Android device in Intune](https://docs.microsoft.com/intune-user-help/enroll-your-device-in-intune-android) to enroll an Android device.

## Phase 3: Manage your iOS and Android devices remotely

Microsoft Intune provides both remote lock and passcode reset capabilities. If someone loses their device, you can lock the device remotely. If someone forgets their passcode, you can reset it remotely.
  
To lock an iOS or Android device remotely:

1. Sign in to the Azure portal at [https://portal.azure.com](https://portal.azure.com) with the credentials of your global administrator account.
2. Click **All services**, type **Intune**, and then click **Intune**.
3. Click **Devices > All devices**.
4. In the list of devices, click an iOS or Android device, and then click the **Remote lock** action.

    
To reset the passcode remotely:

1. If needed, sign in to the Azure portal at [https://portal.azure.com](https://portal.azure.com) with the credentials of your global administrator account.
2. Click **All services**, type **Intune**, and then click **Intune**.
3. Click **Devices > All devices**.
4. From the list of devices you manage, click an iOS or Android device, and choose **...More**. Then choose the **Remove passcode** device remote action.

For additional experimentation, see [Available device actions](https://docs.microsoft.com/intune/device-management#available-device-actions).

    

> [!TIP]
> Click [here](http://aka.ms/catlgstack) for a visual map to all of the articles in the One Microsoft Cloud Test Lab Guide stack.
  
## See Also

[The Microsoft 365 Enterprise dev/test environment](the-microsoft-365-enterprise-dev-test-environment.md)
  
[MAM policies for your Microsoft 365 Enterprise dev/test environment](mam-policies-for-your-microsoft-365-enterprise-dev-test-environment.md)
  
[Cloud adoption Test Lab Guides (TLGs)](cloud-adoption-test-lab-guides-tlgs.md)

[Enterprise Mobility + Security (EMS)](https://www.microsoft.com/cloud-platform/enterprise-mobility-security)


