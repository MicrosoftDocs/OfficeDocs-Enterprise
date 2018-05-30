---
title: "NEVER PUBLISH THIS Use Office 365 tools for security investigations in Exchange Online and SharePoint online"
ms.author: chrfox
author: chrfox
manager: laurawi
ms.date: 5/29/2018
audience: ITPro
ms.topic: article
ms.service: Office 365 Administration
localization_priority: None
ms.collection: Strat_O365_Enterprise
description: "Summary: Forensic guidance for exchange in SharePoint online investigations."
---

# Title: User Office 365 tools for security investigations in Exchange Online and SharePoint online.
Summary: Office 365 includes several features designed specifically for information and data security. When you need to run a security -related investigation, Office 365 has tools that help you with forensic analysis. You can use several these features with or without the help of Microsoft customer support services.

This article focuses on those features available in Office 365 that can help you manage security problems or perform a forensic analysis of a suspected problem. Some of these features require you to enable and configure them before you can use them for analysis and investigation. Once you enable the features, additional information in the form of audit records, logs, and reports are created and made available for you to use. 

## Planning for Office 365 security investigations
Before you can analyze logs and audit records as part of a forensic security investigation in Office 365 services, those logs and audit records must first be created. Parts of Office 365, such as Exchange Online, Exchange Online Protection, SharePoint Online, and Microsoft Azure Active Directory are capable of creating log records and audit trails of all sorts of activities, including non-owner mailbox access, messaging routing and delivery, and actions taken by users and administrators.

Not all activities are logged and audited by default. Some activities, such as mailbox access, are not audited by default, and will need to have auditing enabled before activities will be logged. 

