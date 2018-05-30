---
title: "Office 365 Security Incident Response Whitepaper"
ms.author: robmazz
author: robmazz
manager: laurawi
ms.date: 5/29/2018
audience: ITPro
ms.topic: article
ms.service: Office 365 Administration
localization_priority: None
ms.collection: Strat_O365_Enterprise
description: "Summary: An overview of Microsoft's Security Incident Response process."
---

# Incident Management Program Guidance for Office 365 

## Introduction
This document was developed to assist financial services customers in understanding the relevant capabilities of Microsoft online services in relation to preparing for, detecting and responding to security anomalies. 

The intended audience for this document includes financial services Chief Information Officers, Business Continuity Managers (BCMs), Disaster Recovery Officers, Privacy Officers, Information Technology managers, legal staff, and others responsible for data protection, information security, and/or compliance with industry regulations. 

The overall goal of this document is to address these frequently asked questions (FAQs) from our financial services customers: 
- How does Microsoft notify customers when a security concern is identified? 
- What administrative controls can be configured by customers? 
- How do customers monitor admin activity? 
- How do customers address security concerns? 
- How do customers notify Microsoft? 
- What incident response assistance does Microsoft provide its customers? 
 
When assessing and reviewing event notification commitments, there are two broadly-defined categories to consider:
- Microsoft-detected incidents: attacks against the service that lead to tenant compromise 
- Customer-detected incidents: attacks targeted against a specific tenant that lead to compromise 
 
Microsoft is responsible for protecting customers against threats to the service platform:
- Infrastructure compromise 
- Spam/Phishing
- Backend Service administration
- Service vulnerabilities 
 
Customers are responsible for providing the inherent security that can result from a well-designed and customized tenant, deployed to manage information security and events. As with on-premises risk management, customers can configure online services in ways that effectively address: 
- Identified business risks 
- Alignment with compliance needs
- Policy creation 
- Event monitoring

## Microsoft's Operational Transparency 
Microsoft provides customers with the resources needed to monitor service health and continuity through the Service Health Dashboard; to identify and manage service level changes thorough the Office 365 Roadmap; and to review Microsoft security practices for customer data on the Office 365 Trust Center. Microsoft provides direct access to independent third-party audit reports and implementation and testing details for security, privacy, and compliance controls within the Office 365 admin portal.

*Figure 1 - The Office 365 Admin portal* 
 
