---
title: "Cloud App Security for your Office 365 dev/test environment"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 07/05/2018
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
ms.assetid: 22248f2f-b370-435e-b6ac-0ae0cae36b96
description: "Summary: Configure and demonstrate Office 365 Cloud App Security in your Office 365 dev/test environment."
---

# Cloud App Security for your Office 365 dev/test environment

 **Summary:** Configure and demonstrate Office 365 Cloud App Security in your Office 365 dev/test environment.
  
Office 365 Cloud App Security, previously known as Office 365 Advanced Security Management, lets you create policies that monitor for and inform you of suspicious activities in your Office 365 subscription, so that you can investigate and take possible remediation action. For more information, see [Overview of Cloud App Security in Office 365](https://support.office.com/article/Overview-of-Advanced-Security-Management-in-Office-365-81f0ee9a-9645-45ab-ba56-de9cbccab475).
  
With the instructions in this article, you enable and test Cloud App Security in your Office 365 trial subscription.
  
> [!TIP]
> Click [here](http://aka.ms/catlgstack) for a visual map to all the articles in the One Microsoft Cloud Test Lab Guide stack.
  
## Phase 1: Build out your lightweight or simulated enterprise Office 365 dev/test environment

If you just want to test Cloud App Security in a lightweight way with the minimum requirements, follow the instructions in phases 2 and 3 of [Office 365 dev/test environment](office-365-dev-test-environment.md).
  
If you want to test Cloud App Security in a simulated enterprise, follow the instructions in [DirSync for your Office 365 dev/test environment](dirsync-for-your-office-365-dev-test-environment.md).
  
> [!NOTE]
> Testing Cloud App Security does not require the simulated enterprise dev/test environment, which includes a simulated intranet connected to the Internet and directory synchronization for an Active Directory Domain Services (AD DS) forest. It is provided here as an option so that you can test Cloud App Security and experiment with it in an environment that represents a typical organization. 
  
## Phase 2: Before enabling Cloud App Security and creating a policy

In this procedure, you demonstrate that before enabling Cloud App Security, changing a user's role provides no email notification to the global administrator.
  
### Test the default notification behavior of Office 365

1. Go to the Microsoft 365 admin center ([https://admin.microsoft.com](https://admin.microsoft.com)) and sign in to your Office 365 trial subscription with your global administrator account.
    
  - If you are using the lightweight Office 365 dev/test environment, sign in from your local computer.
    
  - If you are using the simulated enterprise Office 365 dev/test environment, use the [Azure portal](https://portal.azure.com) to connect to the CLIENT1 virtual machine, and then sign in from CLIENT1.
    
2. From the main portal page, click **Admin**.
    
3. In the left navigation, click **Users > Active users**.
    
4. Click the **User 4** account.
    
5. On the **User 4** page, click **Edit** for the **Roles** row.
    
6. On the **Edit user roles** page, click **Global administrator**, type **user4@contoso.com** in the **Alternative email address**, and then click **Save**. Click **Close** twice.
    
7. Select the app launcher icon in the upper-left and choose **Mail**.
    
8. Wait 30 minutes. Notice that there is no email message in the inbox notifying you of the change in User 4's role as a global administrator.
    
## Phase 3: Enable Cloud App Security and create a policy

In this procedure, you enable Cloud App Security and create a new policy to send email notifications to your global administrator account for changes in user account roles. This procedure requires:
  
- The global administrator account name and password of your Office 365 trial subscription.
    
- The name and password of the User 5 account of your Office 365 trial subscription.
    
### Enable and configure Cloud App Security

1. Go to the Microsoft 365 admin center ([https://admin.microsoft.com](https://admin.microsoft.com)) and sign in to your Office 365 trial subscription with your global administrator account.
    
2. Click the **Admin** tile. On the **Office Admin center** tab, click **Admin centers > Security & Compliance**.
    
3. In the left navigation pane, click **Alerts > Manage advanced alerts**.
    
4. On the **Manage advanced alerts** page, click **Turn on Office 365 Cloud App Security**, and then click **Go to Office 365 Cloud App Security**.
    
5. On the new **Dashboard** tab, click **Control > Policies**.
    
6. On the **Policy** page, click **Create policy**, and then click **Activity policy**.
    
7. In **Policy name**, type **Administrative activity**.
    
8. In **Policy severity**, click **High**.
    
9. In **Category**, click **Privileged accounts**.
    
10. In **Create filters for the policy**, in **Activities matching all of the following**, click **Administrative activity**.
    
11. In **Alerts**, click **Send alert as email**. In **To**, type the email address of your global administrator account.
    
12. At the bottom of the page, click **Create**.
    
## Phase 4: Show Cloud App Security in action

In this procedure, you demonstrate how Cloud App Security creates alerts and sends email notifications to the global administrator account when User 4 makes User 5 a password and user management administrator.
  
### Demonstrate email notification for a change in user account roles

1. In the upper-right, click the user icon, and then click **Sign out**.
    
2. Go to [https://www.office.com](https://www.office.com).
    
3. On the Office 365 sign in page, click **Use another account**.
    
4. Type the User 4 account name and its password, and then click **Sign in**.
    
5. If needed, change the User 4 account password, and then click **Update password and sign in**.
    
6. On the Office 365 portal page, click **Admin**.
    
7. If needed, click **cancel** when prompted to update your admin contact info.
    
8. From the main portal page, click **Admin**.
    
9. In the left navigation, click **Users > Active users**.
    
10. Click the **User 5** account.
    
11. On the **User 5** page, click **Edit** for the **Roles** row.
    
12. On the **Edit user roles** page, click **Customized administrator**, click **Password administrator** and **User management administrator**, type **user5@contoso.com** in the **Alternative email address**, and then click **Save**. Click **Close** twice.
    
13. Click the user icon in the upper-right, and then click **Sign out**. 
    
14. Go to [https://www.office.com](https://www.office.com).
    
15. On the **Office 365 sign in** page, click your global administrator account name.
    
16. Type the password, and then click **Sign in**.
    
17. From the Office 365 portal page, click **Admin**.
    
18. Click the **Security &amp; Compliance** tile.
    
19. In the left navigation pane, click **Alerts > Manage advanced alerts**.
    
20. On the **Manage advanced alerts** page, click **Go to Office 365 Cloud App Security**.
    
21. On the new **Dashboard** tab, notice the two new alerts for **Administrative activity**.
    
22. From the **Microsoft Office Home** tab, click **Mail**. Wait up to 30 minutes. 
    
    You should see two new email messages in the inbox with the title **Microsoft Azure AD Notification Service**. One message indicates that the User 5 account was added to the **Password Administrator** role and another message indicates that the User 5 account was added to the **User Administrator** role (equal to the User management administrator role in the Office 365 Admin center).
    
You can now use this environment to create new policies and further experiment with Office 365 Cloud App Security. See [Get ready for Office 365 Cloud App Security](https://support.office.com/article/Get-ready-for-Office-365-Cloud-App-Security-d9ee4d67-f2b3-42b4-9c9e-c4529904990a) for links to additional configuration articles.
  
## See Also

[Cloud adoption Test Lab Guides (TLGs)](cloud-adoption-test-lab-guides-tlgs.md)
  
[Office 365 dev/test environment](office-365-dev-test-environment.md)
  
[Cloud adoption and hybrid solutions](cloud-adoption-and-hybrid-solutions.md)

[Overview of Cloud App Security in Office 365](https://support.office.com/article/Overview-of-Advanced-Security-Management-in-Office-365-81f0ee9a-9645-45ab-ba56-de9cbccab475)


