---
title: "Office 365 and Dynamics 365 dev/test environment"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 05/18/2018
ms.audience: ITPro
ms.topic: article
ms.service: o365-solutions
localization_priority: Priority
search.appverid:
- MET150
ms.collection: 
- Ent_O365
- Strat_O365_Enterprise
ms.custom: Ent_TLGs
ms.assetid: 098c1a1d-83a1-40eb-bbc9-47de7af8bb23
description: "Summary: Use this Test Lab Guide to add Dynamics 365 to your Office 365 dev/test environment."
---

# Office 365 and Dynamics 365 dev/test environment

 **Summary:** Use this Test Lab Guide to add Dynamics 365 to your Office 365 dev/test environment.
  
With the instructions in this article, you add a Dynamics 365 trial subscription to the same organization as your Office 365 dev/test environment, creating an Office 365 and Dynamics 365 dev/test environment.

![Office 365 and Dynamics 365 dev/test environment](media/o365-dynamics365-dev-test.png)
  
  
You can use a Dynamics 365 trial subscription to demonstrate features and capabilities of Dynamics 365. The following solutions are included with a Dynamics 365 Plan 1, Enterprise Edition trial:
  
- [Microsoft Dynamics 365 for Sales](https://www.microsoft.com/dynamics365/sales). Increase your sales with automation and digital intelligence helping your salespeople stay focused and work smarter.
    
- [Microsoft Dynamics 365 for Customer Service](https://www.microsoft.com/dynamics365/customer-service). Earn loyalty by giving your agents the complete information and digital intelligence they need to provide seamless service.
    
- [Microsoft Dynamics 365 for Field Service](https://www.microsoft.com/dynamics365/field-service). Master the service call by optimizing your schedules, equipping your workforce, and using predictive tools to increase profit.
    
- [Microsoft Dynamics 365 for Project Service Automation](https://www.microsoft.com/en-us/dynamics365/project-service-automation). Complete your projects successfully and create profitable relationships with productive employees and intelligent tools.
    
You can explore one or more of the above for your Dynamics 365 trial subscription.
  
![Test Lab Guides in the Microsoft Cloud](media/24ad0d1b-3274-40fb-972a-b8188b7268d1.png)
  
> [!TIP]
> Click [here](http://aka.ms/catlgstack) for a visual map to all the articles in the One Microsoft Cloud Test Lab Guide stack.
  
## Phase 1: Build out your lightweight or simulated enterprise Office 365 dev/test environment

If you just want to test Office 365 and Dynamics 365 in a lightweight way with the minimum requirements, follow the instructions in phases 2 and 3 of [Office 365 dev/test environment](office-365-dev-test-environment.md).
  
If you want to test Office 365 and Dynamics 365 for a simulated enterprise, follow the instructions in [DirSync for your Office 365 dev/test environment](dirsync-for-your-office-365-dev-test-environment.md).

![The Office 365 dev/test environment](media/48fb91aa-09b0-4020-a496-a8253920c45d.png)
  
> [!NOTE]
> The configuration in this article does not require the simulated enterprise dev/test environment, which includes a simulated intranet connected to the Internet and directory synchronization for a Windows Server AD forest. It is provided here as an option so that you can experiment with Office 365 and Dynamics 365 in an environment that represents a typical organization. 
  
## Phase 2: Add a Dynamics 365 trial subscription

In this phase, you sign up for the Dynamics 365 trial subscription and add it to the same organization as your Office 365 trial subscription.
  
### Sign up for a Dynamics 365 trial subscription

1. Using a browser on either your desktop computer (lightweight) or from CLIENT1 (simulated enterprise), sign in to the Microsoft 365 admin center at [https://admin.microsoft.com](https://admin.microsoft.com) with the credentials of your global administrator account.
    
2. Click the **Admin** tile.
    
3. On the **Microsoft 365 admin center** tab, in the left navigation, click **Billing > Purchase services**.
    
4. On the **Purchase services** page, find the **Dynamics 365 Plan 1 Enterprise Edition** item. Hover your mouse pointer over it and click **Start free trial**.
    
5. On the **Confirm your order** page, click **Try now**.
    
6. On the **Order receipt** page, click **Continue**.

![Office 365 and Dynamics 365 dev/test environment](media/o365-dynamics365-dev-test.png)
    
> [!NOTE]
> The Dynamics 365 Plan 1 Enterprise Edition trial subscription is 30 days. You can easily extend the trail subscription for another 30 days. For a permanent dev/test environment, create a new paid subscription with a small number of licenses. 
  
## Phase 3: Assign Dynamics 365 licenses and system administrators

In this phase, you assign Dynamics 365 licenses to the global administrator, User 2, and User 3 accounts and make them system administrators.
  
Use these steps to assign Dynamics 365 licenses.
  
1. On the **Microsoft 365 admin center** tab, click **Users > Active users**.
    
2. In the list of active users, click your global administrator account, and then click **Edit** for **Product licenses**.
    
3. On the **Product licenses** pane, turn the product license for **Dynamics 365 Plan 1 Enterprise Edition** to **On**, click **Save,** and then click **Close** twice.
    
4. Perform steps 2 and 3 for the User 2 and User 3 accounts.
    
5. Close the **Microsoft 365 admin center** tab.
    
Use these steps to configure the User 2 and User 3 accounts as Dynamics 365 system administrators.
  
1. From the **Microsoft Office Home** tab, click **Admin**.
    
2. On the **Office Admin center** tab, in the left navigation, click **Admin centers**, and then click **Dynamics 365**.
    
    You may need to wait for Dynamics 365 to finish provisioning before Dynamics 365 appears in the menu.
    
3. On the Dynamics 365 tab, click **All of these**, and then click **Complete Setup.**
    
    Wait for setup to complete.
    
    When setup completes, it displays a Sales Activity Dashboard based on sample data that is part of the trail subscription. Take a few moments to view the **Welcome to your trial** video. Close the video window when complete.
    
4. On the toolbar at the top, click the down arrow next to **Sales**, click **Settings**, and then click **Security**.
    
5. On the **Security** page, click **Users**.
    
6. In the list of users, click **User 2**.
    
7. In the tool bar, click **Manage Roles**.
    
8. In **Manage Roles**, click **System Administrator**, and then click **OK**.
    
9. In the tool bar at the top click **Security**.
    
10. Repeat steps 5-8 for the User 3 account.
    
11. Close the **User: User3** tab.
    
> [!NOTE]
> Your Office 365 global administrator account was automatically assigned the Dynamics 365 system administrator role. 
  
Your Office 365 and Dynamics 365 dev/test environment now has:
  
- Office 365 E5 Enterprise and Dynamics 365 trial subscriptions sharing the same organization and the same Azure AD tenant with your list of user accounts.
    
- Your global enterprise administrator, User 2, and User 3 accounts are enabled to use both Office 365 E5 Enterprise and Dynamics 365 and are Dynamics 365 system administrators.
    
## Next step

Configure and then demonstrate how Office 365 and Dynamics 365 work together in Exchange Online mailboxes with [Exchange Online integration for your Office 365 and Dynamics 365 dev/test environment](exchange-online-integration-for-your-office-365-and-dynamics-365-dev-test-enviro.md).
  
## See Also

[Cloud adoption Test Lab Guides (TLGs)](cloud-adoption-test-lab-guides-tlgs.md)
  
[Base Configuration dev/test environment](base-configuration-dev-test-environment.md)
  
[Office 365 dev/test environment](office-365-dev-test-environment.md)
  
[DirSync for your Office 365 dev/test environment](dirsync-for-your-office-365-dev-test-environment.md)

[Subscription Management for Dynamics 365 (online)](https://technet.microsoft.com/library/jj679903.aspx)
  
[Administering Dynamics 365](https://technet.microsoft.com/library/dn531101.aspx)


