---
title: "Administering Exchange Online mailboxes in a multi-geo environment"
ms.author: chrisda
author: chrisda
manager: serdars
ms.audience: ITPro
ms.topic: article
ms.service: o365-solutions
ms.custom: 
localization_priority: Priority
description: "Learn how to administer Exchange Online multi-geo setting with Microsoft PowerShell."
---

# Administering Exchange Online mailboxes in a multi-geo environment

Remote PowerShell is required to view and configure multi geo properties in your Office 365 environment. To connect to Exchange Online PowerShell, see [Connect to Exchange Online PowerShell](https://docs.microsoft.com/powershell/exchange/exchange-online/connect-to-exchange-online-powershell/connect-to-exchange-online-powershell).

You need the [Microsoft Azure Active Directory PowerShell Module](https://social.technet.microsoft.com/wiki/contents/articles/28552.microsoft-azure-active-directory-powershell-module-version-release-history.aspx) v1.1.166.0 or later in v1.x to see the **PreferredDataLocation** property on user objects. User objects synchronized via AAD Connect into AAD cannot have their **PreferredDataLocation** value directly modified via AAD PowerShell. Cloud-only user objects can be modified via AAD PowerShell. To connect to Azure AD PowerShell, see [Connect to Office 365 PowerShell](https://docs.microsoft.com/office365/enterprise/powershell/connect-to-office-365-powershell). 

## Connect directly to a geo location using Exchange Online PowerShell
Typically, Exchange Online PowerShell will connect to the central location. But, you can also connect directly to satellite locations. Because of performance improvements, we recommend connecting directly to the satellite location when you only manage users in that geo location.

To connect to a specific geo location, the *ConnectionUri* parameter is different than the regular connection instructions. The rest of the commands and values are the same. The steps are:

1. On your local computer, open Windows PowerShell and run the following command:
    
    ```
    $UserCredential = Get-Credential
    ```
   In the **Windows PowerShell Credential Request** dialog box, type your work or school account and password, and then click **OK**.
    
2. Replace `<emailaddress>` with the email address of **any** mailbox in the target geo location and run the following command. Your permissions on the mailbox and the relationship to your credentials in Step 1 are not a factor; the email address simply tells Exchange Online where to connect.
  
   ```
   $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell?email=<emailaddress> -Credential $UserCredential -Authentication  Basic -AllowRedirection
   ```

   For example, if olga@contoso.onmicrosoft.com is the email address of a valid mailbox in the Geo you want to connect, run the following command:

   ```
   $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell?email=olga@contoso.onmicrosoft.com -Credential $UserCredential -Authentication  Basic -AllowRedirection
   ```
3. Run the following command:
    
    ```
    Import-PSSession $Session
    ```


## View the available geo locations that are configured in your Exchange Online organization
To see the list of configured geo locations in Office 365 Multi-Geo, run the following command in Exchange Online PowerShell:

```
Get-OrganizationConfig | Select -ExpandProperty AllowedMailboxRegions | Format-Table
```

## View the central location for your Exchange Online organization
To view your tenant's central location, run the following command in Exchange Online PowerShell:

```
Get-OrganizationConfig | Select DefaultMailboxRegion
```

## Find the geo location of a mailbox
The **Get-Mailbox** cmdlet in Exchange Online PowerShell displays the following multi-geo related properties on mailboxes:

- **Database**: The first 3 letters of the database name correspond to the geo code, which tells you where the mailbox is currently located. For Online Archive Mailboxes the **ArchiveDatabase** property should be used.

- **MailboxRegion**: Specifies the geo location code that was set by the admin (synchronized from **PreferredDataLocation** in Azure AD).

- **MailboxRegionLastUpdateTime**: Indicates when MailboxRegion was last updated (either automatically or manually).

To see these properties for a mailbox, use the following syntax:

```
Get-Mailbox -Identity <MailboxIdentity> | Format-List Database,MailboxRegion*
```

For example, to see the Geo information for the mailbox chris@contoso.onmicrosoft.com, run the following command:

```
Get-Mailbox -Identity chris@contoso.onmicrosoft.com | Format-List Database, MailboxRegion*
```

The output of the command looks like this:

```
Database                    : EURPR03DG077-db007 
MailboxRegion               : EUR 
MailboxRegionLastUpdateTime : 2/6/2018 8:21:01 PM 
```

> **Note:**
> If the geo location code in the database name doesn't match **MailboxRegion** value, the mailbox will be automatically be put into a relocation queue and moved to the geo location specified by the **MailboxRegion** value (Exchange Online looks for a mismatch between these property values).

## Move an existing cloud-only mailbox to a specific geo location
A cloud-only user is a user not syncrhonized to the tenant via AAD Connect. This user was created directly in Azure AD. Use the **Get-MsolUser** and **Set-MsolUser** cmdlets in the Azure AD Module for Windows PowerShell to view or specify the Geo where a cloud-only user's mailbox will be stored.

To view the **PreferredDataLocation** value for a user, use this syntax in Azure AD PowerShell:

```
Get-MsolUser -UserPrincipalName <UserPrincipalName> | Format-List UserPrincipalName,PreferredDataLocation
```

For example, to see the **PreferredDataLocation** value for the user michelle@contoso.onmicrosoft.com, run the following command:

```
Get-MsolUser -UserPrincipalName michelle@contoso.onmicrosoft.com | Format-List
```

To modify the **PreferredDataLocation** value for a cloud-only user object, use the following syntax in Azure AD PowerShell:

``` 
Set-MsolUser -UserPrincipalName <UserPrincipalName> -PreferredDataLocation <GeoCode>
```

For example, to set the **PreferredDataLocation** value to the European Union (EUR) geo for the user michelle@contoso.onmicrosoft.com, run the following command:

``` 
Set-MsolUser -UserPrincipalName michelle@contoso.onmicrosoft.com -PreferredDataLocation EUR
```

**Notes**:

- As mentioned previously you cannot use this procedure for synchronized user objects from on-premises Active Directory. You need to change the **PreferredDataLocation** value in Active Directory and synchronize it using AAD Connect. For more information, see [Azure Active Directory Connect sync: Configure preferred data location for Office 365 resources](https://docs.microsoft.com/azure/active-directory/connect/active-directory-aadconnectsync-feature-preferreddatalocation). 

- How long it takes to relocate a mailbox to a new geo location depends on several factors:
 
  - The size and type of mailbox.
 
  - The number of mailboxes being moved.
 
  - The availability of move resources.

### Move disabled mailboxes that are on Litigation Hold
Disabled mailboxes on Litigation Hold that are preserved for eDiscovery purposes cannot be moved by changing their **PreferredDataLocation** value in their disabled state. To move a disabled mailbox on litigation hold:

1. Temporarily assign a license to the mailbox.

2. Change the **PreferredDataLocation**.

3. Remove the license from the mailbox after it has been moved to the selected geo location to put it back into the disabled state.

## Create new cloud mailboxes in a specific geo location
To create a new mailbox in a specific geo location, you need to do either of these steps:

- Configure the **PreferredDataLocation** value as described in the previous section *before* the mailbox is created in Exchange Online. For example, configure the **PreferredDataLocation** value on a user before assigning a license. 

- Assign a license at the same time you set the **PreferredDataLocation** value.

To create a new cloud-only licensed user (not AAD Connect synchronized) in a specific Geo, use the following syntax in Azure AD PowerShell:

```
New-MsolUser -UserPrincipalName <UserPrincipalName> -DisplayName "<Display Name>" [-FirstName <FirstName>] [-LastName <LastName>] [-Password <Password>] [-LicenseAssignment <AccountSkuId>] -PreferredDataLocation <GeoCode> 
```
This example create a new user account for Elizabeth Brunner with the following values:

- User principal name: ebrunner@contoso.onmicrosoft.com

- First name: Elizabeth

- Last name: Brunner

- Display name Elizabeth Brunner

- Password: randomly-generated and shown in the results of the command (because we're not using the *Password* parameter)

- License: contoso:ENTERPRISEPREMIUM (E5)

- Location: Australia (AUS)

```
New-MsolUser -UserPrincipalName ebrunner@contoso.onmicrosoft.com -DisplayName "Elizabeth Brunner" -FirstName Elizabeth -LastName Brunner -LicenseAssignment contoso:ENTERPRISEPREMIUM -PreferredDataLocation AUS
```

For more information about creating new user accounts and finding LicenseAssignment values in Azure AD PowerShell, see [Create user accounts with Office 365 PowerShell](https://docs.microsoft.com/office365/enterprise/powershell/create-user-accounts-with-office-365-powershell) and [View licenses and services with Office 365 PowerShell](https://docs.microsoft.com/office365/enterprise/powershell/view-licenses-and-services-with-office-365-powershell).

> **Note:**
> If you are using Exchange Online PowerShell to enable a mailbox and need the mailbox to be created directly in the Geo that's specified in **PreferredDataLocation**, you need to use an Exchange Online cmdlet such as **Enable-Mailbox** or **New-Mailbox** directly against the cloud service. If you use the **Enable-RemoteMailbox** on-premises Exchange cmdlet, the mailbox will be created in the central location.

## Onboard existing on-premises mailboxes in a specific geo location
You can use the standard onboarding tools and processes to migrate a mailbox from an on-premises Exchange organization to Exchange Online, including the [Migration dashboard in the EAC](https://support.office.com/article/d164b35c-f624-4f83-ac58-b7cae96ab331), and the [New-MigrationBatch](https://docs.microsoft.com/powershell/module/exchange/move-and-migration/new-migrationbatch) cmdlet in Exchange Online PowerShell.

The first step is to verify a user object exists for each mailbox to be onboarded, and verify the correct **PreferredDataLocation** value is configured in Azure AD. The onboarding tools will respect the **PreferredDataLocation** value and will migrate the mailboxes directly to the specified Geo.

Or, you can use the following steps to onboard mailboxes directly in a specific geo location using the [New-MoveRequest](https://docs.microsoft.com/powershell/module/exchange/move-and-migration/new-moverequest) cmdlet in Exchange Online PowerShell.

1. Verify the user object exists for each mailbox to be onboarded and that **PreferredDataLocation** is set to the desired value in Azure AD. The value of **PreferredDataLocation** will be synchronized to the **MailboxRegion** attribute of the corresponding mail user object in Exchange Online.

2. Connect directly to the specific satellite Geo using the connection instructions from earlier in this topic.

3. In Exchange Online PowerShell, store the on-premises administrator credentials that's used to perform a mailbox migration in a variable by running the following command:

    ```
    $RC = Get-Credential
    ```

4. In Exchange Online PowerShell, create a new **New-MoveRequest** similar to the following example: 

    ```
    New-MoveRequest -Remote -RemoteHostName mail.contoso.com -RemoteCredential $RC -Identity user@contoso.com -TargetDeliveryDomain <YourAppropriateDomain>
    ```

5. Repeat step #4 for every mailbox you need to migrate from on-premises Exchange to the satellite location you are currently connected to.

6. If you need to migrate additional mailboxes to a different satellite location, repeat steps 2 through 4 for each specific satellite location.

## Multi-geo reporting
**Multi-Geo Usage Reports** in the Microsoft 365 admin center displays the user count by geo location. The report displays user distribution for the current month and provides historical data for the past 6 months.

## See also

[Managing Office 365 and Exchange Online with Windows PowerShell](https://support.office.com//article/06a743bb-ceb6-49a9-a61d-db4ffdf54fa6)