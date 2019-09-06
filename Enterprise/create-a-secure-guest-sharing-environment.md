---
title: "Create a secure guest sharing environment"
ms.author: mikeplum
author: MikePlumleyMSFT
manager: pamgreen
audience: ITPro
ms.topic: article
ms.service: o365-solutions
localization_priority: Priority
description: "Learn how to create a secure guest sharing environment in Microsoft 365."
---

# Create a secure guest sharing environment


## Set up multi-factor authentication for guests


To set up multi-factor authentication for guests
1. In Microsoft Azure, search for *Conditional access*.
2. On the **Conditional Access - Policies** blade, click **New policy**.
3. In the **Name** field, type *Guest MFA*.
4. Under **Assignments**, click **Users and groups**.
5. On the **Users and groups** blade, select **Select users and groups**, select the **All guests and external users** check box, and then click **Done**.
4. Under **Access controls**, click **Grant**.
5. On the **Grant** blade, select the **Require multi-factor authentication** check box, and then click **Select**.
6. On the **New** blade, under **Enable policy**, click **On**, and then click **Create**.




Azure AD

## Set up a terms of use for guests



Create a terms of use and save it as a .pdf file.

To create an Azure AD terms of use
1. Sign in to Azure as a Global Administrator, Security Administrator, or Conditional Access Administrator.
2. Navigate to [Terms of use](https://aka.ms/catou).
3. Click **New terms**.</br>
   ![Screenshot of Azure AD new terms of use settings](media/azure-ad-guest-terms-of-use.png)
4. In the Name box, type *Guest terms of use*.
5. In the Display name box, type *Contoso guest terms of use*.
6. For **Terms of use document**, browse to the pdf file that you created and select it.
7. Select the language for your terms of use document.
8. Set **Require users to expand the terms of use** to **On**.
9. Under **Conditional Access**, in the **Enforce with Conditional Access policy template** list choose **Create conditional access policy later**.
10. Click **Create**.







To create a conditional access policy
1. In Microsoft Azure, search for *Conditional access*.
2. On the **Conditional Access - Policies** blade, click **New policy**.
3. In the **Name** box, type *Guest user terms of use policy*.
4. Under **Assignments**, click **Users and groups**.
5. On the **Users and groups** blade, select **Select users and groups**, select the **All guests and external users** check box, and then click **Done**.
6. Under **Assignments**, click **Cloud apps or actions**.
7. On the **Include** tab, select **Select apps**, and then click **Select**.
8. On the **Select** blade, select **Microsoft Teams**, **Office 365 SharePoint Online**, and **Outlook Groups**, and then click **Select**.
9. On the **Cloud apps or actions** blade, click **Done**.
10. Under **Access controls**, click **Grant**.
11. On the **Grant** blade, select **Guest terms of use**, and then click **Select**.
12. On the **New** blade, under **Enable policy**, click **On**, and then click **Create**.






### More information
[Azure Active Directory terms of use](https://docs.microsoft.com/azure/active-directory/conditional-access/terms-of-use)

Azure AD

## Set up guest access reviews


To create a program
1. Sign in to the Azure portal and open the [Identity Governance page](https://portal.azure.com/#blade/Microsoft_AAD_ERM/DashboardBlade).
2. In the left menu, click **Programs**
3. Click **New program**.
4. In the **Name** box, type *Guest access review program*.
5. In the **Description** box, type *Program for guest access reviews*.
6. Click **Create**.




To set up a guest user access review
1. On the [Identity Governance page](https://portal.azure.com/#blade/Microsoft_AAD_ERM/DashboardBlade), in the left menu, click **Access reviews**.
2. Click **New access review**.</br>
   ![Screenshot of Azure AD access review settings](media/azure-ad-create-access-review.png)
3. In the **Name** box, type *Quarterly guest access review*.
4. For **Frequency**, choose **Quarterly**.
5. For **End**, choose **Never**.
6. For **Scope**, choose **Guest users only**.
7. Click **Group**, select the groups that you want to include in the access review, and then click **Select**.
8. Under **Programs**, click **Link to program**.
9. On the **Select a program** blade, choose **Guest access review program**
10. Click **Start**.









### More information
[Manage guest access with Azure AD access reviews](https://docs.microsoft.com/azure/active-directory/governance/manage-guest-access-with-access-reviews)

[Create an access review of groups or applications in Azure AD access reviews](https://docs.microsoft.com/azure/active-directory/governance/create-access-review)


Azure AD

## Set up conditional access for guest users


To create a conditional access policy
1. In Microsoft Azure, search for *Conditional access*.
2. On the **Conditional Access - Policies** blade, click **New policy**.
3. In the **Name** box, type *Guest user browser access*.
4. Under **Assignments**, click **Users and groups**.
5. On the **Users and groups** blade, select **Select users and groups**, select the **All guests and external users** check box, and then click **Done**.
6. Under **Assignments**, click **Cloud apps or actions**.
7. On the **Include** tab, select **Select apps**, and then click **Select**.
8. On the **Select** blade, select **Microsoft Teams**, **Office 365 SharePoint Online**, and **Outlook Groups**, and then click **Select**.
9. On the **Cloud apps or actions** blade, click **Done**.
10. Under **Assignments**, click **Conditions**.
11. On the **Conditions** blade, click **Client apps**.
12. On the **Client apps** blade, click **Yes** for **Configure**, and then select the **Mobile apps and desktop clients** and **Modern authentication clients** settings.</br>
    ![Screenshot of Azure AD conditional access client apps settings](media/azure-ad-conditional-access-client-mobile.png)
13. Click **Done**, and then on the **Conditions** blade, click **Done** again.
14. Under **Access controls**, click **Grant**.
15. On the **Grant** blade, select **Require device to be marked as compliant** and **Require Hybrid Azure AD joined device**.
16. Under **For multiple controls**, select **Require one of the selected controls**, and then click **Select**.
17. On the **New** blade, under **Enable policy**, click **On**, and then click **Create**.




To configure guest session timeout
1. In Microsoft Azure, search for *Conditional access*.
2. On the **Conditional Access - Policies** blade, click **New policy**.
3. In the **Name** box, type *Guest session timeout*.
4. Under **Assignments**, click **Users and groups**.
5. On the **Users and groups** blade, select **Select users and groups**, select the **All guests and external users** check box, and then click **Done**.
6. Under **Assignments**, click **Cloud apps or actions**.
7. On the **Include** tab, select **Select apps**, and then click **Select**.
8. On the **Select** blade, select **Microsoft Teams**, **Office 365 SharePoint Online**, and **Outlook Groups**, and then click **Select**.
9. On the **Cloud apps or actions** blade, click **Done**.
14. Under **Access controls**, click **Session**.
15. On the **Session** blade, select **Sign-in frequency**.
16. Select **1** and **Days** for the time period, and then click **Select**.
17. On the **New** blade, under **Enable policy**, click **On**, and then click **Create**.



Session timeout

## Create classification labels

Security and Compliance Center

create and publish labels

## Create a sensitive information type for a highly confidential project


## MCAS to assign label based on sensitive info type


## DLP content marking based on label





## See Also

SharingSecurity