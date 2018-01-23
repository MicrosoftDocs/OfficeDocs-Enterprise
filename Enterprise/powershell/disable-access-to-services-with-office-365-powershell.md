---
title: "Disable access to services with Office 365 PowerShell"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 12/15/2017
ms.audience: Admin
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom:
- Ent_Office_Other
- PowerShell
- LIL_Placement
ms.assetid: 264f4f0d-e2cd-44da-a9d9-23bef250a720

description: "Explains how to use Office 365 PowerShell to add or remove access to Office 365 services for users in your organization."
---

# Disable access to services with Office 365 PowerShell

**Summary:** Explains how to use Office 365 PowerShell to add or remove access to Office 365 services for users in your organization.
  
When an Office 365 account is assigned a license from a licensing plan, Office 365 services are made available to the user from that license. However, you can control the Office 365 services that the user can access. For example, even though the license allows access to SharePoint Online, you can disable access to it. In fact, you can use Office 365 PowerShell to disable access to any number of services for:
- An individual account.
    
- A group of accounts.
    
- All accounts in your organization.
    
 **Contents:**[The short version (instructions without explanations)](disable-access-to-services-with-office-365-powershell.md#ShortVersion)[The long version (instructions with detailed explanations)](disable-access-to-services-with-office-365-powershell.md#LongVersion)[See also](disable-access-to-services-with-office-365-powershell.md#SeeAlso)
## Before you begin
<a name="RTT"> </a>

- The procedures in this topic require you to connect to Office 365 PowerShell. For instructions, see [Connect to Office 365 PowerShell](connect-to-office-365-powershell.md).
    
- You use the **Get-MsolAccountSku** cmdlet to view your available licensing plans, and the Office 365 services that are available in those plans. For more information, see[View licenses and services with Office 365 PowerShell](view-licenses-and-services-with-office-365-powershell.md).
    
- To see the before and after results of the procedures in this topic, see [View account license and service details with Office 365 PowerShell](view-account-license-and-service-details-with-office-365-powershell.md).
    
- A PowerShell script is available that automates the procedures described in this topic. Specifically, the script allows you to view and disable services in your Office 365 organization, including Sway. For more information, see [Disable access to Sway with Office 365 PowerShell](disable-access-to-sway-with-office-365-powershell.md).
    
- If you use the **Get-MsolUser** cmdlet without using the _All_ parameter, only the first 500 accounts are returned.
    
## The short version (instructions without explanations)
<a name="ShortVersion"> </a>

This section presents the procedures without fanfare or superfluous explanation. If you have questions or want more information, you can read rest of the topic.
  
To disable Office 365 services for users from a single licensing plan, perform the following steps:
  
1. Identify the undesirable services in the licensing plan by using the following syntax:
    
  ```
  $LO = New-MsolLicenseOptions -AccountSkuId <AccountSkuId> -DisabledPlans "<UndesirableService1>", "<UndesirableService2>"...
  ```

    This example creates a **LicenseOptions** object that disables the Office Online and SharePoint Online services in the licensing plan named `litwareinc:ENTERPRISEPACK` (Office 365 Enterprise E3).
    
  ```
  $LO = New-MsolLicenseOptions -AccountSkuId "litwareinc:ENTERPRISEPACK" -DisabledPlans "SHAREPOINTWAC", "SHAREPOINTENTERPRISE"
  ```

2. Use the **LicenseOptions** object from Step 1 on one or more users.
    
  - To create a new account that has the services disabled, use the following syntax:
    
  ```
  New-MsolUser -UserPrincipalName <Account> -DisplayName <DisplayName> -FirstName <FirstName> -LastName <LastName> -LicenseAssignment <AccountSkuId> -LicenseOptions $LO -UsageLocation <CountryCode>
  ```

    This example creates a new account for Allie Bellew that assigns the license and disables the services described in Step 1.
    
  ```
  New-MsolUser -UserPrincipalName allieb@litwareinc.com -DisplayName "Allie Bellew" -FirstName Allie -LastName Bellew -LicenseAssignment litwareinc:ENTERPRISEPACK -LicenseOptions $LO -UsageLocation US
  ```

    For more information about creating user accounts in Office 365 PowerShell, see [Create user accounts with Office 365 PowerShell](create-user-accounts-with-office-365-powershell.md).
    
  - To disable the services for an existing licensed user, use the following syntax:
    
  ```
  Set-MsolUserLicense -UserPrincipalName <Account> -LicenseOptions $LO
  ```

    This example disables the services for the user BelindaN@litwareinc.com.
    
  ```
  Set-MsolUserLicense -UserPrincipalName belindan@litwareinc.com -LicenseOptions $LO
  ```

  - To disable the services described in Step 1 for all existing licensed users, specify the name of your Office 365 plan from the display of the **Get-MsolAccountSku** cmdlet (such as **litwareinc:ENTERPRISEPACK** ), and then run the following commands:
    
  ```
  $acctSKU="<AccountSkuId>"
$AllLicensed = Get-MsolUser -All | Where {$_.isLicensed -eq $true -and $_.licenses[0].AccountSku.SkuPartNumber -eq ($acctSKU).Substring($acctSKU.IndexOf(":")+1, $acctSKU.Length-$acctSKU.IndexOf(":")-1)}
$AllLicensed | ForEach {Set-MsolUserLicense -LicenseOptions $LO}
  ```

  - To disable the services for a group of existing users, use either of the following methods to identify the users:
    
  - **Filter the accounts based on an existing account attribute** To do this, use the following syntax:
    
  ```
  $x = Get-MsolUser -All <FilterableAttributes>
$x | ForEach {Set-MsolUserLicense -UserPrincipalName $_.UserPrincipalName -LicenseOptions $LO}
  ```

    This example disables the services for users in the Sales department in the United States.
    
  ```
  $USSales = Get-MsolUser -All -Department "Sales" -UsageLocation "US"
$USSales | ForEach {Set-MsolUserLicense -UserPrincipalName $_.UserPrincipalName -LicenseOptions $LO}
  ```

  - **Use a list of specific accounts** To do this, perform the following steps:
    
1. Create a text file that contains one account on each line like this:
    
  ```
  akol@contoso.com
tjohnston@contoso.com
kakers@contoso.com
  ```

    In this example, the text file is C:\\My Documents\\Accounts.txt.
    
2. Run the following command:
    
  ```
  Get-Content "C:\\My Documents\\Accounts.txt" | foreach {Set-MsolUserLicense -UserPrincipalName $_ -LicenseOptions $LO}
  ```

To disable Office 365 services for users while you are assigning them to a licensing plan, see [Disable access to services while assigning user licenses](disable-access-to-services-while-assigning-user-licenses.md).
  
To disable Office 365 services for users in all available licensing plans, perform the following steps:
  
1. Copy and paste this script into Notepad.
    
  ```
  $AllLicensingPlans = Get-MsolAccountSku
for($i = 0; $i -lt $AllLicensingPlans.Count; $i++)
{
    $O365Licences = New-MsolLicenseOptions -AccountSkuId $AllLicensingPlans[$i].AccountSkuId -DisabledPlans "<UndesirableService1>", "<UndesirableService2>"...
    Set-MsolUserLicense -UserPrincipalName <Account> -LicenseOptions $O365Licences
}
  ```

2. Customize the following values for your environment:
    
  -  _<UndesirableService>_ In this example, we'll use Office Online and SharePoint Online.
    
  -  _<Account>_ In this example, we'll use belindan@litwareinc.com.
    
    The customized script looks like this:
    
  ```
  $AllLicensingPlans = Get-MsolAccountSku
for($i = 0; $i -lt $AllLicensingPlans.Count; $i++)
{
    $O365Licences = New-MsolLicenseOptions -AccountSkuId $AllLicensingPlans[$i].AccountSkuId -DisabledPlans "SHAREPOINTWAC", "SHAREPOINTENTERPRISE"
    Set-MsolUserLicense -UserPrincipalName belindan@litwareinc.com -LicenseOptions $O365Licences
}
  ```

3. Save the script as  `RemoveO365Services.ps1` in a location that's easy for you to find. For this example, we'll save the file in " `C:\\O365 Scripts`".
    
4. Run the script in Office 365 PowerShell by using the following command.
    
  ```
  &amp; "C:\\O365 Scripts\\RemoveO365Services.ps1"
  ```

> [!NOTE]
> To reverse the effects of any of these procedures (that is, to re-enable the disabled services), run the procedure again, but use the value  `$null` for the _DisabledPlans_ parameter.
  
[Return to top](disable-access-to-services-with-office-365-powershell.md#RTT)
  
## The long version (instructions with detailed explanations)
<a name="LongVersion"> </a>

By default, all services are enabled when you issue a license by using Office 365 PowerShell. And often that's a good thing: that means that you can quickly and easily assign licenses to users without having to specify that each and every service be enabled along the way.
  
Having said that, however, it's also true that you might want to restrict the services available some of your users; for example, maybe some users should have access to Office Professional Plus, Skype for Business Online, and Exchange Online, but those same users shouldn't have access to SharePoint Online or to Office Online. Can you restrict accounts in that fashion? As it turns out, you can. To help explain how this works, let's take a two-step approach to tackling this problem:
  
1. Assign the user an Office 365 license that automatically enables all the services.
    
2. Run a pair of Office 365 PowerShell commands that disable specified services for that user.
    
We've already taken care of step 1: our user (Belinda Newman) has an Office 365 license that provides her with access to all the Office 365 services. However, we want to modify Belinda's account so that she doesn't have access to SharePoint Online ( `SHAREPOINTENTERPRISE`) or to Office Online ( `SHAREPOINTWAC`). But how are we supposed to do that?
  
Here's how. To begin with, we're going to use the **New-MsolLicenseOptions** cmdlet to create a **LicenseOption** object that contains the services that we want disabled. In Belinda's case, we want to disable `SHAREPOINTENTERPRISE` and `SHAREPOINTWAC`, so we use this command:
  
```
$x = New-MsolLicenseOptions -AccountSkuId "litwareinc:ENTERPRISEPACK" -DisabledPlans "SHAREPOINTWAC", "SHAREPOINTENTERPRISE"
```

See how that works? You specify the licensing plan ( `litwareinc:ENTERPRISEPACK`) and then indicate each of the services that you want disabled, separating those services by using commas.
  
> [!NOTE]
> Make sure you store your new **LicenseOption** object in a variable. In the preceding example, we used `$x`, although you can use any valid Windows PowerShell variable name. 
  
At this point we can use the following command to disable Belinda's access to the two services:
  
```
Set-MsolUserLicense -UserPrincipalName BelindaN@litwareinc.com -LicenseOptions $x
```

Nothing too fancy here, either: we just call the **Set-MsolUserLicense** cmdlet and include the _LicenseOptions_ parameter, along with the variable ( `$x`) containing the plans we want to disable. And what do we see now if we take a peek at Belinda's license information by running the command:  `(Get-MsolUser -UserPrincipalName belindan@litwareinc.com).Licenses.ServiceStatus`? We see this:
  
```
ServicePlan                              ProvisioningStatus
-----------                              ------------------
SWAY                                     Success
INTUNE_O365                              Success
YAMMER_ENTERPRISE                        PendingInput
RMS_S_ENTERPRISE                         Success
OFFICESUBSCRIPTION                       Success
MCOSTANDARD                              Success
SHAREPOINTWAC                            Disabled
SHAREPOINTENTERPRISE                     Disabled
EXCHANGE_S_ENTERPRISE                    Success
```

Pretty cool, huh? And, of course, we could do this same thing to multiple users if we wanted to. For example, these commands disable the same two services for all our licensed users. Specify the name of your Office 365 plan from the display of the **Get-MsolAccountSku** cmdlet (such as **litwareinc:ENTERPRISEPACK** ), and then run them.
  
```
$acctSKU="<AccountSKU ID>"
Get-MsolUser | Where {$_.licenses[0].AccountSku.SkuPartNumber -eq ($acctSKU).Substring($acctSKU.IndexOf(":")+1, $acctSKU.Length-$acctSKU.IndexOf(":")-1) -and $_.IsLicensed -eq $True} | Set-MsolUserLicense -LicenseOptions $x
```

Keep in mind that Belinda still has a valid Office 365 license; it's just that now she has access to fewer services. Before we disabled the two services, Belinda had access to newsfeeds, OneDrive, and SharePoint Online sites:
  
![User with SharePoint access.](images/o365_powershell_with_sharepoint.png)
  
Now those options are no longer available to her:
  
![User without SharePoint access.](images/o365_powershell_without_sharepoint.png)
  
Which is exactly what we hoped would happen.
  
And what if we change our mind later on: is it possible to re-enable these services? You bet it is. To re-enable all the services for a user, just use this command to create the following **LicenseOption** object:
  
```
$x = New-MsolLicenseOptions -AccountSkuId "litwareinc:ENTERPRISEPACK" -DisabledPlans $null
```

What does that command do? To begin with, the Windows PowerShell constant  `$null` means "nothing." (Or, in slightly-more technical language, it means a "null value.") As you recall, when we use the **New-MsolLicenseOptions** cmdlet we have to indicate the services that we want disabled. In this case, we don't want any of the services to be disabled. That might lead you to believe that we could use a command like the following, a command where we don't specify a value for the _DisabledPlans_ parameter:
  
```
$x = New-MsolLicenseOptions -AccountSkuId "litwareinc:ENTERPRISEPACK" -DisabledPlans ""
```

However, that won't work. Instead, it generates an error message:
  
 `Set-MsolUserLicense : Cannot bind parameter 'LicenseOptions'. Cannot convert the "" value of type "System.String" to type "Microsoft.Online.Administration.LicenseOption".`
  
Fortunately for us, setting the parameter value to  `$null` does work:
  
```
$x = New-MsolLicenseOptions -AccountSkuId "litwareinc:ENTERPRISEPACK" -DisabledPlans $null
```

This simply means that, when we run the **Set-MsolUserLicense** cmdlet, we're telling **Set-MsolUserLicense** that we don't want Belinda to have any disabled services:
  
```
Set-MsolUserLicense -UserPrincipalName BelindaN@litwareinc.com -LicenseOptions $x
```

And, logically enough, if none of the services are disabled that must mean that all of the services are enabled.
  
Now that you understand how this all works, let's show you how you can issue a license and disable specified services, and all with the same command. That sounds pretty impressive, but, to be honest, there's really nothing to it: you just include both the  _AddLicenses_ and the _LicenseOptions_ parameters in the same command. In other words, you first create your **LicenseOption** object:
  
```
$x = New-MsolLicenseOptions -AccountSkuId "litwareinc:ENTERPRISEPACK" -DisabledPlans "SHAREPOINTWAC", "SHAREPOINTENTERPRISE"
```

And then, as noted previously, you use both the  _AddLicenses_ and the _LicenseOptions_ parameters in your command:
  
```
Set-MsolUserLicense -UserPrincipalName BelindaN@litwareinc.com -AddLicenses "litwareinc:ENTERPRISEPACK" -LicenseOptions $x
```

That command will issue Belinda Newman a new license, but a license in which Skype for Business Online ( `SHAREPOINTWAC`) and SharePoint Online ( `SHAREPOINTENTERPRISE`) are both disabled.
  
[Return to top](disable-access-to-services-with-office-365-powershell.md#RTT)
  
## New to Office 365?
<a name="LongVersion"> </a>

[!INCLUDE [LinkedIn Learning Info](../common/office/linkedin-learning-info.md)]
   
## See also
<a name="SeeAlso"> </a>

See the following additional topics about managing users with Office 365 PowerShell:
  
- [Delete and restore user accounts with Office 365 PowerShell](delete-and-restore-user-accounts-with-office-365-powershell.md)
    
- [Delete and restore user accounts with Office 365 PowerShell](delete-and-restore-user-accounts-with-office-365-powershell.md)
    
- [Block user accounts with Office 365 PowerShell](block-user-accounts-with-office-365-powershell.md)
    
- [Assign licenses to user accounts with Office 365 PowerShell](assign-licenses-to-user-accounts-with-office-365-powershell.md)
    
- [Create user accounts with Office 365 PowerShell](create-user-accounts-with-office-365-powershell.md)
    
For more information about the cmdlets that are used in these procedures, see the following topics:
  
- [Get-Content](https://go.microsoft.com/fwlink/p/?LinkId=289917)
    
- [Get-MsolAccountSku](https://go.microsoft.com/fwlink/p/?LinkId=691549)
    
- [New-MsolLicenseOptions](https://go.microsoft.com/fwlink/p/?LinkId=691546)
    
- [Get-MsolUser](https://go.microsoft.com/fwlink/p/?LinkId=691543)
    
- [New-MsolUser](https://go.microsoft.com/fwlink/p/?LinkId=691547)
    
- [Set-MsolUserLicense](https://go.microsoft.com/fwlink/p/?LinkId=691548)
    
- [ForEach-Object](https://go.microsoft.com/fwlink/p/?LinkId=113300)
    
- [Where-Object](https://go.microsoft.com/fwlink/p/?LinkId=113423)
    
[Return to top](disable-access-to-services-with-office-365-powershell.md#RTT)
  

