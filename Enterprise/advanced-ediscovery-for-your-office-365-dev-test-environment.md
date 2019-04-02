---
title: "Advanced eDiscovery for your Office 365 dev/test environment"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 12/15/2017
ms.audience: ITPro
ms.topic: article
ms.service: o365-solutions
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: 
- TLG
- Ent_TLGs
ms.assetid: d4c49a6f-abfd-4d68-b353-259b4eefb033
description: "Summary: Configure and demonstrate Office 365 Advanced eDiscovery with sample data in your Office 365 dev/test environment."
---

# Advanced eDiscovery for your Office 365 dev/test environment

 **Summary:** Configure and demonstrate Office 365 Advanced eDiscovery with sample data in your Office 365 dev/test environment.
  
Office 365 Advanced eDiscovery lets you quickly find and analyze relevant information across the data that is stored in Office 365, including email and documents. This can save enormous amounts of time and expense, especially in litigation situations. For more information, see [Office 365 Advanced eDiscovery](https://support.office.com/article/Office-365-Advanced-eDiscovery-fd53438a-a760-45f6-9df4-861b50161ae4).
  
With the instructions in this article, you create a small set of data for a fictional contract dispute and analyze it with Advanced eDiscovery.
  
> [!TIP]
> Click [here](http://aka.ms/catlgstack) for a visual map to all the articles in the One Microsoft Cloud Test Lab Guide stack.
  
## Phase 1: Create your Office 365 dev/test environment

If you just want to test Advanced eDiscovery in a lightweight way with the minimum requirements, follow the instructions in Phase 2 and Phase 3 of [Office 365 dev/test environment](office-365-dev-test-environment.md).
  
If you want to test Advanced eDiscovery in a simulated enterprise, follow the instructions in [DirSync for your Office 365 dev/test environment](dirsync-for-your-office-365-dev-test-environment.md).
  
> [!NOTE]
> Testing Advanced eDiscovery does not require the simulated enterprise environment, which includes a simulated intranet connected to the Internet and directory synchronization for an Active Directory Domain Services (AD DS) forest. It is provided here as an option so that you can perform testing and experimentation in an environment that represents a typical organization. 
  
## Phase 2: Create example data for Advanced eDiscovery

In this procedure, you create email messages that will you later analyze in an Advanced eDiscovery case.
  
1. Open Internet Explorer and sign in at [https://outlook.com](https://outlook.com) to the Outlook account you created in Phase 2 of[Office 365 dev/test environment](office-365-dev-test-environment.md).
    
  - If you are using the lightweight dev/test environment, open a private session of Internet Explorer and sign in from your local computer.
    
  - If you are using the simulated enterprise dev/test environment, use the Azure portal ([https://portal.azure.com](https://portal.azure.com)) to connect to the CLIENT1 virtual machine, and then sign in from CLIENT1.
    
2. On the **Outlook Mail** tab, click **New**.
    
3. In **To**, type the email address of the User6 account of your trial subscription ( **user6@.**<organization name> **.onmicrosoft.com**).
    
4. For the subject, type **Test email 1**.
    
5. In the body, type **Tailspin contract draft**, and then click **Send**.
    
6. On the **Outlook Mail** tab, click **New**.
    
7. In **To**, type the email address of the User6 account of your trial subscription.
    
8. For the subject, type **Test email 2**.
    
9. In the body, type **Tailspin lunch meeting**, and then click **Send**.
    
10. On the **Outlook Mail** tab, click **New**.
    
11. In **To**, type the email address of the User6 account of your trial subscription.
    
12. For the subject, type **Test email 3**.
    
13. In the body, type **Tailspin contract disagreement**, and then click **Send**.
    
14. Click the user icon in the upper right corner, and then click **Sign out**.
    
15. Open a new tab and sign in to the Office 365 portal ([https://www.office.com](https://www.office.com)) with the account name and password of the User6 account of your trial subscription.
    
16. On the **Office 365 portal** tab, click **Mail**.
    
17. On the **Mail - User6 - Outlook** tab, check that User6 received all three emails from the Outlook email account.
    
18. Switch back to the **Office 365 portal tab** for User6.
    
19. Click the user icon in the upper right corner, and then click **Sign out.**
    
In this procedure, you create two Word documents that will you will later analyze in an Advanced eDiscovery case.
  
1. On the **Office** page, click **Sign in,** sign in with the credentials of your global administrator account.
    
2. On a new tab, access the URL of your Production SharePoint site: **https://**<fictional organization name> **.sharepoint.com/sites/production**
    
3. On the **Production site collection** tab, under **Documents**, click **New > Word Document**.
    
4. On the **Word Online** page, type **Tailspin draft contract**, wait until it displays **Saved** in the title, and then close the **Word Online** page tab.
    
5. On the **Production site collection** tab, under **Documents**, click **New > Word Document**.
    
6. On the **Word Online** tab, type **Tailspin contract dispute notes**, wait until it displays **Saved** in the title, and then close the **Word Online** tab.
    
7. On the **Production site collection** tab, you should see **Document** and **Document1** in the list of documents.
    
8. Close the **Production site collection** tab.
    
## Phase 3: Use Advanced eDiscovery for a legal dispute

Unfortunately, a contract dispute between your organization and Tailspin Toys has reached the point of legal action. In this procedure, you create and configure an Advanced eDiscovery case to search for and analyze email and documents that contain the text "Tailspin contract".
  
The process for using Advanced eDiscovery is the following:
  
- Create a search in the Security &amp; Compliance center, analyze its results, and then prepare the results for Advanced eDiscovery.
    
- Create and configure a case in Advanced eDiscovery and analyze the search results.
    
In this procedure, you create a search in the Security &amp; Compliance center for "Tailspin contract", look at the results, and then prepare the results for Advanced eDiscovery.
  
1. From the **Office 365 portal** tab, click **Admin**.
    
2. In the left navigation of the Admin center tab, click **Admin centers > Compliance**.
    
3. On the **Security &amp; Compliance** tab, click **Permissions**.
    
4. In the **Permissions** list, double-click **Organization Management**.
    
5. In the **Role Group** window, under **Members**, click the plus sign.
    
6. In the **Select Members** window, double-click the name of your administrator account, and then click **OK**.
    
7. In the **Role Group** window, click **Save**.
    
8. In the **Permissions** list, double-click **eDiscovery Manager**.
    
9. In the **Role Group** window, under **eDiscovery Administrator**, click the plus icon.
    
10. In the **Select Members** window, double-click the name of your administrator account, and then click **OK**.
    
11. In the **Role Group** window, click **Save**.
    
12. In the left navigation, click **Search &amp; Investigation > Content search**.
    
13. Click the plus icon to add a search.
    
14. In the **New search** window, type **Tailspin contract search** in **Name**.
    
15. In **Where do you want us to look?**, click **Search everywhere,** select **Exchange**, **SharePoint**, and **Public Folders**, and then click **Next.**
    
16. In **What do you want us to look for?**, type **Tailspin contract**, and then click **Search**.
    
17. In the list of searches, click the **Tailspin contract search** name.
    
18. In the **Tailspin contract search** pane, click **Preview search results** under **Results**. You should see a window listing the two documents on the Production SharePoint site ( **Document** and **Document1**) and the **Test email 1** and **Test email 3** emails to User6. Close the window.
    
19. In the **Content search** pane, under **Analyze results with Advanced eDiscovery**, click **Preview results for analysis**.
    
20. In the **Prepare the search results for Tailspin contract search** window, click **Prepare** and wait for it to complete.
    
In this procedure, you create a new case for Advanced eDiscovery and analyze the Tailspin contract search results.
  
1. In the left navigation, click **eDiscovery** under **Search &amp; Investigation**.
    
2. In the **eDiscovery** pane, click **Go to Advanced eDiscovery**.
    
3. In the **Advanced eDiscovery** tab, click the plus icon to add a new case.
    
4. In the **Add case** pane, type **Tailspin contract dispute** in **Name**, and then click **OK**. Wait for the case to be created.
    
5. Double click the **Tailspin contract dispute** case in the list.
    
6. In the **Container** list, click the **Tailspin contract search** container, and then click **Process**. Wait for the processing to complete.
    
7. When **Process: completed** appears at the bottom of the window, click **Process summary** in the left navigation to see a summary.
    
8. In the top navigation, click **Analyze**.
    
9. On the **Setup** page, under **Themes**, type **3** in **Max number of themes**.
    
10. Click **Analyze** and wait for the analysis to complete. You should see a series of pie charts with analysis of the target population, documents, emails, and attachments. For more information, see [Viewing Analyze results](https://support.office.com/article/Viewing-Analyze-results-5974f3c2-89fe-4c5f-ac7b-57f214437f7e).
    
You can now use this environment to create new content, new searches and cases, and experiment further with Advanced eDiscovery in Office 365.
  
## See Also

[Cloud adoption Test Lab Guides (TLGs)](cloud-adoption-test-lab-guides-tlgs.md)
  
[Base Configuration dev/test environment](base-configuration-dev-test-environment.md)
  
[Office 365 dev/test environment](office-365-dev-test-environment.md)
  
[DirSync for your Office 365 dev/test environment](dirsync-for-your-office-365-dev-test-environment.md)
  
[Cloud App Security for your Office 365 dev/test environment](cloud-app-security-for-your-office-365-dev-test-environment.md)
  
[Cloud adoption and hybrid solutions](cloud-adoption-and-hybrid-solutions.md)

[Office 365 Advanced eDiscovery](https://support.office.com/article/Office-365-Advanced-eDiscovery-fd53438a-a760-45f6-9df4-861b50161ae4)


