---
title: "Privileged access management in Office 365"
ms.author: robmazz
author: robmazz
manager: laurawi
ms.date: 7/13/2018
ms.audience: ITPro
ms.topic: overview
ms.service: o365-solutions
localization_priority: Normal
ms.collection: Strat_O365_IP
ms.custom: Ent_Solutions
ms.assetid: 
description: "Summary: Use this topic to learn more about the privileged access management feature in Office 365"
---

# Privileged access management in Office 365

> [!IMPORTANT]
> This topic covers deployment and configuration guidance for a public beta feature only currently available in Office 365 E5 and Advanced Compliance SKUs.

Privileged access management allows granular access control over privileged admin tasks in Office 365.  It can help protect your organization from breaches that may use existing privileged admin accounts with standing access to sensitive data or access to critical configuration settings. After enabling privileged access management, users will need to request just-in-time access to complete elevated and privileged tasks through an approval workflow that is highly scoped and time-bound. This gives users just-enough-access to perform the task at hand, without risking exposure of sensitive data or critical configuration settings. Enabling privileged access management in Office 365 will enable your organization to operate with zero standing privileges and provide a layer of defense against vulnerabilities arising because of such standing administrative access. 

This topic will guide you through enabling and configuring privileged access management in your Office 365 organization and serve as a reference guide for requesting, approving, and managing the feature. 

## Before you begin

