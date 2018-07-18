---
title: "Manage Office 365 Groups with PowerShell"
ms.author: dianef
author: dianef77
manager: scotv
ms.date: 6/29/2018
ms.audience: Admin
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.custom: Adm_O365
search.appverid:
- MOE150
- MED150
- MBS150
- BSA160
- BCS160
ms.assetid: aeb669aa-1770-4537-9de2-a82ac11b0540
description: "Last updated 18 April, 2018"
---

# Manage Office 365 Groups with PowerShell

 *Last updated 18 April, 2018* 
  
This article provides the steps for doing common management tasks for Groups in Microsoft PowerShell. It also lists the PowerShell cmdlets for Groups. For info about managing SharePoint sites, see [Manage team sites and communication sites by using PowerShell](https://support.office.com/article/52ecc2ab-88c3-486e-b8ff-ef6a968ccd87).
  
## Common tasks for managing Office 365 Groups

- [Upgrade distribution lists to Office 365 Groups in Outlook](https://support.office.com/article/787d7a75-e201-46f3-a242-f698162ff09f)
    
- [Manage who can create Office 365 Groups](https://support.office.com/article/4c46c8cb-17d0-44b5-9776-005fced8e618)
    
- [Manage guest access to Office 365 Groups](https://support.office.com/article/7c713d74-a144-4eab-92e7-d50df526ff96)
    
- [Manage groups dynamically in Azure Active Directory](https://go.microsoft.com/fwlink/?linkid=847632)
    
- Add hundreds or thousands of users to Office 365 groups, use the [Add-UnifiedGroupLinks cmdlet](https://go.microsoft.com/fwlink/p/?LinkId=616191).
    
### Link to your Office 365 Groups usage guidelines
<a name="BK_LinkToGuideLines"> </a>

When users [Create a group in Outlook](https://support.office.com/article/04d0c9cf-6864-423c-a380-4fa858f27102), you can show them a link to your organization's usage guidelines. For example, if you require a specific prefix or suffix to be added to a group name.
  
Use the Azure Active Directory PowerShell to point your users to your organization's usage guidelines for Office 365 groups. Check out [Azure Active Directory cmdlets for configuring group settings](https://go.microsoft.com/fwlink/?LinkID=827484) and follow the steps in the **Create settings at the directory level** to define the usage guideline hyperlink. Once you run the AAD cmdlet, user's will see the link to your guidelines when they create or edit a group in Outlook. 
  
![Create a new group with usage guidelines link](./../media/3f74463f-3448-4f24-a0ec-086d9aa95caa.png)
  
![Click Group usage guidelines to see your organizations Office 365 groups guidelines](./../media/d0d54ace-f0ec-4946-b2de-50ce23f17765.png)
  
### Allow users to Send as the Office 365 Group
<a name="BK_LinkToGuideLines"> </a>

You can also do this in the Exchange Admin Center. See [Allow members to send as or send on behalf of a Group](https://support.office.com/article/0ad41414-0cc6-4b97-90fb-06bec7bcf590).
  
If you want to enable your Office 365 groups to "Send As", use the [Add-RecipientPermission](https://go.microsoft.com/fwlink/p/?LinkId=723960) and the [Get-RecipientPermission](https://go.microsoft.com/fwlink/p/?LinkId=733239) cmdlets to configure this. Once you enable this setting, Office 365 group users can use Outlook or Outlook on the web to send and reply to email as the Office 365 group. Users can go to the group, create a new email, and change the "Send As" field to the group's email address. 
  
> [!NOTE]
> You'll need to add the group email address to the **Cc** field when you compose the "send as" email, so that the message is sent to the Group and appears in group conversations. 
  
At this time, the only way to update the mailbox policy is through [PowerShell](https://technet.microsoft.com/en-us/library/cc482986.aspx).
  
- Use this command to set the group alias.
    
  ```
  $groupAlias = "TestSendAs"
  ```

- Use this command to set the user alias.
    
  ```
  $userAlias = "User"
  ```

- Use this command to pass the groupalias to the Get-Recipient cmdlet to get the recipient details.
    
  ```
  $groupsRecipientDetails = Get-Recipient -RecipientTypeDetails groupmailbox -Identity $groupAlias
  ```

- Then the target recipient name (Group name) needs to be passed to the Add-RecipientPermission cmdlet. The useralias for whom the sendas permission will be given will be assigned to the -Trustee parameter.
    
  ```
  Add-RecipientPermission -Identity $groupsRecipientDetails.Name -Trustee $userAlias -AccessRights SendAs
  ```

- Once the cmdlet is executed, users can go to Outlook or Outlook on the web to send as the group, by adding the group email address to the **From** field. 
    
### Create classifications for Office groups in your organization
<a name="BKMK_CreateClassification"> </a>

You can create classifications that the users in your organization can set when they create an Office 365 group. For example, you can allow users to set "Standard", "Secret", and "Top Secret" on groups they create. Group classifications aren't set by default and you need to create it in order for your users to set it. Use Azure Active Directory PowerShell to point your users to your organization's usage guidelines for Office 365 groups.
  
Check out [Azure Active Directory cmdlets for configuring group settings](https://go.microsoft.com/fwlink/?LinkID=827484) and follow the steps in the **Create settings at the directory level** to define the classification for Office 365 groups. 
  
```
$setting["ClassificationList"] = "Low Impact, Medium Impact, High Impact"
```

In order to associate a description to each classification you can use the settings attribute  *ClassificationDescriptions*  to define. 
  
```
$setting["ClassificationDescriptions"] ="Classification:Description,Classification:Description", where Classification matches the strings in the ClassificationList.
```

For example:﻿
  
```
$setting["ClassificationDescriptions"] = "Low Impact: General communication, Medium Impact: Company internal data , High Impact: Data that has regulatory requirements"
```

After you run the above Azure Active Directory cmdlet to set your classification, run the [Set-UnifiedGroup](https://go.microsoft.com/fwlink/?LinkID=616189) cmdlet if you want to set the classification for a specific group. 
  
```
Set-UnifiedGroup <LowImpactGroup@constoso.com> -Classification <LowImpact> 
```

Or create a new group with a classification.
  
```
New-UnifiedGroup <HighImpactGroup@constoso.com> -Classification <HighImpact> -AccessType <Public> 
```

Check out [Using PowerShell with Exchange Online](https://go.microsoft.com/fwlink/?LinkID=402831) and [Connect to Exchange Online PowerShell](https://go.microsoft.com/fwlink/?LinkID=722415) for more details on using Exchange Online PowerShell. 
  
Once these settings are enabled, the group owner will be able to choose a classification from the drop down menu in Outlook on the Web and Outlook, and save it from the **Edit** group page. 
  
![Choose Office 365 group classification](./../media/f8d4219a-6180-491d-b0e1-4313ac83998b.png)
  
### Hide Office 365 Groups from GAL
<a name="BKMK_CreateClassification"> </a>

You can specify whether a Office 365 group appears in the global ﻿address list (GAL) and other lists in your organization. For example, if you have a legal department group that you don't want to show up in the address list, you can stop that group from appearing in GAL. Run the Set-Unified Group commandlet to hide the group from address list﻿ like this:
  
```
  Set-UnifiedGroup -Identity "Legal Department" -HiddenFromAddressListsEnabled $true
```

### Allow only internal users to send message to Office 365 group
<a name="BKMK_CreateClassification"> </a>

If you don't want users from other organization to send email to a Office 365 group, you can change the settings for that group. It will allow only internal users to send an email to your group. If external user try to send message to that group they will be rejected.
  
Run the Set-UnifiedGroup commandlet to update this setting, like this:
  
```
Set-UnifiedGroup -Identity "Internal senders only" - RequireSenderAuthenticationEnabled $true
```

### Add MailTips to the Office 365 Groups
<a name="BKMK_CreateClassification"> </a>

Whenever a sender tries to send an email to an Office 365 group, a MailTip can be shown to him.
  
Run the Set-Unified Group commandlet to add a mailTip to the group:
  
```
Set-UnifiedGroup -Identity "MailTip Group" -MailTip "This group has a MailTip"
```

Along with MailTip, you can also set MailTipTranslations, which specifies additional languages fro the MailTip. Suppose you want to have the Spanish translation, then run the following command:
  
```
Set-UnifiedGroup -Identity "MailaTip Group" -MailTip "This group has a MailTip" -MailTipTranslations "﻿@{Add="ES:Esta caja no se supervisa."
```

### Change Display name of the Office 365 group
<a name="BKMK_CreateClassification"> </a>

Display name specifies the name of the Office 365 group. You can see this name in your exchange admin center or o365 admin portal. You can edit the display name of the group or assign a display name to an exisiting Office 365 group by running Set-UnifiedGroup command:
  
```
Set-UnifiedGroup -Identity "mygroup@contoso.com" -DisplayName "My new group"
```

### Manage user photos in Office 365 Groups
<a name="BKMK_CreateClassification"> </a>

|
|
|**Cmdlet name**|**Description**|
|:-----|:-----|
|[Get-UserPhoto](https://go.microsoft.com/fwlink/p/?LinkId=536510) <br/> |Used to view information about the user photo associated with an account. User photos are stored in Active Directory  <br/> |
|[Set-UserPhoto](https://go.microsoft.com/fwlink/p/?LinkId=536511) <br/> |Used to associate a user photo with an account. User photos are stored in Active Directory  <br/> |
|[Remove-UserPhoto](https://go.microsoft.com/fwlink/p/?LinkId=536512) <br/> |Remove the photo for an Office 365 group  <br/> |
   
### Change the default setting of Office 365 Groups for Outlook to Public or Private
<a name="BKMK_CreateClassification"> </a>

Office 365 Groups in Outlook are created as Private by default. If your organization wants Office 365 Groups for Outlook to be created as Public by default (or back to Private), use this PowerShell cmdlet syntax:
  
 `Set-OrganizationConfig -DefaultGroupAccessType Public`
  
To set to Private:
  
 `Set-OrganizationConfig -DefaultGroupAccessType Private`
  
To verify the setting: 
  
 `Get-OrganizationConfig | ft DefaultGroupAccessType`
  
To learn more, see [Set-OrganizationConfig](https://go.microsoft.com/fwlink/?linkid=871816) and [Get-OrganizationConfig](https://go.microsoft.com/fwlink/?linkid=871817).
  
## Office 365 Groups cmdlets

The following cmdlets were recently made available to Office 365 Groups. If you aren't able to use these, your Office 365 subscription has not been updated with this functionality yet. Check your Message Center and the [Office 365 Roadmap](http://roadmap.office.com/en-us).
  
|
|
|**Cmdlet name**|**Description**|
|:-----|:-----|
|[Get-UnifiedGroup](https://go.microsoft.com/fwlink/p/?LinkId=616182) <br/> |Use this cmdlet to look up existing Office 365 Groups, and to view properties of the group object  <br/> |
|[Set-UnifiedGroup](https://go.microsoft.com/fwlink/p/?LinkId=616189) <br/> |Update the properties of a specific Office 365 Group  <br/> |
|[New-UnifiedGroup](https://go.microsoft.com/fwlink/p/?LinkId=616183) <br/> |Create a new Office 365 group. This cmdlet provides a minimal set of parameters, for setting values for extended properties use Set-UnifiedGroup after creating the new group  <br/> |
|[Remove-UnifiedGroup](https://go.microsoft.com/fwlink/p/?LinkId=616186) <br/> |Delete an existing Office 365 Group  <br/> |
|[Get-UnifiedGroupLinks](https://go.microsoft.com/fwlink/p/?LinkId=616194) <br/> |Retrieve membership and owner information for an Office 365 Group  <br/> |
|[Add-UnifiedGroupLinks](https://go.microsoft.com/fwlink/p/?LinkId=616191) <br/> |Add hundred or thousands of users, or new owners, to an existing Office 365 Group  <br/> |
|[Remove-UnifiedGroupLinks](https://go.microsoft.com/fwlink/p/?LinkId=616195) <br/> |Remove owners and members from an existing Office 365 Group  <br/> |
   
## For more information

- [Using PowerShell](https://technet.microsoft.com/en-us/library/cc482986.aspx)
    
- [Apply or remove an Outlook Web App mailbox policy on a mailbox](https://technet.microsoft.com/en-us/library/dd876884%28v=exchg.150%29.aspx)
    
- [Office 365 Groups naming policy](https://support.office.com/article/6ceca4d3-cad1-4532-9f0f-d469dfbbb552)
    

