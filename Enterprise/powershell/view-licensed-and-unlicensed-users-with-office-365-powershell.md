---
title: "View licensed and unlicensed users with Office 365 PowerShell"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 12/21/2016
ms.audience: Admin
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom:
- O365ITProTrain
- Ent_Office_Other
- DecEntMigration
- PowerShell
ms.assetid: e4ee53ed-ed36-4993-89f4-5bec11031435
description: "Explains how to use Office 365 PowerShell to view licensed and unlicensed user accounts."
---

# View licensed and unlicensed users with Office 365 PowerShell

Explains how to use Office 365 PowerShell to view licensed and unlicensed user accounts.
  
User accounts in your Office 365 organization may have some, all, or none of the available licenses assigned to them from the licensing plans that are available in your organization. You can use Office 365 PowerShell to quickly find the licensed and unlicensed users in your organization.
  
## Before you begin

- The procedures in this topic require you to connect to Office 365 PowerShell. For instructions, see [Connect to Office 365 PowerShell](connect-to-office-365-powershell.md).
    
- If you use the **Get-MsolUser** cmdlet without using the _-All_ parameter, only the first 500 accounts are returned.
    
## The short version (instructions without explanations)

This section presents the procedures without fanfare or superfluous explanation. If you have questions or want more information, you can read rest of the topic.
  
To view the list of all user accounts and their licensing status in your organization, run the following command in Office 365 PowerShell:
  
```
Get-MsolUser -All
```

To view the list of all unlicensed user accounts in your organization, run the following command:
  
```
Get-MsolUser -All -UnlicensedUsersOnly
```

To view the list of all licensed user accounts in your organization, run the following command:
  
```
Get-MsolUser -All | where {$_.isLicensed -eq $true}
```

## The long version (instructions with detailed explanations)

Office 365 user accounts and Office 365 licenses don't need to have a one-to-one correspondence: it's possible to have Office 365 users who do not have an Office 365 license, and it's possible to have Office 365 licenses that haven't been assigned to a user. (In fact, a single user account can even have  *multiple*  Office 365 licenses.) When you create a new Office 365 user account (see the article [License Office 365 users with Windows PowerShell](http://technet.microsoft.com/library/0ab9fcac-e5ea-4b5b-b72c-8c92c55565ac.aspx) for more information) you don't have to assign that user a license: the new user will have a valid account, but he or she won't be able to sign in to Office 365. If they try to sign in, they'll see something similar to this:
  
![User without a valid Office 365 license.](images/o365_powershell_no_license.png)
  
Likewise, you might have a user who will be taking some extended time off, perhaps for a sabbatical or for maternity/paternity leave. In a case like that, you could remove the user's license but leave the user account intact (that is, leave all its property values, such as address and phone number, as-is). By doing that, you can assign their license to someone else (like, say, a temporary worker filling in for the person on leave). When the user returns to work you can issue them a new license and they'll be able to resume working as if they'd never been gone.
  
Which simply means that, yes, you can have users who have accounts but who don't have licenses. Or vice-versa.
  
The article [View licenses and services with Office 365 PowerShell](view-licenses-and-services-with-office-365-powershell.md) explains how you can determine the number of Office 365 licenses your organization has purchased as well as how many of those licenses have been assigned to users. That's important information. Equally important, however is knowing which of your users have been assigned these licenses and which ones haven't. And this article will tell you how to do just that.
  
As you probably know, the **Get-MsolUser** cmdlet returns information about all your Office 365 user accounts. Need some quick info about all your Office 365 users? Then run this command in Office 365 PowerShell:
  
```
Get-MsolUser
```

In turn, Get-MsolUser returns data similar to this:
  
```
UserPrincipalName           DisplayName                     isLicensed
-----------------           -----------                     ----------
ZrinkaM@litwareinc.com      Zrinka Makovac                  True
BelindaN@litwareinc.com     Belinda Newman                  False
BonnieK@litwareinc.com      Bonnie Kearney                  True
FabriceC@litwareinc.com     Fabrice Canel                   True
AnneW@litwareinc.com        Anne Wallace                    True
AlexD@litwareinc.com        Alex Darrow                     True
```

As you can see, one of the property values returned is for the **isLicensed** property. If **isLicensed** is equal to `False` that means that the user doesn't have a license for Office 365. In other words, and if you wanted to, you could simply scroll through your list of users and pick out the ones where the **isLicensed** property is set to `False`.
  
At any rate, scrolling through a list of users trying to pick out the unlicensed users works as long as you have a relatively small number of users. If you have a large number of users, however, scrolling through that list will be, at best, extremely tedious. (And, depending on how Windows PowerShell has been configured, perhaps downright impossible. That's because there's a limit to the number of lines of output that can be displayed in the Windows PowerShell console at any one time.)
  
With that in mind, a much better way to list your unlicensed users is to run this command instead:
  
```
Get-MsolUser -UnlicensedUsersOnly
```

That command returns only those users who don't have a license for Office 365. In other words:
  
```
UserPrincipalName           DisplayName                     isLicensed
-----------------           -----------                     ----------
BelindaN@litwareinc.com     Belinda Newman                  False
```

As you can see we have one unlicensed user. And what is we only wanted a list of the  *licensed*  users? That's a tiny bit more complicated, but only the tiniest bit:
  
```
Get-MsolUser | Where-Object {$_.isLicensed -eq $true}
```

That command, which looks for all the user accounts where the **isLicensed** property is equal to `True`, returns information similar to this:
  
```
UserPrincipalName           DisplayName                     isLicensed
-----------------           -----------                     ----------
ZrinkaM@litwareinc.com      Zrinka Makovac                  True
BonnieK@litwareinc.com      Bonnie Kearney                  True
FabriceC@litwareinc.com     Fabrice Canel                   True
AnneW@litwareinc.com        Anne Wallace                    True
AlexD@litwareinc.com        Alex Darrow                     True
```

As you can see, information is not returned for Belinda Newman. Why not? You got it: because the **isLicensed** property for Belinda's account is not set to `True`.
  
## See also
<a name="SeeAlso"> </a>

For more information about the cmdlets that are used in these procedures, see the following topics:
  
- [Get-MsolUser](https://go.microsoft.com/fwlink/p/?LinkId=691547)
    
- [Where-Object](https://go.microsoft.com/fwlink/p/?LinkId=113423)
    

