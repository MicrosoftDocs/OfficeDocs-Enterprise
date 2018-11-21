---
title: "Multi-Geo capabilities in Exchange Online"
ms.author: chrisda
author: chrisda
manager: serdars
ms.audience: ITPro
ms.topic: article
ms.service: o365-solutions
ms.custom: 
localization_priority: Priority
description: "Learn about multi-geo capabilities in Exchange Online."
---

# Multi-Geo Capabilities in Exchange Online

In a multi-geo environment, you can select the location of Exchange Online mailbox content (data at rest) on a per-user basis.

You can place mailboxes in satellite locations by:

- Creating a new Exchange Online mailbox directly in a satellite location

- Moving an existing Exchange Online mailbox to a satellite location by changing the user's preferred data location

- Onboarding a mailbox from an on-premises Exchange organization directly into a satellite location

## Prerequisite configuration
Before you can start using Multi-Geo capabilities in Exchange Online, Microsoft needs to configure your Exchange Online tenant for multi-geo support. This one-time configuration process is triggered after you order Office 365 Multi-Geo and the licenses show up in your tenant. This one-time configuration process should typically take less than 30 days to complete. To order Office 365 Multi-Geo, contact your Microsoft representative. For more information, see https://aka.ms/Multi-Geo.

You'll receive notifications in the [Office 365 message center](https://support.office.com/article/Message-center-in-Office-365-38FB3333-BFCC-4340-A37B-DEDA509C2093) when your configuration has completed. Configuration is automatically triggered once your multi-geo licenses show up in your tenant.

## Mailbox placement and moves
After Microsoft completes the prerequisite multi-geo configuration steps, Exchange Online will honor the **PreferredDataLocation** attribute on user objects in Azure AD.

Exchange Online synchronizes the **PreferredDataLocation** property from Azure AD into the **MailboxRegion** property in the Exchange Online directory service. The value of **MailboxRegion** determines the Geo where user mailboxes and any associated archive mailboxes will be placed. It is not possible to configure a user's primary mailbox and archive mailboxes to reside in different geo locations. Only one geo location may be configured per user object.

- When **PreferredDataLocation** is configured on a user with an existing mailbox, the mailbox will be put into a relocation queue and automatically moved to the specified geo location. 

- When **PreferredDataLocation** is configured on a user without an existing mailbox, when you provision the mailbox, it will be provisioned into the specified geo location. 

- When **PreferredDataLocation** is not specified on a user, when you provision the mailbox, it will be provisioned in the central location.

- If the **PreferredDataLocation** code is incorrect (e.g. a type of NAN instead of NAM), the mailbox will be provisioned in the central location.

**Note**: multi-geo capabilities and Skype for Business Online regionally hosted meetings both use the **PreferredDataLocation** property on user objects to locate services. If you configure **PreferredDataLocation** values on user objects for regionally hosted meetings, the mailbox for those users will be automatically moved to the specified geo location after multi-geo is enabled on the Office 365 tenant.

## Feature limitations for multi-geo in Exchange Online
1. Only user mailboxes, resource mailboxes (room and equipment mailboxes), and shared mailboxes support multi-geo features. Public Folder Mailboxes and Office 365 Groups remain in the central location.
 
2. Security and compliance features (for example, auditing and eDiscovery) that are available in the Exchange admin center (EAC) aren't available in multi-geo organizations. Instead, you need to use the [Office 365 Security & Compliance Center](https://support.office.com/article/7e696a40-b86b-4a20-afcc-559218b7b1b8) to configure security and compliance features.

3. Outlook for Mac users may experience a temporary loss of access to their Online Archive folder while you move their mailbox to a new geo location. This condition occurs when the user's the primary and archive mailboxes are in different geo locations, because cross-geo mailbox moves may complete at different times.

4. Users can't share *mailbox folders* across geo locations in Outlook on the web (formerly known as Outlook Web App or OWA). For example, a user in the European Union can't use Outlook on the web to open a shared folder in a mailbox that's located in the United States. However, Outlook on the Web users can open *other mailboxes* in different Geos by using a separate browser window as described in [Open another person’s mailbox in a separate browser window in Outlook Web App](https://support.office.com/article/A909AD30-E413-40B5-A487-0EA70B763081#__toc372210362).

    **Note**: Cross-geo mailbox folder sharing is supported in Outlook on Windows.

