---
title: "Create a B2B extranet with managed guests"
ms.author: mikeplum
author: MikePlumleyMSFT
manager: pamgreen
audience: ITPro
ms.topic: article
ms.service: sharepoint-online
localization_priority: Priority
description: "Learn how to create a B2B extranet site or team with managed guest users from a partner organization."
---

# Create a B2B extranet with managed guests

To add a connected organization
1. In [Azure Active Directory](https://aad.portal.azure.com), click **Identity Governance**.
2. Click **Connected organizations**.
3. Click **Add connected organization**.
4. Type a name and description for the organization, and then click **Next: Directory + domain**.
5. Click **Add directory + domain**.
6. Type the domain for the organization that you want to connect, and then click **Add**.
7. Click **Connect**, and then click **Next: Sponsors**.
8. Add people from your organization or the organization that you're connecting to who you want to approve access for guest users.
9. Click **Next: Review + Create**.
10. Review the settings that you've chosen and then click **Create**.


   ![Screenshot of the connected organizations page in Azure Active Directory](media/identity-governance-connected-organizations.png)


To create a catalog
1. In [Azure Active Directory](https://aad.portal.azure.com), click **Identity Governance**.
2. Click **Catalogs**.
3. Click **New catalog**.
4. Type a name and description for the catalog and ensure that **Enabled** and **Enabled for external users** are both set to **Yes**.
5. Click **Create**.

   ![Screenshot of the catalogs page in Azure Active Directory Identity Governance](media/identity-governance-catalogs.png)

To add resources to a catalog
1. In Azure AD Identity Governance, click **Catalogs**, and then click the catalog where you want to add resources.
2. Click **Resources** and then click **Add resources**.
3. Select the teams or SharePoint sites that you want to include in your extranet, and then click **Add**.

   ![Screenshot of the catalog resources page in Azure Active Directory Identity Governance](media/identity-governance-catalog-resource.png)


To add an access package manager


To create an access package
1. In Azure AD Identity Governance, click **Catalogs**, and then click the catalog where you want to create an access package.
2. Click **Access packages**, and then click **New access package**.
3. Type a name and description for the access package, and then click **Next: Resource roles**.
4. Choose the resources from the catalog that you want to use for your extranet.
5. For each resource, in the **Role** column, choose the user role you want to grant to the guest users who use the extranet.
6. Click **Next: Requests**.
7. Under **Users who can request access**, choose **For users not in your directory**.
8. Ensure that the **Specific connected organizations** option is selected, and then click **Add directories**.
9. Choose the connected organization that you add earlier, and then click **Select**
10. Under **Approval**, choose **Yes** for **Require approval**.
11. Under **First approver**, choose one of the sponsors that you added earlier or choose a specific user.
12. Click **Add fallback** and select a fallback approver.
13. Under **Enable**, choose **Yes**.
14. Click **Next: Lifecycle**.
15. Choose the expiration and access review settings that you want to use, and then click **Next: Review + Create**.
16. Review your settings, and then click **Create**.

   ![Screenshot of the access packages screen in Azure Active Directory Identity Governance](media/identity-governance-access-packages.png)



To set an access package to hidden

## See Also

[Create a secure guest sharing environment](create-a-secure-guest-sharing-environment.md)

