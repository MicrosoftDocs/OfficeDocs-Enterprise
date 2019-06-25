---
title: " Microsoft 365 guest sharing settings"
ms.author: mikeplum
author: MikePlumleyMSFT
manager: pamgreen
audience: ITPro
ms.topic: article
ms.service: o365-solutions
ms.custom: 
localization_priority: Priority
description: "Learn about the guest sharing settings available in  Microsoft 365."
---

#  Microsoft 365 guest sharing settings

## Azure Active Directory

Azure Active Directory is the directory service used by  Microsoft 365. The Azure Active Directory Organizational relationships settings directly affect sharing in Teams, Office 365 Groups, SharePoint, and OneDrive.

> [!NOTE]
> These settings only affect SharePoint when [SharePoint and OneDrive integration with Azure AD B2B (Preview)](https://docs.microsoft.com/sharepoint/sharepoint-azureb2b-integration-preview) has been configured.

![Screenshot of Azure Active Directory Organizational Relationships Settings page](media/azure-ad-organizational-relationships-settings.png)

**Navigation:** [Azure Active Directory admin center](https://aad.portal.azure.com) > Azure Active Directory > Organizational relationships > Settings

|**Setting**|**Default**|**Description**|
|:-----|:-----|:-----|
|Guest users permissions are limited|Yes|This setting affects the directory tasks that a guest can perform. It does not affect guests in  Microsoft 365|
|Admins and users in the guest inviter role can invite|Yes|When set to **Yes**, admins can invite guests via Azure AD and via  Microsoft 365 sharing experiences such as Teams and SharePoint; when set to **No**, they cannot. <br>  Microsoft 365 does not use the guest inviter role, so non-admin members of the guest inviter role can only invite guests via Azure AD.|
|Members can invite|Yes|When set to **Yes**, members in Azure AD can invite guests via Azure AD; when set to **No**, they cannot. This setting does not affect  Microsoft 365 guest invitation experiences such as Teams and SharePoint. Note that **members** refers to members in Azure AD (as opposed to guests) and not to site or gorup members in  Microsoft 365. <br>This is identical to the **Let users add new guests to the organization** setting in the  Microsoft 365 admin center.|
|Guests can invite|Yes|INFO NEEDED|
|Enable Email One-Time Passcode for guests (Preview)|No|When set to **Yes**, guests without an MSA or a work or school account can [authenticate with Azure AD using a one-time passcode](https://docs.microsoft.com/azure/active-directory/b2b/one-time-passcode); when set to **No**, users will need to create a Microsoft account in order to authenticate. This setting must be set to **Yes** for [SharePoint and OneDrive integration with Azure AD B2B (Preview)](https://docs.microsoft.com/sharepoint/sharepoint-azureb2b-integration-preview) to work.|
|Collaboration restrictions|Allow invitations to be sent to any domain|This setting allows you to specify a list of allowed or blocked domains for sharing. When allowed domains are specified, then sharing invitations can only be sent to those domains. When denied domains are specified, then sharing invitations cannot be sent to those domains.<br> This setting affects  Microsoft 365 sharing experiences such as Teams and SharePoint. You can allow or block domains at a more granular level by using domain filtering in SharePoint or Teams.|

These settings affect how users are invited to the directory. They do not affect sharing with guests who are already in the directory.

##  Microsoft 365

The Microsoft 365 admin center has organization-level settings for sharing and for Office 365 Groups.

**Sharing**

![Screenshot of the security and privacy guest sharing setting in the  Microsoft 365 admin center](media/sharepoint-security-privacy-sharing-setting.png)

**Navigation:** [Microsoft 365 admin center](https://admin.microsoft.com) > Settings > Security & privacy > Sharing

|**Setting**|**Default**|**Description**|
|:-----|:-----|:-----|
|Let users add new guests to the organization|On|When set to **On**, members in Azure AD can invite guests via Azure AD; when set to **Off**, they cannot. This setting does not affect  Microsoft 365 guest invitation experiences such as Teams and SharePoint. Note that **members** refers to members in Azure AD (as opposed to guests) and not to site or gorup members in  Microsoft 365. <br>This is identical to the **Members can invite** setting in Azure Active Directory Organizational relationships settings.|

**Office 365 Groups**

![Screenshot of Office 365 Groups guest settings in  Microsoft 365 admin center](media/office-365-groups-guest-settings.png)

**Navigation:** [Microsoft 365 admin center](https://admin.microsoft.com) > Settings > Services & add-ins > Office 365 Groups

|**Setting**|**Default**|**Description**|
|:-----|:-----|:-----|
|Let group members outside your organization access group content|On|When set to **On**, guests can access groups content; when set to **Off**, they can't. This setting should be **On** for any scenario where guest users are interacting with Office 365 Groups or Teams.|
|Let group owners add people outside your organization to groups|On|When **On**, Owners of Office 365 Groups or Teams can invite new guests to the group. When **Off**, owners can only invite guests who are already in the directory.|

## Teams



![Screenshot of Teams guest access toggle](media/teams-guest-access-toggle.png)

|**Setting**|**Default**|**Description**|
|:-----|:-----|:-----|
|Allow guest access in Teams|Off| |


![Screenshot of Teams guest calling options](media/teams-guest-calling-setting.png)

|**Setting**|**Default**|**Description**|
|:-----|:-----|:-----|
|Make private calls|On| |

![Screenshot of Teams guest meeting settings](media/teams-guest-meeting-settings.png)

|**Setting**|**Default**|**Description**|
|:-----|:-----|:-----|
|Allow IP video|On| |
|Screen sharing mode|Entire screen| |
|Allow Meet Now|On| |


![Screenshot of Teams guest messaging settings](media/teams-guest-messaging-settings.png)

|**Setting**|**Default**|**Description**|
|:-----|:-----|:-----|
|Edit sent messages|On| |
|Delete sent messages|On| |
|Chat|On| |
|Use Giphys in conversations|On| |
|Giphy content rating|Moderate| |
|Use Memes in conversations|On| |
|User stickers in conversations|On| |
|Allow immersive reader for viewing messages|On| |


## SharePoint and OneDrive

**SharePoint and OneDrive sharing settings**

![Screenshot of SharePoint organization-level sharing settings](media/sharepoint-organization-external-sharing-controls.png)

|**Setting**|**Default**|**Description**|
|:-----|:-----|:-----|
|SharePoint|Anyone| |
|OneDrive|Anyone| |

**SharePoint and OneDrive advanced sharing settings**

![Screenshot of SharePoint organization-level additional sharing settings](media/sharepoint-organization-advanced-sharing-settings.png)

|**Setting**|**Default**|**Description**|
|:-----|:-----|:-----|
|Limit external sharing by domain|Off| |
|Guests must sign in using the same account to which sharing invitations are sent|Off| |
|Allow guests to share items they don't own|On| |

**SharePoint and OneDrive file and folder link settings**

![Screenshot of SharePoint organization-level files and folders sharing settings](media/sharepoint-organization-files-folders-sharing-settings.png)

|**Setting**|**Default**|**Description**|
|:-----|:-----|:-----|
|File and folder links|Anyone with the link| |
|These links must expire within this many days|Off (no expiration)| |
|File permssions|View and edit| |
|Folder permissions|View, edit, and upload| |

**SharePoint and OneDrive security group settings**

![Screenshot of SharePoint organization-level sharing security group settings](media/sharepoint-organization-external-sharing-security-groups.png)

|**Setting**|**Default**|**Description**|
|:-----|:-----|:-----|
|Let only users in selected security groups share with authenticated external users|Off| |
|Let only users in selected security groups share with authenticated external users and using anonymous links|Off| |

## SharePoint site settings

![Screenshot of SharePoint site external sharing settings](media/sharepoint-site-external-sharing-settings.png)

**Navigation:** SharePoint admin center > Active sites > click the site > External sharing

|**Setting**|**Default**|**Description**|
|:-----|:-----|:-----|
|Site content can be shared with|Varies by site type| |

The table below show the default sharing setting for each site type.

|**Site type**|**Default sharing setting**|
|:-----|:-----|
|Classic|Only people in your organization|
|OneDrive|Anyone|
|Group-connected sites (including Teams)|New and existing guests|
|Communication|Only people in your organization|
|Modern sites with no group (#STS3 TeamSite|Only people in your organization|


## See also

|**Setting**|**Default**|**Description**|
|:-----|:-----|:-----|
| | | |


[External sharing overview](https://docs.microsoft.com/sharepoint/external-sharing-overview)