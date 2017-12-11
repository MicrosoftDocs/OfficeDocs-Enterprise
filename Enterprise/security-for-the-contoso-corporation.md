---
title: "Security for the Contoso Corporation"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 5/25/2017
ms.audience: ITPro
ms.topic: overview
ms.service: Office 365
localization_priority: Normal
ms.collection: Ent_O365
ms.custom:
- DecEntMigration
- Ent_Architecture
ms.assetid: 8f6f9894-5394-4110-8b0a-b8765028c10b
description: "Summary: Understand how Contoso mapped their security requirements to features in Microsoft's cloud offerings and determined a path to cloud security readiness."
---

# Security for the Contoso Corporation

 **Summary:** Understand how Contoso mapped their security requirements to features in Microsoft's cloud offerings and determined a path to cloud security readiness.
  
Contoso is serious about their information security and protection. When transitioning their IT infrastructure to a cloud-inclusive one, they made sure that their on-premises security requirements were supported and implemented in Microsoft's cloud offerings.
  
## Contoso's security requirements in the cloud

Here are Contoso's security requirements for the cloud:
  
- Strong authentication to cloud resources
    
    Cloud resource access must be authenticated and, where possible, leverage multi-factor authentication.
    
- Encryption for traffic across the Internet
    
    No data sent across the Internet is in plain text form. Always use HTTPS connections, IPsec, or other end-to-end data encryption methods.
    
- Encryption for data at rest in the cloud
    
    All data stored on disks or elsewhere in the cloud must be in an encrypted form.
    
- ACLs for least privilege access
    
    Account permissions to access resources in the cloud and what they are allowed to do must follow least-privilege guidelines.
    
## Contoso's data sensitivity classification

Using the information in Microsoft's [Data Classification Toolkit](https://msdn.microsoft.com/library/hh204743.aspx), Contoso performed an analysis of their data and determined the following levels.
  
|**Level 1: Low business value**|**Level 2: Medium business value**|**Level 3: High business value**|
|:-----|:-----|:-----|
|Data is encrypted and available only to authenticated users  <br/> Provided for all data stored on premises and in cloud-based storage and workloads, such as Office 365. Data is encrypted while it resides in the service and in transit between the service and client devices.  <br/> Examples of Level 1 data are normal business communications (email) and files for administrative, sales, and support workers.  <br/> |Level 1 plus strong authentication and data loss protection  <br/> Strong authentication includes multi-factor authentication with SMS validation. Data loss prevention ensures that sensitive or critical information does not travel outside the on-premises network.  <br/> Examples of Level 2 data are financial and legal information and research and development data for new products.  <br/> |Level 2 plus the highest levels of encryption, authentication, and auditing  <br/> The highest levels of encryption for data at rest and in the cloud, compliant with regional regulations, combined with multi-factor authentication with smart cards and granular auditing and alerting.  <br/> Examples of Level 3 data are customer and partner personally identifiable information and product engineering specifications and proprietary manufacturing techniques.  <br/> |
   
## Mapping Microsoft cloud offerings and features to Contoso's data levels

The following table shows the mapping of Contoso's data levels to features in Microsoft's cloud offerings:
  
||**SaaS**|**Azure PaaS**|**Azure IaaS**|
|:-----|:-----|:-----|:-----|
|Level 1: Low business value  <br/> | HTTPS for all connections <br/>  Encryption at rest <br/> | Support only HTTPS connections <br/>  Encrypt files stored in Azure <br/> | Require HTTPS or IPsec for server access <br/>  Azure disk encryption <br/> |
|Level 2: Medium business value  <br/> | Azure AD multi-factor authentication (MFA) with SMS <br/> | Use Azure Key Vault for encryption keys <br/>  Azure AD MFA with SMS <br/> | MFA with SMS <br/> |
|Level 3: High business value  <br/> | Azure Rights Management System (RMS) <br/>  Azure AD MFA with smart cards <br/>  Intune conditional access <br/> | Azure RMS <br/>  Azure AD MFA with smart cards <br/> | MFA with smart cards <br/> |
   
## Contoso's information policies

The following table lists Contoso's information policies.
  
||**Access**|**Data retention**|**Information protection**|
|:-----|:-----|:-----|:-----|
|Level 1: Low business value  <br/> | Allow access to all <br/> |6 months  <br/> |Use encryption  <br/> |
|Level 2: Medium business value  <br/> | Allow access to Contoso employees, subcontractors, and partners <br/>  Use MFA, TLS, and MAM <br/> |2 years  <br/> |Use hash values for data integrity  <br/> |
|Level 3: High business value  <br/> | Allow access to executives and leads in engineering and manufacturing <br/>  RMS with managed network devices only <br/> |7 years  <br/> |Use digital signatures for non-repudiation  <br/> |
   
