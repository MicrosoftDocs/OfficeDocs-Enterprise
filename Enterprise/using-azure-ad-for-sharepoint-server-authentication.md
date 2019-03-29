---
title: "Using Azure AD for SharePoint Server Authentication"
ms.author: tracyp
author: MSFTTracyP
ms.reviewer: 
- kirke
- josephd
- kirks
manager: laurawi
ms.audience: ITPro
ms.topic: article
ms.service: o365-solutions
localization_priority: Normal
ms.collection: 
- Ent_O365
- Ent_O365_Hybrid
ms.custom: Ent_Solutions
ms.assetid: 
description: "Summary: Learn how to bypass the Azure Access Control Service and use SAML 1.1 to authenticate your SharePoint Server users with Azure Active Directory."
---

# Using Azure AD for SharePoint Server Authentication

 **Summary:** Learn how to authenticate your SharePoint Server 2016 users with Azure Active Directory.
  
> [!NOTE]
> This article is based on the work of Kirk Evans, a Microsoft Principal Program Manager. 

<blockquote>
<p>This article refers to code samples for interacting with Azure Active Directory Graph. You can download the code samples [here](https://github.com/kaevans/spsaml11/tree/master/scripts).</p>
</blockquote>

SharePoint Server 2016 provides the ability to authenticate users using claims-based authentication, making it easy to manage your users by authenticating them with different identity providers that you trust but someone else manages. For example, instead of managing user authentication through Active Directory Domain Services (AD DS), you could enable users to authenticate using Azure Active Directory (Azure AD). This enables authentication for cloud-only users with the onmicrosoft.com suffix in their username, users synchronized with an on-premises directory, and invited guest users from other directories. It also enables you to take advantage of Azure AD features such as multi-factor authentication and advanced reporting capabilities.

> [!IMPORTANT]
> The solution described in this article can also be used with SharePoint Server 2013; however, keep in mind that SharePoint Server 2013 is nearing the end of mainstream support. For more information, see [Microsoft Lifecycle Policy](https://support.microsoft.com/en-us/lifecycle/search?alpha=SharePoint%20Server%202013) and [Updated Product Servicing Policy for SharePoint 2013](https://technet.microsoft.com/library/684173bb-e90a-4eb7-b268-b8d7458bc802(v=office.16).aspx).

This article explains how you can use Azure AD to authenticate your users instead of your on-premises AD DS. In this configuration, Azure AD becomes a trusted identity provider for SharePoint Server 2016. This configuration adds a user authentication method that is separate from the AD DS authentication used by the SharePoint Server 2016 installation itself. To benefit from this article, you should be familiar with WS-Federation. For more information, see [Understanding WS-Federation](https://go.microsoft.com/fwlink/p/?linkid=188052).

![Using Azure AD for SharePoint Authentication](images/SAML11/fig1-architecture.png)

Previously, this configuration would have required a federation service such as Azure Access Control Service (ACS) in the cloud or an environment that hosts Active Directory Federation Services (AD FS) to transform tokens from SAML 2.0 to SAML 1.1. This transformation is no longer required as Azure AD now enables issuing SAML 1.1 tokens. The diagram above shows how authentication works for SharePoint 2016 users in this configuration, demonstrating that there is no longer a requirement for an intermediary to perform this transformation.

> [!NOTE]
> This configuration works whether the SharePoint farm is hosted in Azure virtual machines or on-premises. It does not require opening additional firewall ports other than ensuring users can access Azure Active Directory from their browser.

For information about SharePoint 2016 accessibility, see [Accessibility Guidelines in SharePoint Server 2016](https://go.microsoft.com/fwlink/p/?LinkId=393123).

## Configuration overview

Follow these general steps to set up your environment to use Azure AD as a SharePoint Server 2016 identity provider.

1. Create a new Azure AD directory or use your existing directory.
2. Ensure the zone for the web application that you want to secure with Azure AD is configured to use SSL.
3. Create a new enterprise application in Azure AD.
4. Configure a new trusted identity provider in SharePoint 2016.
5. Set the permissions for the web application.
6. Add a SAML 1.1 token issuance policy in Azure AD.
7. Verify the new provider.

The following sections describe how to perform these tasks.

## Step 1: Create a new Azure AD directory or use your existing directory

In the Azure Portal ([https://portal.azure.com](https://portal.azure.com)), create a new directory. Provide the organization name, initial domain name, and the country or region.

![Creating a directory](images/SAML11/fig2-createdirectory.png) 

 If you already have a directory such as the one used for Microsoft Office 365 or your Microsoft Azure subscription, you can use that directory instead. You must have permissions to register applications in the directory.

## Step 2: Ensure the zone for the web application that you want to secure with Azure AD is configured to use SSL

This article was written using the reference architecture in [Run a high availability SharePoint Server 2016 farm in Azure](https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/sharepoint). The article’s accompanying scripts used to deploy the solution described in [this article](https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/sharepoint) create a site that does not use SSL.  

Using SAML requires the application be configured to use SSL. If your SharePoint web application is not configured to use SSL, use the following steps to create a new self-signed certificate to configure the web application for SSL. This configuration is only meant for a lab environment and is not intended for production. Production environments should use a signed certificate.

1. Go to **Central Administration** > **Application Management** > **Manage Web Applications**, and choose the web application that needs to be extended to use SSL. Select the web application and click the **Extend ribbon** button. Extend the web application to use the same URL but use SSL with port 443. 

> [!NOTE]
> Very Important to EXTEND the EXISITING APPLICATION to a NEW ZONE and add Custom Sign In Page /_trust/.
</br>![Extending the web app to another IIS site](images/SAML11/fig3-extendwebapptoiis.png)</br>
2. In IIS Manager, double-click **Server Certificates**.
3. In the **Actions** pane, click **Create Self-Signed Certificate**. Type a friendly name for the certificate in the Specify a friendly name for the certificate box, and then click **OK**.
4. From the **Edit Site Binding** dialog box, ensure the host name is the same as the friendly name, as illustrated in the following image.</br>![Editing site binding in IIS](images/SAML11/fig4-editsitebinding.png)</br>

Each of the web front end servers in the SharePoint farm will require configuring the certificate for the site binding in IIS.


## Step 3: Create a new enterprise application in Azure AD

1. In the Azure Portal ([https://portal.azure.com](https://portal.azure.com)), open your Azure AD directory. Click **Enterprise Applications**, then click **New application**. Choose **Non-gallery application**. Provide a name such as *SharePoint SAML Integration* and click **Add**.</br>![Adding a new non-gallery application](images/SAML11/fig5-addnongalleryapp.png)</br>
2. Click the Single sign-on link in the navigation pane to configure the application. Change the **Single Sign-on Mode** dropdown to **SAML-based Sign-on** to reveal the SAML configuration properties for the application. Configure with the following properties:</br>
    - Identifier: `urn:sharepoint:portal.contoso.local` or `https://portal.contoso.local/`
    - Reply URL: `https://portal.contoso.local/_trust/default.aspx`
    - Sign-on URL: `https://portal.contoso.local/_trust/default.aspx`
    - User Identifier: `user.userprincipalname`</br>
    - Note: Remember to change the URLs by replacing *portal.contoso.local* with the URL of the SharePoint site you want to secure.</br>
3. Set up a table (similar to Table 1 below) that includes the following rows:</br> 
    - Realm
    - Full path to SAML signing certificate file
    - SAML Single Sign-On service URL (replacing */saml2* with */wsfed*)
    - Application Object ID. </br>
Copy the *Identifier* value into the *Realm* property into a table  (See Table 1 below.)
4. Save your changes.
5. Click the **Configure (app name)** link to access the Configure sign-on page.</br>![Configuring a single-sign on page](images/SAML11/fig7-configssopage.png)</br> 
    -  Click the **SAML Signing Certificate - Raw** link to download the SAML Signing Certificate as a file with the .cer extension. Copy and paste the full path to the downloaded file into your table.
    - Copy and paste the SAML Single Sign-On Service URL link into your, replacing the */saml2* portion of the URL with */wsfed*.</br>
6.  Navigate to the **Properties** pane for the application. Copy and paste the Object ID value into the table you set up in Step 3.</br>![Properties pane for the application](images/SAML11/fig8-propertiespane.png)</br>
7. Using the values you captured, make sure the table you set up in Step 3 resembles Table 1 below.


| Table 1: Values captured  |  |
|---------|---------|
|Realm | `urn:sharepoint:portal.contoso.local` or `https://portal.contoso.local/` |
|Full path to SAML signing certificate file | `C:/temp/SharePoint SAML Integration.cer`  |
|SAML single sign-on service URL (replace /saml2 with /wsfed) | `https://login.microsoftonline.com/b1726649-b616-460d-8d20-defab80d476c/wsfed` |
|Application Object ID | `a812f48b-d1e4-4c8e-93be-e4808c8ca3ac` |

> [!IMPORTANT]
> Replace the */saml2* value in the URL with */wsfed*. The */saml2* endpoint will process SAML 2.0 tokens. The */wsfed* endpoint enables processing SAML 1.1 tokens and is required for SharePoint 2016 SAML federation.

## Step 4: Configure a new trusted identity provider in SharePoint Server 2016

Sign into the SharePoint Server 2016 server and open the 2016 Management Shell. Fill in the values of $realm, $wsfedurl, and $filepath from Table 1 and run the following commands to configure a new trusted identity provider.

> [!TIP]
> If you're new to using PowerShell or want to learn more about how PowerShell works, see [SharePoint PowerShell](https://docs.microsoft.com/en-us/powershell/sharepoint/overview?view=sharepoint-ps). 

```
$realm = "<Realm from Table 1>"
$wsfedurl="<SAML single sign-on service URL from Table 1>"
$filepath="<Full path to SAML signing certificate file from Table 1>"
$cert = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2($filepath)
New-SPTrustedRootAuthority -Name "AzureAD" -Certificate $cert
$map = New-SPClaimTypeMapping -IncomingClaimType "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name" -IncomingClaimTypeDisplayName "name" -LocalClaimType "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress"
$map2 = New-SPClaimTypeMapping -IncomingClaimType "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname" -IncomingClaimTypeDisplayName "GivenName" -SameAsIncoming
$map3 = New-SPClaimTypeMapping -IncomingClaimType "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname" -IncomingClaimTypeDisplayName "SurName" -SameAsIncoming
$map4 = New-SPClaimTypeMapping -IncomingClaimType "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/upn" -IncomingClaimTypeDisplayName "upn" -SameAsIncoming
$map5 = New-SPClaimTypeMapping -IncomingClaimType "http://schemas.microsoft.com/ws/2008/06/identity/claims/role" -IncomingClaimTypeDisplayName "Groups" -SameAsIncoming
$ap = New-SPTrustedIdentityTokenIssuer -Name "AzureAD" -Description "SharePoint secured by Azure AD" -ImportTrustCertificate $cert  -realm $realm -ClaimsMappings $map,$map2,$map3,$map4,$map5 -SignInUrl $wsfedurl -IdentifierClaim "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name"
```

Next, follow these steps to enable the trusted identity provider for your application:
1. In Central Administration, navigate to **Manage Web Application** and select the web application that you wish to secure with Azure AD. 
2. In the ribbon, click **Authentication Providers** and choose the zone that you wish to use.
3. Select **Trusted Identity provider** and select the identify provider you just registered named *AzureAD*.  
4. On the sign-in page URL setting, select **Custom sign in page** and provide the value “/_trust/”. 
5. Click **OK**.

![Configuring your authentication provider](images/SAML11/fig10-configauthprovider.png)

## Step 5: Set the permissions

The users who will log into Azure AD and access SharePoint must be granted access to the application. 

1. In the Azure Portal, open the Azure AD directory. Click **Enterprise Applications**, then click **All applications**. Click the application that you created previously (SharePoint SAML Integration).
2. Click **Users and Groups**. 
3. Click **Add user** to add a user or group who will have permissions to log into SharePoint using Azure AD.
4. Select the user or group then click **Assign**.
 
The user has been granted permission in Azure AD, but also must be granted permission in SharePoint. Use the following steps to set the permissions to access the web application.

1. In Central Administration, click **Application Management**.
2. On the **Application Management** page, in the **Web Applications** section, click **Manage web applications**.
3. Click the appropriate web application, and then click **User Policy**.
4. In Policy for Web Application, click **Add Users**.</br>![Searching for a user by their name claim](images/SAML11/fig11-searchbynameclaim.png)</br>
5. In the **Add Users** dialog box, click the appropriate zone in **Zones**, and then click **Next**.
6. In the **Policy for Web Application** dialog box, in the **Choose Users** section, click the **Browse** icon.
7. In the **Find** textbox, type the sign-in name for a user in your directory and click **Search**. </br>Example: *demouser@blueskyabove.onmicrosoft.com*.
8. Under the AzureAD heading in the list view, select the name property and click **Add** then click **OK** to close the dialog.
9. In Permissions, click **Full Control**.</br>![Granting full control to a claims user](images/SAML11/fig12-grantfullcontrol.png)</br>
10. Click **Finish**, and then click **OK**.

## Step 6: Add a SAML 1.1 token issuance policy in Azure AD

When the Azure AD application is created in the portal, it defaults to using SAML 2.0. SharePoint Server 2016 requires the SAML 1.1 token format. The following script will remove the default SAML 2.0 policy and add a new policy to issue SAML 1.1 tokens. This code requires downloading the accompanying [samples demonstrating interacting with Azure Active Directory Graph](https://github.com/kaevans/spsaml11/tree/master/scripts). 


```
Import-Module <file path of Initialize.ps1> 
$objectid = "<Application Object ID from Table 1>"
$saml2policyid = Get-PoliciesAssignedToServicePrincipal -servicePrincipalId $objectid | ?{$_.displayName -EQ "TokenIssuancePolicy"} | select objectId
Remove-PolicyFromServicePrincipal -policyId $saml2policyid -servicePrincipalId $objectid
$policy = Add-TokenIssuancePolicy -DisplayName SPSAML11 -SigningAlgorithm "http://www.w3.org/2001/04/xmldsig-more#rsa-sha256" -TokenResponseSigningPolicy TokenOnly -SamlTokenVersion "1.1"
Set-PolicyToServicePrincipal -policyId $policy.objectId -servicePrincipalId $objectid
```
> Note that it is important to run the `Import-Module` command as shown in this example. This will load a dependent module that contains the commands shown. You may need to open an elevated command prompt to successfully execute these commands.

These sample PowerShell commands are examples of how to execute queries against the Graph API. For more details on Token Issuance Policies with Azure AD, see the [Graph API reference for operations on policy](https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/policy-operations#create-a-policy).

## Step 7: Verify the new provider

Open a browser to the URL of the web application that you configured in the previous steps. You are redirected to sign into Azure AD.

![Signing into Azure AD configured for federation](images/SAML11/fig13-examplesignin.png)

You are asked if you want to stay signed in.

![Stay signed in?](images/SAML11/fig14-staysignedin.png)

Finally, you can access the site logged in as a user from your Azure Active Directory tenant.

![User signed into SharePoint](images/SAML11/fig15-signedinsharepoint.png)

## Managing certificates
It is important to understand that the signing certificate that was configured for the trusted identity provider in step 4 above has an expiration date and must be renewed. See the article [Manage certificates for federated single sign-on in Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/active-directory-sso-certs) for information on certificate renewal. Once the certificate has been renewed in Azure AD, download to a local file and use the following script to configure the trusted identity provider with the renewed signing certificate. 

```
$filepath="<Full path to renewed SAML signing certificate file>"
$cert= New-Object System.Security.Cryptography.X509Certificates.X509Certificate2($filePath)
New-SPTrustedRootAuthority -Name "AzureAD" -Certificate $cert
Get-SPTrustedIdentityTokenIssuer "AzureAD" | Set-SPTrustedIdentityTokenIssuer -ImportTrustCertificate $cert
```
## Configuring one trusted identity provider for multiple web applications
The configuration works for a single web application, but needs additional configuration if you intend to use the same trusted identity provider for multiple web applications. For example, assume we had extended a web application to use the URL `https://portal.contoso.local` and now want to authenticate the users to `https://sales.contoso.local` as well. To do this, we need to update the identity provider to honor the WReply parameter and update the application registration in Azure AD to add a reply URL.

1. In the Azure Portal, open the Azure AD directory. Click **App registrations**, then click **View all applications**. Click the application that you created previously (SharePoint SAML Integration).
2. Click **Settings**.
3. In the settings blade, click **Reply URLs**. 
4. Add the URL for the additional web application (such as `https://sales.contoso.local`) and click **Save**. 
5. On the SharePoint server, open the **SharePoint 2016 Management Shell** and execute the following commands, using the name of the trusted identity token issuer that you used previously.

```
$t = Get-SPTrustedIdentityTokenIssuer "AzureAD"
$t.UseWReplyParameter=$true
$t.Update()
```
6. In Central Administration, go to the web application and enable the existing trusted identity provider. Remember to also configure the sign-in page URL as a custom sign in page `/_trust/`.
7. In Central Administration, click the web application and choose **User Policy**. Add a user with the appropriate permissions as demonstrated previously in this article.

## Fixing People Picker
Users can now log into SharePoint 2016 using identities from Azure AD, but there are still opportunities for improvement to the user experience. For instance, searching for a user presents multiple search results in the people picker. There is a search result for each of the 3 claim types that were created in the claim mapping. To choose a user using the people picker, you must type their user name exactly and choose the **name** claim result.

![Claims search results](images/SAML11/fig16-claimssearchresults.png)

There is no validation on the values you search for, which can lead to misspellings or users accidentally choosing the wrong claim type to assign such as the **SurName** claim. This can prevent users from successfully accessing resources.

To assist with this scenario, there is an open-source solution called [AzureCP](https://yvand.github.io/AzureCP/) that provides a custom claims provider for SharePoint 2016. It will use the Azure AD Graph to resolve what users enter and perform validation. Learn more at [AzureCP](https://yvand.github.io/AzureCP/). 

## Robert "Moojjoo" Dannelly Notes from MSFT Premier Ticket
1.	Associate the AzureAD trusted identity token issuer to the appropriate web application and zone
2.	Configure AzureCP 
a.	Remove the default Mail claim mapping
b.	Change the property to look users up by for the email address claim from UPN to Mail. 
i.	Display the mail property and set the picker entity type to Email
3.	Configure the Claim configuration in AzureAD for your On-premises App to use the Mail property as the Name claim and format for the nameidentifier


## Additional resources

[Understanding WS-Federation](https://go.microsoft.com/fwlink/p/?linkid=188052)
  
[Cloud adoption and hybrid solutions](cloud-adoption-and-hybrid-solutions.md)
  
## Join the discussion

|**Contact us**|**Description**|
|:-----|:-----|
|**What cloud adoption content do you need?** <br/> |We are creating content for cloud adoption that spans multiple Microsoft cloud platforms and services. Let us know what you think about our cloud adoption content, or ask for specific content by sending email to [cloudadopt@microsoft.com](mailto:cloudadopt@microsoft.com?Subject=[Cloud%20Adoption%20Content%20Feedback]:%20).  <br/> |
|**Join the cloud adoption discussion** <br/> |If you are passionate about cloud-based solutions, consider joining the Cloud Adoption Advisory Board (CAAB) to connect with a larger, vibrant community of Microsoft content developers, industry professionals, and customers from around the globe. To join, add yourself as a member of the [CAAB (Cloud Adoption Advisory Board) space](https://aka.ms/caab) of the Microsoft Tech Community and send us a quick email at [CAAB@microsoft.com](mailto:caab@microsoft.com?Subject=I%20just%20joined%20the%20Cloud%20Adoption%20Advisory%20Board!). Anyone can read community-related content on the [CAAB blog](https://blogs.technet.com/b/solutions_advisory_board/). However, CAAB members get invitations to private webinars that describe new cloud adoption resources and solutions.  <br/> |
|**Get the art you see here** <br/> |If you want an editable copy of the art you see in this article, we'll be glad to send it to you. Email your request, including the URL and title of the art, to [cloudadopt@microsoft.com](mailto:cloudadopt@microsoft.com?subject=[Art%20Request]:%20).  <br/> |
   

