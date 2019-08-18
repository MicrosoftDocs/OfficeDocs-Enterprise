---
title: "Additional endpoints not included in the Office 365 IP Address and URL Web service"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 06/24/2019
audience: Admin
ms.topic: conceptual
ms.service: o365-administration
localization_priority: Priority
ms.collection:
- Ent_O365
- Strat_O365_Enterprise
ms.custom: Adm_O365
search.appverid:
- MET150
- MOE150
- MED150
- MBS150
- MOM160
- BCS160
ms.assetid: 
description: "Summary: The new endpoint Web service does not include a small number of endpoints for specific scenarios."
hideEdit: true
---

# Additional endpoints not included in the Office 365 IP Address and URL Web service

Some network endpoints were previously published and have not been included in the [Office 365 IP Address and URL Web Service](office-365-ip-web-service.md). The web service scope is network endpoints that are required for connectivity from a user of Office 365 across an enterprise perimeter network. This currently does not include:

1. Network connectivity that may be required from a Microsoft datacenter to a customer network (inbound hybrid server network traffic).
2. Network connectivity from servers on a customer network across the enterprise perimeter (outbound server network traffic).
3. Uncommon scenarios for network connectivity requirements from a user.
4. DNS resolution connectivity requirement (not listed below).
5. Internet Explorer or Microsoft Edge Trusted Sites.

Apart from DNS, these are all optional for most customers unless you need the specific scenario that is described.

