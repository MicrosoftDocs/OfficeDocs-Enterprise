---
title: "Hybrid Modern Authentication overview and prerequisites for using it with on-premises Skype for Business and Exchange servers"
ms.author: tracyp
ms.reviewer: smithre4
author: MSFTTracyP
manager: laurawi
ms.date:
ms.audience: ITPro
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.assetid: ef753b32-7251-4c9e-b442-1a5aec14e58d
ms.collection:
- M365-security-compliance
description: "Modern Authentication is a method of identity management that offers more secure user authentication and authorization. It's available for hybrid deployments of Skype for Business server on-premises and Exchange server on-premises, as well as split-domain Skype for Business hybrids. This article links to related docs about prerequisites, setup/disabling Modern Authentication, and to some of the related client (ex. Outlook and Skype clients) information."
---

# Hybrid Modern Authentication overview and prerequisites for using it with on-premises Skype for Business and Exchange servers

Modern Authentication is a method of identity management that offers more secure user authentication and authorization. It's available for Office 365 hybrid deployments of Skype for Business server on-premises and Exchange server on-premises, as well as, split-domain Skype for Business hybrids. This article links to related docs about prerequisites, setup/disabling Modern Authentication, and to some of the related client (ex. Outlook and Skype clients) information. 
  
- [What is Modern Authentication?](hybrid-modern-auth-overview.md#BKMK_WhatisModAuth)
    
- [What changes when I use Modern Authentication?](hybrid-modern-auth-overview.md#BKMK_WhatChanges)
    
- [Check the Modern Authentication status of your on-premises environment](hybrid-modern-auth-overview.md#BKMK_CheckStatus)
    
- [Do you meet Modern Authentication prerequisites?](hybrid-modern-auth-overview.md#BKMK_MeetPrereq)
    
- [What else do I need to know before I begin?](hybrid-modern-auth-overview.md#BKMK_Whatelse)
    
- [List of Modern Authentication URLs](hybrid-modern-auth-overview.md#BKMK_URLListforMA)
    
## What is Modern Authentication?
<a name="BKMK_WhatisModAuth"> </a>

When talking about communication between a client (for example, your laptop or your phone) and a server, Microsoft uses the phrase 'Modern authentication'.
  
Modern authentication is an umbrella term for a combination of authentication and authorization methods, as well as some security measures that rely on access policies that you may already be familiar with. It includes:
  
- **Authentication methods**: Multi-factor Authentication; Client Certificate-based authentication; and the Active Directory Authentication Library ( [ADAL](https://technet.microsoft.com/en-us/library/mt710548.aspx)).
    
- **Authorization methods**: Microsoft's implementation of Open Authorization (OAuth). 
    
- **Conditional access policies**: Mobile Application Management (MAM) and Azure Active Directory Conditional Access. 
    
Managing user identities with Modern Authentication gives administrators many different tools to use when it comes to securing resources and offers more secure methods of identity management to both on-premises (Exchange and Skype for Business), Exchange hybrid, and Skype for Business hybrid/split-domain scenarios.
  
Be aware that because Skype for Business works closely with Exchange, the login behaviour Skype for Business client users will see will be effected by the Modern Authentication status of Exchange. This will also apply if you have a Skype for Business split-domain hybrid. Also, the type of Skype for Business Hybrid that supports the use of Modern Authentication is often called a 'split-domain' (in a split-domain, you have both Skype for Business Online and Skype for Business on-prem, and users are homed in both locations).
  
> [!IMPORTANT]
> Did you know that, as of August of 2017, all new Office 365 tenants that include Skype for Business online and Exchange online will have Modern Authentication enabled by default? Pre-existing tenants won't have a change in their default MA state, but all new tenants automatically support the expanded set of identity features you see listed above. To check your MA status for Skype for Business online, you can use Skype for Business online PowerShell with Global Admin credentials. Run `Get-CsOAuthConfiguration` to check the output of -ClientADALAuthOverride. If -ClientADALAuthOverride is 'Allowed' your Modern Authentication is on. 
  
## What changes when I use Modern Authentication?
<a name="BKMK_WhatChanges"> </a>

When using Modern Authentication with on-premises Skype for Business or Exchange server, you're still  *authenticating*  users on-premises, but the story of  *authorizing*  their access to resources (like files or emails) changes. This is why, though Modern Authentication is about client and server communication, the steps taken during configuring MA result in evoSTS (a Security Token Service used by Azure AD) being set as Auth Server for Skype for Business and Exchange server on-premises. 
  
The change to evoSTS allows your on-premises servers to take advantage of OAuth (token issuance) for authorizing your clients, and also lets your on-premises use security methods common in the cloud (like Multi-factor Authentication). Additionally, the evoSTS issues tokens that allow users to request access to resources without supplying their password as part of the request. No matter where your users are homed (of online or on-premises), and no matter which location hosts the needed resource, EvoSTS will become the core of authorizing users and clients once Modern Authentication is configured.
  
Here's an example of what I mean. If Skype for Business client needs to access Exchange server to get calendar information on behalf of a user, it uses the Active Directory Authentication Library (ADAL) to do so. ADAL is a code library designed to make secured resources in your directory available to client applications using OAuth security tokens. ADAL works with OAuth to verify claims and to exchange tokens (rather than passwords), to grant a user access to a resource. In the past, the authority in a transaction like this one -- the server that knows how to validate user claims and issue the needed tokens -- might have been a Security Token Service on-premises, or even Active Directory Federation Services. However, Modern Authentication centralizes that authority with Azure Active Directory (Azure AD) in the Cloud.
  
This also means that even though your Exchange server and Skype for Business environments may be entirely on-premises, the authorizing server will be online, and your on-premises environment must have the ability to create and maintain a connection to your Office 365 subscription in the Cloud (and the Azure Active Directory instance that your subscription uses as its directory).
  
What doesn't change? Whether you're in a split-domain hybrid or using Skype for Business and Exchange server on-premises, all users must first authenticate  *on-premises*  . In a hybrid implementation of Modern Authentication, Lyncdiscovery and Autodiscovery point to your on-premises server. 
  
> [!IMPORTANT]
> If you need to know the specific Skype for Business topologies supported with MA, that's [documented right here](https://technet.microsoft.com/en-us/library/mt803262.aspx).
  
## Check the Modern Authentication status of your on-premises environment
<a name="BKMK_CheckStatus"> </a>

Because Modern Authentication changes the authorization server used when services leverage OAuth/S2S, you need to know if Modern Authentication is On or Off for your Skype for Business and Exchange environment. You can check the status on your Exchange or Skype for Business servers, on premises, by running the `Get-CSOAuthConfiguration` command in PowerShell. If the command returns an empty 'OAuthServers' property, then Modern Authentication is disabled.
  
## Do you meet Modern Authentication prerequisites?

Verify and check these items off your list before you continue:
  
- **Skype for Business specific**
    
  - All servers must have SFB Server 2015 CU5 or later
    
  - **Exception** - Survivability Branch Appliance (SBA) can be on the current version (based on Lync 2013) 
    
  - Your SIP domain is added as a Federated domain in Office 365
    
  - All SFB Front Ends must have connections outbound to the internet, to Office 365 Authentication URLs (TCP 443) and well known certificate root CRLs (TCP 80) listed in Rows 56 and 125 of the 'Microsoft 365 Common and Office Online' section of [Office 365 URLs and IP address ranges](urls-and-ip-address-ranges.md).
    
 **Note** If your Skype for Business front-end servers use a proxy server for Internet access, the proxy server IP and Port number used must be entered in the configuration section of the web.config file for each front end. 
  
- C:\Program Files\Skype for Business Server 2015\Web Components\Web ticket\int\web.config
    
- C:\Program Files\Skype for Business Server 2015\Web Components\Web ticket\ext\web.config
    
```xml
<system.identityModel.services>
  <system.net>
    <defaultProxy>
      <proxy
        proxyaddress="http://192.168.100.60:8080"
        bypassonlocal="true" />
    </defaultProxy>
  </system.net>
</system.identityModel.services>
```
    
> [!IMPORTANT]
> Be sure to subscribe to the RSS feed for [Office 365 URLs and IP address ranges](urls-and-ip-address-ranges.md) to stay current with the latest listings of required URLs. 
  
- **Exchange Server specific**
    
  - You're using either Exchange server 2013 CU19 and up, or Exchange server 2016 CU8 and up.
    
  - There is no Exchange server 2010 in the environment.
    
  - SSL Offloading is not configured. SSL termination and re-encryption is supported.
    
  - In the event your environment utilizes a proxy server infrastructure to allow servers to connect to the Internet, be sure all Exchange servers have the proxy server defined in the [InternetWebProxy](https://technet.microsoft.com/en-us/library/bb123716%28v=exchg.160%29.aspx) property.
    
- **Exchange client and protocol requirements**
  
  - The following clients support modern authentication:

  |**Clients**|**Primary Protocol**|**Notes**|
  |:-----|:-----|:-----|
  |Outlook 2013 and Outlook 2016  <br/> |MAPI over HTTP  <br/> |MAPI over HTTP must be enabled within Exchange in order to leverage modern authentication with these clients (usually enabled or True for new installs of Exchange 2013 Service Pack 1 and above); for more information see [How modern authentication works for Office 2013 and Office 2016 client apps](https://docs.microsoft.com/en-us/office365/enterprise/modern-auth-for-office-2013-and-2016).  <br/> Ensure you are running the minimum required build of Outlook; see [Latest updates for versions of Outlook that use Windows Installer (MSI)](https://docs.microsoft.com/en-us/officeupdates/outlook-updates-msi).  <br/> |
  |Outlook 2016 for Mac  <br/> |Exchange Web Services  <br/> |  <br/> |
  |Outlook for iOS and Android  <br/> |  <br/> |See [Using hybrid Modern Authentication with Outlook for iOS and Android](https://docs.microsoft.com/en-us/Exchange/clients/outlook-for-ios-and-android/use-hybrid-modern-auth) for more information.  <br/> |
  |Exchange ActiveSync clients (e.g., iOS11 Mail)  <br/> |Exchange ActiveSync  <br/> |For Exchange ActiveSync clients that support modern authentication, you must recreate the profile in order to switch from basic authentication to modern authentication.  <br/> |

- **General prerequisites**
    
  - If you use ADFS, you should have Windows 2012 R2 ADFS 3.0 and above for federation
    
  - Your identity configurations are any of the types supported by AAD Connect (such as password hash sync, pass-through authentication, on-premises STS supported by Office 365, et cetera.)
    
  - You have AAD Connect configured and functioning for user replication and sync.
    
  - You have verified that hybrid is configured using Exchange Classic Hybrid Topology mode between your on-premises and Office 365 environment. Official support statement for Exchange hybrid says you must have either current CU or current CU - 1.
    
    > [!Note]
    > Hybrid Modern Authentication is not supported with the [Hybrid Agent](https://docs.microsoft.com/exchange/hybrid-deployment/hybrid-agent).
    
  - Make sure both an on-premises test user, as well as a hybrid test user homed in Office 365, can login to the Skype for Business desktop client (if you want to use Modern Authentication with Skype) and Microsoft Outlook (if you want so use Modern Authentication with Exchange).
    
## What else do I need to know before I begin?
<a name="BKMK_Whatelse"> </a>

1. All the scenarios for on-premises servers involve setting up Modern Authentication on-premises (in fact, for Skype for Business there is a list of Supported topologies) so that the server responsible for authentication and authorization is in the Microsoft Cloud (AAD's security token service, called 'evoSTS'), and updating Azure Active Directory (AAD) about the URLs or namespaces used by your on-premises installation of either Skype for Business or Exchange. Therefore, on-premises servers take on a Microsoft Cloud dependency. Taking this action could be considered configuring 'hybrid auth'.
    
2. This article links out to others that will help you choose supported Modern Authentication topologies (necessary only for Skype for Business), and how-to articles that outline the setup steps, or steps to disable Modern Authentication, for Exchange on-premises and Skype for Business on-premises. Favourite this page in your browser if you're going to need a home-base for using Modern Authentication in your server environment.
    
## List of Modern Authentication URLs
<a name="BKMK_URLListforMA"> </a>

- [How to configure Exchange Server on-premises to use Modern Authentication](configure-exchange-server-for-hybrid-modern-authentication.md)
    
- [Skype for Business topologies supported with Modern Authentication](https://technet.microsoft.com/en-us/library/mt803262.aspx)
    
- [How to configure Skype for Business on-premises to use Modern Authentication](configure-skype-for-business-for-hybrid-modern-authentication.md)
    
- [Removing or disabling Hybrid Modern Authentication from Skype for Business and Exchange](remove-or-disable-hybrid-modern-authentication-from-skype-for-business-and-excha.md)
    

