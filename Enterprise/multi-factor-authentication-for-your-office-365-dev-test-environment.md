---
title: "Multi-factor authentication for your Office 365 dev/test environment"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 02/20/2019
ms.audience: ITPro
ms.topic: article
ms.service: o365-solutions
localization_priority: Normal
search.appverid:
- MET150
ms.collection: Ent_O365
ms.custom: 
- TLG
- Ent_TLGs
ms.assetid: e2b354b9-7f18-4da0-9107-6245eae0f33f
description: "Summary: Configure multi-factor authentication using text messages sent to a smart phone in an Office 365 dev/test environment."
---

# Multi-factor authentication for your Office 365 dev/test environment

 **Summary:** Configure multi-factor authentication using text messages sent to a smart phone in an Office 365 dev/test environment.
  
For an additional level of security for signing in to your Office 365 subscription, you can enable Azure multi-factor authentication, which requires more than just a username and password to authenticate an account. With multi-factor authentication for Office 365, users are required to acknowledge a phone call, type a verification code sent in a text message, or specify an app password on their smart phones after correctly entering their passwords. They can sign in only after this second authentication factor has been satisfied. 
  
This article describes how to enable and test text message-based authentication for a specific Office 365 account.
  
There are two phases to setting up multi-factor authentication for Office 365 in a dev/test environment:
  
1. Create the Office 365 dev/test environment.
    
2. Enable and test multi-factor authentication for the User 2 account.
    
> [!TIP]
> Click [here](http://aka.ms/catlgstack) for a visual map to all the articles in the One Microsoft Cloud Test Lab Guide stack.
  
## Phase 1: Build out your lightweight or simulated enterprise Office 365 dev/test environment

If you just want to test multi-factor authentication in a lightweight way with the minimum requirements, follow the instructions in phases 2 and 3 of [Office 365 dev/test environment](office-365-dev-test-environment.md).
  
If you want to test multi-factor authentication in a simulated enterprise, follow the instructions in [DirSync for your Office 365 dev/test environment](dirsync-for-your-office-365-dev-test-environment.md).
  
> [!NOTE]
> Testing multi-factor authentication does not require the simulated enterprise dev/test environment, which includes a simulated intranet connected to the Internet and directory synchronization for a Windows Server AD forest. It is provided here as an option so that you can test multi-factor authentication and experiment with it in an environment that represents a typical organization. 
  
## Phase 2: Enable and test multi-factor authentication for the User 2 account

Enable multi-factor authentication for the User 2 account with these steps:
  
1. Open a separate instance of your browser, go to the Office 365 portal ([https://www.office.com](https://www.office.com)), and then sign in to your Office 365 trial subscription with your global administrator account.
    
2. From the main portal page, click **Admin**.
    
3. In the left navigation, click **Users > Active users**.
    
4. In the Active users pane, click **More > Multi-factor authentication setup**.
    
5. In the list, select the **User 2** account.
    
6. In the **User 2** section, under **Quick steps**, click **Enable**.
    
7. In the **About enabling multi-factor auth** dialog box, click **Enable multi-factor auth**.
    
8. In the **Updates successful** dialog box, click **Close**.
    
9. On the **Microsoft Office Home** tab, click the user account icon in the upper right, and then click **Sign out**.
    
10. Close your browser instance.
    
Complete the configuration for the User 2 account to use a text message for validation and test it with these steps:
  
1. Open a new instance of your browser.
    
2. Go to the Office 365 portal ([https://www.office.com](https://www.office.com)) and sign in with the User 2 account (user2@\<organization name>.onmicrosoft.com) and password.
    
3. After signing in, you are prompted to set up the account for additional security validation. Click **Set it up now**.
    
4. On the **Additional security verification** page:
    
  - Select your country or region.
    
  - Type phone number of the smart phone that will receive text messages.
    
  - in **Method**, click **Send me a code by text message**.
    
5. Click **Next**.
    
6. Enter the verification code from the text message received on your smart phone, and then click **Verify**.
    
7. On the **Step 3: Keep your existing applications** page, record the displayed app password for the User 2 account in a secure location, and then click **Done**.
    
8. If this is the first time you signed in with the User 2 account, you are prompted to change the password. Type the original password and a new password twice, and then click **Update password and sign in**. Record the new password in a secure location.
    
    You should see the Office 365 portal for User 2 on the **Microsoft Office Home** tab of your browser.
    
## See Also

[Cloud adoption Test Lab Guides (TLGs)](cloud-adoption-test-lab-guides-tlgs.md)
  
[Base Configuration dev/test environment](base-configuration-dev-test-environment.md)
  
[Office 365 dev/test environment](office-365-dev-test-environment.md)
  
[Cloud adoption and hybrid solutions](cloud-adoption-and-hybrid-solutions.md)

[Plan for multi-factor authentication for Office 365 Deployments](https://support.office.com/article/Plan-for-multi-factor-authentication-for-Office-365-Deployments-043807b2-21db-4d5c-b430-c8a6dee0e6ba)

