---
title: "Assign licenses to user accounts with Office 365 PowerShell"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 10/5/2017
ms.audience: Admin
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom:
- Ent_Office_Other
- LIL_Placement
- DecEntMigration
- PowerShell
- O365ITProTrain
ms.assetid: ba235f4f-e640-4360-81ea-04507a3a70be

description: "Explains how to use Office 365 PowerShell assign an Office 365 license to unlicensed users."
---

# Assign licenses to user accounts with Office 365 PowerShell
[]
Explains how to use Office 365 PowerShell assign an Office 365 license to unlicensed users.
  
Licensing user accounts in Office 365 is important, because users can't use any Office 365 services until their account has been licensed. You can use Office 365 PowerShell to efficiently assign licenses to unlicensed accounts, especially multiple accounts. **Contents:**[The short version (instructions without explanations)](assign-licenses-to-user-accounts-with-office-365-powershell.md#ShortVersion)[The long version (instructions with detailed explanations)](assign-licenses-to-user-accounts-with-office-365-powershell.md#LongVersion)[See also](assign-licenses-to-user-accounts-with-office-365-powershell.md#SeeAlso)
## Before you begin
<a name="RTT"> </a>

- The procedures in this topic require you to connect to Office 365 PowerShell. For instructions, see [Connect to Office 365 PowerShell](connect-to-office-365-powershell.md).
    
- Use the **Get-MsolAccountSku** cmdlet to view the available licensing plans and the number of available licenses in each plan in your organization. The number of available licenses in each plan is **ActiveUnits** - **WarningUnits** - **ConsumedUnits**. For more information about licensing plans, licenses, and services, see[View licenses and services with Office 365 PowerShell](view-licenses-and-services-with-office-365-powershell.md).
    
- To find the unlicensed accounts in your organization, run the command  `Get-MsolUser -All -UnlicensedUsersOnly`
    
- You can assign licenses only to user accounts that have the **UsageLocation** property set to a valid ISO 3166-1 alpha-2 country code. For example, US for the United States, and FR for France. Some Office 365 services aren't available in certain countries. For more information, see[About license restrictions](https://go.microsoft.com/fwlink/p/?LinkId=691730).
    
    To find accounts that don't have a **UsageLocation** value, run the command `Get-MsolUser -All | where {$_.UsageLocation -eq $null}`. To set the **UsageLocation** value on an account, use the syntax `Set-MsolUser -UserPrincipalName "<Account>" -UsageLocation <CountryCode>`. For example,  `Set-MsolUser -UserPrincipalName "belindan@litwareinc.com" -UsageLocation US`.
    
- If you use the **Get-MsolUser** cmdlet without using the _All_ parameter, only the first 500 accounts are returned.
    
## The short version (instructions without explanations)
<a name="ShortVersion"> </a>

This section presents the procedures without fanfare or superfluous explanation. If you have questions or want more information, you can read rest of the topic.
  
To assign a license to a user, use the following syntax in Office 365 PowerShell:
  
```
Set-MsolUserLicense -UserPrincipalName "<Account>" -AddLicenses "<AccountSkuId>"
```

This example assigns a license from the  `litwareinc:ENTERPRISEPACK` (Office 365 Enterprise E3) licensing plan to the unlicensed user `belindan@litwareinc.com`.
  
```
Set-MsolUserLicense -UserPrincipalName "belindan@litwareinc.com" -AddLicenses "litwareinc:ENTERPRISEPACK"
```

To assign a license to many unlicensed users, use the following syntax:
  
```
$x = Get-MsolUser -All -UnlicensedUsersOnly [<FilterableAttributes>]; $x | foreach {Set-MsolUserLicense -AddLicenses "<AccountSkuId>"}
```

 **Notes**
  
- You can't assign multiple licenses to a user from the same licensing plan.
    
- If you don't have enough available licenses, the licenses are assigned to users in the order that they're returned by the **Get-MsolUser** cmdlet until the available licenses run out.
    
This example assigns licenses from the  `litwareinc:ENTERPRISEPACK` (Office 365 Enterprise E3) licensing plan to all unlicensed users.
  
