---
title: "Use the Centralized Deployment PowerShell cmdlets to manage add-ins"
ms.author: twerner
author: twernermsft
manager: scotv
ms.date: 5/31/2017
ms.audience: Admin
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
search.appverid:
- MOE150
- MED150
- MBS150
- BCS160
ms.assetid: 94f4e86d-b8e5-42dd-b558-e6092f830ec9
description: "Use the Centralized Deployment PowerShell cmdlets to help you deploy and manage Office add-ins for your Office 365 organization."
---

# Use the Centralized Deployment PowerShell cmdlets to manage add-ins

As an Office 365 admin, you can deploy Office add-ins to users via the Centralized Deployment feature (see [Manage deployment of Office 365 add-ins in the Office 365 admin center](https://support.office.com/article/737e8c86-be63-44d7-bf02-492fa7cd9c3f)). In addition to deploying Office add-ins via the Office 365 admin center, you can also use Microsoft PowerShell. [Download](https://go.microsoft.com/fwlink/p/?linkid=850850) the Centralized Deployment PowerShell cmdlets from the Microsoft Download Center. 
  
## What do you want to do?

[Connect using your admin credentials](use-the-centralized-deployment-powershell-cmdlets-to-manage-add-ins.md#BKMK_Connect)
  
[Upload an add-in manifest](use-the-centralized-deployment-powershell-cmdlets-to-manage-add-ins.md#BKMK_UploadManifest)
  
[Upload an add-in from the Office Store](use-the-centralized-deployment-powershell-cmdlets-to-manage-add-ins.md#BKMK_UploadAddin)
  
[Get details of an add-in](use-the-centralized-deployment-powershell-cmdlets-to-manage-add-ins.md#BKMK_GetDetails)
  
[Turn on or turn off an add-in](use-the-centralized-deployment-powershell-cmdlets-to-manage-add-ins.md#BKMK_TurnOnOff)
  
[Add or remove users from an add-in](use-the-centralized-deployment-powershell-cmdlets-to-manage-add-ins.md#BKMK_AddRemove)
  
[Update an add-in](use-the-centralized-deployment-powershell-cmdlets-to-manage-add-ins.md#BKMK_UpdateAddin)
  
[Delete an add-in](use-the-centralized-deployment-powershell-cmdlets-to-manage-add-ins.md#BKMK_Delete)
  
[Get detailed help for each cmdlet](use-the-centralized-deployment-powershell-cmdlets-to-manage-add-ins.md#BKMK_GetHelp)
  
## Connect using your admin credentials
<a name="BKMK_Connect"> </a>

Before you can use the Centralized Deployment cmdlets, you need to sign in.
  
1. Start PowerShell.
    
2. Connect to PowerShell by using your company admin credentials. Run the following cmdlet.
    
  ```
  Connect-OrganizationAddInService
  ```

3. In the **Enter Credentials** page, enter your Office 365 global admin credentials. Alternately, you can enter your credentials directly into the cmdlet. 
    
    Run the following cmdlet specifying your company admin credentials as a PSCredential object.
    
  ```
  $secpasswd = ConvertTo-SecureString "MyPassword" -AsPlainText -Force
  $mycredentials = New-Object System.Management.Automation.PSCredential ("serviceaccount@contoso.com", $secpasswd)
  Connect-OrganizationAddInService -Credential $mycredentials
  ```

> [!NOTE]
> For more information about using PowerShell, see [Connect to Office 365 PowerShell](https://go.microsoft.com/fwlink/p/?linkid=848585). 
  
## Upload an add-in manifest
<a name="BKMK_UploadManifest"> </a>

Run the New-OrganizationAdd-In cmdlet to upload an add-in manifest from a path, which can be either a file location or URL. The following example shows a file location for the value of the  _ManifestPath_ parameter. 
  
```
New-OrganizationAddIn -ManifestPath 'C:\Users\Me\Desktop\taskpane.xml' -Locale 'en-US'
```

You can also run the New-OrganizationAdd-In cmdlet to upload an add-in and assign it to users or groups directly by using the  _Members_ parameter, as shown in the following example. Separate the email addresses of members with a comma. 
  
```
New-OrganizationAddIn -ManifestPath 'C:\Users\Me\Desktop\taskpane.xml' -Locale 'en-US' -Members  'KathyBonner@contoso.com', 'MaxHargrave@contoso.com'
```

## Upload an add-in from the Office Store
<a name="BKMK_UploadAddin"> </a>

Run the New-OrganizationAddIn cmdlet to upload a manifest from the Office Store.
  
In the following example, the New-OrganizationAddIn cmdlet specifies the AssetId for an add-in for a United States location and content market.
  
```
New-OrganizationAddIn -AssetId 'WA104099688' -Locale 'en-US' -ContentMarket 'en-US'
```

To determine the value for the  _AssetId_ parameter, you can copy it from the URL of the Office Store webpage for the add-in. AssetIds always begin with "WA" followed by a number. For example, in the previous example, the source for the AssetId value of WA104099688 is the Office Store webpage URL for the add-in: [https://store.office.com/en-001/app.aspx?assetid=WA104099688](https://store.office.com/en-001/app.aspx?assetid=WA104099688).
  
The values for the  _Locale_ parameter and the  _ContentMarket_ parameter are identical and indicate the country/region you're trying to install the add-in from. The format is en-US, fr-FR. and so forth. 
  
> [!NOTE]
> Add-ins uploaded from the Office Store will update automatically within a few days of the latest update being available on the Office Store. 
  
## Get details of an add-in
<a name="BKMK_GetDetails"> </a>

Run the Get-OrganizationAddIn cmdlet as shown below to get details of all add-ins uploaded to the tenant, included an add-in's product ID.
  
```
Get-OrganizationAddIn
```

Run the Get-OrganizationAddIn cmdlet with a value for the  _ProductId_ parameter to specify which add-in you want to retrieve details for. 
  
```
Get-OrganizationAddIn -ProductId 6a75788e-1c6b-4e9b-b5db-5975a2072122
```

To get full details of all the add-ins plus the assigned users and groups, pipe the output of the Get-OrganizationAddIn cmdlet to the Format-List cmdlet, as shown in the following example.
  
```
Get-OrganizationAddIn |Format-List
```

## Turn on or turn off an add-in
<a name="BKMK_TurnOnOff"> </a>

To turn off an add-in so users and groups that are assigned to it will no longer have access, run the Set-OrganizationAddIn cmdlet with the  _ProductId_ parameter and the  _Enabled_ parameter set to  `$false`, as shown in the following example.
  
```
Set-OrganizationAddIn -ProductId 6a75788e-1c6b-4e9b-b5db-5975a2072122 -Enabled $false
```

To turn an add-in back on, run the same cmdlet with the  _Enabled_ parameter set to  `$true`.
  
```
Set-OrganizationAddIn -ProductId 6a75788e-1c6b-4e9b-b5db-5975a2072122 -Enabled $true
```

## Add or remove users from an add-in
<a name="BKMK_AddRemove"> </a>

To add users and groups to a specific add-in, run the Set-OrganizationAddInAssignments cmdlet with the  _ProductId_,  _Add_, and  _Members_ parameters. Separate the email addresses of members with a comma. 
  
```
Set-OrganizationAddInAssignments -ProductId 6a75788e-1c6b-4e9b-b5db-5975a2072122 -Add -Members 'KathyBonner@contoso.com','sales@contoso.com'
```

To remove users and groups, run the same cmdlet using the  _Remove_ parameter. 
  
```
Set-OrganizationAddInAssignments -ProductId 6a75788e-1c6b-4e9b-b5db-5975a2072122 -Remove -Members 'KathyBonner@contoso.com','sales@contoso.com'
```

To assign an add-in to all users on the tenant, run the same cmdlet using the  _AssignToEveryone_ parameter with the value set to  `$true`.
  
```
Set-OrganizationAddInAssignments -ProductId 6a75788e-1c6b-4e9b-b5db-5975a2072122 -AssignToEveryone $true
```

To not assign an add-in to everyone and revert to the previously assigned users and groups, you can run the same cmdlet and turn off the  _AssignToEveryone_ parameter by setting its value to  `$false`.
  
```
Set-OrganizationAddInAssignments -ProductId 6a75788e-1c6b-4e9b-b5db-5975a2072122 -AssignToEveryone $false
```

## Update an add-in
<a name="BKMK_UpdateAddin"> </a>

To update an add-in from a manifest, run the Set-OrganizationAddIn cmdlet with the  _ProductId_,  _ManifestPath_, and  _Locale_ parameters, as shown in the following example. 
  
```
Set-OrganizationAddIn -ProductId 6a75788e-1c6b-4e9b-b5db-5975a2072122 -ManifestPath 'C:\Users\Me\Desktop\taskpane.xml' -Locale 'en-US'
```

> [!NOTE]
> Add-ins uploaded from the Office Store will update automatically within a few days of the latest update being available on the Office Store. 
  
## Delete an add-in
<a name="BKMK_Delete"> </a>

To delete an add-in, run the Remove-OrganizationAddIn cmdlet with the  _ProductId_ parameter, as shown in the following example. 
  
```
Remove-OrganizationAddIn -ProductId 6a75788e-1c6b-4e9b-b5db-5975a2072122
```

## Get detailed help for each cmdlet
<a name="BKMK_GetHelp"> </a>

You can look at detailed help for each cmdlet by using the Get-help cmdlet. For example, the following cmdlet provides detailed information about the Remove-OrganizationAddIn cmdlet.
  
```
Get-help Remove-OrganizationAddIn -Full
```


