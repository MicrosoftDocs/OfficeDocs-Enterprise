---
title: "Protect your Office 365 global administrator accounts"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 4/10/2018
ms.audience: Admin
ms.topic: get-started-article
ms.service: o365-administration
localization_priority: Normal
ms.collection: Strat_O365_IP
search.appverid:
- MET150
- MOE150
- MED150
- MBS150
- BCS160
ms.assetid: 6b4ded77-ac8d-42ed-8606-c014fd947560
description: "Protect global administrator access to your Office 365 subscription with these three steps."
---

# Protect your Office 365 global administrator accounts

 **Summary:** Protect your Office 365 subscription from attacks based on the compromise of a global administrator account. 
  
Security breaches of an Office 365 subscription, including information harvesting and phishing attacks, are typically done by compromising the credentials of an Office 365 global administrator account. Security in the cloud is a partnership between you and Microsoft:
  
- Microsoft cloud services are built on a foundation of trust and security. Microsoft provides you security controls and capabilities to help you protect your data and applications.
    
- You own your data and identities and the responsibility for protecting them, the security of your on-premises resources, and the security of cloud components you control.
    
Microsoft provides capabilities to help protect your organization, but they are effective only if you use them. If you do not use them, you may be vulnerable to attack. To protect your global administrator accounts, Microsoft is here to help you with detailed instructions to:
  
1. Create dedicated Office 365 global administrator accounts and use them only when necessary.
    
2. Configure multi-factor authentication for your dedicated Office 365 global administrator accounts and use the strongest form of secondary authentication.
    
3. Enable and configure Office 365 Cloud App Security to monitor for suspicious global administrator account activity.
    
> [!NOTE]
> Although this article is focused on global administrator accounts, you should also consider whether additional accounts with wide-ranging permissions to access the data in your subscription, such as eDiscovery administrator or security or compliance administrator accounts, should be protected in the same way. 
  
## Step 1. Create dedicated Office 365 global administrator accounts and use them only when necessary

There are relatively few administrative tasks, such as assigning roles to user accounts, that require global administrator privileges. Therefore, instead of using everyday user accounts that have been assigned the global admin role, do these steps:
  
1. Determine the set of user accounts that have been assigned the global admin role. You can do this with this command at the Microsoft Azure Active Directory Module for Windows PowerShell command prompt:
    
  ```
  Get-MsolRoleMember -RoleObjectId (Get-MsolRole -RoleName "Company Administrator").ObjectId
  ```

2. Sign into your Office 365 subscription with a user account that has been assigned the global admin role.
    
