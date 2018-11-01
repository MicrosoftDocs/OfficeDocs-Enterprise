---
title: "View user accounts with Office 365 PowerShell"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 10/08/2018
ms.audience: Admin
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: 
- LIL_Placement
- PowerShell
- Ent_Office_Other
ms.assetid: bb12f49d-a85d-4f3b-ada2-5c4e33977b10

description: "Summary: View, list, or display your user accounts in various ways with Office 365 PowerShell."
---

# View user accounts with Office 365 PowerShell

 **Summary:** View, list, or display your user accounts in various ways with Office 365 PowerShell.
  
Although you can use the Office 365 Admin center to view the accounts for your Office 365 tenant, you can also use Office 365 PowerShell and do some things that the Office 365 Admin center cannot.
  
## Before you begin

The procedures in this topic require you to connect to Office 365 PowerShell. For instructions, see [Connect to Office 365 PowerShell](connect-to-office-365-powershell.md).
  
## Display Office 365 user account information

To display the full list of user accounts, run this command in your Office 365 PowerShell command prompt or the PowerShell Integrated Script Environment (ISE).
  
```
Get-MsolUser
```

You should see information similar to this:
  
```
UserPrincipalName                     DisplayName           isLicensed
-----------------                     -----------           ----------
ZrinkaM@litwareinc.onmicrosoft.com    Zrinka Makovac        True
BonnieK@litwareinc.onmicrosoft.com    Bonnie Kearney        True
FabriceC@litwareinc.onmicrosoft.com   Fabrice Canel         True
BrianJ@litwareinc.onmicrosoft.com     Brian Johnson         False 
AnneWlitwareinc.onmicrosoft.com       Anne Wallace          True
ScottW@litwareinc.onmicrosoft.com     Scott Wallace         False
```

The **Get-MsolUser** cmdlet also has a set of parameters to filter the set of user accounts displayed. For example, for the list of unlicensed users (users who've been added to Office 365 but haven't yet been licensed to use any of the services), run this command.
  
```
Get-MsolUser -UnlicensedUsersOnly
```

You should see information similar to this:
  
```
UserPrincipalName                     DisplayName           isLicensed
-----------------                     -----------           ----------
BrianJ@litwareinc.onmicrosoft.com     Brian Johnson         False
ScottW@litwareinc.onmicrosoft.com     Scott Wallace         False
```

