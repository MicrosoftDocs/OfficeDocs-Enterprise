---
title: "Using Azure AD for SharePoint Server Authentication"
ms.author: tracyp
author: MSFTTracyP
manager: laurawi
ms.date: 3/1/2018
ms.audience: ITPro
ms.topic: article
ms.service: o365-solutions
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Solutions
ms.assetid: 
description: "Summary: Learn how to bypass the Azure Access Control Service and use SAML 1.1 to authenticate your SharePoint Server 2013 users with Azure Active Directory."
---

# Using Azure AD for SharePoint Server Authentication

 **Summary:** Learn how to authenticate your SharePoint Server 2016 users with Azure Active Directory.
  
SharePoint Server 2016 provides the ability to authenticate users using claims-based authentication, making it easy to manage your users by authenticating them with different identity providers that you trust but someone else manages. For example, instead of managing user authentication through Active Directory Domain Services (AD DS), you could enable users to authenticate using Azure Active Directory (Azure AD). This enables authentication for cloud-only users with the onmicrosoft.com suffix in their username, users synchronized with an on-premises directory, and invited guest users from other directories. It also enables you to take advantage of Azure AD features such as conditional access, multi-factor access support, conditional access policies, and advanced reporting capabilities.

This article explains how you can use Azure AD to authenticate your users instead of your on-premises AD DS. In this configuration, Azure AD becomes a trusted identity provider for SharePoint Server 2016. This configuration adds a user authentication method that is separate from the AD DS authentication used by the SharePoint Server 2016 installation itself. To benefit from this article, you should be familiar with WS-Federation. For more information, see [Understanding WS-Federation](https://go.microsoft.com/fwlink/p/?linkid=188052).

Previously, this configuration would have required a federation service such as Azure Access Control Service (ACS) in the cloud or an environment that hosts Active Directory Federation Services (AD FS) to transform tokens from SAML 2.0 to SAML 1.1. This transformation is no longer required as Azure Active Directory now enables issuing SAML 1.1 tokens. The following figure shows how authentication works for SharePoint 2016 users in this configuration, demonstrating that there is no longer a requirement for an intermediary to perform this transformation.

![Figure 1: Using Azure AD for SharePoint Authentication](images/SAML11/fig1-architecture.png)

Note that this configuration works whether the SharePoint farm is hosted in Azure virtual machines or on-premises. It does not require opening additional firewall ports other than ensuring users can access Azure Active Directory from their browser.

For information about SharePoint 2016 accessibility, see [Accessibility Guidelines in SharePoint Server 2016](https://go.microsoft.com/fwlink/p/?LinkId=393123).

## Configuration overview

Follow these general steps to set up your environment to use Azure AD as a SharePoint Server 2016 identity provider.

1. Create a new Azure AD directory or use your existing directory.
2. Ensure the zone for the web application that you want to secure with Azure AD is configured to use SSL.
3. Create a new enterprise application in Azure AD.
4. Configure a new trusted identity provider in SharePoint Server 2016.
5. Set the permissions for the web application.
6. Add a SAML 1.1 token issuance policy in Azure AD.
7. Verify the new provider.

The following sections describe how to perform these tasks.

## Create a new Azure AD directory or use your existing directory

In the Azure Portal ([https://portal.azure.com](https://portal.azure.com)), create a new directory. Provide the organization name, initial domain name, and the country or region.

![Figure 2: Create a directory](images/SAML11/fig2-createdirectory.png) 

 If you already have a directory such as the one used for Microsoft Office 365 or your Microsoft Azure subscription, you can use that directory instead. You must have permissions to register applications in the directory.

## Ensure the zone for the web application that you want to secure with Azure AD is configured to use SSL

This article was written using the reference architecture in [Run a high availability SharePoint Server 2016 farm in Azure](https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/sharepoint). The article’s accompanying scripts used to deploy the solution described in [this article](https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/sharepoint) create a site that does not use SSL.  

Using SAML requires the application be configured to use SSL. If your SharePoint web application is not configured to use SSL, use the following steps to create a new self-signed certificate to configure the web application for SSL. This configuration is only meant for a lab environment and is not intended for production. Production environments should use a signed certificate.

1. Go to **Central Administration** > **Application Management** > **Manage Web Applications**, and choose the web application that needs to be extended to use SSL. Select the web application and click the **Extend ribbon** button. Extend the web application to use the same URL but use SSL with port 443.</br>![Figure 3: Extend the web app to another IIS site](images/SAML11/fig3-extendwebapptoiis.png)</br>
2. In IIS Manager, double-click **Server Certificates**.
3. In the **Actions** pane, click **Create Self-Signed Certificate**. Type a friendly name for the certificate in the Specify a friendly name for the certificate box, and then click **OK**.
4. From the **Edit Site Binding** dialog box, ensure the host name is the same as the friendly name, as illustrated in the following figure.</br>![Figure 4: Edit site binding in IIS](images/SAML11/fig4-editsitebinding.png)</br>

Each of the web front end servers in the SharePoint farm will require configuring the certificate for the site binding in IIS.

## Create a new enterprise application in Azure AD

1. In the Azure Portal ([https://portal.azure.com](https://portal.azure.com)), open your Azure AD directory. Click **Enterprise Applications**, then click **New application**. Choose **Non-gallery application**. Provide a name such as *SharePoint SAML Integration* and click **Add**.</br>![Figure 5: Add a new non-gallery application](images/SAML11/fig5-addnongalleryapp.png)</br>
2. Click the Single sign-on link in the navigation pane to configure the application. Change the **Single Sign-on Mode** dropdown to **SAML-based Sign-on** to reveal the SAML configuration properties for the application. Configure with the following properties:
- Identifier: urn:sharepoint:portal.contoso.local
- Reply URL: https://portal.contoso.local/_trust/default.aspx
- Sign-on URL: https://portal.contoso.local/_trust/default.aspx
- User Identifier: user.userprincipalname
> [!IMPORTANT]
> Note: the URLs above should be changed, replacing *portal.contoso.local* to point to the URL of the SharePoint site you wish to secure.
3. Set up a table that includes rows for Realm, Full path to SAML signing certificate file, SAML Single Sign-On service URL (replacing /saml2 with /wsfed), and Application Object ID. Copy the *Identifier* value into the *Realm* property into a table  (An example table is provided after Step 7.)
4. Save your changes.
5. Click the **Configure (app name)** link to access the Configure sign-on page. 
-  Click the **SAML Signing Certificate - Raw** link to download the SAML Signing Certificate as a file with the .cer extension. Copy the full path to the downloaded file into the table you set up in Step 3.
- Copy the SAML Single Sign-On Service URL link into the table below, replacing the “/saml2” portion of the URL with “/wsfed”.
  
## Additional resources

[Understanding WS-Federation](https://go.microsoft.com/fwlink/p/?linkid=188052)
  
[Cloud adoption and hybrid solutions](cloud-adoption-and-hybrid-solutions.md)
  
## Join the discussion

|**Contact us**|**Description**|
|:-----|:-----|
|**What cloud adoption content do you need?** <br/> |We are creating content for cloud adoption that spans multiple Microsoft cloud platforms and services. Let us know what you think about our cloud adoption content, or ask for specific content by sending email to [cloudadopt@microsoft.com](mailto:cloudadopt@microsoft.com?Subject=[Cloud%20Adoption%20Content%20Feedback]:%20).  <br/> |
|**Join the cloud adoption discussion** <br/> |If you are passionate about cloud-based solutions, consider joining the Cloud Adoption Advisory Board (CAAB) to connect with a larger, vibrant community of Microsoft content developers, industry professionals, and customers from around the globe. To join, add yourself as a member of the [CAAB (Cloud Adoption Advisory Board) space](https://aka.ms/caab) of the Microsoft Tech Community and send us a quick email at [CAAB@microsoft.com](mailto:caab@microsoft.com?Subject=I%20just%20joined%20the%20Cloud%20Adoption%20Advisory%20Board!). Anyone can read community-related content on the [CAAB blog](https://blogs.technet.com/b/solutions_advisory_board/). However, CAAB members get invitations to private webinars that describe new cloud adoption resources and solutions.  <br/> |
|**Get the art you see here** <br/> |If you want an editable copy of the art you see in this article, we'll be glad to send it to you. Email your request, including the URL and title of the art, to [cloudadopt@microsoft.com](mailto:cloudadopt@microsoft.com?subject=[Art%20Request]:%20).  <br/> |
   

