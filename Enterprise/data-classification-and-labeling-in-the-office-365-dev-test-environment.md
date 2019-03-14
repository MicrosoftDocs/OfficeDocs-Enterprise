---
title: "Data classification and labeling in the Office 365 dev/test environment"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 12/15/2017
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
ms.assetid: 919b8fc7-b0bc-46db-91f5-37342564e01b
description: "Summary: Configure and demonstrate data classification and labeling using the Azure Information Protection (AIP) client in your Office 365 dev/test environment."
---

# Data classification and labeling in the Office 365 dev/test environment

 **Summary:** Configure and demonstrate data classification and labeling using the Azure Information Protection (AIP) client in your Office 365 dev/test environment.
  
The Azure Information Protection client lets you classify a document before you upload it to a SharePoint Online folder in Office 365. With the instructions in this article, you install the Azure Information Protection client and demonstrate data classification. For more information, see [Azure Information Protection](https://www.microsoft.com/cloud-platform/azure-information-protection).
  
> [!TIP]
> Click [here](http://aka.ms/catlgstack) for a visual map to all the articles in the One Microsoft Cloud Test Lab Guide stack.
  
## Phase 1: Build out your Office 365 dev/test environment

Follow the instructions in [Office 365 dev/test environment](office-365-dev-test-environment.md).
  
## Phase 2: Add the Azure Information Protection trial subscription

In this phase, you add Azure Information Protection to your Office 365 dev/test environment and enable it for your user accounts. If you have configured the [Office 365 and EMS dev/test environment](http://technet.microsoft.com/library/c76eea86-d4b6-4d35-ad89-341696e89ef7.aspx), skip this phase. The Enterprise Mobility Suite trial subscription includes Azure Information Protection licenses.
  
First, sign up for an Azure Information Protection trial subscription.
  
### Sign up for an Azure Information Protection trial subscription

1. In Internet Explorer or your browser, go to [http://admin.microsoft.com](http://admin.microsoft.com) and sign in with your Office 365 global administrator account.
    
2. On the **Microsoft Office Home** tab, click the **Admin** tile.
    
3. On the Office 365 Admin tab, in the left navigation, click **Billing > Purchase services**.
    
4. On the **Purchase services** page, find the **Azure Information Protection Premium P2** item. Hover your mouse over it and click **Start free trial**.
    
5. On the **Confirm your order** page, click **Try now**.
    
6. On the **Order receipt** page, click **Continue**.
    
Next, you enable the Azure Information Protection license for all user accounts.
  
1. On the Microsoft 365 admin center tab, click **Users**.
    
2.  In the list of user accounts, select your global administrator account, and then click **Edit** for **Product licenses**.
    
3. Turn the product license for **Azure Information Protection Premium P2** to **On**, click **Save,** and then click **Close** twice.
    
4. Repeat steps 2 and 3 for your other user accounts (User 1 through User 5).
    
Your Office 365 dev/test environment now has:
  
- Office 365 E5 Enterprise and Azure Information Protection trial subscriptions.
    
- All of your user accounts enabled to use both Office 365 E5 Enterprise and Azure Information Protection.
    
## Phase 3: Demonstrate data classification

In this phase, you demonstrate data classification using the Azure Information Protection client and the default Azure Information Protection policy.
  
If you are using the simulated enterprise Office 365 dev/test environment, you must first install Office 2016 on CLIENT1.
  
1. Use your browser and go to the [Azure portal](http://portal.azure.com).
    
2. Click **Resource Groups >** [your resource group name] **> CLIENT1 > Connect**.
    
3. From CLIENT1, run Internet Explorer, go to the Office portal at [http://admin.microsoft.com](http://admin.microsoft.com), and then sign in with the User5 account name and password.
    
4. On the **Microsoft Office Home** tab, click **Install Office 2016**.
    
5. Run the download when prompted and click **Yes** when prompted by User Account Control. Wait for Office to install. When complete, click **Close** twice.
    
Next, you install the Azure Information Protection client.
  
1. In your browser or Internet Explorer, go to the [Microsoft Azure Information Protection download page](https://www.microsoft.com/download/details.aspx?id=53018).
    
  - If you are using the lightweight version of the Office 365 dev/test environment, use the browser on your local computer.
    
  - If you are using the simulated enterprise Office 365 dev/test environment, run Internet Explorer from CLIENT1.
    
2. On the **Microsoft Azure Information Protection** download page, click **Download**, click **AzInfoProtection.exe**, and then click **Next**.
    
3. When prompted, run AzInfoProtection.exe.
    
4. In the **Install the Azure Information Protection** client box, click **I agree**, and then click **Yes** when prompted by User Account Control.
    
5. In the **Completed successfully** box, click **Close.**
    
Next, you demonstrate document classification.
  
1. Click the **Word** icon in the taskbar.
    
2. When prompted, sign in with the User5 account name and password.
    
3. If you just installed Office 2016 on CLIENT1, in the **First things first** box, click **Accept**.
    
4. Click **Blank document**. 
    
    Note the **Protection** section of the ribbon on the **Home** tab and the row of document classifications.
    
5. In the blank document, type some text.
    
6. Click **File > Save**, type the name **BeforeAIP**, and then click **OK**. 
    
7. In the row of document classes, click the down arrow for **Secret**, and then click **All Company**.
    
8. Click **File > Save As**, type the name **AfterAIP**, and then click **OK**.
    
9. Click **File Explorer** in the taskbar, and then open the **Documents** folder.
    
    Note the different file sizes of the **BeforeAIP** and **AfterAIP** documents. The AfterAIP document is larger because it has the classification information.
    
Next, you allow everyone to access the Support site collection.
  
1. On the **Microsoft Office Home** tab, click **SharePoint**.
    
2. From the **SharePoint** tab, click **Support site collection**.
    
3. In the upper right, click the **Settings** icon, and then click **Shared with**.
    
4. In **Share 'Support site collection'**, click **Advanced**.
    
5. In the list of SharePoint groups, click **Support site collection Members**.
    
6. On the **People and Groups** page, click **New**.
    
7. In **Share 'Support site collection'**, type **Everyone**, click **Everyone except external users**, and then click **Share.**
    
8. Close the **People and Groups** tab.
    
Next, you sign in with your User5 account and upload the AIP-protected document to the Documents folder of the Support site collection.
  
1. On the **Microsoft Office Home** tab, in the upper right, click the user icon, and then click **Sign out**.
    
2. Go to [http://admin.microsoft.com](http://admin.microsoft.com).
    
3. On the **Office 365 sign in** page, click the User5 account name and sign in.
    
4. On the **Microsoft Office Home** tab, click **SharePoint > Support site collection**.
    
5. Click **Documents**, click **Upload**, click the **AfterAIP** document, and then click **Open**.
    
    You should see AfterAIP.docx in the Documents folder on the Support site collection.
    
## See Also

[Cloud adoption Test Lab Guides (TLGs)](cloud-adoption-test-lab-guides-tlgs.md)

[Office 365 and EMS dev/test environment](http://technet.microsoft.com/library/c76eea86-d4b6-4d35-ad89-341696e89ef7.aspx)
  
[Azure Information Protection](https://www.microsoft.com/cloud-platform/azure-information-protection)


