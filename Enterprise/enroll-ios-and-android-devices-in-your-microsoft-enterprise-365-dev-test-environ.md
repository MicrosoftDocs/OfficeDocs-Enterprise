---
title: "Enroll iOS and Android devices in your Microsoft Enterprise 365 dev/test environment"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 12/15/2017
ms.audience: ITPro
ms.topic: article
ms.service: o365-solutions
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_TLGs
ms.assetid: 49c7758a-1c01-4153-9b63-5eae3f6305ce
description: "Summary: Use this Test Lab Guide to enroll devices in your Microsoft 365 dev/test environment and manage them remotely."
---

# Enroll iOS and Android devices in your Microsoft Enterprise 365 dev/test environment

 **Summary:** Use this Test Lab Guide to enroll devices in your Microsoft 365 dev/test environment and manage them remotely.
  
The Microsoft Enterprise Mobility Suite (EMS) helps keep your employees productive using their favorite apps and devices while protecting your organization's data. For more information, see [Enterprise Mobility + Security (EMS)](https://www.microsoft.com/cloud-platform/enterprise-mobility-security).
  
If you need to apply security at the device level, you must enroll devices into Microsoft Intune. Device enrollment not only helps you to manage corporate-owned devices, but also personal (BYOD) and shared devices, depending on your organization's legal policies.
  
By following the instructions provided in this article, you'll be able to enroll and test basic mobile device management capabilities for iOS and Android devices in your Microsoft 365 dev/test environment.
  
## Phase 1: Create your Microsoft 365 dev/test environment

Follow the instructions in [The Microsoft 365 Enterprise dev/test environment](the-microsoft-365-enterprise-dev-test-environment.md).
  
## Phase 2: Customize the Microsoft Intune Company Portal app

Use these steps to customize the Microsoft Intune Company Portal app for your fictional company:
  