```
$AllUn = Get-MsolUser -All -UnlicensedUsersOnly; $AllUn | foreach {Set-MsolUserLicense -AddLicenses "litwareinc:ENTERPRISEPACK"}
```

This example assigns those same licenses to unlicensed users in the Sales department in the United States.
  
```
$USSales = Get-MsolUser -All -Department "Sales" -UsageLocation "US" -UnlicensedUsersOnly; $USSales | foreach {Set-MsolUserLicense -AddLicenses "litwareinc:ENTERPRISEPACK"}
```

[Return to top](assign-licenses-to-user-accounts-with-office-365-powershell.md#RTT)
  
## The long version (instructions with detailed explanations)
<a name="LongVersion"> </a>

As noted in the article [View licensed and unlicensed users with Office 365 PowerShell](view-licensed-and-unlicensed-users-with-office-365-powershell.md), it's possible to have users who have valid Office 365 user accounts, but who have not been issued an Office 365 license. That means that, valid account or no valid account, those users will not be able to log on to Office 365. And if you can't log on, you can't take advantage of any Office 365 services.
  
The aforementioned article also noted that we can return a list of unlicensed user accounts by running this command:
  
```
Get-MsolUser -All -UnlicensedUsersOnly
```

That command returns information about any users who are not currently licensed for Office 365:
  
```
UserPrincipalName           DisplayName                     isLicensed
-----------------           -----------                     ----------
BelindaN@litwareinc.com     Belinda Newman                  False
```

As you can see, we have one unlicensed user: Belinda Newman. So how do we go about assigning Belinda an Office 365 license?
  
For starters, we're going to run the **Get-MsolAccountSku** cmdlet discussed in the article[View licenses and services with Office 365 PowerShell](view-licenses-and-services-with-office-365-powershell.md):
  
```
Get-MsolAccountSku
```

That command returns data similar to this:
  
```
AccountSkuId               ActiveUnits    WarningUnits   ConsumedUnits
------------               -----------    ------------   -------------
litwareinc:ENTERPRISEPACK  25             0              24
```

Why did we run **Get-MsolAccountSku** ? ("Sku," in case you're wondering, is short for "stock-keeping unit." For our purposes, that's just business-speak for "product.") There are two reasons why we ran **Get-MsolAccountSku**. First, we need to make sure we actually have a license to assign Belinda. Do we have any licenses we can assign her? To determine that, we take the value of **ActiveUnits** property (25) and subtract the values of the **WarningUnits** (0) and **ConsumedUnits** (24) properties:
  
 `25 - 0 - 24 = 1`
  
The **ActiveUnits** property tells us how many licenses we've purchased, and the combined value of **WarningUnits** and **ConsumedUnits** tells us how many licenses are currently in use. If we subtract the number of licenses already spoken for from the number of licenses we purchased, we'll know how many licenses are still available. As luck would have it, we have one license available for distribution:
  
 `25 - 0 - 24 = 1`
  
Second, in order to assign Belinda a new license we need to know the name of our licensing plan (that is, we need to know the **AccountSkuId** ). In this case, that's easy: we only have a single licensing plan ( `litwareinc:ENTERPRISEPACK`). Note, however, that it's possible for an organization to have multiple licensing plans. In that case, **Get-MsolAccountSku** would return two different **AccountSkuIds**, and you would need to pick the appropriate licensing plan when assigning licenses. For now, though, we're going to stick with the simplest case, and assume we have just one licensing plan.
  
So then how  *do*  we assign Belinda Newman a new license? Like this:
  
```
Set-MsolUserLicense -UserPrincipalName "BelindaN@litwareinc.com" -AddLicenses "litwareinc:ENTERPRISEPACK"
```

That's also you have to do: just call the **Set-MsolUserLicense** cmdlet, making sure that you specify the _UserPrincipalName_ parameter for the user and the appropriate licensing plan.
  
When **Set-MsolUserLicense** finishes running, you'll see something similar to this onscreen:
  
 `PS C:\\windows\\system32>`
  
In other words, it won't look like anything has happened. To verify that the user has been assigned a license, run a command like the following:
  
```
Get-MsolUser -UserPrincipalName "BelindaN@litwareinc.com"
```

If everything worked as expected, you should see that Belinda's isLicensed property is now set to True:
  
```
UserPrincipalName           DisplayName                     isLicensed
-----------------           -----------                     ----------
BelindaN@litwareinc.com     Belinda Newman                  True
```

> [!SECURITY NOTE]
> Good question: what if you made a mistake and tried to assign a license to a user who already has a license? Will you end up giving two licenses to a single user? > The quick answer? No; Office 365 won't let you assign more than one license to the same user. (Well, more than one license from the same licensing plan, that is.) If you try to do that your command will fail with the following error message: >  `Set-MsolUserLicense : Unable to assign this license because it is invalid. Use the Get-MsolAccountSku cmdlet to retrieve a list of valid licenses.`> Admittedly, that error message is a tiny bit misleading: the license isn't really invalid, it's just being assigned to a user who already  *has*  a license. But, error message aside, the important thing is that one user won't end up with multiple licenses.
  
As you've just seen, it's very easy to use Office 365 PowerShell to assign a single license to a single user. And that leads to an obvious question: wouldn't it be just as easy, maybe even easier, to use the Office 365 admin center to assign a single license to a single user? Well, maybe; that depends, in part, on whether you're more comfortable using Windows PowerShell or more comfortable using the Office 365 admin center. Where Windows PowerShell really shines, however, is when you need to assign multiple licenses to multiple users. For example, this command assigns an Office 365 license to any of your users that don't already have a license:
  
```
Get-MsolUser -All -UnlicensedUsersOnly | Set-MsolUserLicense -AddLicenses "litwareinc:ENTERPRISEPACK"
```

In the preceding command, we use **Get-MsolUser** and the _UnlicensedUsersOnly_ parameter to return a collection of all the unlicensed user accounts. We then pass that collection to the **Set-MsolUserLicense** cmdlet; in turn, **Set-MsolUserLicense** assigns a license (taken from the `litwareinc:ENTERPRISEPACK` licensing plan) to each user in the collection.
  
Ah, but what if you have 5 unlicensed users but only one available license? In that case **Set-MsolUserLicense** will give the available license to the first user returned by **Get-MsolUser**. **Set-MsolUserLicense** will then dutifully try to assign a license to the other four users, but all four of those attempts will fail along with the following error message:
  
 `Set-MsolUserLicense : Unable to assign this license because the number of allowed licenses have been assigned.`
  
In other words, Set-MsolUserLicense won't just fail. Instead, it will assign as many licenses as it can. Only then will it fail.
  
Let's try another example. Maybe you'd like to assign a license to all the users in the Sales department. No problem:
  
```
Get-MsolUser -All -Department "Sales" | Set-MsolUserLicense -AddLicenses "litwareinc:ENTERPRISEPACK"
```

Or, if you want to get really fancy, and if you want to keep error messages and computing processing to a minimum, just assigned a license to unlicensed users from the Sales department:
  
```
Get-MsolUser -All -Department "Sales" -UnlicensedUsersOnly | Set-MsolUserLicense -AddLicenses "litwareinc:ENTERPRISEPACK"
```

After all, there's no point trying to license users who already have a license. As we've already seen, that won't work.
  
Here's another example. Maybe you'd like to license all the US users who don't currently have an Office 365 license. In that case:
  
```
Get-MsolUser -All -UsageLocation "US" -UnlicensedUsersOnly | Set-MsolUserLicense -AddLicenses "litwareinc:ENTERPRISEPACK"
```

And so on and so on.
  
> [!NOTE]
> How long does it take to run a command that, say, issues licenses to all your unlicensed users? That's difficult to say: it depends on everything from the number of users you have to the speed of your network connection. If you have a couple hundred users to license this will go reasonably quickly (that is, it shouldn't take more than a minute or two). If you have 10,000 users to license it will obviously take a little longer. But nowhere near as long as it would take to assign licenses to 10,000 users by using the Office 365 admin center. 
  
