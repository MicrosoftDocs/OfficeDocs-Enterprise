---
title: "View account license and service details with Office 365 PowerShell"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 12/10/2018
ms.audience: Admin
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: 
- PowerShell
- Ent_Office_Other
- LIL_Placement
ms.assetid: ace07d8a-15ca-4b89-87f0-abbce809b519

description: "Explains how to use Office 365 PowerShell to determine the Office 365 services that have been assigned to users."
---

# View account license and service details with Office 365 PowerShell

**Summary:** Explains how to use Office 365 PowerShell to determine the Office 365 services that have been assigned to users.
  
In Office 365, licenses from licensing plans (also called SKUs or Office 365 plans) give users access to the Office 365 services that are defined for those plans. However, a user might not have access to all the services that are available in a license that's currently assigned to them. You can use Office 365 PowerShell to view the status of services on user accounts. 

## Before you begin

- The procedures in this topic require you to connect to Office 365 PowerShell. For instructions, see [Connect to Office 365 PowerShell](connect-to-office-365-powershell.md).
    
- Use the commands  `Get-MsolAccountSku` and `(Get-MsolAccountSku | where {$_.AccountSkuId -eq '<AccountSkuId>'}).ServiceStatus` to find the following information:
    
  - The licensing plans that are available in your organization.
    
  - The services that are available in each licensing plan, and the order in which they are listed (the index number).
    
     For more information about licensing plans, license, and services, see [View licenses and services with Office 365 PowerShell](view-licenses-and-services-with-office-365-powershell.md).
    
- Use the command  `Get-MsolUser -UserPrincipalName <user account UPN> | Format-List DisplayName,Licenses` to find the licenses that are assigned to a user, and the order in which they are listed (the index number).
    
- If you use the **Get-MsolUser** cmdlet without using the _All_ parameter, only the first 500 accounts are returned.
    

## To view services for a user account

To view all the Office 365 services that a user has access to, use the following syntax:
  
```
(Get-MsolUser -UserPrincipalName <user account UPN>).Licenses[<LicenseIndexNumber>].ServiceStatus
```

This example shows the services to which the user BelindaN@litwareinc.com has access. This shows the services that are associated with all licenses that are assigned to her account.
  
```
(Get-MsolUser -UserPrincipalName belindan@litwareinc.com).Licenses.ServiceStatus
```

This example shows the services that user BelindaN@litwareinc.com has access to from the first license that's assigned to her account (the index number is 0).
  
```
(Get-MsolUser -UserPrincipalName belindan@litwareinc.com).Licenses[0].ServiceStatus
```

To view all the services for a user who has been assigned *multiple licenses*, use the following syntax:

```
$userAccountUPN="<user account UPN>"
$AllLicenses=(Get-MsolUser -UserPrincipalName $userAccountUPN).Licenses
$licArray = @()
for($i = 0; $i -lt $AllLicenses.Count; $i++)
{
$licArray += "License: " + $AllLicenses[$i].AccountSkuId
$licArray +=  $AllLicenses[$i].ServiceStatus
$licArray +=  ""
}
$licArray
```

  
## See also

See the following additional topics about managing users with Office 365 PowerShell:
  
- [Create user accounts with Office 365 PowerShell](create-user-accounts-with-office-365-powershell.md)
    
- [Delete and restore user accounts with Office 365 PowerShell](delete-and-restore-user-accounts-with-office-365-powershell.md)
    
- [Block user accounts with Office 365 PowerShell](block-user-accounts-with-office-365-powershell.md)
    
- [Assign licenses to user accounts with Office 365 PowerShell](assign-licenses-to-user-accounts-with-office-365-powershell.md)
    
- [Remove licenses from user accounts with Office 365 PowerShell](remove-licenses-from-user-accounts-with-office-365-powershell.md)
    
For more information about the cmdlets that are used in these procedures, see the following topics:
  
- [ConvertTo-Html](https://go.microsoft.com/fwlink/p/?LinkId=113290)
    
- [Format-List](https://go.microsoft.com/fwlink/p/?LinkId=113302)
    
- [Get-MsolUser](https://go.microsoft.com/fwlink/p/?LinkId=691543)
    
- [Select-Object](https://go.microsoft.com/fwlink/p/?LinkId=113387)
    
- [Where-Object](https://go.microsoft.com/fwlink/p/?LinkId=113423)
    

  
## New to Office 365?


[!INCLUDE [LinkedIn Learning Info](../common/office/linkedin-learning-info.md)]