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




- Set up multi-factor authentication for guests.
- Set up a terms of use for guests.
- Set up quarterly guest access reviews to periodically validate whether guests continue to need permissions to teams and sites.
- Restrict guests to web-only access for unmanaged devices.
- Configure a session timeout policy to ensure guests authenticate daily.
- Create and publish sensitivity labels to classify content.
- Create a sensitive information type for a highly confidential project.
- Use Cloud App Security to assign a *highly confidential* label to documents that contain the sensitive information type.
- Use Cloud App Security to remove guest access from files labeled as *highly confidential*.


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

To create a classification label (General)
1. In the [Security and Compliance Center](https://protection.office.com), in the left navigation, expand **Classification**, and then click **Sensitivity labels**.
2. Click **Create a label**.
3. In **Label name**, type *General*.
4. In **Tooltip**, type *General information that can be shared with employees, guests, and partners*, and then click **Next**.
5. Leave encryption **Off** and click **Next**.
6. Leave content marking **Off** and click **Next**.
7. Leave endpoint data loss prevention **Off** and click **Next**.
8. Leave auto labeling **Off** and click **Next**.
9. Click **Create**.


To create a classification label (Highly confidential)
2. Click **Create a label**.
3. In **Label name**, type *Highly confidential*.
4. In **Tooltip**, type *Highly confidential information. Share only with employees and authorized guests*, and then click **Next**.
5. Leave encryption **Off** and click **Next**.
6. Turn content marking **On**, select the **Add a header** check box, and then click **Customize text**.
1. Type *Highly confidential* for the header text and click **Save**.
1. On the **Content marking** page, click **Next**.
1. Leave endpoint data loss prevention **Off** and click **Next**.
1. Leave auto labeling **Off** and click **Next**.
1. Click **Create**.




To publish labels
1. On the **Sensitivity labels** page, click **Publish labels**.
1. Click **Choose labels to publish**.
1. Click **Add**, select the labels that you created, and then click **Add**.
1. Click **Done**.
1. Click **Next**.
1. Leave the users and groups set to **All** and click **Next**.
1. Click **Next**.
1. On the **Policy settings** page, type *Document sensitivity* for the name, and then click **Next**.
1. Click **Publish**.


Security and Compliance Center

create and publish labels

## Create a sensitive information type for a highly confidential project



To create a sensitive information type
1. In the [Security and Compliance Center](https://protection.office.com), in the left navigation, expand **Classification**, and then click **Sensitive info types**.
1. Click **Create**.
1. For **Name** and **Description**, type **Project Saturn**, and then click **Next**.
1. Click **Add an element**.
1. On the **Detect content containing** list, select **Keywords**, and then enter *Project Saturn* in the keyword box.
1. Click **Next**, and then click **Finish**.
1. If asked if you would like to test the seneitive information type, click **No**.


## MCAS to assign label based on sensitive info type


Time delay as custom label replicated to MCAS

To create a sensitive information type-based file policy
1. Open [Microsoft Cloud App Security](https://portal.cloudappsecurity.com).
1. In the left navigation, expand **Control**, and then click **Policies**.
1. Click **Create policy**, and then choose **File policy**.
1. For **Policy name**, type *Project Saturn labeling*.
1. Under **Create a filter for the files this policy will act on**, click X twice to delete the default filters.
1. In the **Select a filter** list, choose **App**, and then select **Microsoft SharePoint Online** from the **Select apps...** list.
1. Under **Inspection method**, choose **Data classification service**.
1. On the **Choose inspection type** list, choose **Sensitive information type**.
1. Search for and select the *Project Saturn* sensitivity label, and then click **Done**.
1. Under **Governance**, expand **Microsoft SharePoint Online**.
1. Select the **Apply classification label** check box and select the **Highly Confidential** label.
1. Click **Create**.



To create a label-based file policy
1. Open [Microsoft Cloud App Security](https://portal.cloudappsecurity.com).
1. In the left navigation, expand **Control**, and then click **Policies**.
1. Click **Create policy**, and then choose **File policy**.
1. For **Policy name**, type *Project Saturn - remove guest access*.
1. Under **Create a filter for the files this policy will act on**, click X twice to delete the default filters.
1. In the **Select a filter** list, choose **App**, and then select **Microsoft SharePoint Online** from the **Select apps...** list.
1. Click **Add a filter**.
1. In the **Select a filter** list, choose **Classification label**, and then select **Azure Information Protection** from the **Select filter...** list.
1. In the **Select classification label** list, select **Highly Confidential**.
1. Under **Governance**, expand **Microsoft SharePoint Online**.
1. Select the **Send policy-match digest to file owner** and **Remove external users** check boxes.
1. Click **Create**.



## DLP content marking based on label





## See Also

SharingSecurity