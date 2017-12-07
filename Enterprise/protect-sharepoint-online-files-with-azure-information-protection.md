---
title: "Protect SharePoint Online files with Azure Information Protection"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 11/16/2017
ms.audience: ITPro
ms.topic: article
ms.service: Office 365
localization_priority: Normal
ms.collection:
- Ent_O365
- Ent_O365_Top
ms.custom:
- DecEntMigration
- Strat_O365_Enterprise
- Ent_Solutions
ms.assetid: 5b9c8e41-25d2-436d-89bb-9aecb9ec2b80
description: "Summary: Apply Azure Information Protection to protect files in a highly confidential SharePoint Online team site."
---

# Protect SharePoint Online files with Azure Information Protection

 **Summary:** Apply Azure Information Protection to protect files in a highly confidential SharePoint Online team site.
  
Use the steps in this article to configure Azure Information Protection to provide encryption and permissions for files in a highly confidential SharePoint Online team site. The encryption and permissions protection travels with a file even when it is downloaded from the site. For more information about highly confidential SharePoint Online team sites, see [Secure SharePoint Online sites and files](secure-sharepoint-online-sites-and-files.md).
  
> [!NOTE]
> When Azure Information Protection encryption is applied to files stored in Office 365, the service cannot process the contents of these files. Co-authoring, eDiscovery, search, Delve, and other collaborative features do not work. Data Loss Prevention (DLP) policies can only work with the metadata (including Office 365 labels) but not the contents of these files (such as credit card numbers within files). 
  
First, use the instructions in [Activate Azure RMS with the Office 365 admin center](https://docs.microsoft.com/information-protection/deploy-use/activate-office365) for your Office 365 subscription.
  
Next, configure Azure Information Protection with a new scoped policy and sub-label for protection and permissions of your highly confidential SharePoint Online team site.
  
1. Sign in to the Office 365 portal with an account that has the Security Administrator or Company Administrator role. For help, see [Where to sign in to Office 365](https://support.office.com/Article/Where-to-sign-in-to-Office-365-e9eb7d51-5430-4929-91ab-6157c5a050b4).
    
2. In a separate tab of your browser, go to the Azure portal ([https://portal.azure.com](https://portal.azure.com)).
    
3. If this is the first time you are configuring Azure Information Protection, see these [instructions](https://docs.microsoft.com/information-protection/deploy-use/configure-policy#to-access-the-azure-information-protection-blade-for-the-first-time).
    
4. In the list pane, click **More services**, type **information**, and then click **Azure Information Protection**.
    
5. On the **Azure Information protection** blade, , click **Scoped policies > + Add a new policy**.
    
6. Type a name for the new policy in **Policy name** and a description in **Description**.
    
7. Click **Select which users or groups get this policy > User/Groups**, and then select the site members access group for your highly sensitive SharePoint Online team site. 
    
8. Click **Select > OK**.
    
9. For the **Highly Confidential** label, click the ellipses (…), and then click **Add a sub-label**.
    
10. Type a name for the sub-label in **Name** and a description of the label in **Description**.
    
11. In **Set permissions for documents and emails containing this label**, click **Protect**.
    
12. In the **Protection** section, click **Azure (cloud key)**.
    
13. On the **Protection** blade, under **Protection settings**, click **+ Add permissions**.
    
14. On the **Add permissions** blade, under **Specify users and groups**, click **+ Browse directory**.
    
15. On the **AAD Users and Groups** pane, select the site members access group for your highly sensitive SharePoint Online team site, and then click **Select**.
    
16. Under **Choose permissions from the preset**, clear the **Print**, **Copy and extract content**, and **Forward** check boxes.
    
17. Click **OK** twice.
    
18. On the **Sub-label** blade, click **Save**.
    
19. Close the new scoped policy blade.
    
20. On the **Azure Information protection - Scoped policies** blade, click **Publish**.
    
This is your resulting configuration for your highly confidential SharePoint Online team site.
  
![Azure Information Protection label for an isolated SharePoint Online team site.](images/8cc92aa4-e7bc-4c2f-a4a4-3b034b21aebf.png)
  
You are now ready to begin creating documents and protecting them with Azure Information Protection and your new label.
  
You must [install the Azure Information Protection client](https://docs.microsoft.com/information-protection/rms-client/install-client-app) on your device or Windows-based computer. You can script and automate the installation, or users can install the client manually. See the following resources:
  
- [The client side of Azure Information Protection](https://docs.microsoft.com/information-protection/rms-client/use-client)
    
- [Installing the Azure Information Protection client](https://docs.microsoft.com/information-protection/rms-client/client-admin-guide)
    
- [Download page for manual installation](https://www.microsoft.com/download/details.aspx?id=53018)
    
Once installed, your users run and then sign-in from an Office application (such as Microsoft Word) with their Office 365 account. A new **Information Protection** bar allows users to select the new label. Make sure that your users know the SharePoint Online team site and which label to use, to protect their highly confidential files.
  
> [!NOTE]
> If you have multiple highly sensitive SharePoint Online team sites, you should create multiple Azure Information Protection scoped policies with sub-labels with the above settings, with the permissions for each sub-label set to the site members access group of a specific SharePoint Online team site. 
  
## See Also

#### 

[Secure SharePoint Online sites and files](secure-sharepoint-online-sites-and-files.md)
  
[Secure SharePoint Online sites in a dev/test environment](secure-sharepoint-online-sites-in-a-dev-test-environment.md)
  
[Microsoft Security Guidance for Political Campaigns, Nonprofits, and Other Agile Organizations](microsoft-security-guidance-for-political-campaigns-nonprofits-and-other-agile-o.md)
  
[Cloud adoption and hybrid solutions](cloud-adoption-and-hybrid-solutions.md)