## Contoso's path to cloud security readiness

Contoso used the following steps to ready their security for the Microsoft cloud:
  
1. Optimize administrator accounts for the cloud
    
    Contoso did an extensive review of the existing Windows Server AD administrator accounts and set up a series of cloud administrator accounts and groups.
    
2. Perform data classification analysis into three levels
    
    Contoso performed a careful review and determined the three levels, which was used to determine the Microsoft cloud offering features to protect Contoso's most valuable data.
    
3. Determine access, retention, and information protection policies for data levels
    
    Based on the data levels, Contoso determined detailed requirements, which will be used to qualify future IT workloads being moved to the cloud.
    
## Contoso's use of Office 365 security best practices

In accordance with Office 365 security best practices, Contoso's security administrators and IT department have deployed the following:
  
- **Dedicated global administrator accounts with very strong passwords**
    
    Rather than assign the global admin role to everyday user accounts, Contoso has create three, dedicated global administrator accounts with very strong passwords. Signing in with a global administrator account is only done for specific administrative tasks and the passwords are only known to designated staff. Contoso's security administrators have assigned admin roles to accounts that are appropriate to that IT person's job function and responsibility.
    
    For more information, see [About Office 365 admin roles](https://support.office.com/article/About-Office-365-admin-roles-da585eea-f576-4f55-a1e0-87090b6aaa9d).
    
- **Multi-factor authentication (MFA) for important user accounts**
    
    MFA adds an additional layer of protection to the sign-in process by requiring users to acknowledge a phone call, text message, or an app notification on their smart phone after correctly entering their password. With MFA, Office 365 user accounts are protected against unauthorized sign-in even if an account password is compromised.
    
  - To protect against a compromise of the Office 365 subscription, Contoso enabled MFA on all three global administrator accounts.
    
  - To protect against phishing attacks, in which an attacker compromises the credentials of a trusted person in the organization and sends malicious emails, Contoso enabled MFA on all user accounts for managers, including the executive staff.
    
    For more information, see [Plan for multi-factor authentication for Office 365 Deployments](https://support.office.com/article/Plan-for-multifactor-authentication-for-Office-365-Deployments-043807b2-21db-4d5c-b430-c8a6dee0e6ba)
    
- **Advanced Security Management (ASM)**
    
    ASM uses configured policies to monitor for anomalous activity. Contoso security administrators set up alerts with ASM so that IT administrators are notified of unusual or risky user activity, such as downloading large amounts of data, multiple failed sign-in attempts, or sign-ins from unknown or dangerous IP addresses
    
    For more information, see [Overview of Advanced Security Management in Office 365 ](https://support.office.com/article/Overview-of-Advanced-Security-Management-in-Office-365-81f0ee9a-9645-45ab-ba56-de9cbccab475).
    
- **Secure email flow and mailbox audit logging**
    
    Contoso security specialists are using Exchange Online Protection and Advanced Threat Protection (ATP) to protect against unknown malware, viruses, and malicious URLs transmitted through emails. Contoso has also enabled mailbox audit logging to determine who has logged into user mailboxes, sent messages, and other activities performed by the mailbox owner, a delegated user, or an administrator.
    
    For more information, see: 
    
  - [Office 365 Email Anti-Spam Protection](https://support.office.com/article/Office-365-Email-AntiSpam-Protection-6a601501-a6a8-4559-b2e7-56b59c96a586)
    
  - [Advanced threat protection for safe attachments and safe links](https://technet.microsoft.com/library/mt148491.aspx)
    
  - [Enable mailbox auditing in Office 365](https://go.microsoft.com/fwlink/p/?LinkID=626109)
    
- **Data Loss Prevention (DLP)**
    
    Contoso has identified its sensitive data and configured DLP policies for Exchange Online, SharePoint Online, and OneDrive to help prevent users from accidentally or intentionally sharing the data. 
    
    For more information, see [Overview of data loss prevention policies](https://support.office.com/article/Overview-of-data-loss-prevention-policies-1966b2a7-d1e2-4d92-ab61-42efbb137f5e).
    
## See Also

[Contoso in the Microsoft Cloud](contoso-in-the-microsoft-cloud.md)
  
[Microsoft Cloud IT architecture resources](microsoft-cloud-it-architecture-resources.md)

[Microsoft's Enterprise Cloud Roadmap: Resources for IT Decision Makers](https://sway.com/FJ2xsyWtkJc2taRD)
  
[Security best practices for Office 365](https://support.office.com/article/Security-best-practices-for-Office-365-9295e396-e53d-49b9-ae9b-0b5828cdedc3)

#### 