Some of the features listed below require specific Office 365 or Microsoft Intune SKUs. For information about availability, see [Office 365 Service Description](https://technet.microsoft.com/en-us/library/office-365-service-descriptions.aspx)s.


|Workload |Area  |For more information, see... |
|---------|---------|---------|
|Office 365 (all)    |  Auditing reports       |   [Reports in the Office 365 Security & Compliance Center ](http://go.microsoft.com/fwlink/p/?LinkId=715710)     |
|Office 365 device management    |    Mobile device management     |    [Overview of mobile device management for Office 365](http://go.microsoft.com/fwlink/p/?LinkId=615142)     |
|Intune device management   |  Mobile device management       |    [Understand Microsoft Intune operations by using reports](https://technet.microsoft.com/library/dn646977.aspx)     |
|Exchange Online    |    Auditing reports     |       [Enable mailbox audit logging](https://technet.microsoft.com/library/jj150497(v=exchg.150).aspx)  |
|Row5     |         |   [Export mailbox audit logs  ](https://technet.microsoft.com/library/jj150552(v=exchg.150).aspx)    |
|Row6     |         |  Run a non-owner mailbox access report       |
|Row7     |         |       Run a per-mailbox litigation hold report  |
|Row8     |         |     Search the role group changes or administrator audit logs    |
|Row9     |         |   View and export the data in admin audit log      |
|Row10     |     Data loss prevention    |     View reports about DLP policy detections    |
|Row11     |         |   Creating incident reports for D L P policy detections      |
|Row12     |         |  Create a D L P policy from a template       |
|Row13     | In-place eDiscovery        |     Create an in-place E discovery search    |
|Row14     |         |  Start or stop in in-place E discovery search       |
|Row15     |         |    Modify an in-place E discovery search     |
|Row16     |         |      Export E discovery search results   |
|Row17     |         |   Create a discovery mailbox      |
|Row18     |   In-place hold      |       Create or remove an in-place hold  |
|Row19     |    Messaging records management     |     Create a retention policy    |
|Row20     |         |      Apply retention tags to or remove retention tags from a retention policy   |
|Row21     |         |       Apply a retention policy to mailboxes  |
|Row22     |         |   Place a mailbox on retention hold      |
|Row23     |   Transport rules      |     Manage transport rules    |
|Row24     |         |     Transport rule actions    |
|Exchange Online Protection  |       Mail protection reports  |      Mail protection reports using the Excel reporting workbook   |
|Row26     |    Trace an email message     |    Run a message trace and view results     |
|Row27     |     Quarantine    |   Manage quarantined messages      |
|SharePoint Online    |  SharePoint audit logging       |   Configure audit settings for a site collection      |
|Azure active directory   |     Azure A D usage reports    |   View your access and usage reports      |
|Row30     |         |      Azure Active Directory additions   |
|Row31     |         |         |

 
 


## Obtaining office 365 reports by using your SIEM solution 
You can use your on-premises Security Incident and Event Manager (SIEM) solution with the Office 365 Management Activity API to get the same report information as the information provided in the Compliance Center, but with SIEM integration. You can manage the on-premises report and keep this non-premises information indefinitely. For more information, see:

- [Announcing the new Office 365 Management Activity API for security and compliance monitoring](https://blogs.office.com/2015/04/21/announcing-the-new-office-365-management-activity-api-for-security-and-compliance-monitoring/)
- [Office 365 Management API overview](https://msdn.microsoft.com/library/office/dn707385.aspx)

## Reviewing user activity by using the Office 365 Security & Compliance Center 
You can view reports of how individuals within your organization are using Office 365 by using the Security & Compliance Center. Using the reports in the Security & Compliance Center allows you to start your security investigations for both Exchange Online and SharePoint Online from a single dashboard in Office 365.

You have to be a global admin in your Office 365 organization to access the Security & Compliance Center, or a global admin has to assign you Permissions to access the Security & Compliance Center. For more information, see [Permissions in the Office 365 Security & Compliance Center.](http://go.microsoft.com/fwlink/p/?LinkId=715704)

###To connect to the Security & Compliance Center in Office 365 
1. [Go to the Office 365 Security & Compliance Center](http://go.microsoft.com/fwlink/p/?LinkId=615143).
2. Sign in to Office 365 with your work or school account

## Performing Office O365 security investigations
The rest of this article provides three examples of security investigations that show how you can use the tools that are provided in Office 365 for forensic analysis and investigation.

 - Potential data leak in Exchange Online
 - Potential data leak in SharePoint Online
 - Analysis of administrator activities in Exchange Online 

### Example 1: Potential data leak in Exchange Online
Paul, a security officer, receives a request from a board member regarding a potential data leak. Amy, the board member, suspect someone from her team disclosed confidential information about the company's strategy through her mailbox. To investigate the leak, Paul can review non-owner mailbox, access reports, export admin audit logs, and review a list of devices and applications that have been used to sign in.

To execute this forensic analysis successfully, Paul follows this approach:

1. Paul will verify if anyone was connected to Amy's mailbox in the past.
2. If someone did make a connection to Amy's mailbox, Paul will trace any message sent during this connection period.
3. Paul will search from which devices or application the connection was made.

####Verify if anyone has connected to the mailbox in the past
Before you begin:

- You need to be assigned permissions before you can perform this task. You must be a member of the [Compliance Management role group](https://technet.microsoft.com/library/jj619307(v=exchg.150).aspx).
- You have to enable mailbox audit logging for each mailbox for which you want to run a non--owner mailbox access report. If mailbox audit logging isn't enabled for a mailbox, you won't get any results for it when you run the report. Only activities that occurred after auditing was enabled will appear in the report. For instructions on enabling mailbox audit logging, see [Enable mailbox auditing in Office 365](https://technet.microsoft.com/library/dn879651.aspx).

#####To run a non-owner mailbox access report
1. In the Security & Compliance Center, choose **Reports** > **View reports**.
2. Under **Auditing**, choose **Exchange audit reports**.
3. To search mailbox audit logs for mailboxes that have been opened by someone other than the owner, see **Run a non-owner mailbox access report**.
4. Specify a date range and then click **select mailboxes** to select the mailboxes you want to search.
5. Select to search for non-owner access by choosing **All non-owners** from the **Search for access by** drop-down.
6. Choose **Search** to perform the search and produce the report.
7. The results will be displayed in the **Search results** area. Choose the printer icon to print the results.

#### Verify users that connected to the Exchange Online mailbox had permission to do so
If the results from the non-owner mailbox axis report indicate that the selected mailbox has been accessed by one or more non-owners and you want to verify that those non-owners had permission to access the mailbox, the next step is to export the admin audit logs.

Before you begin:

1. You need to be assigned permissions before you can perform this task. To see what permissions you need, see "View-only administrator audit logging" under "Exchange infrastructure permissions" in [Exchange and Shell infrastructure permissions](https://technet.microsoft.com/library/dd638114(v=exchg.150).aspx).
2. If you export the admin audit log, Microsoft Exchange attaches the audit log, which is an XML file, to an email message that it sends to recipients that you specify. However, Outlook Web App blocks X M L attachments by default. If you want to use Outlook Web App to access these audit logs, you have to configure Outlook Web App to allow XM L attachments. See V[iew and export the external admin audit log](https://technet.microsoft.com/library/dn505728(v=exchg.150).aspx) for details on how to allow XM L attachments in Outlook Web App.


#####To export the admin audit log 



####Trace any message sent while the user was connected to the mailbox 


#####To trace messages in a mailbox connection 
 

####Identify the devices or application connected to the mailbox 

#####To review Azure Active Directory reports
##### To examine the devices and applications from which a specific user connected to a mailbox in Office 365

### Example 2: potential data leak in SharePoint online
