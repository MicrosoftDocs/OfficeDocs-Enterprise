---
title: "Use the Office 365 Content Delivery Network (CDN) with SharePoint Online"
ms.author: kvice
author: kelleyvice-msft
manager: laurawi
ms.date: 3/19/2019
ms.audience: ITPro
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Adm_O365
search.appverid:
- MET150
- SPO160
ms.assetid: bebb285f-1d54-4f79-90a5-94985afc6af8
description: "Describes how to use the Office 365 Content Delivery Network (CDN) to speed up delivery of your SharePoint Online assets to all of your users no matter where they are located or how they access your content."
---

# Use the Office 365 Content Delivery Network (CDN) with SharePoint Online

You can use the built-in Office 365 Content Delivery Network (CDN) to host static assets to provide better performance for your SharePoint Online pages. The Office 365 CDN improves performance by caching static assets closer to the browsers requesting them, which helps to speed up downloads and reduce latency. Also, the Office 365 CDN uses the [HTTP/2 protocol](https://en.wikipedia.org/wiki/HTTP/2) for improved compression and download speeds.

The Office 365 CDN is composed of multiple CDNs of two distinct classes of CDN: **public** and **private**. Both public and private CDNs allow you to host static assets in multiple locations, or _origins_, and serve them from global high-speed networks.

> [!NOTE]
> The Office 365 CDN service is included as part of your SharePoint Online subscription. However, the Azure CDN is a separate service that requires an Azure subscription and is subject to usage fees. For more information, see [Azure CDN assets](use-office-365-cdn-with-spo.md#Azure-CDN-Assets).

If you are already familiar with the way that CDNs work, you only need to complete a few steps to enable the Office 365 CDN for your tenant. This topic describes how. Read on for information about public and private CDNs and how to get started hosting your static assets.
  
 **Head back to [Network planning and performance tuning for Office 365](https://aka.ms/tune).**

## Overview of working with the Office 365 CDN in SharePoint Online

To set up the Office 365 CDN for your organization, you follow these basic steps:

- Plan for CDN deployment:

  - Determine which static assets you want to host on the CDN. For detailed information about how to make these choices, refer to [Content Delivery Networks](content-delivery-networks.md).
  - [Determine where you want to store your assets](use-office-365-cdn-with-spo.md#CDNStoreAssets). This location can be a SharePoint site, library or folder and is called an _origin_.
  - Determine whether the assets should be made public or kept private. You do this when you [Choose whether each origin should be public or private](use-office-365-cdn-with-spo.md#CDNOriginChoosePublicPrivate). If you want, you can have multiple origins in which some are public, and some are private.

- [Set up and configure the CDN by using the SharePoint Online Management Shell](use-office-365-cdn-with-spo.md#CDNSetupinPShell). When you complete this step, you will have:

  - Enabled the CDN for your organization.
  - Added your origins. You identify each origin as public or private.

Once you're done with setup, [Manage the Office 365 CDN](use-office-365-cdn-with-spo.md#CDNManage) over time by:
  
- Adding, updating, and removing assets
- Adding and removing origins
- Configuring CDN policies
- If necessary, disabling the CDN

## Determine where you want to store your assets

The CDN fetches your assets from a location called an origin. For Office 365, an origin is a SharePoint library or folder that is accessible by a URL. You have great flexibility when you specify origins for your organization. For example, you can specify multiple origins or a single origin where you want to put all your CDN assets. You can choose to have both public or private origins for your organization. Most organizations will choose to implement a combination of the two.
  
If you define hundreds of origins, it will likely have a negative impact on the time it takes to process requests. We recommend that you limit the number of origins as much as possible.
  
## Choose whether each origin should be public or private

When you identify an origin, you specify whether it should be made public or private. Regardless of which option you choose, Microsoft does all the heavy lifting for you when it comes to administration of the CDN itself. Also, you can change your mind later, after you've set up the CDN and identified your origins.

### What's the difference between public and private CDNs?

Public CDNs within the Office 365 CDN are hosted by CDN providers like Akamai, Verizon and Microsoft Azure. Content on a public CDN is accessible anonymously, and can be accessed by anyone who has URLs to hosted assets. Because access to content in a public CDN is anonymous, you should only use them to cache non-sensitive generic content such as javascript files, scripts, icons and images.

You can also use the Azure CDN for hosting custom web parts, libraries and other resource assets, which allows you to apply access keys to your CDN storage and exert greater control over your CDN configuration. For more information on how to configure an Azure CDN instance, see [Quickstart: Integrate an Azure storage account with Azure CDN](https://docs.microsoft.com/en-us/azure/cdn/cdn-create-a-storage-account-with-cdn).

Private CDNs like the Office 365 CDN provide fast, secure access to user content such as SharePoint Online document libraries, sites and media such as videos. Unlike public CDNs, access to content in the Office 365 CDN is secured by default so it can only be accessed by users with permissions to the original document library or storage location. The private Office 365 CDN can only be used for SharePoint Online content.

For need more information about why to use a CDN or about general CDN concepts, see [Content Delivery Networks](content-delivery-networks.md).
  
Both public and private options provide similar performance gains, but each has unique attributes and advantages.

### Attributes and advantages of hosting assets in the public CDN
  
- Assets exposed in a public origin are accessible by everyone anonymously.
    > [!IMPORTANT]
    > If you identify a public origin in your CDN, you should never place resources that are considered sensitive to your organization in a public origin or SharePoint Online library.
- If you remove an asset from a public origin, the asset may continue to be available for up to 30 days from the cache; however, we will invalidate links to the asset in the CDN within 15 minutes.
- When you host style sheets (CSS files) in a public origin, you can use relative paths and URIs within the code. This means that you can reference the location of background images and other objects relative to the location of the asset that's calling it.
- While you can hard code a public origin's URL, doing so is not recommended. The reason for this is that if access to the CDN becomes unavailable, the URL will not automatically resolve to your organization in SharePoint Online and might result in broken links and other errors.
- The default file types that are included for public origins are .css, .eot, .gif, .ico, .jpeg, .jpg, .js, .map, .png, .svg, .ttf, and .woff. You can specify additional file types.
- You can configure a policy to exclude assets that have been identified by site classifications that you specify. For example, you can choose to exclude all assets that are marked as "confidential" or "restricted" even if they are an allowed file type and are located in a public origin.

### Attributes and advantages of hosting assets in the private CDN

- The Private Office 365 CDN can only be used for SharePoint Online assets.
- Users can only access the assets from a private origin if they are authorized to do so. Anonymous access to these assets is prevented.
- Assets in the private CDN must be refered from the SharePoint Online tenant. Direct access to private CDN assets does not work.
- If you remove an asset from the private origin, the asset may continue to be available for up to an hour from the cache; however, we will invalidate links to the asset in the CDN within 15 minutes.
- The default file types that are included for private origins are .gif, .ico, .jpeg, .jpg, .js, and .png. You can specify additional file types.
- Just like public origins, you can configure a policy to exclude assets that have been identified by site classifications that you specify even if you use wildcards to include all assets within a folder or document library.

## Default CDN origins

Unless you specify otherwise, Office 365 sets up some default origins for you when you enable a CDN. If you initially exclude them, you can add these origins after you complete setup.
  
Default private CDN origins:
  
- \*/userphoto.aspx
- \*/siteassets

Default public CDN origins:
  
- \*/masterpage
- \*/style library

> [!NOTE]
> _Clientsideassets_ is a default public origin that was added in December 2017. This origin must be present in order for CDN content to be available. If you'd like to read an example of using this CDN origin, see: [Host your client-side web part from Office 365 CDN (Hello World part 4)](https://docs.microsoft.com/en-us/sharepoint/dev/spfx/web-parts/get-started/hosting-webpart-from-office-365-cdn)

## Set up and configure a CDN by using the SharePoint Online Management Shell

The procedures in this topic require you to use the SharePoint Online Management Shell to connect to SharePoint Online. For instructions, see [Connect to SharePoint Online PowerShell](https://docs.microsoft.com/powershell/sharepoint/sharepoint-online/connect-sharepoint-online?view=sharepoint-ps).
  
Complete these steps to set up and configure the CDN to host your static assets in SharePoint Online.
  
### To enable your organization to use a CDN

Before you make changes to the tenant CDN settings, you should retrieve the current status of the private CDN configuration in your Office 365 tenant. Connect to your tenant using the SharePoint Online Management Shell:

``` powershell
Connect-SPOService -Url https://contoso-admin.sharepoint.com
```

Now use the **Get-SPOTenantCdnEnabled** cmdlet to retrieve the CDN status settings from the tenant:

``` powershell
Get-SPOTenantCdnEnabled -CdnType <Public | Private>
```

The status of the CDN for the specified CdnType will output to the screen.

Use the **Set-SPOTenantCdnEnabled** cmdlet to enable your organization to use a CDN. You can enable your organization to use public origins, private origins, or both CDNs at once. You can also configure the CDN to skip the setup of default origins when you enable it. You can always add these origins later as described in this topic.
  
In Windows Powershell for SharePoint Online:

``` powershell
Set-SPOTenantCdnEnabled -CdnType <Public | Private | Both> -Enable $true
```

For example, to enable your organization to use both public and private origins with the CDN, type the following command:

``` powershell
Set-SPOTenantCdnEnabled -CdnType Both -Enable $true
```

To enable your organization to use both public and private origins with the CDN but skip setting up the default origins, type the following command:

``` powershell
Set-SPOTenantCdnEnabled -CdnType Both -Enable $true -NoDefaultOrigins
```

To enable your organization to use public origins with the CDN, type the following command:

``` powershell
Set-SPOTenantCdnEnabled -CdnType Public -Enable $true
```

To enable your organization to use private origins with the CDN, type the following command:

``` powershell
Set-SPOTenantCdnEnabled -CdnType Private -Enable $true
```

For more information about this cmdlet, see [Set-SPOTenantCdnEnabled](https://technet.microsoft.com/en-us/library/mt790765.aspx).
  
### (Optional) To change the list of file types to include in a CDN
<a name="Office365CDNforSPOFileType"> </a>

> [!TIP]
> When you define file types by using the **Set-SPOTenantCdnPolicy** cmdlet, you overwrite the currently defined list. If you want to add additional file types to the list, use the cmdlet first to find out what file types are already allowed and include them in the list along with your new ones.
  
Use the **Set-SPOTenantCdnPolicy** cmdlet to define static file types that can be hosted by public and private origins in the CDN. By default, common asset types are allowed, for example .css, .gif, .jpg, and .js.

In Windows PowerShell for SharePoint Online:

``` powershell
Set-SPOTenantCdnPolicy -CdnType <Public | Private> -PolicyType IncludeFileExtensions -PolicyValue "<Comma-separated list of file types >"
```

For example, to enable the Office 365 CDN to host .css and .png files, you would enter the command:

``` powershell
Set-SPOTenantCdnPolicy -CdnType Private -PolicyType IncludeFileExtensions -PolicyValue "CSS,PNG"
```

To see what file types are currently allowed by the CDN, use the **Get-SPOTenantCdnPolicies** cmdlet:

``` powershell
Get-SPOTenantCdnPolicies -CdnType <Public | Private>
```

For more information about these cmdlets, see [Set-SPOTenantCdnPolicy](https://technet.microsoft.com/en-us/library/mt800839.aspx) and [Get-SPOTenantCdnPolicies](https://technet.microsoft.com/en-us/library/mt800838.aspx).
  
### (Optional) To change the list of site classifications you want to exclude from a CDN
<a name="Office365CDNforSPOSiteClassification"> </a>

> [!TIP]
> When you exclude site classifications by using the **Set-SPOTenantCdnPolicy** cmdlet, you overwrite the currently defined list. If you want to exclude additional site classifications, use the cmdlet first to find out what classifications are already excluded and then add them along with your new ones.

Use the **Set-SPOTenantCdnPolicy** cmdlet to exclude site classifications that you do not want to make available over the CDN. By default, no site classifications are excluded.

In Windows PowerShell for SharePoint Online:

``` powershell
Set-SPOTenantCdnPolicy -CdnType <Public | Private> -PolicyType ExcludeRestrictedSiteClassifications  -PolicyValue "<Comma-separated list of site classifications >"
```

To see what site classifications are currently restricted, use the **Get-SPOTenantCdnPolicies** cmdlet:

``` powershell
Get-SPOTenantCdnPolicies -CdnType <Public | Private>
```

The properties that will be returned are _IncludeFileExtensions_, _ExcludeRestrictedSiteClassifications_ and _ExcludeIfNoScriptDisabled_.

The _IncludeFileExtensions_ property contains the list of file extensions that will be served from the CDN.

> [!NOTE]
> Depending on if you have configured your tenant CDN to either be public or private, the default file extensions will be different between public and private.

The _ExcludeRestrictedSiteClassifications_ property contains the site classifications that you want to exclude from the CDN. For example, you can exclude sites marked as **Confidential** so content from sites with that classification applied will not be served from the CDN.

The _ExcludeIfNoScriptDisabled_ property excludes content from the CDN based on the site-level _NoScript_ attribute settings. By default, the _NoScript_ attribute is set to **Enabled** for Modern sites and **Disabled** for Classic sites. This depends on your tenant settings.

For more information about these cmdlets, see [Set-SPOTenantCdnPolicy](https://technet.microsoft.com/en-us/library/mt800839.aspx) and [Get-SPOTenantCdnPolicies](https://technet.microsoft.com/en-us/library/mt800838.aspx).
  
### To add an origin for your assets
<a name="Office365CDNforSPOOrigin"> </a>

Use the **Add-SPOTenantCdnOrigin** cmdlet to define an origin. You can define multiple origins. The origin is a URL that points to a SharePoint library or folder that contains the assets that you want to be hosted by the CDN.
  
> [!IMPORTANT]
> If you identify a public origin in your CDN, you should never place resources that are considered sensitive to your organization in the public origin or SharePoint Online library.

``` powershell
Add-SPOTenantCdnOrigin -CdnType <Public | Private> -OriginUrl <path>
```

The value of _path_ is the path to the library or folder that contains the assets. You can use wildcards in addition to relative paths. Origins support wildcards prepended to the Url. This allows you to create origins that span multiple sites. For example, to include all of the assets in the masterpages folder for all of your sites as a public origin within the CDN, type the following command:

``` powershell
Add-SPOTenantCdnOrigin -CdnType Public -OriginUrl */masterpage
```

- The wildcard modifier ***/** can only be used at the beginning of the path, and will match all URL segments under the specified URL.
- The path can point to either a document library or a site. For example, the path _*/site1_ will match all the document libraries under the site.

You can add an origin with a specific path using either a relative path or a full path.

This example adds a private origin of the siteassets library on a specific site using a relative path:

``` powershell
Add-SPOTenantCdnOrigin -CdnType Private -OriginUrl sites/site1/siteassets
```

This example adds a private origin of the _folder1_ folder in the site collection's site assets library using the full path:

``` powershell
Add-SPOTenantCdnOrigin -CdnType Private -OriginUrl “https://contoso.sharepoint.com/sites/test/siteassets/folder1”
```

For more information about this command and its syntax, see [Add-SPOTenantCdnOrigin](https://technet.microsoft.com/en-us/library/mt790772.aspx).

> [!NOTE]
> Assets being shared from the CDN origin must have a major version published before they can be accessed from the CDN.
  
Once you've run the command, the system synchronizes the configuration across the datacenter. This takes 15 minutes.
  
### Example: Configure a public origin for your master pages and for your style library for SharePoint Online
<a name="ExamplePublicOrigin"> </a>

Normally, these origins are set up for you by default when you enable the public CDN. However, if you want to enable them manually, follow these steps.
  
- Use the **Add-SPOTenantCdnOrigin** cmdlet to define the style library as an origin within the public CDN.

``` powershell
  Add-SPOTenantCdnOrigin -CdnType Public -OriginUrl */style%20library
  ```

- Use the **Add-SPOTenantCdnOrigin** cmdlet to define the master pages as an origin within the public CDN.

``` powershell
  Add-SPOTenantCdnOrigin -CdnType Public -OriginUrl */masterpage
  ```

- For more information about this command and its syntax, see [Add-SPOTenantCdnOrigin](https://technet.microsoft.com/en-us/library/mt790772.aspx).

    Once you've run the command, the system synchronizes the configuration across the datacenter. This can take up to 15 minutes.

### Example: Configure a private origin for your site assets, site pages, and publishing images for SharePoint Online
<a name="ExamplePrivateOrigin"> </a>

- Use the **Add-SPOTenantCdnOrigin** cmdlet to define the site assets folder as a private origin within the Office 365 CDN.

``` powershell
  Add-SPOTenantCdnOrigin -CdnType Private -OriginUrl */siteassets
  ```

- Use the **Add-SPOTenantCdnOrigin** cmdlet to define the site pages folder as a private origin within the Office 365 CDN.

``` powershell
  Add-SPOTenantCdnOrigin -CdnType Private -OriginUrl */sitepages
  ```

- Use the **Add-SPOTenantCdnOrigin** cmdlet to define the publishing images folder as a private origin within the Office 365 CDN.

``` powershell
  Add-SPOTenantCdnOrigin -CdnType Private -OriginUrl */publishingimages
  ```

    For more information about this command and its syntax, see [Add-SPOTenantCdnOrigin](https://technet.microsoft.com/en-us/library/mt790772.aspx).

    Once you've run the command, the system synchronizes the configuration across the datacenter. This can take up to 15 minutes.

### Example: Configure a private origin for a site collection for SharePoint Online
<a name="ExamplePrivateOriginSiteCollection"> </a>

Use the **Add-SPOTenantCdnOrigin** cmdlet to define a site collection as a private origin within the Office 365 CDN. For example:

``` powershell
Add-SPOTenantCdnOrigin -CdnType Private -OriginUrl sites/site1/siteassets
```

For more information about this command and its syntax, see [Add-SPOTenantCdnOrigin](https://technet.microsoft.com/en-us/library/mt790772.aspx).
  
Once you've run the command, the system synchronizes the configuration across the datacenter. You may see a _Configuration pending_ message which is expected as the SharePoint Online tenant connects to the CDN service. This can take up to 15 minutes.
  
## Manage a CDN
<a name="CDNManage"> </a>

Once you've set up the CDN, you can make changes to your configuration as you update content or as your needs change, as described in this section.
  
### To add, update, or remove assets from a CDN
<a name="Office365CDNforSPOaddremoveasset"> </a>

Once you've completed the setup steps, you can add new assets, and update or remove existing assets whenever you want. Just make your changes to the assets in the folder or SharePoint library that you identified as an origin. If you add a new asset, it is available through the CDN immediately. However, if you update the asset, it will take up to 15 minutes for the new copy to propagate and become available in the CDN.
  
If you need to retrieve the location of the origin, you can use the **Get-SPOTenantCdnOrigins** cmdlet. For information on how to use this cmdlet, see [Get-SPOTenantCdnOrigins](https://technet.microsoft.com/en-us/library/mt790770.aspx).
  
### To remove an origin from a CDN
<a name="Office365CDNforSPORemoveOrigin"> </a>

You can remove access to a folder or SharePoint library that you identified as an origin. To do this, use the **Remove-SPOTenantCdnOrigin** cmdlet.

``` powershell
Remove-SPOTenantCdnOrigin -OriginUrl <path> -CdnType <Public | Private | Both>
```

For information on how to use this cmdlet, see [Remove-SPOTenantCdnOrigin](https://technet.microsoft.com/en-us/library/mt790761.aspx).
  
### To modify an origin in a CDN
<a name="Office365CDNforSPORemoveOrigin"> </a>

You cannot modify an origin you've created. Instead, remove the origin and then add a new one. For more information, see [To remove an origin from the Office 365 CDN](use-office-365-cdn-with-spo.md#Office365CDNforSPORemoveOrigin) and [To add an origin for your assets](use-office-365-cdn-with-spo.md#Office365CDNforSPOOrigin).
  
### To disable a CDN
<a name="Office365CDNforSPODisable"> </a>

Use the **Set-SPOTenantCdnEnabled** cmdlet to disable the CDN for your organization. If you have both the public and private origins enabled for the CDN, you need to run the cmdlet twice as shown in the following examples.
  
To disable use of public origins in the CDN, in Windows Powershell for SharePoint Online, enter the following command:

``` powershell
Set-SPOTenantCdnEnabled -CdnType Public -Enable $false
```

To disable use of the private origins in the CDN, enter the following command:

``` powershell
Set-SPOTenantCdnEnabled -CdnType Private -Enable $false
```

For more information about this cmdlet, see [Set-SPOTenantCdnEnabled](https://technet.microsoft.com/en-us/library/mt790765.aspx).

### Set up and configure the Office 365 CDN using the Office 365 CLI

> [!NOTE]
> Before you can manage site collection app catalogs in your tenant, ensure that you have installed the [Office 365 CLI](https://aka.ms/o365cli). Next, connect to your SharePoint Online tenant using the [spo connect](https://pnp.github.io/office365-cli/cmd/spo/connect/) command.

#### Enable Office 365 CDN

You can manage the state of the Office 365 CDN in your tenant using the [spo cdn set](https://pnp.github.io/office365-cli/cmd/spo/cdn/cdn-set/) command.

To enable the Office 365 Public CDN in your tenant execute:

```sh
spo cdn set --type Public --enabled true
```

To enable the Office 365 Private CDN, execute:

```sh
spo cdn set --type Private --enabled true
```

#### View the current status of the Office 365 CDN

To check, if the particular type of Office 365 CDN is enabled or disabled, use the [spo cdn get](https://pnp.github.io/office365-cli/cmd/spo/cdn/cdn-get/) command.

To check if the Office 365 Public CDN is enabled, execute:

```sh
spo cdn get --type Public
```

#### View Office 365 CDN origins

To view the currently configured Office 365 Public CDN origins execute:

```sh
spo cdn origin list --type Public
```

#### Add Office 365 CDN origin

> [!NOTE]
> You should never place resources that are considered sensitive to your organization in a SharePoint Document library configured as a Public CDN origin

Use the [spo cdn origin add](https://pnp.github.io/office365-cli/cmd/spo/cdn/cdn-origin-add/) command to define a CDN origin. You can define multiple origins. The origin is a URL that points to a SharePoint library or folder that contains the assets that you want to be hosted by the CDN.

```sh
spo cdn origin add --type [Public | Private] --origin <path>
```

Where `path` is the path to the folder that contains the assets. You can use wildcards in addition to relative paths.

To include all assets in the Master Page Gallery of all sites as a public CDN origin, execute:

```sh
spo cdn origin add --type Public --origin */masterpage
```

To configure a private origin for a specific site collection, execute:

```sh
spo cdn origin add --type Private --origin sites/site1/siteassets
```

> [!NOTE]
> After adding a CDN origin, it might take up to 15 minutes for you to be able to retrieve files via the CDN service. You can verify if the particular origin has already been enabled using the [spo cdn origin list](https://pnp.github.io/office365-cli/cmd/spo/cdn/cdn-origin-list/) command.

#### Remove Office 365 CDN origin

Use the [spo cdn origin remove](https://pnp.github.io/office365-cli/cmd/spo/cdn/cdn-origin-remove/) command to remove a CDN origin for the specified CDN type.

To remove an origin from the Public CDN configuration, execute:

```sh
spo cdn origin remove --type Public --origin */masterpage
```

> [!NOTE]
> Removing a CDN origin doesn't affect the files stored in any Document library matching that origin. If these assets have been referenced using their SharePoint URL, SharePoint will automatically switch back to the original URL pointing to the Document library. If, however, assets have been referenced using the Public CDN URL, then these links will now be broken and will need to be manually changed.

#### Modify Office 365 CDN origin

It's not possible to modify an existing CDN origin. Instead, you should remove the previously defined CDN origin using the `spo cdn origin remove` command and add a new one using the `spo cdn origin add` command.

#### Change the types of files to include in Office 365 CDN

By default, the following file types are included in the CDN: _.css, .eot, .gif, .ico, .jpeg, .jpg, .js, .map, .png, .svg, .ttf, and .woff_. If you need to include additional file types in the CDN, you can change the CDN configuration using the [spo cdn policy set](https://pnp.github.io/office365-cli/cmd/spo/cdn/cdn-policy-set/) command.

> [!NOTE]
> When changing the list of file types, you overwrite the currently defined list. If you want to include additional file types, first use the [spo cdn policy list](https://pnp.github.io/office365-cli/cmd/spo/cdn/cdn-origin-list/) command to find out which file types are currently configured.

To add the _JSON_ file type to the default list of file types included in the Public CDN, execute:

```sh
spo cdn policy set --type Public --policy IncludeFileExtensions --value "CSS,EOT,GIF,ICO,JPEG,JPG,JS,MAP,PNG,SVG,TTF,WOFF,JSON"
```

#### Change the list of site classifications you want to exclude from the Office 365 CDN

Use the [spo cdn policy set](https://pnp.github.io/office365-cli/cmd/spo/cdn/cdn-policy-set/) command to exclude site classifications that you do not want to make available over the CDN. By default, no site classifications are excluded.

> [!NOTE]
> When changing the list of excluded site classifications, you overwrite the currently defined list. If you want to exclude additional classifications, first use the [spo cdn policy list](https://pnp.github.io/office365-cli/cmd/spo/cdn/cdn-policy-list/) command to find out which classifications are currently configured.

To exclude sites classified as _HBI_ from the Public CDN, execute

```sh
spo cdn policy set --type Public --policy ExcludeRestrictedSiteClassifications --value "HBI"
```

#### Disable Office 365 CDN

To disable the Office 365 CDN use the `spo cdn set` command, for example:

```sh
spo cdn set --type Public --enabled false
```

## Using your CDN assets

Now that you have enabled the CDN and configured origins and policies, you can begin using your CDN assets.

### Private CDN assets

No additional configuration is required to use private CDN assets. SharePoint Online automatically rewrites URLs for assets in private CDN origins so requests for those assets will always be served from the CDN.

Private access to assets in the Office 365 CDN is granted by tokens generated by SharePoint Online. Users who already have permission to access to the folder or library designated by the origin will automatically be granted tokens that permit the user to interact with the file based on their permission level.

SharePoint Online does not support item-level permissions for the CDN. For example, for a file located at `https://contoso.sharepoint.com/sites/site1/library1/folder1/image1.jpg`, given the following:
  
- User 1 has access to folder1 and to image1.jpg
- User 2 does not have access to folder1
- User 3 does not have access to folder1 but is granted explicit permission to access image1.jpg through SharePoint Online
- User 4 has access to folder1 but has been explicitly denied access to image1.jpg

Then the following are true:
  
- User 1 and User 4 will be able to access image1.jpg through the CDN.
- User 2 and User 3 will not be able to access image1.jpg through the CDN.
- User 3 can still access the asset image1.jpg directly through SharePoint Online while User 4 cannot access the asset through SharePoint Online.

### Public CDN assets

The Publishing feature in SharePoint Online automatically rewrites URLs of assets stored in public CDN origins to their CDN equivalents so that assets are served from the CDN service instead of SharePoint. If your origin in in a site with the Publishing feature enabled, no further configuration is required.

The following is an overview of which links are automatically rewritten by the SharePoint Publishing feature:

- IMG/LINK/CSS URLs in classic publishing page HTML responses
  - This includes images added by authors within the HTML content of a page
  - When extending pages, you can temporarily disable auto-rewriting URLs on a page by:
    - checking out the page
    - adding the query string parameter ?NoAutoReWrites=true
  - Picture Library SlideShow webpart image URLs
  - Image fields in SPList REST API (RenderListDataAsStream) results
    - Use the new property ImageFieldsToTryRewriteToCdnUrls to provide a comma separated list of Fields.
    - Supports Hyperlink Fields (Picture or Link) and PublishingImage Fields.
  - SharePoint Image renditions

To use public CDN assets that are in an origin that does not have the Publishing feature enabled, you can manually construct URLs to the assets and use these URLs in your content. For public CDN assets, the URL format will look like the following:

``` html
https://publiccdn.sharepointonline.com/<TenantHostName>/sites/site/library/asset.png
```

You need to replace **TenantHostName** with your tenant name. Example:

``` html
https://publiccdn.sharepointonline.com/contoso.sharepoint.com/sites/site/library/asset.png
```

You will not be able to test the URL’s directly in a web browser because you must have a referer coming from SharePoint Online. However, if you add the CDN asset URL to a SharePoint page and then render the page in the browser, you will see the asset render.

### Azure CDN assets

The public Azure CDN is available as an alternative to organizations who want to deploy their own CDN instance. Azure CDN storage is provided by an Azure storage account, and can be secured with access keys. To deploy an Azure CDN instance, you must have an Azure subscription.

For more information on how to configure an Azure CDN instance, see [Quickstart: Integrate an Azure storage account with Azure CDN](https://docs.microsoft.com/en-us/azure/cdn/cdn-create-a-storage-account-with-cdn).

For an example of how the Azure CDN can be used to host SharePoint web parts, see [Deploy your SharePoint client-side web part to Azure CDN](https://docs.microsoft.com/en-us/sharepoint/dev/spfx/web-parts/get-started/deploy-web-part-to-cdn).

## Troubleshooting your Office 365 CDN
<a name="CDNManage"> </a>

### How do I confirm that assets are being served by the CDN?
Once you have added links to CDN assets to a page, you can confirm that the asset is being served from the CDN by browsing to the page, right clicking on the image once it has rendered and reviewing the image URL.

You can also use your browser's developer tools to view the URL for each asset on a page, or use a 3rd party network trace tool.

> [!NOTE]
> If you use a network tool such as Fiddler to test your assets outside of rendering the asset from a SharePoint page, you must manually add the referer header “Referer: https://yourdomain.sharepoint.com” to the GET request where the URL is the root URL of your SharePoint Online tenant. Browsing directly to an asset without the SharePoint Online referer will fail to load the asset.

For more information on using the developer tools in the Microsoft Edge browser, see [Microsoft Edge Developer Tools](https://docs.microsoft.com/en-us/microsoft-edge/devtools-guide).

### Why are assets from a new origin unavailable?
Assets in new origins will not immediately be available for use, as it takes time for the registration to propagate through the CDN and for the assets to be uploaded to CDN storage. Configuration can take up to 15 minutes.

### The */clientsideassets origin is missing, and public CDN content isn't working

``` powershell
Add-SPOTenantCdnOrigin -CdnType Public -OriginUrl */CLIENTSIDEASSETS
```

``` powershell
o365 spo cdn origin add --origin */CLIENTSIDEASSETS
```

## See also

[Content Delivery Networks](https://aka.ms/o365cdns)

[Network planning and performance tuning for Office 365](https://aka.ms/tune)