|||||
|:-----|:-----|:-----|:-----|
| **Row** | **Purpose** | **Destination** | **Type** |
| 1  | [Import Service](https://support.office.com/article/use-network-upload-to-import-your-organization-pst-files-to-office-365-103f940c-0468-4e1a-b527-cc8ad13a5ea6) for PST and file ingestion | Refer to the [Import Service](https://support.office.com/article/use-network-upload-to-import-your-organization-pst-files-to-office-365-103f940c-0468-4e1a-b527-cc8ad13a5ea6) for additional requirements. | Uncommon outbound scenario |
| 2  | [Microsoft Support and Recovery Assistant for Office 365](https://diagnostics.office.com/#/) - validate single sign-on user credentials. Source: <br> ```o365diagnosticsbasic-eus.cloudapp.net (104.211.54.99)``` <br> ```o365diagnosticworker-eus.cloudapp.net (104.211.54.134)```  | On-premises security token service | Inbound server traffic |
| 3  | Azure AD Connect (w/SSO option) – WinRM & remote PowerShell | Customer STS environment (AD FS Server and AD FS Proxy) \| TCP ports 80 & 443 | Inbound server traffic |
| 4  | STS such as AD FS Proxy server(s) (for federated customers only) | Customer STS (such as AD FS Proxy) \| Ports TCP 443 or TCP 49443 w/ClientTLS | Inbound server traffic |
| 5  | [Exchange Online Unified Messaging/SBC integration](https://technet.microsoft.com/library/jj673565.aspx) | Bidirectional between on-premises Session Border Controller and *.um.outlook.com | Outbound server only traffic |
| 6  | Mailbox Migration. When mailbox migration is initiated from on-premises [Exchange Hybrid](https://docs.microsoft.com/exchange/exchange-deployment-assistant) to Office 365, Office 365 will connect to your published Exchange Web Services (EWS)/Mailbox Replication Services (MRS) server. If you need the NAT IP addresses used by Exchange Online servers to restrict inbound connections from specific source IP ranges, they are listed in [Office 365 URL & IP ranges](urls-and-ip-address-ranges.md) under the "Exchange Online" service area. Care should be taken to ensure that access to published EWS endpoints like OWA is not impacted by ensuring the MRS proxy resolves to a separate FQDN and public IP address before restricting TCP 443 connections from specific source IP ranges. | Customer on-premises EWS/MRS Proxy<br> TCP port 443 | Inbound server traffic |
| 7  | [Exchange Hybrid](https://docs.microsoft.com/exchange/exchange-deployment-assistant) co-existence functions such as Free/Busy sharing. | Customer on-premises Exchange server | Inbound server traffic |
| 8  | [Exchange Hybrid](https://docs.microsoft.com/exchange/exchange-deployment-assistant) proxy authentication | Customer on-premises STS | Inbound server traffic |
| 9  | Used to configure [Exchange Hybrid](https://docs.microsoft.com/exchange/exchange-deployment-assistant), using the [Exchange Hybrid Configuration Wizard](https://docs.microsoft.com/exchange/hybrid-configuration-wizard) <br> Note: These endpoints are only required to configure Exchange hybrid  | domains.live.com on TCP ports 80 & 443, only required for Exchange 2010 SP3 Hybrid Configuration Wizard<BR> <BR> GCC High, DoD IP addresses: 40.118.209.192/32; 168.62.190.41/32 <BR> <BR> Worldwide Commercial & GCC: *.store.core.windows.net; asl.configure.office.com; mshrcstorageprod.blob.core.windows.net; tds.configure.office.com; mshybridservice.trafficmanager.net <BR>  | Outbound server only traffic |
| 10  | The AutoDetect service is used in [Exchange Hybrid](https://docs.microsoft.com/exchange/exchange-deployment-assistant) scenarios with [Hybrid Modern Authentication with Outlook for iOS and Android](https://docs.microsoft.com/Exchange/clients/outlook-for-ios-and-android/use-hybrid-modern-auth) <BR> <BR> ```*.acompli.net``` <BR> <BR> ```*.outlookmobile.com``` <BR> <BR> ```*.outlookmobile.us``` <BR> <BR> ```52.125.128.0/20``` <BR> ```52.127.96.0/23``` <BR> | Customer on-premises Exchange server on TCP 443 | Inbound server traffic |
| 11  | Skype for Business in Office 2016 includes video based screen sharing which uses UDP ports. Prior Skype for Business clients in Office 2013 and earlier used RDP over TCP port 443. | TCP port 443 open to 52.112.0.0/14 | Skype for Business older client versions in Office 2013 and earlier |
| 12  | Skype for Business hybrid on-premises server connectivity to Skype for Business Online | 13.107.64.0/18, 52.112.0.0/14 UDP ports 50,000-59,999 <BR>  TCP ports 50,000-59,999 | Skype for Business on-premises server outbound connectivity |
| 13  | Cloud PSTN with on-premises hybrid connectivity requires network connectivity open to the on-premises hosts. For more details about Skype for Business Online hybrid configurations  | See [Plan hybrid connectivity between Skype for Business Server and Office 365](https://docs.microsoft.com/skypeforbusiness/hybrid/plan-hybrid-connectivity) | Skype for Business on-premises hybrid inbound |
| 14  | **Authentication and identity FQDNs** <br> The FQDN ```secure.aadcdn.microsoftonline-p.com``` needs to be in your client's Internet Explorer (IE) or Edge Trusted Sites Zone to function. |  | Trusted Sites |
| 15  |  **Microsoft Teams FQDNs** <br> If you are using Internet Explorer or Microsoft Edge, you need to enable first and third-party cookies and add the FQDNs for Teams to your Trusted Sites. This is in addition to the suite-wide FQDNs, CDNs, and telemetry listed in row 14. See [Known issues for Microsoft Teams](https://docs.microsoft.com/microsoftteams/known-issues) for more information. |  | Trusted Sites |
| 16  |  **SharePoint Online and OneDrive for Business FQDNs** <br> All '.sharepoint.com' FQDNs with '\<tenant>' in the FQDN need to be in your client's IE or Edge Trusted Sites Zone to function. In addition to the suite-wide FQDNs, CDNs, and telemetry listed in row 14, you'll need to also add these endpoints. |  | Trusted Sites |
| 17  | **Yammer**  <br> Yammer is only available in the browser and requires the authenticated user to be passed through a proxy. All Yammer FQDNs need to be in your client's IE or Edge Trusted Sites Zone to function. |  | Trusted Sites |
| 18  | Use [Azure AD Connect](https://docs.microsoft.com/azure/active-directory/hybrid/) to sync on-premises user accounts to Azure AD. | See [Hybrid Identity Required Ports and Protocols](https://docs.microsoft.com/azure/active-directory/hybrid/reference-connect-ports), [Troubleshoot Azure AD connectivity](https://docs.microsoft.com/azure/active-directory/hybrid/tshoot-connect-connectivity), and [Azure AD Connect Health Agent Installation](https://docs.microsoft.com/azure/active-directory/hybrid/how-to-connect-health-agent-install#outbound-connectivity-to-the-azure-service-endpoints). | Outbound server only traffic |
| 19  | Microsoft Stream (needs the Azure AD user token). <BR> Office 365 Worldwide (including GCC) | *.cloudapp.net <BR> *.api.microsoftstream.com <BR> *.notification.api.microsoftstream.com <BR> amp.azure.net <BR> api.microsoftstream.com <BR> az416426.vo.msecnd.net <BR> s0.assets-yammer.com <BR> vortex.data.microsoft.com <BR> web.microsoftstream.com <BR> TCP port 443  | Inbound server traffic |
| 20  | Use MFA server for multifactor authentication requests, both new installations of the server and setting it up with Active Directory Domain Services (AD DS). | See [Getting started with the Azure Multi-Factor Authentication Server](https://docs.microsoft.com/azure/active-directory/authentication/howto-mfaserver-deploy#plan-your-deployment).  | Outbound server only traffic |
|||||

## Related Topics

[Managing Office 365 endpoints](managing-office-365-endpoints.md)
  
[Troubleshooting Office 365 connectivity](https://support.office.com/article/d4088321-1c89-4b96-9c99-54c75cae2e6d.aspx)
  
[Client connectivity](https://support.office.com/article/client-connectivity-4232abcf-4ae5-43aa-bfa1-9a078a99c78b)
  
[Content delivery networks](https://support.office.com/article/content-delivery-networks-0140f704-6614-49bb-aa6c-89b75dcd7f1f)
  
[Microsoft Azure Datacenter IP Ranges](https://www.microsoft.com/download/details.aspx?id=41653)
  
[Microsoft Public IP Space](https://www.microsoft.com/download/details.aspx?id=53602)

