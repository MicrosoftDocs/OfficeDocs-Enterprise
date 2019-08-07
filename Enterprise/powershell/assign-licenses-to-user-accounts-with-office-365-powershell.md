---
title: "Assign licenses to user accounts with Office 365 PowerShell"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 08/05/2019
audience: Admin
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: 
- Ent_Office_Other
- LIL_Placement
- PowerShell
- O365ITProTrain
ms.assetid: ba235f4f-e640-4360-81ea-04507a3a70be
search.appverid:
- MET150

description: "How to use Office 365 PowerShell to assign an Office 365 license to unlicensed users."
---

# Assign licenses to user accounts with Office 365 PowerShell

**Summary:**  How to use Office 365 PowerShell to assign an Office 365 license to unlicensed users.
  
Users can't use any Office 365 services until their account has been assigned a license from a licensing plan. You can use Office 365 PowerShell to quickly assign licenses to unlicensed accounts. 

>[!Note]
>User accounts must be assigned a location. You can do this from the properties of a user account in the Microsoft 365 admin center or from PowerShell.
>

## Use the Azure Active Directory PowerShell for Graph module

First, [connect to your Office 365 tenant](connect-to-office-365-powershell.md#connect-with-the-azure-active-directory-powershell-for-graph-module).
  

Next, list the license plans for your tenant with this command.

```
Get-AzureADSubscribedSku | Select SkuPartNumber
```

Next, get the sign-in name of the account to which you want add a license, also known as the user principal name (UPN).

Next, ensure that the user account has a usage location assigned.

```
Get-AzureADUser -ObjectID <user sign-in name (UPN)> | Select DisplayName, UsageLocation
```

If there is no usage location assigned, you can assign one with these commands:

```
$userUPN="<user sign-in name (UPN)>"
$userLoc="<ISO 3166-1 alpha-2 country code>"
Set-AzureADUser -ObjectID $userUPN -UsageLocation $userLoc
```

Finally, specify the user sign-in name and license plan name and run these commands.

```
$userUPN="<user sign-in name (UPN)>"
$planName="<license plan name from the list of license plans>"
$License = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicense
$License.SkuId = (Get-AzureADSubscribedSku | Where-Object -Property SkuPartNumber -Value $planName -EQ).SkuID
$LicensesToAssign = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses
$LicensesToAssign.AddLicenses = $License
Set-AzureADUserLicense -ObjectId $userUPN -AssignedLicenses $LicensesToAssign
```

## Use the Microsoft Azure Active Directory Module for Windows PowerShell

First, [connect to your Office 365 tenant](connect-to-office-365-powershell.md#connect-with-the-microsoft-azure-active-directory-module-for-windows-powershell).

Run the **Get-MsolAccountSku** command to view the available licensing plans and the number of available licenses in each plan in your organization. The number of available licenses in each plan is **ActiveUnits** - **WarningUnits** - **ConsumedUnits**. For more information about licensing plans, licenses, and services, see [View licenses and services with Office 365 PowerShell](view-licenses-and-services-with-office-365-powershell.md).
    
To find the unlicensed accounts in your organization, run this command.

```
Get-MsolUser -All -UnlicensedUsersOnly
```

You can only assign licenses to user accounts that have the **UsageLocation** property set to a valid ISO 3166-1 alpha-2 country code. For example, US for the United States, and FR for France. Some Office 365 services aren't available in certain countries. For more information, see [About license restrictions](https://go.microsoft.com/fwlink/p/?LinkId=691730).
    
To find accounts that don't have a **UsageLocation** value, run this command.

```
Get-MsolUser -All | where {$_.UsageLocation -eq $null}
```

To set the **UsageLocation** value on an account, run this command.

```
Set-MsolUser -UserPrincipalName "<Account>" -UsageLocation <CountryCode>
```

For example:

```
Set-MsolUser -UserPrincipalName "belindan@litwareinc.com" -UsageLocation US
```
    
If you use the **Get-MsolUser** cmdlet without using the **-All** parameter, only the first 500 accounts are returned.

### Assigning licenses to user accounts
    
To assign a license to a user, use the following command in Office 365 PowerShell.
  
```
Set-MsolUserLicense -UserPrincipalName "<Account>" -AddLicenses "<AccountSkuId>"
```

This example assigns a license from the **litwareinc:ENTERPRISEPACK** (Office 365 Enterprise E3) licensing plan to the unlicensed user **belindan@litwareinc.com**:
  
```
Set-MsolUserLicense -UserPrincipalName "belindan@litwareinc.com" -AddLicenses "litwareinc:ENTERPRISEPACK"
```

To assign a license to many unlicensed users, run this command.
  
```
Get-MsolUser -All -UnlicensedUsersOnly [<FilterableAttributes>] | Set-MsolUserLicense -AddLicenses "<AccountSkuId>"
```
  
>[!Note]
>You can't assign multiple licenses to a user from the same licensing plan. If you don't have enough available licenses, the licenses are assigned to users in the order that they're returned by the **Get-MsolUser** cmdlet until the available licenses run out.
>

This example assigns licenses from the **litwareinc:ENTERPRISEPACK** (Office 365 Enterprise E3) licensing plan to all unlicensed users:
  
```
Get-MsolUser -All -UnlicensedUsersOnly | Set-MsolUserLicense -AddLicenses "litwareinc:ENTERPRISEPACK"
```

This example assigns those same licenses to unlicensed users in the Sales department in the United States:
  
```
Get-MsolUser -All -Department "Sales" -UsageLocation "US" -UnlicensedUsersOnly | Set-MsolUserLicense -AddLicenses "litwareinc:ENTERPRISEPACK"
```
  
## New to Office 365?

[!INCLUDE [LinkedIn Learning Info](../common/office/linkedin-learning-info.md)]

## See also

[Manage user accounts and licenses with Office 365 PowerShell](manage-user-accounts-and-licenses-with-office-365-powershell.md)
  
[Manage Office 365 with Office 365 PowerShell](manage-office-365-with-office-365-powershell.md)
  
[Getting started with Office 365 PowerShell](getting-started-with-office-365-powershell.md)