### Limited functionality
During the public beta, privileged access management features are only available through [Exchange Online PowerShell](https://docs.microsoft.com/powershell/exchange/exchange-online/exchange-online-powershell?view=exchange-ps) in Office 365. Privileged access management covers the task definitions at the level of Exchange management cmdlets. In future Office 365 releases, privileged access features will be available through the admin portal and will cover other Office 365 workloads services.

### Connecting to Exchange Online PowerShell
The configuration steps in this topic will walk you through enabling and using privileged access in Office 365 using Exchange Online PowerShell. 

Follow the steps in [Connect to Exchange Online PowerShell using Multi-Factor authentication](https://docs.microsoft.com/powershell/exchange/exchange-online/connect-to-exchange-online-powershell/mfa-connect-to-exchange-online-powershell?view=exchange-ps) to connect to Exchange Online PowerShell with your Office 365 credentials to enable and configure privileged access for your organization.

> [!NOTE]
> You do not need to enable multi-factor authentication for your Office 365 organization to use the steps to enable privileged access while connecting to Exchange Online PowerShell. Connecting with multi-factor authentication creates an OAuth token that is used by privileged access for signing your requests.

## Enable and configure privileged access management

### Step 1 - Create an approver's group
From Office 365 Admin Portal, select **Groups** > **Add a group**, then create a mail enabled security group for the default privileged access approvers. When complete, select **Add** to create and save the approver group.

![Privileged access approvers screen in Office 365 Admin portal](images/privileged-access-approvers-ui.png)

### Step 2 - Enable privileged access in Office 365
Privileged access needs to be explicitly turned on with the default approver group and including a set of system accounts that you’d want to be excluded from the privileged access management access control. 

Run the following command in Exchange Online PowerShell to enable privileged access and to assign the approver's group:
```
Enable-ElevatedAccessControl 
    -AdminGroup '<default approver group>' 
    -SystemAccounts @('<systemAccountUPN1>','<systemAccountUPN2>')
```
Example:
```
Enable-ElevatedAccessControl 
    -AdminGroup 'pamapprovers@fabrikam.onmicrosoft.com' 
    -SystemAccounts @('sys1@fabrikamorg.onmicrosoft.com', sys2@fabrikamorg.onmicrosoft.com')
```

> [!NOTE]
> System accounts feature is made available to ensure certain automations within your organizations can work without dependency on privileged access, however it is recommended that such exclusions be exceptional and those allowed should be approved and audited regularly.

### Step 3 - Create an approval policy
An approval policy allows you to define the specific approval requirements scoped at individual tasks. The approval type options are **Auto** or **Manual**. 

Run the following command in Exchange Online PowerShell to define an approval policy:
```
New-ElevatedAccessApprovalPolicy 
    -Task 'Exchange\<exchange management cmdlet name>' 
    -ApprovalType <Manual, Auto> 
    -ApproverGroup '<default/custom approver group>'
```
Example:
```
New-ElevatedAccessApprovalPolicy 
    -Task 'Exchange\New-MoveRequest' 
    -ApprovalType Manual 
    -ApproverGroup 'mbmanagers@fabrikamorg.onmicrosoft.com'
```

## Using privileged access in your Office 365 organization

### Requesting elevation authorization to execute tasks
Once enabled, privileged access requires approvals for executing any task that has an associated approval policy defined. Users needing to execute tasks included in the an approval policy must request and be granted access approval in order to have permissions necessary to execute the task.

Run the following command in Exchange Online PowerShell to create and submit an approval request to the approver's group:
```
New-ElevatedAccessRequest 
    -Task 'Exchange\<exchange management cmdlet name>' 
    -Reason '<appropriate reason>' 
    -DurationHours <duration in hours>
```
Example:
```
New-ElevatedAccessRequest 
    -Task 'Exchange\New-MoveRequest' 
    -Reason 'Attempting to fix the user mailbox error' 
    -DurationHours 4
```

### Approving an elevation authorization request
When an approval request is created, members of the relevant approver group will receive an email notification and can approve the request associated with the request ID. 

Run the following command in Exchange Online PowerShell to approve an elevation authorization request:
```
Approve-ElevatedAccessRequest 
    -RequestId <request id>
    -Comment '<approval comment>'
```
Example:
```
Approve-ElevatedAccessRequest 
    -RequestId a4bc1bdf-00a1-42b4-be65-b6c63d6be279 
    -Comment '<approval comment>'
```
### Denying an elevation authorization request
When an approval request is created, members of the relevant approver group can deny the request associated with the request ID. 

Run the following command in Exchange Online PowerShell to deny an elevation authorization request:
```
Deny-ElevatedAccessRequest 
    -RequestId <request id>
    -Comment '<denial comment>'
```
Example:
```
Deny-ElevatedAccessRequest 
    -RequestId a4bc1bdf-00a1-42b4-be65-b6c63d6be279 
    -Comment '<denial comment>'
```


### Running the task
After approval is granted, the requesting user can execute the intended task and privileged access will authorize and execute the task on users’ behalf. The approval remains valid for the requested duration (default duration is 4 hours), during which the requester can execute the intended task multiple times. All such executions are logged and made available for security and compliance auditing. 

### Disable privileged access in Office 365
If needed, you can disable privileged access management in Office 365. Disabling privileged access does not delete any associated approval policies or approver groups.

Run the following command in Exchange Online Powershell to disable privileged access:

```
Disable-ElevatedAccessControl
```
## Project Euclid with privileged access
Project Euclid is a service that helps organizations exert a granular level of control over their Office 365 data. The Euclid system allows application developers who build solutions to mine data to build useful insights. 

Project Euclid uses Office 365 privileged access to assert control over their data through the privileged access maangement approval workflow, allowing scoped access to Office 365 data with admin oversight. Requests for data from Project Euclid come in through the integration when apps are installed.

### View requests for Office 365 data from Euclid
View details of access requests for Office 365 data from the Euclid system.

Run the following command in Exchange Online Powershell to view data requests from the Euclid system:
```
Get-ElevatedAccessRequest 
    –Identity <request id>
    | select RequestorUPN, Service, RequestedAccess
    | fl
```
Example:
```
RequestorUPN    : admin@contoso.com
Service         : Office365
RequestedAccess : Data Access Request
```

### Approve all data access requests for Project Euclid apps
All data access requests can be approved through the standard privileged access approval cmdlets.

Run the following command in Exchange Online Powershell to approve all data requests for specific requestor:

```
Approve-ElevatedAccessRequest 
    -RequestId <request id>
    -Comment '<approval comment>'
```
Example:
```
Approve-ElevatedAccessRequest 
    -RequestId a4bc1bdf-00a1-42b4-be65-b6c63d6be279 
    -Comment '<approval comment>'
```

## Getting help and providing feedback
We recognize that during the public beta you may come across an occasional bug or have feedback and suggestions on how we can improve privileged access management. We value your feedback and encourage you to share it with us:
- Post your feedback ad suggestions in the [Office Preview Yammer Group](https://www.yammer.com/officeenterprisenda/#/threads/inGroup?type=in_group&feedId=14435206).
- File your bug reports under area path “Office 365 Privileged Access Management” on the [Office Preview VSO](https://office-previews.visualstudio.com/previews).

## Frequently asked questions

### What SKUs do I need to use privileged access in Office 365?
Privileged access management in Office 365 is currently only available for customers with E5 and Advanced Compliance SKUs.

### When will privileged access be available for Office 365 workloads beyond Exchange?
We plan to offer this feature in other Office 365 workloads soon. When we’re ready to share a timeline, it will be available through the Office 365 roadmap.

### How is this different from Azure Active Directory’s Privileged Identity Management?
Privileged access management in Office 365 and [Azure AD Privileged Identity Management](https://docs.microsoft.com/azure/active-directory/active-directory-privileged-identity-management-configure) complement each other by providing access control with just-in-time access at different scopes. Together they provide a robust set of controls for protecting your data.

Privileged access management in Office 365 can be defined and scoped at the task level, while Azure AD Privileged Identity Management applies at the role level with the ability to execute multiple tasks.  Azure AD Privileged Identity Management primarily allows managing accesses for AD roles and role groups while privileged access management in Office 365 is applied at the task level.

 - **Enabling privileged access management in Office 365 while already using Azure AD Privileged Identity Management:** Adding privileged access management in Office 365 can provide another granular layer of protection and audit capabilities for privileged access to Office 365 data.

- **Enabling Azure AD Privileged Identity Management while already using privileged access management in Office 365:**  Adding Azure AD Privileged Identity Management to privileged access management in Office 365 can extend privileged access to data outside of Office 365 that’s primarily defined by a user’s role or identity. 

### Do I need to be a Global Admin to manage privileged access in Office 365?
During the preview you need to have Global Admin privilege to be able to manage privileged access in Office 365. Users who are included in an approvers’ group don't need to be a Global Admin to review and approve requests. 

### How is privileged access management in Office 365 related to Customer Lockbox?
[Customer Lockbox](https://support.office.com/article/Office-365-Customer-Lockbox-Requests-36f9cdd1-e64c-421b-a7e4-4a54d16440a2) allows a level of access control for organizations for access to to data by their service provider, i.e. Microsoft. Privileged access management in Office 365 allows granular access control within an organization for all Office 365 privileged tasks.