1. On a new tab, open the Microsoft Intune administration console ([https://manage.microsoft.com](https://manage.microsoft.com)).
    
2. Click **Admin** in the navigation pane, and then click **Mobile Device Management** in the **Administration** pane.
    
3. In the **Tasks** list, select **Set Mobile Device Management Authority**. Ensure that it is set to **Microsoft Intune**.
    
4. In the **Administration** pane, click **Company Portal**.
    
5. In the **Company Portal** pane, configure the following settings:
    
  - Company name: \<your fictional company name>
    
  - IT department contact name: **User5**
    
  - IT department phone number: **555-1234**
    
  - IT department e-mail address: **User5@**\<fictional organization name> **.onmicrosoft.com** (the email address of the User5 account)
    
6. In **Customization**, select **Green** in **Theme color**.
    
7. Click **Save**.
    
Next, you will install the Microsoft Intune Company Portal app and enroll an iOS or Android device, and then test basic management functionality from the Microsoft Intune administration console.
  
## Phase 3 (for iOS devices only): Enroll and manage an iOS device

To enroll an iOS device for management by Intune, you will need the following:
  
- An iOS device such as an Apple iPad or iPhone.
    
- Knowledge of the iOS device's passcode.
    
- An Apple ID (an account name and password). If you do not already have one, go to the [Apple ID website](https://appleid.apple.com/#!&amp;page=signin) and click **Create your Apple ID**. Create an Apple ID corresponding to the global administrator account of your Office 365 subscription. Record your new Apple ID account name and password in a secure location.
    
An Apple Push Notification service (APNs) certificate is required for Intune to manage iOS and Mac devices. Once the certificate is added to Intune, users can install the Microsoft Intune Company Portal app to enroll their devices or the administrator can set up corporate-owned iOS device management.
  
You need a certificate signing request file to request a trust relationship certificate from the Apple Push Certificates Portal. To get a certificate signing request file:
  
1. In the Microsoft Intune administration console, click **Admin** in the navigation pane.
    
    In the **Administration** pane, open **Mobile Device Management > iOS and Mac OS X**, and then click **Upload an APNs Certificate** in **Tasks**. 
    
2. In the **Upload an APNs Certificate** pane, click **Download the APNs certificate request**. Save the certificate signing request (.csr) file locally with the name **dev-test**.
    
To get an Apple Push Notification service certificate:
  
1. Open a new tab, go to the [Apple Push Certificates Portal](https://idmsa.apple.com/IDMSWebAuth/login?appIdKey=3fbfc9ad8dfedeb78be1d37f6458e72adc3160d1ad5b323a9e5c5eb2f8e7e3e2&amp;rv=2), and sign in with your Apple ID.
    
2. On the **Get Started** page, click **Create a Certificate**.
    
3. On the **Terms of Use** page, select **I have read and agree to these terms and conditions**, and then click **Accept**.
    
4. On the **Create a New Push Certificate** page, click **Browse** and select the **dev-test.csr** file saved in the previous procedure, and then click **Upload**. When prompted to open a json file, save it to the same folder where the dev-test.csr file is stored.
    
5. Open the [Apple Push Certificates Portal](https://idmsa.apple.com/IDMSWebAuth/login?appIdKey=3fbfc9ad8dfedeb78be1d37f6458e72adc3160d1ad5b323a9e5c5eb2f8e7e3e2&amp;rv=2) in a different tab and for **Certificates for Third-Party Servers**, click **Download**.
    
6. When prompted to open a .pem file, save it with the name **dev-test.pem** to the same folder where the dev-test.csr file is stored. This is your APNs certificate.
    
To upload the APNs certificate into Intune:
  
1. On the Microsoft Intune administration console tab, on the **Upload an APNs Certificate** page, click **Upload the APNs certificate**.
    
2. Click **Browse** and specify the **dev-test.pem** file.
    
3. Click **Open**, type your Apple ID account name, and then click **Upload**. You should see a **Ready for enrollment** message on the **iOS and MaxOS X Mobile Device Management Setup** page.
    
With the APNs certificate installed, Intune can now enroll and manage iOS devices by pushing policy to enrolled mobile devices.
  
To download the Microsoft Intune Company portal app and enroll the iOS device:
  
1. From your iOS device, sign in with your Apple ID.
    
2. Open the **Apple Store** app.
    
3. Type **intune** in the search box and tap **Microsoft Intune Company Portal**, then **Get**, and then **Install**.
    
4. After it installs, tap **Open**.
    
5. On the **Intune Company Portal** screen, sign in with your Office 365 global administrator account.
    
6. On the **Company Access Setup** screen, tap **Begin**, and then tap **Continue** twice.
    
7. On the **What comes next?** screen, tap **Enroll**.
    
8. On the **Activate device administrator?** screen, tap **Activate**.
    
9. On the **Management Profile** screen, tap **Install**.
    
10. In **Enter Passcode**, type your iOS device passcode.
    
11. On the **What comes next** screen, tap **Enroll**.
    
12. In **Install Profile**, tap **Install**.
    
13. On the **Warning** page, tap **Install**.
    
14. In **Remote Management**, tap **Trust**.
    
15. Tap **Done** to complete the enrollment process.
    
16. When prompted to **Open this page in "Comp Portal"?**, tap **Open**.
    
17. On the **Company Access Setup** screen, tap **Begin**, and then tap **Done**.
    
18. On the main screen of the Microsoft Intune Company Portal app, you should see:
    
  - A green banner.
    
  - Your fictional company name in the upper left.
    
  - Your iOS device name listed in **My Devices**.
    
  - In the **Helpdesk** section, the **Contact Name** of **User5** with the phone number of **555-1234** and a **Contact by email** button.
    
Microsoft Intune provides both remote lock and passcode reset capabilities. If someone loses their device, you can lock the device remotely. If someone forgets their passcode, you can remove the passcode remotely.
  
To lock an iOS device remotely:
  
1. From your administration computer, on the Microsoft Intune administration console tab of your browser, click **Groups** in the left navigation.
    
2. In the **Groups** pane, open **All devices > All Mobile devices > All Direct Managed Devices**.
    
3. In the **All Direct Managed Devices** pane, click the **Devices** tab.
    
4. In the devices list, click your iOS device. 
    
5. From your iOS device, make sure it is at the main screen. 
    
6. From your administration computer, on the taskbar, click **Remote Tasks > Remote Lock**. Watch your iOS device as it switches to the lockout screen.
    
To remove the passcode:
  
1. From your administration computer, in the **All Direct Managed Devices** pane, click the **Devices** tab.
    
2. In the list, click your iOS device. On the taskbar, click **Remote Tasks > Passcode Reset**. Wait for one minute.
    
3. From your iOS device, unlock it and notice that there is no longer a passcode. To change the passcode back, go into **Settings**, and then **Passcode**.
    
## Phase 3 (for Android devices only): Enroll and manage an Android device

You will need the following to enroll an Android device for management by Intune:
  
- An Android device.
    
- Knowledge of the device's passcode.
    
To download the Intune Company portal app and enroll the Android device:
  
1. From your Android device, go to the **Google Play Store**, and then tap **Get Started**.
    
2. Type **intune** in the search box, and then tap **intune company portal** in the search results.
    
3. Tap the **Intune Company Portal** item, and then tap **Install**.
    
4. On the **For Complete account setup** screen, tap **Continue**, and then **Skip**.
    
5. In **Intune Company Portal**, tap **Accept**. The app installs.
    
6. Tap **Open**, and then tap **Sign in**.
    
7. On the **Intune Company Portal** screen, sign in with your Office 365 global administrator account.
    
8. On the **Company Access Setup** screen, tap **Begin**, and then **Continue** twice.
    
9. On the **What comes next?** screen, tap **Enroll**.
    
10. On the **Activate device administrator?** screen, tap **Activate.**
    
11. On the **Privacy Policy** screen, select **I acknowledge** and then tap **Confirm**. Wait for the enrollment process to complete.
    
12. In the **Company Access Setup** screen, tap **Continue**, and then tap **Done**.
    
13. On the main screen of the Microsoft Intune Company Portal app, you should see a green banner and your fictional company name in the upper left.
    
14. Tap **My devices**. You should see your Android device name in the list.
    
15. Tap **Contact IT**. You should see the phone number of **555-1234**, a **Contact by email** button, and the IT contact of **User5**.
    
Microsoft Intune provides both remote lock and passcode reset capabilities. If someone loses their device, you can lock the device remotely. If someone forgets their passcode, you can reset the passcode remotely.
  
To lock an Android device remotely:
  
1. From your administration computer, on the Microsoft Intune administration console tab of your browser, click **Groups** in the left navigation.
    
2. In the **Groups** pane, open **All devices > All Mobile devices > All Direct Managed Devices**.
    
3. In the **All Direct Managed Devices** pane, click the **Devices** tab.
    
4. In the devices list, click your Android device. 
    
5. From your Android device, make sure it is at the main screen. 
    
6. From your administration computer, on the taskbar, click **Remote Tasks > Remote Lock**. When prompted, click **Yes**.
    
7. Watch your Android device as it switches to the lockout screen.
    
When you reset the passcode for Android devices, the Intune administration portal generates and configures a strong passcode.
  
To reset the passcode remotely:
  
1. From your administration computer, on the Microsoft Intune administration console tab of your browser, in the **All Direct Managed Devices** pane, click your Android device.
    
2. On the taskbar, click **Remote Tasks > Passcode Reset**.
    
3. On the **Remote Task: Passcode Reset** prompt, click **Yes**. Wait for one minute.
    
4. In the **All Direct Managed Devices** pane, click **View Properties**.
    
5. Under **Passcode Reset**, note the new passcode.
    
6. From your Android device, enter the new passcode from the lockout screen. 
    
7. To change the passcode back, go into **Settings**, tap **Device**, tap **Lock screen**, enter the new passcode again, tap **Screen lock**, and then your choice for the passcode.
    
> [!TIP]
> Click [here](http://aka.ms/catlgstack) for a visual map to all of the articles in the One Microsoft Cloud Test Lab Guide stack.
  
## See Also

[The Microsoft 365 Enterprise dev/test environment](the-microsoft-365-enterprise-dev-test-environment.md)
  
[MAM policies for your Microsoft 365 Enterprise dev/test environment](mam-policies-for-your-microsoft-365-enterprise-dev-test-environment.md)
  
[Cloud adoption Test Lab Guides (TLGs)](cloud-adoption-test-lab-guides-tlgs.md)

[Enterprise Mobility + Security (EMS)](https://www.microsoft.com/cloud-platform/enterprise-mobility-security)


