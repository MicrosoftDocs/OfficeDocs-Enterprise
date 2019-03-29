---
title: "View directory synchronization status in Office 365"
ms.author: robmazz
author: robmazz
manager: laurawi
ms.audience: Admin
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.custom: Adm_O365
ms.collection:
- Ent_O365
- M365-identity-device-management
search.appverid:
- MET150
- MOE150
- MED150
ms.assetid: 18be3b98-34ae-47be-9337-ab6c3fb372ac
description: "Learn how to deactivate directory synchronization. You can also view its status."
---

# View directory synchronization status in Office 365

If you have integrated your on-premises Active Directory with Azure AD by synchronizing your on-premises environment with Office 365, you can also check the status of your synchronization.
  
## View directory synchronization status

- Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com) and choose **DirSync Status** on the home page.
- Alternately, you can go to **Users** \> **Active users**, and on the **Active users** page, choose **More** \> **Directory synchronization**. On the **Directory Synchronization** pane, choose **Go to DirSync management**.

## Information on the Manage directory synchronization page

The following table lists the features you can get information about on the page.
  
If there is a problem with your directory synchronization, the errors are listed on this page as well. For more information about different errors you might encounter, see [Identify directory synchronization errors in Office 365](identify-directory-synchronization-errors.md).
  
|**Item**|**What it's for**|
|:-----|:-----|
|**Domains verified** | Number of domains in your Office 365 tenant that you have verified you own. |
|**Domains not verified** | Domains you have added, but not verified. |
|**Directory sync enabled** |True or False. Specifies whether you have enabled directory sync. |
|**Latest directory sync** | Last time directory sync ran. Will display a warning and a link to a troubleshooting tool if the last sync was more than three days ago. |
|**Password sync enabled** | True or False. Specifies whether you have password hash sync between our on-premises and your Office 365 tenant. |
|**Last Password Sync** | Last time password hash sync ran. Will display a warning and a link to a troubleshooting tool if the last sync was more than three days ago. |
|**Directory sync client version** | Contains a download link if a new version of Azure AD Connect has been released. |
|**IDFix Tool** | Download link to [IDFix](install-and-run-idfix.md), a tool you can use to check you local Active Directory. |
|**Directory sync service account** | Displays the name of you Office 365 directory sync service account. |