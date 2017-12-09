---
title: "Microsoft Cloud Identity for Enterprise Architects"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 7/19/2017
ms.audience: ITPro
ms.topic: conceptual
ms.service: Office 365
localization_priority: Priority
ms.collection:
- Ent_O365
- Ent_O365_Visuals
ms.custom:
- DecEntMigration
- O365ITProTrain
- Strat_O365_Enterprise
- Ent_Architecture
ms.assetid: d27b5085-7325-4ab9-9d9a-438908a65d2c
description: "Summary: Design your identity solution for Microsoft cloud services and platforms."
---

# Microsoft Cloud Identity for Enterprise Architects

 **Summary:** Design your identity solution for Microsoft cloud services and platforms.
  
This article describes what IT architects need to know about designing identity for organizations using Microsoft cloud services and platforms. You can also view this article as a 5-page poster and print it in tabloid format (also known as ledger, 11 x 17, or A3).
  
[![Thumb image for Microsoft cloud identity model] (images/ffa145a1-97e6-4c36-b08b-01c4a4ae8b9b.png)          ](https://www.microsoft.com/download/details.aspx?id=54431)
  
![PDF file](images/ITPro_Other_PDFicon.png)[PDF](https://go.microsoft.com/fwlink/p/?LinkId=524586)  | ![Visio file](images/ITPro_Other_VisioIcon.jpg)[Visio](https://download.microsoft.com/download/2/3/8/238228E6-9017-4F6C-BD3C-5559E6708F82/MSFT_cloud_architecture_identity.vsd)  | ![See a page with versions in additional languages](images/e16c992d-b0f8-48ae-bf44-db7a9fcaab9e.png)[More languages](https://www.microsoft.com/download/details.aspx?id=54431)
  
You can also see all of the models in the [Microsoft Cloud IT architecture resources](microsoft-cloud-it-architecture-resources.md) and swipe through [Microsoft's Enterprise Cloud Roadmap: Resources for IT Decision Makers](https://aka.ms/cloudarchitecture).
  
> [!NOTE]
> This article reflects the January 2016 version of the **Microsoft cloud identity for enterprise architects** poster. It does not contain the changes for the April 2016 version of the poster.
  
## Designing identity for the Microsoft cloud

Integrating your identities with the Microsoft cloud provides access to a broad range of services and cloud platform options. There are two main options:
  
- You can integrate with Microsoft Azure Active Directory (AD). This involves synchronizing your on-premises accounts to Azure AD, the identity provider for the Microsoft cloud.
    
- You can extend your on-premises Active Directory Domain Services (AD DS) environment to virtual machines running in Microsoft Azure infrastructure services.
    
![Options for designing your identities in the cloud](images/08277e96-e4d2-43cb-a56f-a11c7647881a.png)
  
 **Figure 1: Options for designing your identities in the cloud**
  
Figure 1 shows how Azure AD is the identity provider for Microsoft Software as a Service (SaaS) services and Azure Platform as a Service (PaaS) applications and how line-of-business applications can use on-premises AD DS. 
  
### Azure Active Directory

Microsoft Azure AD is the Microsoft cloud-hosted identity and access management service. It's at the center of Microsoft cloud services and platforms. Integrating with Azure AD provides access to all of the Microsoft SaaS services using your current set of accounts and passwords. That integration also provides cloud-based identity for Azure PaaS applications. 
  
> [!NOTE]
> Azure AD does not replace the need for AD DS on-premises for enterprise organizations or for Windows -based virtual machines running in Azure Infrastructure as a Service (IaaS). 
  
There are three editions of Azure AD: Free, Basic, and Premium. 
  
||||
|:-----|:-----|:-----|
|**Free** <br/> |**Basic** <br/> |**Premium** <br/> |
| Manage user accounts <br/>  Synchronize with on-premises directories <br/>  Single sign-on across Azure, Office 365, and thousands of other popular SaaS applications, such as Salesforce, Workday, Concur, DocuSign, Google Apps, Box, ServiceNow, Dropbox, and more <br/> | Includes all of the abilities in the Free edition, plus: <br/>  Company branding <br/>  Group-based application access <br/>  Self-service password reset <br/>  Enterprise SLA of 99.9% <br/> | Includes all of the features of the Free and Basic editions, plus: <br/>  Self-service group management <br/>  Advanced security reports and alerts <br/>  Multi-factor authentication <br/>  Password reset with write-back to on-premises AD DS <br/>  Azure AD Connect tool bidirectional synchronization <br/>  Azure AD Application Proxy <br/>  Microsoft Forefront Identity Manager (MIM) <br/> |
   
For more information about versions, see [Azure Active Directory editions](https://go.microsoft.com/fwlink/p/?LinkId=524280).
  
### Option 1: Integrate with Azure Active Directory

Most organizations synchronize a standard set of objects and attributes to their Azure AD tenant. The Azure AD Connect tool synchronizes your accounts between on-premises AD DS and an Azure AD tenant.
  
![Integrating with Azure AD](images/3ce05e49-2cb6-4cdc-99ab-d96c5bd12fe8.png)
  
 **Figure 2: Integrating with Azure AD**
  
Figure 2 shows how the Azure AD Connect tool obtains AD DS changes and sends them to your Azure AD tenant. In this case, your Azure AD tenant is a cloud-hosted duplicate of essential on-premises directory content.
  
Many organizations use AD DS as their on-premises identity provider. You can use a different type of identity provider on-premises (such as one that uses LDAP), and synchronize these to Azure AD.
  
### Option 2: Extend AD DS to Azure

Extending AD DS to virtual machines running in Azure infrastructure services supports a different set of solutions and applications compared to synchronization with Azure AD. Here are two:
  
- Supports cloud-based solutions that require NTLM or Kerberos authentication, or AD DS domain-joined virtual machines.
    
- Adds additional integration potential for cloud services and applications across Microsoft cloud services and platforms.
    
![Extending AD DS to Azure](images/4675cf17-962c-4840-b1dc-bbd1d8894a27.png)
  
 **Figure 3: Extending AD DS to Azure**
  
Figure 3 shows an AD DS domain controller connected to an Azure virtual network through an on-premises VPN device and an Azure VPN gateway. The Azure virtual network contains servers for a line-of-business application and its own set of AD DS domain controllers.
  
### More Information

- [Synchronizing your directory with Office 365 is easy](https://go.microsoft.com/fwlink/p/?LinkId=524281)
    
- [Infographic: Cloud identity and access management](https://go.microsoft.com/fwlink/p/?LinkId=524282)
    
- [Azure Active Directory](https://go.microsoft.com/fwlink/p/?LinkId=524283)
    
## Integrate your on-premises AD DS accounts with Microsoft Azure AD

By synchronizing your on-premises AD DS accounts with Azure AD, your users can use their on-premises AD DS accounts to access:
  
- All of the Microsoft SaaS services (Office 365, Microsoft Intune, and Dynamics CRM Online)
    
- Your applications running in Azure PaaS
    
There are two ways to configure this integration:
  
- Directory and password synchronization
    
- Federation and single sign-on
    
Start with the simplest option that meets your needs. You can switch between these options, if needed.
  
> [!NOTE]
> Using cloud-only accounts (not integrating with your on-premises AD DS) is not recommended for enterprise-scale organizations. 
  
### Directory and password synchronization

This is the simplest option and requires only a server running the Azure AD Connect tool. 
  
![Directory and password synchronization configuration](images/e7dcfe8f-dab5-461e-89cc-d7a48f58dc0f.png)
  
 **Figure 4: Directory and password synchronization configuration**
  
Figure 4 shows an on-premises or private cloud datacenter with an AD DS domain controller. A server running the Azure AD Connect tool synchronizes the list of account names with Azure AD.
  
With this option:
  
- User accounts are synchronized from your on-premises AD DS (or other identity provider) to your Azure AD tenant. The on-premises directory remains the authoritative source for accounts and you manage all account changes from there.
    
- Azure AD performs all authentication for Microsoft SaaS-based services and Azure PaaS applications.
    
- You can also configure synchronization for multiple AD DS forests.
    
With password synchronization:
  
- Users are prompted to enter a password when accessing cloud services, which is the same password that they use for on-premises resources.
    
- User passwords are never sent as cleartext to Azure AD. Instead, a hash of the password is used. It is cryptographically impossible to decrypt or reverse-engineer the password hash and obtain the cleartext password. 
    
With multi-factor authentication (MFA):
  
- You can take advantage of basic MFA features offered with Office 365.
    
- Azure PaaS application developers can take advantage of the Azure Multi-Factor Authentication service.
    
Directory synchronization does not provide integration with on-premises MFA solutions.
  
### Federation and single sign-on

This option requires additional servers and infrastructure. 
  
![Servers needed for federated authentication](images/1e54f0d2-e650-4eb5-957f-4f1d3c44da16.png)
  
 **Figure 5: Servers needed for federated authentication**
  
Figure 5 shows the set of components for federated authentication. Azure AD contacts a web application proxy, which forwards the authentication request to an Active Directory Federation Services (AD FS) server, which forwards the request to an AD DS domain controller for evaluation and response. A server running the Azure AD Connect tool synchronizes the list of account names from AD DS to Azure AD.
  
Federation provides these additional enterprise capabilities:
  
- All authentication requests sent to Azure AD are forwarded to and performed against the on-premises identity provider through AD FS.
    
- Works with non-Microsoft identity providers.
    
- Password hash synchronization can act as a sign-in backup for federated sign-in (for example, if the federated authentication fails).
    
Use federation if:
  
- Single sign-on is required. With single sign-on, users are not prompted to enter any credentials (user name or password), when accessing a cloud service.
    
- AD FS is already deployed.
    
- You use a third-party identity provider.
    
- You use Forefront Identity Manager 2010 R2 (does not support password hash synchronization).
    
- You have an on-premises integrated smart card or other MFA solution.
    
- You require sign-in audit and/or disablement of accounts.
    
- Your organization requires client sign-in restrictions by network location or work hours.
    
- You must comply with Federal Information Processing Standards (FIPS).
    
Federated authentication requires a greater investment in infrastructure on-premises.
  
- The on-premises servers must be Internet-accessible through a corporate firewall. Microsoft recommends the use of Web Application Proxy servers deployed in your perimeter network.
    
- Requires hardware, licenses, and operations for AD FS servers, AD FS proxy or Web Application Proxy servers, firewalls, and load balancers. 
    
- Availability and performance are important to ensure users can access Office 365 and other cloud applications.
    
### More Information

- [Synchronizing your directory with Office 365 is easy](https://go.microsoft.com/fwlink/p/?LinkId=524281)
    
- [Prepare to provision users through directory synchronization to Office 365](https://go.microsoft.com/fwlink/p/?LinkId=524284)
    
- [Multi-Factor Authentication for Office 365](https://go.microsoft.com/fwlink/p/?LinkID=392012)
    
- [Azure Multi-Factor Authentication](https://go.microsoft.com/fwlink/p/?LinkId=524285)
    
- [TechEd 2014: Directory Integration: Creating One Directory with Active Directory and Azure Active Directory](https://go.microsoft.com/fwlink/p/?LinkId=524286)
    
## Extend AD DS to Azure

Extending AD DS to Azure is the first step to support line-of-business applications running on virtual machines in Azure infrastructure services, which provides:
  
- Support for cloud-based solutions that require NTLM or Kerberos authentication, or AD DS domain-joined virtual machines.
    
- Additional integration potential for cloud services and applications and can be added at any time.
    
![Extending AD DS to an Azure virtual network](images/9fe2e27d-7fc8-441a-a694-1db4b9f6d03f.png)
  
 **Figure 6: Extending AD DS to an Azure virtual network**
  
Figure 6 shows an on-premises or private cloud datacenter with AD DS connected to an Azure virtual network with a site-to-site VPN or ExpressRoute connection. The Azure virtual network contains servers for a line-of-business application and its own set of AD DS domain controllers. This configuration is a hybrid deployment of AD DS on-premises and in Azure infrastructure services. It requires:
  
- An Azure virtual network.
    
- A connection between an on-premises virtual private network (VPN) device or router and an Azure VPN gateway.
    
- Using a portion of your on-premises IP address space for the virtual machines in the virtual network.
    
- Deploying one or more domain controllers in the virtual network designated as global catalog servers (reduces egress traffic across the VPN connection).
    
This identity architecture supports a different set of solutions and applications compared to synchronization with Azure AD.
  
### On-premises to Azure connection options

To connect your on-premises network to an Azure virtual network, you can use:
  
- A site-to-site VPN connection, which can connect 1-10 sites (including other Azure virtual networks) to a single Azure virtual network.
    
- ExpressRoute, a private, secure WAN link to Azure through a partner network and datacenter services provider. ExpressRoute connections can offer increased reliability, higher bandwidth, and lower latencies.
    
### More Information

- [Cross-premises connectivity for virtual networks](https://go.microsoft.com/fwlink/p/?LinkId=524293)
    
- [ExpressRoute Technical Overview](https://go.microsoft.com/fwlink/?LinkID=392081)
    
- [Guidelines for Deploying Windows Server Active Directory on Azure Virtual Machines](https://go.microsoft.com/fwlink/p/?LinkId=524295)
    
## Integrate your applications with cloud identities

When designing and developing applications that run in the cloud, you should aim for consistency of the user experience for the authentication process, including the set of required credentials. For example, when using Windows credentials, whether against Azure AD or an extended AD DS, ensure that users can quickly authenticate and focus on their tasks.
  
![Integrate your applications with cloud identities](images/1e6304b0-fa15-4f80-a3b4-7507a28808ae.png)
  
 **Figure 7: Integrate your applications with cloud identities**
  
Figure 7 shows three options for integrating your application with cloud identities.
  
1. Register your cloud-hosted applications with Azure AD.
    
    See the MSDN article [Integrating Applications with Azure Active Directory](https://go.microsoft.com/fwlink/p/?LinkId=524303). This lets you use Azure AD to authenticate access to your PaaS application, as well as allowing users or administrators to grant rights to your application to access content on their behalf from other cloud services, such as Office 365. More details and code samples can be found in the MSDN article [Authentication Scenarios for Azure Active Directory](https://go.microsoft.com/fwlink/p/?LinkId=524304). 
    
2. Applications that require programmatic authentication to gain access to an application secured by AD SD, AD FS on Windows Server 2012 R2, or Azure AD can use:
    
  - The [Azure AD Graph API](https://go.microsoft.com/fwlink/p/?LinkId=524305)
    
  - [Active Directory Authentication Library (ADAL)](https://go.microsoft.com/fwlink/p/?LinkID=524297)
    
    The Azure AD Graph API supports OAuth and OpenID Connect. It also works with PaaS applications.
    
3. Configure on-premises applications or line-of-business applications running on virtual machines in an Azure virtual network to use Windows authentication (NTLM or Kerberos) directly. This is the best experience for users and requires the least configuration for server application developers.
    
### Application integration example

An organization builds an ASP.NET application that exposes a REST endpoint where other applications can obtain the latest sales data. Access to that REST endpoint is secured with Azure AD. Applications must provide credentials that can be authenticated by Azure AD before the ASP.NET application sends the requested data. Other developers in the organization can then write their own applications that use the sales data from the REST endpoint.
  
To authenticate to Azure AD and retrieve data, ADAL manages the user authentication process and hands the access token off to the application so it can be used to gain access to the sales data. ADAL abstracts out much of the complexity of obtaining and parsing tokens, OAuth flows, and other elements. ADAL is another technology solution that is rapidly changing so developers should look for the latest version on NuGet.
  
## Deploying directory components in Azure

You can deploy directory components, such as servers for password synchronization or federated authentication, in an Azure virtual network rather than an on-premises datacenter. Consider its benefits, especially if you plan to extend AD DS into Azure.
  
Here are the directory components that can be put in an Azure virtual network:
  
- Azure AD Connect tool
    
- Federated authentication components
    
- A standalone AD DS environment
    
### AD Connect tool

The Azure AD Connect tool can be hosted in the cloud on an Azure virtual network. Consider these benefits of deploying this workload to Azure:
  
- Potentially faster provisioning and lower cost of operations
    
- Increased availability
    
![The AD Connect tool running in Azure infrastructure services](images/97593481-e06a-4e34-b8b5-cc63acb5f9f1.png)
  
 **Figure 8: The AD Connect tool running in Azure**
  
Figure 8 shows the AD Connect tool running on a virtual machine in an Azure virtual network, which queries an on-premises AD DS domain controller for account changes and then sends those changes to Office 365. This solution works with:
  
- Office 365 services.
    
- Azure PaaS applications that are available over the Internet.
    
- Line-of-business applications in Azure that are available from on-premises environments through the site-to-site VPN or ExpressRoute connection.
    
For more information, see [Integrating your on-premises identities with Azure Active Directory](https://go.microsoft.com/fwlink/p/?LinkId=524307).
  
### Federated authentication infrastructure

If you haven't already deployed AD FS on-premises, consider these benefits of deploying this workload to Azure:
  
- Provides autonomy for authentication to cloud services (no on-premises dependencies)
    
- Reduces servers and tools hosted on-premises
    
- Uses a site-to-site VPN gateway on a two-node failover cluster to connect to Azure (new)
    
- Uses ACLs to ensure that Web Application Proxy servers can only communicate with AD FS, not domain controllers or other servers directly
    
![Deploying your federated authentication infrastructure in Azure](images/4e023dd4-b9fb-403a-a8eb-069b56d7a65e.png)
  
 **Figure 9: Deploying your federated authentication infrastructure in Azure**
  
Figure 9 shows a set of on-premises domain controllers replicating AD DS information with a set of domain controllers in an Azure virtual network. The Azure AD Connect tool running on a server in the Azure virtual network queries the local domain controllers for changes and then sends those changes to Azure AD. Incoming authentication requests to Azure AD from Microsoft SaaS services, Azure PaaS applications, and other cloud applications are forwarded to an external load balancer, which forwards the request to a set of Web Application Proxy servers. The Web Application Proxy servers forward the request to an internal load balancer, which forwards the request to a set of AD FS servers. The AD FS servers then forward the request to a domain controller to validate the send credentials.
  
 This solution works with:
  
- Applications that require Kerberos
    
- All of Microsoft's SaaS services
    
- Applications in Azure that are Internet-facing
    
- Applications in Azure IaaS or PaaS that require authentication with the set of accounts in your organization's AD DS
    
For more information, see [Integrating your on-premises identities with Azure Active Directory](https://go.microsoft.com/fwlink/p/?LinkId=524307).
  
### Standalone AD DS environment in an Azure virtual network

You don't always need to integrate a cloud application with your on-premises environment. For example, a standalone AD DS domain in an Azure virtual network supports applications that are public-facing, such as Internet sites.
  
![A standalone AD DS environment for a server-based application](images/98c7349f-535d-4c9b-8de4-e580f6d573d4.png)
  
 **Figure 10: A standalone AD DS environment for a server-based application**
  
Figure 10 shows an Azure virtual network hosting a set of AD DS servers, providing both AD DS and DNS services, with a set of servers that host an application. This solution works with:
  
- Internet-facing web sites and applications
    
- Applications that require NTLM or Kerberos authentication
    
- Applications running on Windows-based servers that require AD DS
    
For more information, see [Integrating your on-premises identities with Azure Active Directory](https://go.microsoft.com/fwlink/p/?LinkId=524307).
  
## See Also

#### 

[Microsoft Cloud IT architecture resources](microsoft-cloud-it-architecture-resources.md)
#### 

[Microsoft's Enterprise Cloud Roadmap: Resources for IT Decision Makers](https://sway.com/FJ2xsyWtkJc2taRD)