As long as we're on the subject, here's something you need to watch out for when assigning licenses: if a user does not have a value configured for the **UsageLocation** property you won't be able to assign that user an Office 365 license. Instead, you'll get an error message similar to this:
  
 `Set-MsolUserLicense : You must provide a required property: Parameter name: UsageLocation`
  
In somewhat-roundabout fashion, this error message tells us that the user in question has not been assigned a **UsageLocation**. As you might have guessed, the **UsageLocation** property (which indicates the region or country where the user typically uses Office 365) is extremely important. Why? That's because the services available to a user depend not only on the licensing pack that you purchased but also on where the user lives: due to local rules and regulations, some services might not be available to some users. If a user doesn't have a **UsageLocation**, Office 365 has no way of knowing which services can legally be exposed to that user. Therefore, Office 365 can't offer any services to that user, at least not until the **UsageLocation** has been specified.
  
> [!NOTE]
> When you configure a user account you'll know immediately if there are any license restrictions associated with the specified part of the world. For example, if you change the **UsageLocation** for a licensed user to Iran ( `IR`), the command will fail with this error message: >  `Set-MsolUser : Unable to update license for this user. One or more of the assigned service plans is not available in this user's country. Prohibited Service Plans: EXCHANGE_S_ENTERPRISE, SHAREPOINTENTERPRISE, SHAREPOINTWAC, MCOSTANDARD, OFFICESUBSCRIPTION, RMS_S_ENTERPRISE. Specific service plans can be disabled for a user by using the licenseoptions parameter.`> That's because Office 365 is not currently available to users in Iran. For more information, see [About license restrictions](https://go.microsoft.com/fwlink/p/?LinkId=691730). > Incidentally, Office 365 uses the two-letter country codes produced by the International Organization for Standardization (ISO). You can find those codes on the [ISO web site](https://go.microsoft.com/fwlink/p/?LinkId=84073). 
  
If you want to verify that a given user has a **UsageLocation** you can use a command similar to this one:
  
```
Get-MsolUser -UserPrincipalName "BelindaN@litwareinc.com" | Select-Object UsageLocation
```

Alternatively, you can return a list of all the users who don't have a **UsageLocation** by using this command:
  
```
Get-MsolUser -All | Where-Object {$_.UsageLocation -eq $null}
```

> [!NOTE]
> When you assign a license to a user that user will, by default, be given access to all the Office 365 services that your organization has access to. For example, if you purchased licenses for Office 365 Enterprise E3, your newly-licensed user will automatically be granted access to services like Exchange Online, Skype for Business Online, and SharePoint Online. If you would prefer to limit a user's access to those services (for example, you might want a user to have access to SharePoint Online but  *not*  to Exchange Online and Skype for Business Online) then see the article[Disable access to services with Office 365 PowerShell](disable-access-to-services-with-office-365-powershell.md). 
  
[Return to top](assign-licenses-to-user-accounts-with-office-365-powershell.md#RTT)
  
## New to Office 365?
<a name="LongVersion"> </a>

||
|:-----|
|![The short icon for LinkedIn Learning](images/d547e1cb-7c66-422b-85be-7e7db2a9cf97.png) **New to Office 365?**         Discover free video courses for **Office 365 admins and IT pros**, brought to you by LinkedIn Learning. |
   
## See also
<a name="SeeAlso"> </a>

See the following additional topics about managing users with Office 365 PowerShell:
  
- [Create user accounts with Office 365 PowerShell](create-user-accounts-with-office-365-powershell.md)
    
- [Delete and restore user accounts with Office 365 PowerShell](delete-and-restore-user-accounts-with-office-365-powershell.md)
    
- [Block user accounts with Office 365 PowerShell](block-user-accounts-with-office-365-powershell.md)
    
- [Remove licenses from user accounts with Office 365 PowerShell](remove-licenses-from-user-accounts-with-office-365-powershell.md)
    
For more information about the cmdlets that are used in these procedures, see the following topics:
  
- [Get-MsolAccountSku](https://go.microsoft.com/fwlink/p/?LinkId=691549)
    
- [Get-MsolUser](https://go.microsoft.com/fwlink/p/?LinkId=691543)
    
- [Set-MsolUserLicense](https://go.microsoft.com/fwlink/p/?LinkId=691548)
    
- [ForEach-Object](https://go.microsoft.com/fwlink/p/?LinkId=113300)
    
- [Select-Object](https://go.microsoft.com/fwlink/p/?LinkId=113387)
    
- [Where-Object](https://go.microsoft.com/fwlink/p/?LinkId=113423)
    

