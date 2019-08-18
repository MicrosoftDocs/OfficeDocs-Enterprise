---
title: "Sensitive file protection in the Office 365 dev/test environment"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 04/01/2019
audience: ITPro
ms.topic: article
ms.service: o365-solutions
localization_priority: Normal
search.appverid:
- MET150
ms.collection: Ent_O365
ms.custom: 
- TLG
- Ent_TLGs
ms.assetid: 27ecff45-06a6-4629-bc45-9dab4eef3a21
description: "Summary: Configure and demonstrate how Office 365 Information Rights Management protects your sensitive files, even when they are posted to the wrong SharePoint Online site collection."
---

# Sensitive file protection in the Office 365 dev/test environment

 **Summary:** Configure and demonstrate how Office 365 Information Rights Management protects your sensitive files, even when they are posted to the wrong SharePoint Online site collection.
  
Information Rights Management (IRM) in Office 365 is a set of capabilities to protect documents that are downloaded from SharePoint Online libraries and lists. Downloaded files are encrypted and contain the open, copy, save, and print permissions that reflect the SharePoint Online library in which they were stored.
  
With the instructions in this article, you enable and test IRM in Office 365 for files containing possible sensitive information in your Office 365 trial subscription.
  
> [!TIP]
> Click [here](http://aka.ms/catlgstack) for a visual map to all the articles in the Office 365 Test Lab Guide stack.
  
## Phase 1: Build out your Office 365 dev/test environment

If you just want to test sensitive file protection in a lightweight way with the minimum requirements, follow the instructions in phases 2 and 3 of [Office 365 dev/test environment](office-365-dev-test-environment.md).
  
If you want to test sensitive file protection in a simulated enterprise, follow the instructions in [DirSync for your Office 365 dev/test environment](dirsync-for-your-office-365-dev-test-environment.md).
  
> [!NOTE]
> Testing sensitive file protection does not require the simulated enterprise dev/test environment, which includes a simulated intranet connected to the Internet and directory synchronization for a Active Directory Domain Services (AD DS) forest. It is provided here as an option so that you can test sensitive file protection and experiment with it in an environment that represents a typical organization. 
  
## Phase 2: Demonstrate how documents from permissions-protected sites can be leaked

In this phase, you demonstrate that someone can download a document from a permissions-protected site and then upload it to a site that has wide-open permissions.
  
First, you add three new user accounts that represent executives and assign them Office 365 E5 licenses.
  
Use the instructions in [Connect to Office 365 PowerShell](https://technet.microsoft.com/library/dn975125.aspx) to install the PowerShell modules (if needed) and connect to your new Office 365 subscription from:
  
- Your computer (for the lightweight Office 365 dev/test environment).
    
- The CLIENT1 virtual machine (for the simulated enterprise Office 365 dev/test environment).
    
In the **Windows PowerShell Credential Request** dialog box, type the Office 365 global administrator name (example: jdoe@contosotoycompany.onmicrosoft.com) and password of your Office 365 trial subscription.
  
Fill in your organization name (example: contosotoycompany) and the two-character country code for your location, and then run the following commands from the Windows Azure Active Directory Module for Windows PowerShell prompt:
  
```
$orgName="<organization name>"
$loc="<two-character country code, such as US>"
$licAssignment= $orgName + ":ENTERPRISEPREMIUM"
$userName= "ceo@" + $orgName + ".onmicrosoft.com"
New-MsolUser -DisplayName "CEO" -FirstName "Chief" -LastName "Executive Officer" -UserPrincipalName $userName -UsageLocation $loc -LicenseAssignment $licAssignment

```

From the display of the **New-MsolUser** command, note the generated password for the CEO account and record it in a safe location.
  
Run the following commands from the Windows Azure Active Directory Module for Windows PowerShell prompt:
  
```
$userName= "cfo@" + $orgName + ".onmicrosoft.com"
New-MsolUser -DisplayName "CFO" -FirstName "Chief" -LastName "Financial Officer" -UserPrincipalName $userName -UsageLocation $loc -LicenseAssignment $licAssignment

```

From the display of the **New-MsolUser** command, note the generated password for the CFO account and record it in a safe location.
  
Run the following commands from the Windows Azure Active Directory Module for Windows PowerShell prompt:
  
```
$userName= "coo@" + $orgName + ".onmicrosoft.com"
New-MsolUser -DisplayName "COO" -FirstName "Chief" -LastName "Operations Officer" -UserPrincipalName $userName -UsageLocation $loc -LicenseAssignment $licAssignment

```

From the display of the **New-MsolUser** command, note the generated password for the COO account and record it in a safe location.
  
Next, you create a private Executives group and add the new executive accounts to it.
  
1. In your browser, go to the Office portal at [http://admin.microsoft.com](http://admin.microsoft.com) and sign in to your Office 365 trial subscription with your global administrator account.
    
  - If you are using the lightweight Office 365 dev/test environment, open a private session of Internet Explorer or your browser and sign in from your local computer.
    
  - If you are using the simulated enterprise Office 365 dev/test environment, use the Azure portal to connect to the CLIENT1 virtual machine, and then sign in from CLIENT1.
    
2. On the **Microsoft Office Home** tab, click **Admin > Groups > Groups**, and then click **Add a group**.
    
3. In **Add a group**, select **Office 365 group** for the group type, type **Executives** in **Name** and **Group Id**, select **Private** for **Privacy**, and then click **Select Owner**.
    
4. In the list, click your global administrator account name.
    
5. Click **Add**, and then click **Close**.
    
6. In the groups list, click **Executives**.
    
7. Click **Edit for Members**.
    
8. Click **Add members**. In the member list, select the following user accounts:
    
  - Chief Executive Officer
    
  - Chief Financial Officer
    
  - Chief Operations Officer
    
9. Click **Save**, and then click **Close**.
    
10. Close the **Office Admin center** tab.
    
Next, you create an Executives site collection and allow just the members of the Executives group to access it.
  
1. On the **Microsoft Office Home** tab, click the **Admin** tile.
    
2. On the **Office Admin center** tab, click **Admin centers > SharePoint**.
    
3. On the **SharePoint admin center** tab, click **New > Private site collection**.
    
4. In the new site collection pane, type **Executives** in **Title**, executives in the URL box, specify the name of your global administrator account in **Administrator**, and then click **OK**.
    
5. Wait until the new site collection has been created. When complete, copy the URL of the new Executives site collection and paste it into a new tab of your browser.
    
6. In the upper right of the **Executives** site collection, click the settings icon, and then click **Shared with**.
    
7. In **Share 'Executives'**, click **Advanced**.
    
8. In the list of SharePoint groups, click **Executives Members**.
    
9. On the **People and Groups** page, click **New**.
    
10. In **Share 'Executives'**, type **Executives**, click the **Executives** group, and then click **Share**.
    
11. Close the **People and groups** tab.
    
Next, you allow everyone to access the Sales site collection.
  
1. From the **SharePoint admin center** tab, copy the URL of the Sales site collection and paste it into a new tab of your browser..
    
2. In the upper right, click the settings icon, and then click **Shared with**.
    
3. In **Share 'Sales site collection'**, click **Advanced**.
    
4. In the list of SharePoint groups, click **Sales site collection Members**.
    
5. On the **People and Groups** page, click **New**.
    
6. In **Share 'Sales site collection'**, type **Everyone**, click **Everyone except external users**, and then click **Share**.
    
7. Close the **Sales site collection** and **SharePoint** tabs.
    
Next, you sign in with an executive account and create a document in the Executives site collection.
  
1. On the **Microsoft Office Home** tab, click the user icon in the upper-right, and then click **Sign out**.
    
2. Go to [http://admin.microsoft.com](http://admin.microsoft.com).
    
3. On the **Office 365 sign in** page, click **Use another account**.
    
4. Type the **CEO** account name and its password, and then click **Sign in**.
    
5. On a new tab of your browser, type the URL to the Executives site collection ( **https://**\<organization name>**.sharepoint.com/sites/executives**).
    
6. Click **Documents**, click **New,** and then click **Word Document**.
    
7. Click in the title bar and type **SensitiveData-BeforeIRM**.
    
8. Click in the document body and type **Minutes from the latest board meeting**, and then click **Executives**.
    
     You should see **SensitiveData-BeforeIRM.docx** in the **Documents** folder.
    
Next, you download a local copy of the SensitiveData-BeforeIRM.docx document and then accidentally post it to the Sales site collection.
  
1. On your local computer, create a new folder (for example, C:\\TLGs\\SensitiveDataTestFiles).
    
2. On the **Documents** tab of your browser, select the **SensitiveData-BeforeIRM.docx** document, click the ellipses, and then click **Download**.
    
3. Store the **SensitiveData-BeforeIRM.docx** document in the folder created in step 1.
    
4. On a new tab of your browser, type the URL to the Sales site collection ( **https://**\<organization name>**.sharepoint.com/sites/sales**).
    
5. Click the **Documents** folder of the **Sales site collection**.
    
6. Click **Upload**, and then specify **SensitiveData-BeforeIRM.docx** document in the folder created in step 1, and then click **OK**.
    
7. Verify that the **SensitiveData-BeforeIRM.docx** document is in the **Documents** folder.
    
8. Close the **Sales** and **SharePoint** tabs.
    
Next, you sign in as User5 and try to open the SensitiveData-BeforeIRM.docx document in the Sales site collection.
  
1. On the **Microsoft Office Home** tab, click the user icon in the upper-right, and then click **Sign out**.
    
2. Go to [http://admin.microsoft.com](http://admin.microsoft.com).
    
3. On the **Office 365 sign in** page, click **Use another account**.
    
4. Type the User5 account name and its password, and then click **Sign in**.
    
5. On a new tab of your browser, type the URL to the Sales site collection.
    
6. In the **Documents** folder of the **Sales site collection**, click the **SensitiveData-BeforeIRM.docx** document.
    
    You should see its contents.
    
7. Close the **Documents** and **Sales site collection** tabs.
    
By accidentally posting the SensitiveData-BeforeIRM.docx document on the Sales site collection, the CEO bypassed the permissions security of the Executives site collection.
  
To prepare Office 365 for Phases 3 and 4, enable IRM for SharePoint Online.
  
1. On the **Microsoft Office Home** tab, click the user icon in the upper-right, and then click **Sign out**.
    
2. Go to [http://admin.microsoft.com](http://admin.microsoft.com).
    
3. On the **Office 365 sign in** page, click the global administrator account name, type its password, and then click **Sign in**.
    
4. On the **Microsoft Office Home** tab, click **Admin > Admin centers > SharePoint**.
    
5. On the **SharePoint admin center** tab, click **Settings**.
    
6. On the page, in the **Information Rights Management (IRM)** section, select **Use the IRM service specified in your configuration**, and then select **Refresh IRM Settings**.
    
7. Close the **SharePoint admin center** tab.
    
## Phase 3: Use SharePoint Information Rights Management with an Office 365 private group

In this phase, you use SharePoint Information Rights Management with an Office 365 private group to protect access to a document with sensitive information, even when it is posted on a site with open permissions.
  
First, you enable and configure IRM for the documents library of the Executives site collection. 
  
1. On a new tab of your browser, type the URL to the Executives site collection.
    
2. Click **Documents**.
    
3. In the upper-right, click the settings icon, and then click **Library settings**.
    
4. On the **Settings** page, under **Permissions and Management**, click **Information Rights Management**.
    
5. On the **Information Rights Management Settings** page:
    
  - Select **Restrict permission to documents in this library on download**.
    
  - For **Create a permission policy title**, type **Executives**.
    
  - For **Add a permission policy description**, type **IRM for executives**.
    
6. Click **Show Options**.
    
7. Under **Set additional IRM library settings**, select **Do not allow users to upload documents that do not support IRM**.
    
8. Under **Configure document access rights**, select **Allow viewers to print** and **Allow viewers to write on a copy of the downloaded document**.
    
9. Under **Set group protection and credentials interval**, select **Allow group protection. Default group**, and then type **Executives**.
    
10. Click **OK**.
    
Next, acting as the CEO, you upload a new document to the Executives document folder, download it, then accidentally upload it to the Sales document folder.
  
1. Open the local folder where you stored the **SensitiveData-BeforeIRM.docx** document.
    
2. Right-click **SensitiveData-BeforeIRM.docx**, and then click **Copy**.
    
3. Right-click within the folder, and then click **Paste**.
    
4. Rename the new **SensitiveData-BeforeIRM - Copy.docx** file to **SensitiveData-AfterIRM.docx**.
    
5. From the **Microsoft Office Home** tab in your browser, click the user icon in the upper-right, and then click **Sign out**.
    
6. Go to [http://admin.microsoft.com](http://admin.microsoft.com).
    
7. On the **Office 365 sign in** page, click the CEO account name, type its password, and then click **Sign in**.
    
8. On a new tab of your browser, type the URL to the Executives site collection.
    
9. On the **Documents** page, click **Upload**, specify the **SensitiveData-AfterIRM.docx** document in your local folder, and then click **Open**.
    
10. Select the new **SensitiveData-AfterIRM.docx** document in the **Documents** page, click the ellipsis (…) in the menu bar, and then click **Download**.
    
11. When prompted, save the **SensitiveData-AfterIRM.docx** document in your local folder, overwriting the original version.
    
12. Close the tab for the **Documents** page.
    
13. On a new tab of your browser, type the URL to the Sales site collection.
    
14. Click **Documents**.
    
15. On the **Documents** page, click **Upload**, specify the **SensitiveData-AfterIRM.docx** document in your local folder, and then click **Open**.
    
16. Close the **Sales site collection** and **SharePoint** tabs.
    
Next, acting as a normal user, you try to access the **SensitiveData-AfterIRM.docx** document in the Sales document folder.
  
1. From the **Microsoft Office Home** tab in your browser, click the user icon in the upper-right, and then click **Sign out**.
    
2. Go to [http://admin.microsoft.com](http://admin.microsoft.com).
    
3. On the **Office 365 sign in** page, click the User5 account name, type its password, and then click **Sign in**.
    
4. On a new tab of your browser, type the URL to the Sales site collection.
    
5. Click **Documents**.
    
6. On the **Documents** page, open the **SensitiveData-AfterIRM.docx** document.
    
    You should see a message that states, "Sorry, Word can't open this document because it's protected by Information Rights Management (IRM)." 
    
7. Click **Edit in Word**. You are prompted if you want to open the file. Click **Yes**.
    
8. You are prompted to sign-in. Type the account name of the User5 account, and then click **Next**.
    
9. You are prompted to provide the password. Type the password for the User5 account and then click **Sign in**. 
    
    You should see the a message that states: "You do not have the credentials that allow you to open this document."
    
10. Click **No**.
    
Another way to see the IRM protection is to look at the files in your local folder. The **SensitiveData-AfterIRM.docx** should be much larger than the **SensitiveData-BeforeIRM.docx** file. The **SensitiveData-AfterIRM.docx** file is encrypted and has the IRM protection information added to it.
  
## See Also

[Cloud adoption Test Lab Guides (TLGs)](cloud-adoption-test-lab-guides-tlgs.md)
  
[Base Configuration dev/test environment](base-configuration-dev-test-environment.md)
  
[Office 365 dev/test environment](office-365-dev-test-environment.md)
  
[Cloud adoption and hybrid solutions](cloud-adoption-and-hybrid-solutions.md)