Customers can also check Service Health using these alternative methods: 
- [Using the Office 365 Message Center](https://support.office.com/en-us/article/Message-center-in-Office-365-38FB3333-BFCC-4340-A37B-DEDA509C2093)
- [Using the web](http://status.office365.com/)
- [Using the Office 365 admin portal](https://support.office.com/en-us/article/How-to-check-Office-365-service-health-932AD3AD-533C-418A-B938-6E44E8BC33B0) 
- [Using the Office 365 Admin App](https://products.office.com/en-US/business/manage-office-365-admin-app)

## Security Incident Notifications 
Microsoft has a robust security incident management process that includes direct engagement with customers affected by a SEV A event, such as the compromise of admin credentials or a tenant level attack or infiltration by a known nation state bad actor.

Enterprise customers are handled with a "white glove" approach that includes: 
- Account team engagement 
- TAM engagement 
- Telephone contact with these customer-assigned roles: 
   - Technical contact 
   - Compliance Admin 
   - Privacy Admin 
- Global Admin 
- Email follow-up as appropriate 
- Iterative engagement until resolved 

## Monitoring the Microsoft Platform 
To help our customers optimize Office 365 as part of an overall risk management program, especially in the areas of detecting and responding to security concerns, Microsoft has provided a feature and capability overview for both online services.

Note that many of the scenarios that require investigation are initially identified by the customer. It is important to design operational processes that capture all input signals – from Microsoft; from custom-built applications; from third-party offerings; and from customer internal monitoring – and synthesize appropriately when assessing the system health. 

When assessing and reviewing event monitoring features, there are two broadly-defined categories to consider:
- **Built-in controls**: Measures that Microsoft takes on behalf of all Office 365 customers to protect customer data and to maintain a highly available service 
- **Customer controls**: Features that enable customers to configure Office 365 to meet the specific needs of an organization 

Microsoft manages the underlying cloud service platforms and provides log feeds, activity APIs, and other mechanisms for ensuring prompt and actionable notifications are sent to customers.

In addition, Microsoft makes numerous notification channels available to customers that need to ensure ongoing monitoring and awareness of relevant service events and anomalous activity. Microsoft recommends that regulated industry customers review these online service offerings, enable the appropriate capabilities, and integrate chosen capabilities with on-premises systems.

At a minimum, customers must carefully control access and monitor usage reports to ensure only authorized users are logging on successfully. Microsoft also recommends that customer processes should include:
- Monitoring service availability of the Microsoft platform: Customers can independently monitor service health through the Service Health Dashboard, the Office 365 Message Center, and by establishing customized alerts and setting the appropriate notification delivery options. 
- Anomalous activity detection: Available through the enablement of audit logging, inbox logging and multiple other capabilities as outlined within this document. Microsoft provides data input and the customer may use standard reporting or customize reports to analyze usage and behavior patterns. 

Information Security compromise within the service platform is promptly reported by Microsoft and delivered to the person(s) identified by the customer. 
- Customers also may want to consider implementing additional independent monitoring such as deploying a security information and event management (SIEM) integration with on-premises security monitoring. Microsoft provides customers with the necessary activity APIs tailored to the service and compatible with third-party solutions. 

*Figure 2 - IT Service Management (ITSM) across service models*

## Office 365 Security Guidance and Documentation 

Focusing on the customer's role in protecting data, Microsoft recommends that customers review the numerous technical articles, security blogs and best practice guidelines published by Microsoft. The initial step any customer should take is to leverage [Office 365 Secure Score](https://support.office.com/en-us/article/Introducing-the-Office-365-Secure-Score-c9e7160f-2c34-4bd0-a548-5ddcc862eaef).

Secure Score is a security analytics tool that helps customers understand what has been done or what still needs to be done to reduce the risk to data in Office 365. 
 
Secure Score rationalizes cloud security configuration and behavioral options into a cohesive analytical framework, making it easy for customers to take incremental action over time to improve account protections and elevate their score. Microsoft's approach is threefold: 
1.	Create an inventory of security configurations customers can independently execute to protect and mitigate risks to data in Office 365. 
2.	Assign points based upon the extent to which a control mitigated a specific set of risks. More effective the control, the higher the assigned points. 
3.	Measure the extent to which a tenant has adopted the recommended controls, then aggregate the assigned points into a single Secure Score.

Secure Score starts with addressing the common account vulnerabilities discussed below.
 
[Multi-factor Authentication](https://support.office.com/en-us/article/Set-up-multi-factor-authentication-for-Office-365-users-8f0454b2-f51a-4d9c-bcde-2c48e41621c6)

Implementing MFA for Office 365 requires users to acknowledge a phone call, text message, or app notification on their smart phones after correctly entering their passwords. Users can sign in only after the second authentication factor has been satisfied.

Multi-factor authentication is included with Office 365. Azure multi-factor authentication includes extended functionality and is available for purchase. 
 
[Assigning Administrator Roles](https://support.office.com/en-us/article/About-Office-365-admin-roles-da585eea-f576-4f55-a1e0-87090b6aaa9d)

Office 365 provides a set of admin roles can be assigned to users within the organization. Each admin role maps to common business functions and grants permissions for specific tasks within the Office 365 admin center. 
 
[Anti-spam and anti-malware-protection](https://support.office.com/en-us/article/Anti-spam-and-anti-malware-protection-in-Office-365-5ce5cf47-2120-4e51-a403-426a13358b7e?ui=en-US&rs=en-US&ad=US)

Office 365 has built-in malware and spam filtering capabilities that help protect inbound and outbound messages from malicious software and help protect inboxes from spam. Filtering technologies are enabled by default. Admins can implement company-specific filtering customizations in the Exchange admin center (EAC). 
 
[Azure AD Password Protection](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/06/Microsoft_Password_Guidance-1.pdf) (Advanced Service) 

Azure Active Directory and Active Directory enable password protections: 
- Maintain an 8-character minimum length requirement 
- Eliminate character-composition requirements 
- Eliminate mandatory periodic password resets for user accounts 
- Ban common passwords, to keep the most vulnerable passwords out of your system 
- Educate your users not to re-use their password for non-work-related purposes 
- Enforce registration for multi-factor authentication 
- Enable risk based multi-factor authentication challenges 
 
[Azure AD Conditional Access](https://docs.microsoft.com/en-us/azure/active-directory/active-directory-conditional-access-azure-portal) (Advanced Service) 

Conditional access is an Azure Active Directory capability that enforces access controls for apps in the tenant environment based on specific conditions using customizable policies. With controls, admins can tie additional access requirements or block access. The policy-based approach simplifies the configuration experience because it conforms to internal organizational access requirements.
 
[Azure AD Smart Account (lockout)](https://docs.microsoft.com/en-us/azure/active-directory/connect/active-directory-aadconnect-pass-through-authentication-smart-lockout) (Advanced Service) 

Azure AD protects against brute force password attacks and prevents genuine users from being locked out of Office 365 and SaaS applications. This capability, called Smart Lockout, is supported by using Passthrough Authentication as the sign-in method. Smart Lockout is enabled by default for all tenants. 

Smart Lockout works by keeping track of failed sign-in attempts, and after a certain Lockout Threshold, starting a Lockout Duration. Any sign-in attempts from the attacker during the Lockout Duration are rejected. If the attack continues, the subsequent failed sign-in attempts after the Lockout Duration ends result in longer Lockout Durations. 
 
[Office 365 Activity Data: Audit Logging](https://support.office.com/en-us/article/Search-the-audit-log-in-the-Office-365-Security-Compliance-Center-0d4d0f35-390b-4518-800e-0c7ec95e946c?ui=en-US&rs=en-US&ad=US) 

To enable audit logging through the UI, navigate to "[Search & investigation](https://protection.office.com/)" and click the "Start recording user and admin activities" link. If the link is not shown in the portal, it means logging has already been enabled.
 
[Inbox auditing](https://support.office.com/en-us/article/Enable-mailbox-auditing-in-Office-365-aaca8987-5b62-458b-9882-c28476a66918)

In Office 365, mailbox audit logging will log mailbox access by mailbox owners, delegates, and administrators. By default, mailbox auditing in Office 365 is turned off. After mailbox audit logging is turned for an inbox, the Office 365 audit log can be searched for mailbox activity, including actions performed by administrators and delegates. 
Actions performed by the mailbox owner aren't audited by default. To log (and then search for) actions performed by mailbox owners, specific owner actions must be identified as desired audit fields. 
 
[Mail Transport Rules](https://technet.microsoft.com/en-us/library/jj919238(v=exchg.150).aspx)

Mail flow rules (also known as transport rules) are used to identify and act on messages that flow through Office 365. Mail flow rules are similar to the Inbox rules that are available in the Outlook desktop client and Outlook on the web. The main difference is that mail flow rules take action on messages while they're in transit, and not after the message is delivered to the mailbox. Mail flow rules contain a richer set of conditions, exceptions, and actions, which provides admins with the flexibility to implement many types of messaging policies. 
 
[Office 365 Data Loss Prevention (DLP)](https://blogs.technet.microsoft.com/tiagosouza/2016/11/23/customize-dlp-built-in-export-import-and-create-a-new-rule/)

To comply with business standards and industry regulations, organizations need to protect sensitive information and prevent its inadvertent disclosure. Examples of sensitive information that admins might want to prevent from leaking outside your organization include financial data or personally identifiable information (PII) such as credit card numbers, social security numbers, or health records. With a data loss prevention (DLP) policy in the Office 365 Security & Compliance Center, admins can identify, monitor, and automatically protect sensitive information across Office 365. 
 
[SPF](https://technet.microsoft.com/en-us/library/dn789058(v=exchg.150).aspx), [DKIM](https://technet.microsoft.com/en-us/library/mt695945(v=exchg.150).aspx), and [DMARC](https://technet.microsoft.com/en-us/library/mt734386(v=exchg.150).aspx) 

[Domain-based Message Authentication, Reporting, and Conformance](https://dmarc.org/) (DMARC) works with Sender Policy Framework (SPF) and Domain Keys Identified Mail (DKIM) to authenticate mail senders and ensure that destination email systems trust messages sent from your domain. Implementing DMARC with SPF and DKIM provides additional protection against spoofing and phishing email. DMARC helps receiving mail systems determine what to do with messages sent from your domain that fail SPF or DKIM checks. 
 
[ATP](https://support.office.com/en-us/article/Office-365-Advanced-Threat-Protection-e100fe7c-f2a1-4b7d-9e08-622330b83653?ui=en-US&rs=en-US&ad=US), [ATP Safe Attachments](https://support.office.com/en-us/article/ATP-safe-attachments-in-Office-365-6e13311e-92ae-495e-a619-56d770199170?ui=en-US&rs=en-US&ad=US), [ATP Safe Links](https://support.office.com/en-us/article/ATP-safe-links-in-Office-365-DD6A1FEF-EC4A-4CF4-A25A-BB591C5811E3) (Advanced Services) 

Office 365 Advanced Threat Protection includes [safe links](https://support.office.com/en-us/article/safe-links-dd6a1fef-ec4a-4cf4-a25a-bb591c5811e3), [safe attachments](https://support.office.com/en-us/article/safe-attachments-6e13311e-92ae-495e-a619-56d770199170), [spoof intelligence](https://support.office.com/en-us/article/spoof-intelligence-978c3173-3578-4286-aaf4-8a10951978bf), and advanced anti-phishing capabilities. Advanced Threat Protection helps protect your organization from malicious attacks by checking content, such as attachments and hyperlinks in email messages, and unauthorized spoof mail. Protection is determined by the [policies for safe links and safe attachments](https://support.office.com/en-us/article/Office-365-Advanced-Threat-Protection-overview-e100fe7c-f2a1-4b7d-9e08-622330b83653?ui=en-US&rs=en-US&ad=US) that global administrators or security administrators define.
 
[Office 365 Threat Management](https://support.office.com/en-us/article/Threat-management-in-the-Office-365-Security-Compliance-Center-0a73d5fa-b2c8-43e7-9ed4-61f0552b1c98) 

Use Threat management to help control and manage mobile device access to data, help protect the organization from data loss and help protect inbound and outbound messages from malicious software and spam. Threat management can be used to protect domain's security and to determine whether or not senders are maliciously spoofing accounts from your domain. 

[Cloud App Security](https://docs.microsoft.com/en-us/cloud-app-security/what-is-cloud-app-security) and [Intune Mobile App Management](https://www.microsoft.com/en-us/cloud-platform/microsoft-intune-apps) (Advanced Services) 

Cloud App Security reports on anomalous activity, such as download activity, and can suspend user accounts. Intune Mobile Application Management implements rules to prevent business data from leaving approved business apps on mobile devices. 

## Monitoring Tenant and User Events in Microsoft Office 365 

Office 365 tenant administrators have access to a wide range of user activity events logged within Exchange Online, SharePoint Online, and Azure Active Directory services. Microsoft online services provide detailed activity logs that can be acquired and analyzed to facilitate self-service forensic investigations to scope and remediate a suspected incident or compromise.

Information related to Microsoft's recommended security configurations is included in the **Additional Resources** section later in the document. This section is designed to provide knowledge and tools related to: 
- Capturing activity data from Azure and Office 365 
- Establishing alert policies 
- Performing a forensic investigation to identify and scope suspected malicious activity 

## Capturing Activity Data in Office 365 

Office 365 activity data is divided into three asset classifications. Administrative actions across the three asset classifications are audited and logged: 
- **Mail**: User mailboxes and all messaging contained within (e.g. email, calendar and tasks); controls within Exchange Online that affect mail flow rules and filter policies; and access identity in relation to those mailboxes (e.g. delegates, shared inboxes). 
- **Documents**: Files stored in OneDrive and/or SharePoint; and the identity access control of that information (e.g. shared documents and site administrator). 
- **Accounts**: User account roles and credential management; tenant level Active Directory configuration and synchronization between Azure AD and Office 365. 

Follow these steps to capture activity data: 
1. Enable Auditing to Record Activity 

*Figure 3 - Enabling Auditing to record activity*

2. Enable Mailbox Auditing to record Exchange Online Activity 

*Figure 4 - Enabling Mailbox Auditing to record Exchange Online activity*

3. Review Audit Logs to Assess Events 

*Figure 5 - Reviewing audit logs to assess events*

## Establishing Alert Policies in Office 365 
Office 365 customers should plan to use the alert policy and alert dashboard tools in the Office 365 Security & Compliance Center to create alert policies. After the policies are defined, tenant admins can view the alerts that are generated when users perform activities that match the conditions of an alert policy.

Alert policies build on and expand the functionality of activity alerts by letting customers categorize the alert policy, apply the policy to all users within the organization, and set a threshold level for when an alert is triggered. Office 365 offers an expanded list of policy events, allowing admins to track malware activity and data loss incidents.

Within the Security & Compliance Center admins can view and filter alerts and set an alert status to manage or dismiss alerts. The Office 365 admin creates, configures, and turns on an alert policy by using the Alert Policies page in the Security and Compliance Center. Alert policies can also be created by using the *New-ProtectionAlert* cmdlet in PowerShell. 

Whenever an activity occurs that matches the conditions of an alert policy, Office 365 generates an alert and displays it on the View Alerts page in the Security and Compliance Center.

If email notifications are enabled for the alert policy, Office 365 sends a notification to the designated list of recipients as demonstrated below: 

*Figure 6 - Office 365 designated notifications list*
 
More information, including step-by-step instructions and relevant screenshots. can be found on [Managing Alert Policies in Office 365](https://support.office.com/en-us/article/Alert-policies-in-the-Office-365-Security-Compliance-Center-8927B8B9-C5BC-45A8-A9F9-96C732E58264). 

Office 365 customers can also [view information related to Service Health](https://support.office.com/en-us/article/How-to-check-Office-365-service-health-932AD3AD-533C-418A-B938-6E44E8BC33B0) and/or view Microsoft alerts through the [Message Center](https://support.office.com/en-us/article/Message-center-in-Office-365-38FB3333-BFCC-4340-A37B-DEDA509C2093). Admins can monitor alerts using the [Office 365 Admin App for Mobile Devices](https://products.office.com/en-US/business/manage-office-365-admin-app).

[Advanced Security Management](https://support.office.com/en-us/article/Overview-of-Advanced-Security-Management-in-Office-365-81f0ee9a-9645-45ab-ba56-de9cbccab475?ui=en-US&rs=en-US&ad=US)

Office 365 Advanced Security Management provides the insights into suspicious activity needed to identify and investigate situations and take action to address security issues. Advanced Security Management is powered by Cloud App Security. With Advanced Security Management, customers can: 
- See how an organization's data is accessed and used 
- Control access to Office 365 data on mobile devices/apps 
- Define policies that trigger alerts for atypical or suspicious activities 
- Suspend user accounts exhibiting suspicious activity 
- Require users to log back in to Office 365 apps after an alert has been triggered 
 
[View Reports](https://support.office.com/en-us/article/Reports-in-the-Office-365-Security-Compliance-Center-7acd33ce-1ec8-49fb-b625-43bac7b58c5a?ui=en-US&rs=en-US&ad=US)

Use the View reports page in the Office 365 Security & Compliance Center to quickly access audit reports for SharePoint Online and Exchange Online. Azure Active Directory (AD) provides user sign-in reports, user activity reports, and the Azure AD audit log 
 
[DLP Reports](https://support.office.com/en-us/article/View-the-reports-for-data-loss-prevention-41eb4324-c513-4fa5-91c8-8fbd8aaba83b?ui=en-US&rs=en-US&ad=US)

DLP reports in Office 365 provide a view of the number of DLP policy matches, overrides, or false positives; where policies are trending. The reports can be filtered and provide additional details when selecting a point on a line on the graph. 
 
[External Admin access report](https://technet.microsoft.com/library/dn505728(v=exchg.150).aspx)

Exchange Online actions performed by Microsoft and delegated administrators are logged in the administrator audit log. Use the EAC or the Exchange Management Shell to search for and view audit log entries to determine if external administrators performed any actions on or changed the configuration. 
 
[Non-Owner Mailbox Activity Audit Report](https://technet.microsoft.com/library/jj150552(v=exchg.150).aspx)

When mailbox auditing is enabled, Microsoft Exchange logs information in the mailbox audit log whenever a user other than the owner accesses the mailbox. Each log entry includes information about who accessed the mailbox and when, the actions performed by the non-owner, and whether the action was successful. Entries in the mailbox audit log are retained for 90 days by default. The mailbox audit log can be used to determine if a user other than the owner has accessed a mailbox. 
 
[Admin Auditing](https://technet.microsoft.com/library/ff459262(v=exchg.150).aspx)

Search the administrator audit logs to discover who made changes to organization, server, and recipient configuration. This can help track the cause of unexpected behavior, to identify a malicious administrator, or to verify that compliance requirements are being met.
 
[Manage Legal Investigations with eDiscovery](https://support.office.com/en-us/article/Manage-legal-investigations-with-eDiscovery-cases-in-Office-365-2e5fbe9f-ee4d-4178-8ff8-4356bc1b168e) (Advanced Services) 

Organizations have many reasons to respond to a legal case involving certain executives or other employees in your organization. This might involve quickly finding and retaining for further investigation specific information in email, documents, instant messaging conversations, and other content locations used by people in their day-to-day work tasks. You can perform these and many other similar activities by using these eDiscovery case tools in the Office 365 Security & Compliance Center: 
- [Supervision Policies](https://support.office.com/en-us/article/Configure-supervision-policies-for-your-organization-d14ae7c3-fcb0-4a03-967b-cbed861bb086)
- [Search for Content](https://support.office.com/en-us/article/Search-for-content-in-Office-365-df2d1e0f-b476-42c9-aade-4a260b24f193)
- [Alert Policies](https://support.office.com/en-us/article/Alert-policies-in-the-Office-365-Security-Compliance-Center-8927B8B9-C5BC-45A8-A9F9-96C732E58264)

## Recovery from Compromise 
Microsoft offers multiple levels of technical assistance for customers investigating and responding to security events. 

PowerShell scripts and technical documentation developed by Microsoft security teams to allow customers to quickly and effectively recover a compromised account: 
 
- Account Recovery
   - [How to fix a compromised account](https://blogs.technet.microsoft.com/office365security/how-to-fix-a-compromised-hacked-microsoft-office-365-account/)
- Data Recovery
   - [Delete or Recover Exchange Online Mailboxes](https://technet.microsoft.com/en-us/library/dn186233(v=exchg.150).aspx) 
- Malicious Content Removal
   - [Review and Mitigate Phishing Attacks](https://blogs.technet.microsoft.com/office365security/how-to-review-and-mitigate-the-impact-of-phishing-attacks-in-office-365/) 
   - [Manage SharePoint Site Collections within the Admin Center](https://support.office.com/en-US/article/Manage-site-collections-and-global-settings-in-the-SharePoint-admin-center-abacd1bb-295d-4235-afdd-15f5e4cc2e6c) 
- Audit Logs
   - http://aka.ms/delegateforwardrules 
   - http://aka.ms/mailboxaudit1 
   - http://aka.ms/remediate 
   - http://aka.ms/AccessAAD 
- Microsoft Engagement 
   - Technical Support 
   - Office 365 Security and Compliance Team 
   - Customer Service and Support (CSS) Security 
   - Detection and Response Team (DART) 

## Escalating an Anomalous Office 365 Event to Microsoft 
 
Users who have been assigned an Office 365 [admin role](https://support.office.com/en-us/article/About-Office-365-admin-roles-da585eea-f576-4f55-a1e0-87090b6aaa9d) can sign in to the Office 365 [admin portal](https://portal.office.com/) and submit an online security incident service request (SR). Online submittals ensure that security incident SRs are routed directly to the correct technical support service queue. Administrators can use the following instructions to open a security incident SR and provide Microsoft with detailed information about the security concern and its status. 
1.	Sign in to the [Office 365 portal](https://portal.office.com/). If you are not taken directly to the Office 365 Admin center, from the portal landing page, select the **Admin** tile to open the Office 365 Admin center. 
2.	In the left-hand navigation of the Office 365 Admin center, click **Support**. 
3.	Check the list of known issues to see if a known issue is causing or related to the problem you are reporting. If there is a related issue, please check back for newly posted information until the known issue is resolved. If you don't find a related issue, continue with step 4 below. 

*Figure 7 - List of known issues*

4.	Under **Create a service request**, click **User and domain management**. 
5.	On the **New service request** page, under **Feature**, select **Account Security** and under **Symptom**, select **Investigate/mitigate an account compromise/breach**. 

*Figure 8 - New service request*

6.	In the **Issue summary** and **Issue details** fields, add detailed information about the issue being reported, and then click **Next**.
7.	Review the suggestions for applicability to the issue being reported, and then click **Yes, Continue**. 

*Figure 9 - Review suggestions*

8.	Under **add details**, select the answers for the questions **Is your service unavailable?** and **How many users are affected**? 
> **NOTE** If you select **Yes** for **Is your service unavailable?** and select **All** for **How many users affected?**, a Sev A SR will be generated, ensuring CRITSIT resources will be engaged both at the reporting customer and at Microsoft. 

*Figure 10 - Add details*

9.	Provide an email address for an affected user. 
10.	Click **Attach a file** to optionally send one or more files related to the issue being reported, and then click **Next**. 
11.	On the **Confirm and submit** page, review the information in the submission. If the submission needs changes, click **back** and make the appropriate edits. Otherwise, click **Submit request**. 

## Additional Resources 
[Overview: Security and Compliance in Office 365](https://support.office.com/en-us/article/Overview-of-security-and-compliance-in-Office-365-dcb83b2c-ac66-4ced-925d-50eb9698a0b2?ui=en-US&rs=en-US&ad=US) 

Specific to Office 365, this site is designed to assist customers in protecting data and maintaining regulatory and legal compliance. Key components of this site include recommendations for security and compliance planning, data protection and governance, activity monitoring, and other search capabilities. 
 
[Improve Your Cybersecurity Stance](https://blogs.technet.microsoft.com/office365security/using-office-365-activity-data-to-improve-your-cybersecurity-stance-and-capability/) 

The process, tooling, and analysis discussed in this post enable admins to acquire Office 365 activity and event data from a central cloud-based data store to perform ad hoc analysis or migrate to an analytical application. This scalable platform enables insights into the strength of protection against attacks, the ability to identify or detect suspicious behavior, and to effectively respond to future incidents. 
 
[Security Best Practices for Office 365](https://support.office.com/en-us/article/Security-best-practices-for-Office-365-9295e396-e53d-49b9-ae9b-0b5828cdedc3?ui=en-US&rs=en-US&ad=US)

Minimize the potential of a data breach or a compromised account by following these recommended best practices: 
- Require multi-factor authentication 
- Enable activity auditing 
- Configure advanced security monitoring 
- Utilize secure mail flow capabilities 
- Configure data loss prevention policies 
 
[Office 365 User audit logs](https://support.office.com/en-us/article/Search-the-audit-log-in-the-Office-365-Security-Compliance-Center-0d4d0f35-390b-4518-800e-0c7ec95e946c?ui=en-US&rs=en-US&ad=US)

Office 365 Audit Logs provide visibility into all user activities in Office 365. Download and integrate these logs in your SIEM: [Activity API](https://msdn.microsoft.com/en-us/office-365/office-365-management-activity-api-reference).
 
[Security Intelligence Report](https://www.microsoft.com/en-us/security/intelligence-report)

Access unparalleled threat intelligence collected from more than 100 countries to learn how to improve your security posture. With the twice-yearly published guidance in the Microsoft Security Intelligence Report (SIR), you can better protect your organization from vulnerabilities, exploits, and malware. 
 
[Spoof Intelligence](https://support.office.com/en-us/article/Learn-more-about-spoof-intelligence-978c3173-3578-4286-aaf4-8a10951978bf) 

Customers who have Office 365 Enterprise E5 or who have purchased Advanced Threat Protection licenses have access to spoof intelligence in the Office 365 Security & Compliance Center. 

Use spoof intelligence in the Security & Compliance Center on the Anti-spam settings page to review all senders who are spoofing your domain. You can review senders who are spoofing your domain and then choose to allow the sender to continue or block the sender. 
 
[Advanced Threat Protection](https://cloudblogs.microsoft.com/enterprisemobility/2017/09/27/introducing-azure-advanced-threat-protection/)

Azure ATP fuses together unique machine learning algorithms, world-class security research, and the breadth and depth of the critical security data available to Microsoft as a major enterprise vendor. It will help protect from both known and unknown attack vectors, detecting threats early in the kill chain before they mature into actual damage. 

Azure ATP brings the capabilities of our current on-premises behavioral analytics solution, Microsoft 
Advanced Threat Analytics (ATA), to the cloud. Building on the in-depth threat detection capabilities of ATA, Azure ATP will help our customers protect their identities across both their cloud and on-premises directories. 
 
[Office 365 Threat Intelligence](https://support.office.com/en-gb/article/Office-365-Threat-Intelligence-32405da5-bee1-4a4b-82e5-8399df94c512?ui=en-US&rs=en-GB&ad=GB)

Office 365 hosts one of the largest enterprise email services and productivity suites in the world, and manages content created on millions of devices. In the course of protecting this information, Microsoft has built a vast repository of threat intelligence data, and the systems needed to spot patterns that correspond to attack behaviors and suspicious activity. Office 365 Threat Intelligence is a collection of these insights used in analyzing your Office 365 environment to help you find and eliminate threats, proactively. Threat Intelligence appears as a set of tools and dashboards in the Security & Compliance Center to understand and respond to threats. 

Office 365 Threat Intelligence monitors signals from sources, such as user activity, authentication, email, compromised PCs, and security incidents. This data can be analyzed and displayed so that business decision makers and Office 365 global or security administrators can understand and respond to threats against their users and intellectual property. 
 
[Office 365 Service Communication](https://msdn.microsoft.com/en-us/office-365/office-365-service-communications-api-reference) 

The Office 365 Service Communications API V2 provides access to the following data: 
- Get Services: Get the list of subscribed services 
- Get Current Status: Get a view of current and ongoing service incidents
- Get Historical Status: Get a historical view of service health, including incidents 
- Get Messages: Find Incident, Planned Maintenance, and Message Center communications 

## Disclaimer
This guide is not intended to constitute legal advice. Customers should consult with their own legal counsel regarding compliance with any laws or regulations applicable to their industry and intended use of Microsoft Online Services, viz. Azure, O365 and other Microsoft Products and Services. *Microsoft makes no warranties, express, implied, or statutory, as to the information in this document. This is a live document and will be updated periodically to reflect the current state of tools, process and methods described in it to reflect current state, as and when realistically possible.* 
 
The information contained in this document represents the current view of Microsoft Corporation on the issues discussed as of the date of publication. Because Microsoft must respond to changing market conditions, it should not be interpreted to be a commitment on the part of Microsoft, and Microsoft cannot guarantee the accuracy of any information presented after the date of publication. 

This white paper is for informational purposes only. Microsoft makes no warranties, express or implied, in this document. 

Complying with all applicable copyright laws is the responsibility of the user. Without limiting the rights under copyright, no part of this document may be reproduced, stored in, or introduced into a retrieval system, or transmitted in any form or by any means (electronic, mechanical, photocopying, recording, or otherwise), or for any purpose, without the express written permission of Microsoft Corporation. 

Microsoft may have patents, patent applications, trademarks, copyrights, or other intellectual property rights covering subject matter in this document. Except as expressly provided in any written license agreement from Microsoft, the furnishing of this document does not give you any license to these patents, trademarks, copyrights, or other intellectual property. 

© 2018 Microsoft Corporation. All rights reserved. 