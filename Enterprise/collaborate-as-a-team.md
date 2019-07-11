---
title: "Collaborate as a team"
ms.author: mikeplum
author: MikePlumleyMSFT
manager: pamgreen
audience: ITPro
ms.topic: article
ms.service: o365-solutions
localization_priority: Priority
description: "Learn how to collaborate with guests in Teams."
---

# Collaborate as a team

If you need to collaborate with guests across documents, tasks, and conversations, we recommend using Microsoft Teams. Teams provides all of the collaboration features available in Office and SharePoint with persistent chat and a customizable and extensible set of collaboration tools in a unified user experience.

## Azure Organizational relationships settings

Sharing in Microsoft 365 is governed at its highest level by the organizational relationships settings in Azure Active Directory. If guest sharing is disabled or restricted in Azure AD, this will override any sharing settings that you configure in Microsoft 365.

Check the organizational relationships settings to ensure that sharing with guests is not blocked.

To set organizational relationship settings

1. Log in to Microsoft Azure [https://portal.azure.com](https://portal.azure.com).
2. In the left navigation, click **Azure Active Directory**.
3. In the **Overview** pane, click **Organizational relationships**.
4. In the **Organizational relationships** pane, click **Settings**.
5. Ensure that **Admins and users in the guest inviter role can invite** and **Members can invite** are both set to **Yes**.
6. If you made changes, click **Save**.

Note the settings in the **Collaboration restrictions** section. Make sure that the domains of the users that you want to collaborate with aren't blocked.

## Teams guest access settings

Teams has a master on/off switch for guest access and a variety of settings available to control what guests can do in a team. The master switch, **Allow guest access in Teams** must be **On** for guest access to work in Teams.

Check to ensure that guest access is enabled in Teams and make any adjustment to the guest settings based on your business needs. Keep in mind that these settings affect all teams.

To set Teams guest access settings

1. Log in to the Microsoft 365 admin center [https://admin.microsoft.com](https://admin.microsoft.com).
2. In the left navigation, click **Show all**.
3. Under **Admin centers**, click **Teams**.
4. In the Teams admin center, in the left navigation, expand **Org-wide settings** and click **Guest access**.
5. Ensure that **Allow guest access in Teams** is set to **On**.
6. Make any desired changes to the additional guest settings, and then click **Save**.

> [!NOTE]
> It may take up to twenty-four hours for the Teams guest setting to become active after you turn it on.

## Office 365 Groups guest settings

Teams uses Office 365 Groups for team membership. The Office 365 Groups guest settings must be turned on in order for guest access in Teams to work.

To set Office 365 Groups guest settings

1. In the Microsoft 365 admin center, in the left navigation, expand **Settings**.
2. Click **Services & add-ins**.
3. In the list, click **Office 365 Groups**.
4. Ensure that the **Let group members outside your organization access group content** and **Let group owners add people outside your organization to groups** check boxes are both checked.
5. If you made changes, click **Save changes**.


## SharePoint organization level sharing settings

In order for guests to have access to files in Teams, the SharePoint organization-level sharing settings must allow for sharing with guests.

To set SharePoint organization level sharing settings

1. In the Microsoft 365 admin center, in the left navigation, under **Admin centers**, click **SharePoint**.
2. In the SharePoint admin center, in the left navigation, click **Sharing**.
3. Ensure that external sharing for SharePoint is set to **Anyone** or **New and existing guests**.
4. If you made changes, click **Save**.


## SharePoint organization level default link settings



To set the SharePoint organization level default link settings

1. Navigate to the Sharing page in the SharePoint admin center.
2. Under **File and folder links**, select the default sharing link that you want to use.
3. If you made changes, click **Save**.



## Create a team

To create a team
1. In Teams, on the **Teams** tab, click **Join or create a team** at the bottom of the left pane.
2. Click **Create a team**.
3. Click **Build a team from scratch**.
4. Choose **Private** or **Public**.
5. Type a name and description for the team, and then click **Create**.
6. Click **Skip**.


## SharePoint site level sharing settings

To set site-level sharing settings
1. In the SharePoint admin center, in the left navigation, expand **Sites** and click **Active sites**.
2. Select the site for the team that you just created.
3. In the ribbon, click **Sharing**.
4. Ensure that sharing is set to **Anyone** or **New and existing guests**.
5. If you made changes, click **Save**.


## Invite users

To invite guests to a team
1. In the team, click **More options \*\*\***, and then click **Add member**.
2. Type the email address of the guest who you want to invite.
3. Click **Edit guest information**.
4. Type the guest's full name and click the check mark.
5. Click **Add**, and then click **Close**.

To invite internal users to a team
1. In the team, click **More options \*\*\***, and then click **Add member**.
2. Type the name of the person who you want to invite.
3. Click **Add**, and then click **Close**.


## See Also

CollabWorking