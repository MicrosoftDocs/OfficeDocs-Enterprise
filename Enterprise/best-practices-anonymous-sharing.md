---
title: "Best practices for anonymous sharing"
ms.author: mikeplum
author: MikePlumleyMSFT
manager: pamgreen
audience: ITPro
ms.topic: article
ms.service: sharepoint-online
localization_priority: Priority
description: "Learn best practices for sharing files and folders with anonymous users."
---

# Best practices for sharing files and folders with anonymous users

Anonymous sharing can be very convenient and is useful in a variety of scenarios. Usually, not all content in an organization is appropriate for anonymous sharing. This article covers the options available to help you create an environment where your users can share files and folders anonymously, but where there are safeguards in place to help protect your organization's content.

## Enable Anyone links

### Enable Anyone links for your organization

To enable Anyone links for your organization

### Enable Anyone links at site level


![Screenshot of SharePoint site external sharing settings with Anyone links selected](media/sharepoint-site-external-sharing-settings-anyone.png)




## Set an expiration date for Anyone links

Files are often stored in sites, groups, and teams for long periods of time. Occasionally there are data retention policies that require files to be retained for years. If such files are shared anonymously, this could lead to unexpected access and changes to files in the future. To mitigate this possibility, you can configure an expiration time for *Anyone* links.

Once an *Anyone* link expires, it can no longer be used to access content.

To set an expiration date for Anyone links
1. Open the SharePoint Online admin center.
2. In the left navigation, click **Sharing**.
3. Under **Advanced settings for "Anyone" links**, select the **These links must expire within this many days** check box.</br>
   ![Screenshot of SharePoint organization-level Anyone link expiration settings](media/sharepoint-organization-anyone-link-expiration.png)
4. Type a number of days in the box, and then click **Save**.

Note that once an *Anyone* link expires, the file or folder can be re-shared with a new *Anyone* link.

## Set link permissions

By default, *Anyone* links for a file allow people to edit the file, and *Anyone* links for a folder allow people to upload new files to the folder. You can change these permissions for files and for folders independently to view-only.

If you want to allow anonymous sharing, but are concerned about unauthenticated users modifying your organization's content, consider setting the file and folder permissions to **View**.

To set permissions for anonymous links
1. Open the SharePoint Online admin center.
2. In the left navigation, click **Sharing**.
3. Under **Advanced settings for "Anyone" links**, select the file and folder permissions that you want to use.</br>
   ![Screenshot of SharePoint organization-level Anyone link permissions settings](media/sharepoint-organization-anyone-link-permissions.png)

## Set default link type to only work for people in your organization

When *Anyone* sharing is enabled for your organization, the default sharing link is normally set to **Anyone**. While this can be convenient for users, it can increase the risk of unintentional anonymous sharing. If a user forgets to change the link type while sharing a sensitive document, they might accidentally create a sharing link that doesn't require authentication.

You can mitigate this risk by changing the default link setting to a link that only works for people inside your organization. Users who want to share anonymously would then have to specifically select that option.

To set the default file and folder sharing link
1. In the SharePoint admin center, in the left navigation, click **Sharing**.
2. Under **File and folder links**, select **Only people in your organization**.</br>
   ![Screenshot of SharePoint default link type setting](media/sharepoint-default-sharing-link-company-link.png)
3. Click **Save**




## Protect against malicious files

When you allow anonymous users to upload files, you're at an increased risk of someone uploading a malicious file. In Microsoft 365, you can use the *safe attachments* feature in Advanced Threat Protection to automatically scan uploaded files and quarantine files that are found to be unsafe.

To turn on safe attachments
1. Open the [Microsoft 365 security](https://security.microsoft.com) admin center.
2. In the left navigation, click **Policies**.
3. Under **Threat protection**, click **ATP safe attachments (Office 365)**.
4. Select the **Turn on ATP for SharePoint, OneDrive, and Microsoft Teams** check box, and then click **Save**.</br>
   ![Screenshot of the safe attachments setting in the Security and Compliance center](media/safe-attachments-setting.png)

## Label-added document footer





## See Also

SharingSecurity