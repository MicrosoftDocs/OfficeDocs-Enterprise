---
title: "Prepare to provision users through directory synchronization to Office 365"
ms.author: robmazz
author: robmazz
manager: laurawi
ms.date: 8/21/2018
ms.audience: Admin
ms.topic: article
f1_keywords:
- 'O365p_AddUsersWithDirSync'
- 'O365M_AddUsersWithDirSync'
- 'O365E_HRCSetupAADConnectAboutLM617031'
- 'O365E_AddUsersWithDirSync'
ms.service: o365-administration
localization_priority: Normal
ms.custom: Adm_O365
ms.collection:
- Ent_O365
- M365-identity-device-management
search.appverid:
- MET150
- MOP150
- MOE150
- MBS150
ms.assetid: 01920974-9e6f-4331-a370-13aea4e82b3e
description: "Describes how to prepare to provision users to Office 365 by using directory synchronization and the long-term benefits of using this method."
---

# Prepare to provision users through directory synchronization to Office 365

Provisioning users with directory synchronization requires more planning and preparation than simply managing your work or school account directly in Office 365. The additional planning and preparation tasks are required to ensure that your on-premises Active Directory synchronizes properly to Azure Active Directory. The added benefits to your organization include:
  
- Reducing the administrative programs in your organization
- Optionally enabling single sign-on scenario
- Automating account changes in Office 365
    