3. Create at least one and up to a maximum of five dedicated global administrator user accounts. **Use strong passwords at least 12 characters long.** See [Create a strong password](https://support.microsoft.com/help/4026406/microsoft-account-create-a-strong-password) for more information. Store the passwords for the new accounts in a secure location. 
    
4. Assign the global admin role to each of the new dedicated global administrator user accounts.
    
5. Sign out of Office 365.
    
6. Sign in with one of the new dedicated global administrator user accounts.
    
7. For each existing user account that had been assigned the global admin role from step 1:
    
  - Remove the global admin role.
    
  - Assign admin roles to the account that are appropriate to that user's job function and responsibility. For more information about various admin roles in Office 365, see [About Office 365 admin roles](https://support.office.com/article/da585eea-f576-4f55-a1e0-87090b6aaa9d).
    
8. Sign out of Office 365.
    
The result should be:
  
- The only user accounts in your subscription that have the global admin role are the new set of dedicated global administrator accounts. Verify this with the following PowerShell command:
    
  ```
  Get-MsolRoleMember -RoleObjectId (Get-MsolRole -RoleName "Company Administrator").ObjectId
  ```

- All other everyday user accounts that manage your subscription have admin roles assigned that are associated with their job responsibilities.
    
From this moment onward, you sign in with the dedicated global administrator accounts only for tasks that require global administrator privileges. All other Office 365 administration must be done by assigning other administration roles to user accounts.
  
> [!NOTE]
> Yes, this requires additional steps to sign out as your everyday user account and sign in with a dedicated global administrator account. But this only needs to be done occasionally for global administrator operations. Consider that recovering your Office 365 subscription after a global administrator account breach requires a lot more steps. 
  
## Step 2. Configure multi-factor authentication for your dedicated Office 365 global administrator accounts and use the strongest form of secondary authentication

Multi-factor authentication (MFA) for your global administrator accounts requires additional information beyond the account name and password. Office 365 supports these verification methods:
  
- A phone call
    
- A randomly generated pass code
    
- A smart card (virtual or physical)
    
- A biometric device
    
If you are a small business that is using user accounts stored only in the cloud (the cloud identity model), use these steps to configure MFA using a phone call or a text message verification code sent to a smart phone:
  
1. [Enable MFA](https://support.office.com/article/Set-up-multi-factor-authentication-for-Office-365-users-8f0454b2-f51a-4d9c-bcde-2c48e41621c6).
    
2. [Set up 2-step verification for Office 365](https://support.office.com/article/Set-up-2-step-verification-for-Office-365-ace1d096-61e5-449b-a875-58eb3d74de14) to configure each dedicated global administrator account for phone call or text message as the verification method. 
    
If you are a larger organization that is using an Office 365 hybrid identity model, you have more verification options. If you have the security infrastructure already in place for a stronger secondary authentication method, use these steps:
  
1. [Enable MFA](https://support.office.com/article/Set-up-multi-factor-authentication-for-Office-365-users-8f0454b2-f51a-4d9c-bcde-2c48e41621c6).
    
2. [Set up 2-step verification for Office 365](https://support.office.com/article/Set-up-2-step-verification-for-Office-365-ace1d096-61e5-449b-a875-58eb3d74de14) to configure each dedicated global administrator account for the appropriate verification method. 
    
If the security infrastructure for the desired stronger verification method is not in place and functioning for Office 365 MFA, we strongly recommend that you configure dedicated global administrator accounts with MFA using a phone call or a text message verification code sent to a smart phone for your global administrator accounts as an interim security measure. Do not leave your dedicated global administrator accounts without the additional protection provided by MFA.
  
For more information, see [Plan for multi-factor authentication for Office 365 Deployments](https://support.office.com/article/043807b2-21db-4d5c-b430-c8a6dee0e6ba).
  
To connect to Office 365 services with MFA and PowerShell, see [this article](https://blogs.technet.microsoft.com/solutions_advisory_board/2017/04/27/connect-to-office-365-services-with-multifactor-authentication-mfa-and-powershell/).
  
## Step 3. Monitor for suspicious global administrator account activity

Office 365 Cloud App Security lets you create policies to notify you of suspicious behavior in your subscription. Cloud App Security is built into Office 365 E5, but is also available as a separate service. For example, if you do not have Office 365 E5, you can purchase individual Cloud App Security licenses for the user accounts that are assigned the global administrator, security administrator, and compliance administrator roles.
  
If you have Cloud App Security in your Office 365 subscription, use these steps:
  
1. Sign into the Microsoft 365 admin center with an account that is assigned the Security Administrator or Compliance Administrator role.
    
2. [Turn on Office 365 Cloud App Security](https://support.office.com/article/ba919c73-d021-404d-9850-eec57e78678c).
    
3. Review your [Anomaly detection policies in Office 365 Cloud App Security](https://support.office.com/article/88935b4e-dcb1-47f1-8aca-1bf8fb069db6) to notify you by email of anomalous patterns of privileged administrative activity. 
    
To add a user account to the Security Administrator role, [connect to Office 365 PowerShell](https://technet.microsoft.com/library/dn975125.aspx#step3) with a dedicated global administrator account and MFA, fill in the user principal name of the user account, and then run these commands: 
  
```
$upn="<User principal name of the account>"
Add-MsolRoleMember -RoleMemberEmailAddress $upn -RoleName "Security Administrator"
```

To add a user account to the Compliance Administrator role, fill in the user principal name of the user account, and then run these commands:
  
```
$upn="<User principal name of the account>"
Add-MsolRoleMember -RoleMemberEmailAddress  $upn -RoleName "Compliance Administrator"
```

## Additional protections for enterprise organizations

After steps 1-3, use these additional methods to ensure that your global administrator account, and the configuration that you perform using it, are as secure as possible.
  
### Privileged Access Workstation (PAW)

To ensure that the execution of highly privileged tasks is as secure as possible, use a PAW. A PAW is a dedicated computer that is only used for sensitive configuration tasks, such as Office 365 configuration that requires a global administrator account. Because this computer is not used daily for Internet browsing or email, it is better protected from Internet attacks and threats.
  
For instructions on how to set up a PAW, see [http://aka.ms/cyberpaw](http://aka.ms/cyberpaw).
  
### Azure AD Privileged Identity Management (PIM)

Rather than having your global administrator accounts be permanently assigned the global administrator role, you can use Azure AD PIM to enable on-demand, just-in-time assignment of the global administrator role when it is needed.
  
Instead of your global administrator accounts being a permanent admin, they become eligible administrators. The global administrator role is inactive until someone needs it. You then complete an activation process to add the global administrator role to the global administrator account for a predetermined amount of time. When the time expires, PIM removes the global administrator role from the global administrator account.
  
Using PIM and this process significantly reduces the amount of time that your global administrator accounts are vulnerable to attack and use by malicious users.
  
For more information, see [Configure Azure AD Privileged Identity Management](https://docs.microsoft.com/azure/active-directory/active-directory-privileged-identity-management-configure).
  
> [!NOTE]
> PIM is available with Azure Active Directory Premium P2, which is included with Enterprise Mobility + Security (EMS) E5, or you can purchase individual licenses for your global administrator accounts. 
  
### Security information and event management (SIEM) software for Office 365 logging

SIEM software run on a server performs real-time analysis of security alerts and events created by applications and network hardware. To allow your SIEM server to include Office 365 security alerts and events in its analysis and reporting functions, integrate these in your SIEM system:
  
- Azure AD
    
    For more information, see [Integrate logs from Azure resources into your SIEM systems](https://docs.microsoft.com/azure/security/security-azure-log-integration-overview).
    
- Office 365 Cloud App Security
    
    For more information, see [Integrate your SIEM server with Office 365 Cloud App Security](https://support.office.com/article/dd6d2417-49c4-4de6-9294-67fdabbf8532).
    
## Next step

See [Security best practices for Office 365](https://support.office.com/article/9295e396-e53d-49b9-ae9b-0b5828cdedc3).
  

