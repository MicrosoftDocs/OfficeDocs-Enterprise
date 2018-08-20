---
title: "Office 365 Germany endpoints change log"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 8/13/2018
ms.audience: ITPro
ms.topic: conceptual
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
search.appverid: MOE150
ms.assetid: 980041c9-7984-44b2-95f0-af66743543a1

---

# Office 365 Germany endpoints change log

*Applies To: Office 365 Admin*

## List of changes to the endpoints required for Office 365 Germany

The following table lists the changes to [Office 365 Germany endpoints](office-365-germany-endpoints.md).
  
|**Date**|**Change**|
|:-----|:-----|
|1/24/2017  <br/> |Initial publication of article.  <br/> |
|2/28/2017  <br/> |Adding 3 FQDNs; 1/[Effective 4/1/2017. Required: Office 365 Portal and shared. ExpressRoute: No. www.office.de], 2/[Effective 4/1/2017. Required: Office 365 Portal and shared. ExpressRoute: No. office.de], 3/[Effective 4/1/2017. Required: Office 365 Portal and shared. ExpressRoute: No. officehome.msocdn.de]. Notes: Adding additional Portal FQDNs. Adding 2 IP_Sets; 1/[Effective 4/1/2017. Required: Office 365 Portal and shared. ExpressRoute: No. 51.5.245.67/32], 2/[Effective 4/1/2017. Required: Office 365 Portal and shared. ExpressRoute: No. 51.4.227.178/32]. Notes: Adding additional Portal endpoints. Adding 2 IP_Sets; 1/[Effective 4/1/2017. Required: Office 365 Portal and shared. ExpressRoute: No. 2a01:4180:2001::92], 2/[Effective 4/1/2017. Required: Office 365 Portal and shared. ExpressRoute: No. 2a01:4180:2401::11f]. Notes: Adding additional Portal endpoints.  <br/> |
|3/8/2017  <br/> |Adding 1 FQDNs; 1/[Effective 3/8/2017. Required: OneDrive for Business. ExpressRoute: No. spoprod-a.akamaihd.net],. Notes: Adding additional CDN endpoints.  <br/> |
|3/31/2017  <br/> |Adding 3 FQDNs; 1/[Effective 5/1/2017. Required: SharePoint Online Hybrid. \*.search.production.de.azuretrafficmanager.de], 2/[Effective 5/1/2017. Required: SharePoint Online Hybrid. login.microsoftonline.de], 3/[Effective 5/1/2017. Required: SharePoint Online Hybrid. provisioningapi.microsoftonline.de]. Notes: Adding Sharepoint hybrid FQDNs.  <br/> |
|6/1/2017  <br/> |Adding 2 FQDNs Effective 7/1/2017  <br/> shellprod.msocdn.de  <br/> r1.res.office365.com  <br/> |
|6/26/2017  <br/> |Replaced Autodiscover\*.outlook.de with Autodiscover.outlook.de And Autodiscover-outlook.office.de.  <br/> |
|9/29/2017  <br/> |Adding 3 FQDNs; 1/[Effective 11/1/2017.  <br/> cegsignup.microsoft.de  <br/> negsignup.microsoft.de  <br/> \*.svc.ms  <br/> |
|1/16/2018  <br/> |Adding 1 FQDNs; 1/[Effective 2/1/2018. Required: Office 365 Portal. ExpressRoute: No. webshell.suite.office.de]. Notes: Adding additional FQDN for Office 365 suite shell. Adding 4 IP_Sets; 1/[Effective 2/1/2018. Required: Office 365 Portal. ExpressRoute: No. 51.5.242.163/32], 2/[Effective 2/1/2018. Required: Office 365 Portal. ExpressRoute: No. 51.4.226.115/32], 3/[Effective 2/1/2018. Required: Office 365 Portal. ExpressRoute: No. 2a01:4180:2401::33b/ 4/[Effective 2/1/2018. Required: Office 365 Portal. ExpressRoute: No. 2a01:4180:2001::234/ Notes: Adding additional IP addresses for Office 365 suite shell.  <br/> |
|2/5/2018  <br/> |Adding 1 FQDN;1/[Effective 3/1/2018. Required: Portal and shared. ExpressRoute: Yes. webshell.suite.office.de]. Notes: Adding a URL for Portal and shared FQDNs. Adding 2 IP_Sets; 1/[Effective 3/1/2018. Required: Portal and shared. ExpressRoute: Yes. 51.5.242.163/32]., 2/[Effective 3/1/2018. Required: Portal and shared. ExpressRoute: Yes. 51.4.226.115/32]. Notes: Adding new prefixes for Portal and shared. Adding 2 IP_Sets; 1/[Effective 3/1/2018. Required: Portal and shared. ExpressRoute: Yes. 2a01:4180:2401::33b/128]., 2/[Effective 3/1/2018. Required: Portal and shared. ExpressRoute: Yes. 2a01:4180:2001::234/128]. Notes: Adding new prefixes for Portal and shared. Adding 1 IP_Sets; 1/[Effective 3/1/2018. Required: Office Online. ExpressRoute: Yes. 51.18.16.0/23]. Notes: Adding a new prefix for Office Online.  <br/> |
|3/15/2018  <br/> |Adding 1 IP_Set; 1/[Effective 4/15/2018. Required: Office 365 ProPlus. ExpressRoute: No. 51.18.0.0/21]. Notes: Adding an Office 365 ProPlus endpoint.  <br/> |
|7/2/2018  <br/> |Removing 1 FQDN; 1/[Effective 8/1/2018. Required: OneDrive for Business. ExpressRoute: No. login.microsoftonline.de]. Notes: Removing OneDrive for Business endpoint. Removing 11 FQDNs; 1/[Effective 8/1/2018. Required: Office Mobile. ExpressRoute: No. https://excelps.osi.office.de/exlps/excelprint.svc/exlPrint], 2/[Effective 8/1/2018. Required: Office Mobile. ExpressRoute: No. https://wordps.osi.office.de/wrdps/wordprint.svc/wrdprint], 3/[Effective 8/1/2018. Required: Office Mobile. ExpressRoute: No. https://wordcs.osi.office.de/wordauto/wordautomation.svc/wordautomation], 4/[Effective 8/1/2018. Required: Office Mobile. ExpressRoute: No. https://wordcs.osi.office.de/wordauto/wordautomation.svc/rest], 5/[Effective 8/1/2018. Required: Office Mobile. ExpressRoute: No. https://pptps.osi.office.de/pptps/powerpointprint.svc/PptPrint], 6/[Effective 8/1/2018. Required: Office Mobile. ExpressRoute: No. https://pptcs.osi.office.de/pptauto/PowerpointAutomation.svc/PptAutomation], 7/[Effective 8/1/2018. Required: Office Mobile. ExpressRoute: No. https://pptcs.osi.office.de/pptauto/PowerpointAutomation.svc/rest], 8/[Effective 8/1/2018. Required: Office Mobile. ExpressRoute: No. https://ols.osi.office.de/], 9/[Effective 8/1/2018. Required: Office Mobile. ExpressRoute: No. https://ols.osi.office.de/olsc/OlsClient.svc/OlsClient], 10/[Effective 8/1/2018. Required: Office Mobile. ExpressRoute: No. https://excelcs.osi.office.de/xlauto/excelautomation.svc/XlAutomation], 11/[Effective 8/1/2018. Required: Office Mobile. ExpressRoute: No. https://excelcs.osi.office.de/xlauto/excelautomation.svc/rest]. Notes: Removing Office Mobile endpoints.  <br/> |
   