For more information about additional parameters to filter the display the set of user accounts displayed, see [Get-MsolUser](https://msdn.microsoft.com/library/azure/dn194133.aspx) .
  
To be more selective about the list of accounts to display, you can use the **Where-Object** cmdlet in combination with the **Get-MsolUser** cmdlet. To combine the two cmdlets, we use the "pipe" character "|", which tells Office 365 PowerShell to take the results of one command and send it to the next command. Here is an example command that displays only those user accounts that have an unspecified usage location:
  
```
Get-MsolUser | Where-Object {$_.UsageLocation -eq $Null}
```

This command instructs Office 365 PowerShell to:
  
- Get all of the information on the user accounts ( **Get-MsolUser** ) and send it to the next command ( **|** ).
    
- Find all of the user accounts that have an unspecified usage location ( **Where-Object {$\_.UsageLocation -eq $Null}** ). Inside the braces, the command instructs Office 365 PowerShell to only find the set of accounts in which the UsageLocation user account property ( **$\_.UsageLocation** ) is not specified ( **-eq $Null** ).
    
You should see information similar to this:
  
```
UserPrincipalName                     DisplayName           isLicensed
-----------------                     -----------           ----------
BrianJ@litwareinc.onmicrosoft.com     Brian Johnson         False 
ScottW@litwareinc.onmicrosoft.com     Scott Wallace         False

```

The **UsageLocation** property is only one of many properties associated with a user account. To see all of the properties for user accounts, use the **Select-Object** cmdlet and the wildcard character (*) to display them all for a specific user account. Here is an example:
  
```
Get-MsolUser -UserPrincipalName "BelindaN@litwareinc.onmicosoft.com" | Select-Object *
```

For example, from this list, **City** is the name of a user account property. This means you can use the following command to list all of the user accounts for users living in London:
  
```
Get-MsolUser | Where-Object {$_.City -eq "London"}
```

> [!TIP]
>  The syntax for the **Where-Object** cmdlet shown in these examples is **Where-Object {$\_.** [user account property name] [comparison operator] [value] **}**.>  [comparison operator] is **-eq** for equals, **-ne** for not equals, **-lt** for less than, **-gt** for greater than, and others>  [value] is typically a string (a sequence of letters, numbers, and other characters), a numerical value, or **$Null** for unspecified>  See [Where-Object](https://technet.microsoft.com/en-us/library/hh849715.aspx) for more information.
  
You can check the blocked status of a user account with the following command:
  
```
Get-MolUser -UserPrincipalName <UPN of user account> | Select DisplayName,BlockCredential
```

## Select the user account properties to display

The [Get-MsolUser](https://msdn.microsoft.com/library/azure/dn194133.aspx) cmdlet by default displays three properties of user accounts:
  
- UserPrincipalName
    
- DisplayName
    
- isLicensed
    
If you need additional properties, such as the department the user works for and the country/region where the user uses Office 365 services, you can run **Get-MsolUser** in combination with the **Select-Object** cmdlet to specify the list of user account properties. Here is an example:
  
```
Get-MsolUser | Select-Object DisplayName, Department, UsageLocation
```

This command instructs Office 365 PowerShell to:
  
- Get all of the information on the user accounts ( **Get-MsolUser** ) and send it to the next command ( **|** ).
    
- Display only the user account name, department, and usage location ( **Select-Object DisplayName, Department, UsageLocation** ).
    
You should see information similar to this:
  
```
DisplayName             Department                       UsageLocation
-----------             ----------                       -------------
Zrinka Makovac          Sales & Marketing                    US
Bonnie Kearney          Sales & Marketing                    US
Fabrice Canel           Legal                                US
Brian Johnson
Anne Wallace            Executive Management                 US
Alex Darrow             Sales & Marketing                    US
David Longmuir      Operations                               US
Scott Wallace            Operations
```

The **Select-Object** cmdlet lets you pick and choose the properties you want a command to display. To see all of the properties for user accounts, use the wildcard character (*) to display them all for a specific user account. Here is an example:
  
```
Get-MsolUser -UserPrincipalName "BelindaN@litwareinc.onmicosoft.com" | Select-Object *
```

To be more selective about the list of accounts to display, you can also use the **Where-Object** cmdlet. Here is an example command that displays only those user accounts that have an unspecified usage location:
  
```
Get-MsolUser | Where-Object {$_.UsageLocation -eq $Null} | Select-Object DisplayName, Department, UsageLocation
```

This command instructs Office 365 PowerShell to:
  
- Get all of the information on the user accounts ( **Get-MsolUser** ) and send it to the next command ( **|** ).
    
- Find all of the user accounts that have an unspecified usage location ( **Where-Object {$\_.UsageLocation -eq $Null}** ) and send the resulting information to the next command ( **|** ). Inside the braces, the command is instructing Office 365 PowerShell to only find the set of accounts in which the UsageLocation user account property ( **$\_.UsageLocation** ) is not specified ( **-eq $Null** ).
    
- Display only the user account name, department, and usage location ( **Select-Object DisplayName, Department, UsageLocation** ).
    
You should see information similar to this:
  
```
DisplayName              Department                      UsageLocation
-----------              ----------                      -------------
Brian Johnson 
Scott Wallace            Operations
```

If you are using directory synchronization to create and manage your Office 365 users, you can display which local account an Office 365 user has been projected from. The following assumes that Azure AD Connect has been configured to use the default source anchor of ObjectGUID (for more on configuring a source anchor, see [Azure AD Connect: Design concepts](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/plan-connect-design-concepts)) and assumes that the Active Directory module for powershell has been installed (see [RSAT tools](https://www.microsoft.com/en-gb/download/details.aspx?id=45520)):
```
(Get-ADUser [guid][system.convert]::frombase64string((Get-MsolUser -UserPrincipalName <UPN of user account>).ImmutableID)).Guid
```
## Use the Azure Active Directory V2 PowerShell module to display user accounts

To display properties for user accounts with the Azure Active Directory V2 PowerShell module, you use the [Get-AzureADUser](https://docs.microsoft.com/powershell/module/azuread/get-azureaduser?view=azureadps-2.0) cmdlet. But first, you must connect to your subscription. For the instructions, see[Connect with the Azure Active Directory V2 PowerShell module](https://go.microsoft.com/fwlink/?linkid=842218).
  
### Display Office 365 user account information

To display the full list of user accounts, run this command in your Office 365 PowerShell command prompt or the PowerShell Integrated Script Environment (ISE).
  
```
Get-AzureADUser
```

The **Get-AzureADUser** cmdlet by default displays three properties of user accounts:
  
- ObjectID
    
- DisplayName
    
- UserPrincipalName
    
To be more selective about the list of accounts to display, you can use the **Where-Object** cmdlet in combination with the **Get-AzureADUser** cmdlet. To combine the two cmdlets, we use the "pipe" character "|", which tells Office 365 PowerShell to take the results of one command and send it to the next command. Here is an example command that displays only those user accounts that have an unspecified usage location:
  
```
Get-AzureADUser | Where-Object {$_.UsageLocation -eq $Null}
```

This command instructs Office 365 PowerShell to:
  
- Get all of the information on the user accounts ( **Get-AzureADUser** ) and send it to the next command ( **|** ).
    
- Find all of the user accounts that have an unspecified usage location ( **Where-Object {$\_.UsageLocation -eq $Null}** ). Inside the braces, the command instructs Office 365 PowerShell to only find the set of accounts in which the UsageLocation user account property ( **$\_.UsageLocation** ) is not specified ( **-eq $Null** ).
    
The **UsageLocation** property is only one of many properties associated with a user account. To see all of the properties for user accounts, use the **Select-Object** cmdlet and the wildcard character (*) to display them all for a specific user account, one page at a time ( **More** ). Here is an example:
  
```
Get-AzureADUser -ObjectID "BelindaN@litwareinc.onmicosoft.com" | Select-Object * | More
```

For example, **City** is the name of a user account property. This means you can use the following command to list all of the user accounts for users living in London:
  
```
Get-AzureADUser | Where-Object {$_.City -eq "London"}
```

> [!TIP]
>  The syntax for the **Where-Object** cmdlet shown in these examples is **Where-Object {$\_.** [user account property name] [comparison operator] [value] **}**.>  [comparison operator] is **-eq** for equals, **-ne** for not equals, **-lt** for less than, **-gt** for greater than, and others>  [value] is typically a string (a sequence of letters, numbers, and other characters), a numerical value, or **$Null** for unspecified>  See[Where-Object](https://technet.microsoft.com/en-us/library/hh849715.aspx) for more information.
  
### Select the user account properties to display

The **Get-AzureADUser** cmdlet by default displays the ObjectID, DisplayName, and UserPrincipalName properties of user accounts. If you need additional properties, such as the department the user works for and the country/region where the user uses Office 365 services, you can run **Get-AzureADUser** in combination with the **Select-Object** cmdlet to specify the list of user account properties. Here is an example:
  
```
Get-AzureADUser | Select-Object DisplayName,Department,UsageLocation
```

This command instructs Office 365 PowerShell to:
  
- Get all of the information on the user accounts ( **Get-AzureADUser** ) and send it to the next command ( **|** ).
    
- Display only the user account name, department, and usage location ( **Select-Object DisplayName, Department, UsageLocation** ).
    
To be more selective about the list of accounts to display, you can also use the **Where-Object** cmdlet. Here is an example command that displays only those user accounts that have an unspecified usage location:
  
```
Get-AzureADUser | Where-Object {$_.UsageLocation -eq $Null} | Select-Object DisplayName, Department, UsageLocation
```

This command instructs Office 365 PowerShell to:
  
- Get all of the information on the user accounts ( **Get-AzureADUser** ) and send it to the next command ( **|** ).
    
- Find all of the user accounts that have an unspecified usage location ( **Where-Object {$\_.UsageLocation -eq $Null}** ) and send the resulting information to the next command ( **|** ). Inside the braces, the command is instructing Office 365 PowerShell to only find the set of accounts in which the UsageLocation user account property ( **$\_.UsageLocation** ) is not specified ( **-eq $Null** ).
    
- Display only the user account name, department, and usage location ( **Select-Object DisplayName, Department, UsageLocation** ).
    
## New to Office 365?

[!INCLUDE [LinkedIn Learning Info](../common/office/linkedin-learning-info.md)]
  
## See also

#### 

[Manage user accounts and licenses with Office 365 PowerShell](manage-user-accounts-and-licenses-with-office-365-powershell.md)
  
[Manage Office 365 with Office 365 PowerShell](manage-office-365-with-office-365-powershell.md)
  
[Getting started with Office 365 PowerShell](getting-started-with-office-365-powershell.md)