For more information about the advantages of using directory synchronization, see [Directory synchronization roadmap]( https://go.microsoft.com/fwlink/p/?LinkId=525398) and [Understanding Office 365 Identity and Azure Active Directory](about-office-365-identity.md).
  
To determine which scenario is the best for your organization, review the [directory integration tools comparison](https://go.microsoft.com/fwlink/p/?LinkId=525320).
  
## Directory cleanup tasks

Before you begin synchronizing your directory, you need to clean up your directory.
  
Review also the [attributes synchronized to Azure Active Directory by Azure AD Connect](https://docs.microsoft.com/azure/active-directory/hybrid/reference-connect-sync-attributes-synchronized).
  
> [!IMPORTANT]
> If you don't perform directory cleanup before you synchronize, there can be a significant negative effect on the deployment process. It might take days, or even weeks, to go through the cycle of directory synchronization, identifying errors, and re-synchronization. 
  
In your on-premises directory, complete the following clean-up tasks:
  
1. Ensure that each user who will be assigned Office 365 service offerings has a valid and unique email address in the **proxyAddresses** attribute. 
    
2. Remove any duplicate values in the **proxyAddresses** attribute. 
    
3.  If possible, ensure that each user who will be assigned Office 365 service offerings has a valid and unique value for the **userPrincipalName** attribute in the user's **user** object. For best synchronization experience, ensure that the on-premises Active Directory UPN matches the cloud UPN. If a user does not have a value for the **userPrincipalName** attribute, then the **user** object must contain a valid and unique value for the **sAMAccountName** attribute. Remove any duplicate values in the **userPrincipalName** attribute. 
    
4. For optimal use of the global address list (GAL), be sure the information in the following attributes is correct:
    
  - givenName
  - surname
  - displayName
  - Job Title
  - Department
  - Office
  - Office Phone
  - Mobile Phone
  - Fax Number
  - Street Address
  - City
  - State or Province
  - Zip or Postal Code
  - Country or Region
    
## Directory object and attribute preparation

Successful directory synchronization between your on-premises directory and Office 365 requires that your on-premises directory attributes are properly prepared. For example, you need to ensure that specific characters aren't used in certain attributes that are synchronized with the Office 365 environment. Unexpected characters do not cause directory synchronization to fail but might return a warning. Invalid characters will cause directory synchronization to fail.
  
Directory synchronization will also fail if some of your Active Directory users have one or more duplicate attributes. Each user must have unique attributes.
  
The attributes that you need to prepare are listed here:
  
 **NOTE:** You can also use the [IdFix tool](install-and-run-idfix.md) to make this process a lot easier. 
  
- **displayName**
    
  - If the attribute exists in the user object, it will be synchronized with Office 365.
  - If this attribute exists in the user object, there must be a value for it. That is, the attribute must not be blank.
  - Maximum number of characters: 256
    
- **givenName**
    
  - If the attribute exists in the user object, it will be synchronized with Office 365, but Office 365 does not require or use it.
  - Maximum number of characters: 64
    
- **mail**
    
  - The attribute value must be unique within the directory.
    
    > [!NOTE]
    > If there are duplicate values, the first user with the value is synchronized. Subsequent users will not appear in Office 365. You must modify either the value in Office 365, or modify both of the values in the on-premises directory in order for both users to appear in Office 365. 
  
- **mailNickname** (Exchange alias) 
    
  - The attribute value cannot begin with a period (.).
  - The attribute value must be unique within the directory.
    
- **proxyAddresses**
    
  - Multiple-value attribute
  - Maximum number of characters per value: 256
  - The attribute value must not contain a space.
  - The attribute value must be unique within the directory.
  - Invalid characters: \< \> ( ) ; , [ ] "
    
    Note that the invalid characters apply to the characters following the type delimiter and ":", such that SMTP:User@contso.com is allowed, but SMTP:user:M@contoso.com is not.
    
    > [!IMPORTANT]
    > All Simple Mail Transport Protocol (SMTP) addresses should comply with email messaging standards. If duplicate or unwanted addresses exist, see the Help topic [Removing duplicate and unwanted proxy addresses in Exchange](https://go.microsoft.com/fwlink/?LinkId=293860). 
  
- **sAMAccountName**
    
  - Maximum number of characters: 20
  - The attribute value must be unique within the directory.
  - Invalid characters: [ \ " | , / : \< \> + = ; ? \* ]
  - If a user has an invalid **sAMAccountName** attribute but has a valid **userPrincipalName** attribute, the user account is created in Office 365. 
  - If both **sAMAccountName** and **userPrincipalName** are invalid, the on-premises Active Directory **userPrincipalName** attribute must be updated. 
    
- **sn** (surname) 
    
  - If the attribute exists in the user object, it will be synchronized with Office 365, but Office 365 does not require or use it.
    
- **targetAddress**
    
    It's required that the **targetAddress** attribute (for example, SMTP:tom@contoso.com) that's populated for the user must appear in the Office 365 GAL. In third-party messaging migration scenarios, this would require the Office 365 schema extension for the on-premises directory. The Office 365 schema extension would also add other useful attributes to manage Office 365 objects that are populated by using a directory synchronization tool from on-premises directory. For example, the **msExchHideFromAddressLists** attribute to manage hidden mailboxes or distribution groups would be added. 
   
  - Maximum number of characters: 256
  - The attribute value must not contain a space.
  - The attribute value must be unique within the directory.
  - Invalid characters: \ \< \> ( ) ; , [ ] "
  - All Simple Mail Transport Protocol (SMTP) addresses should comply with email messaging standards.
    
- **userPrincipalName**
    
  - The **userPrincipalName** attribute must be in the Internet-style sign-in format where the user name is followed by the at sign (@) and a domain name: for example, user@contoso.com. All Simple Mail Transport Protocol (SMTP) addresses should comply with email messaging standards.
  - The maximum number of characters for the **userPrincipalName** attribute is 113. A specific number of characters are permitted before and after the at sign (@), as follows: 
  - Maximum number of characters for the user name that is in front of the at sign (@): 64
  - Maximum number of characters for the domain name following the at sign (@): 48
  - Invalid characters: \ % &amp; \* + / = ? { } | \< \> ( ) ; : , [ ] "
  - An umlaut is also an invalid character.
  - The @ character is required in each **userPrincipalName** value. 
  - The @ character cannot be the first character in each **userPrincipalName** value. 
  - The user name cannot end with a period (.), an ampersand (&amp;), a space, or an at sign (@).
  - The user name cannot contain any spaces.
  - Routable domains must be used; for example, local or internal domains cannot be used.
  - Unicode is converted to underscore characters.
  - **userPrincipalName** cannot contain any duplicate values in the directory. 
    
## Prepare the userPrincipalName attribute

Active Directory is designed to allow the end users in your organization to sign in to your directory by using either **sAMAccountName** or **userPrincipalName**. Similarly, end users can sign in to Office 365 by using the user principal name (UPN) of their work or school account. Directory synchronization attempts to create new users in Azure Active Directory by using the same UPN that's in your on-premises directory. The UPN is formatted like an email address. 

In Office 365, the UPN is the default attribute that's used to generate the email address. It's easy to get **userPrincipalName** (on-premises and in Azure Active Directory) and the primary email address in **proxyAddresses** set to different values. When they are set to different values, there can be confusion for administrators and end users. 
  
It's best to align these attributes to reduce confusion. To meet the requirements of single sign-on with Active Directory Federation Services (AD FS) 2.0, you need to ensure that the UPNs in Azure Active Directory and your on-premises Active Directory match and are using a valid domain namespace.
  
## Add an alternative UPN suffix to AD DS

You may need to add an alternative UPN suffix to associate the user's corporate credentials with the Office 365 environment. A UPN suffix is the part of a UPN to the right of the @ character. UPNs that are used for single sign-on can contain letters, numbers, periods, dashes, and underscores, but no other types of characters.
  
For more information on how to add an alternative UPN suffix to Active Directory, see [Prepare for directory synchronization]( https://go.microsoft.com/fwlink/p/?LinkId=525430).
  
## Match the on-premises UPN with the Office 365 UPN

If you've already set up directory synchronization, the user's UPN for Office 365 may not match the user's on-premises UPN that's defined in your on-premises directory service. This can occur when a user was assigned a license before the domain was verified. To fix this, use [PowerShell to fix duplicate UPN](https://go.microsoft.com/fwlink/p/?LinkId=396730) to update the user's UPN to ensure that the Office 365 UPN matches the corporate user name and domain. If you are updating the UPN in the on-premises directory service and would like it to synchronize with the Azure Active Directory identity, you need to remove the user's license in Office 365 prior to making the changes on-premises. 
  
See also [How to prepare a non-routable domain (such as .local domain) for directory synchronization](prepare-a-non-routable-domain-for-directory-synchronization.md).
  
## Directory integration tools

Directory synchronization is the synchronization of directory objects (users, groups, and contacts) from your on-premises Active Directory environment to the Office 365 directory infrastructure, Azure Active Directory. See [Directory Integration Tools](https://go.microsoft.com/fwlink/p/?LinkID=510956) for a list of the available tools and their functionality. The recommended tool is [Microsoft Azure Active Directory Connect](https://go.microsoft.com/fwlink/p/?LinkID=510956). For more information about Azure Active Directory Connect, see [Integrating your on-premises identities with Azure Active Directory](https://go.microsoft.com/fwlink/p/?LinkId=527969).
  
When user accounts are synchronized with the Office 365 directory for the first time, they are marked as not activated. They cannot send or receive email, and they don't consume subscription licenses. When you're ready to assign Office 365 subscriptions to specific users, you must select and activate them by [Assign licenses to users in Office 365 for business](https://support.office.com/article/997596b5-4173-4627-b915-36abac6786dc).
  
You can also use [PowerShell](https://go.microsoft.com/fwlink/p/?LinkId=613097) to assign licenses. See [How to Use PowerShell to Automatically Assign Licenses to Your Office 365 Users](https://go.microsoft.com/fwlink/p?LinkID=329805) for an automated solution.