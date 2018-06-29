---
title: "Get details about devices managed by Mobile Device Management (MDM) for Office 365"
ms.author: brendonb
author: brendonb
manager: laurawi
ms.date: 6/12/2018
ms.audience: Admin
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
search.appverid: MBS150
ms.assetid: 5602963c-a1f2-4c21-afb9-f66cd7dca1f0
description: "This article shows you how to use Windows PowerShell to get details about the devices in your organization that you set up for Mobile Device Management for Office 365."
---

# Get details about devices managed by Mobile Device Management (MDM) for Office 365

This article shows you how to use Windows PowerShell to get details about the devices in your organization that you set up for Mobile Device Management for Office 365. 
  
## What device details can I get?
<a name="devicedetails"> </a>

Here's a breakdown.
  
|**Detail**|**What to look for in PowerShell**|
|:-----|:-----|
|Device is [enrolled in MDM for Office 365](enroll-your-mobile-device.md) <br/> |The value of the  *isManaged*  parameter is:  <br/> **True** = device is enrolled.  <br/> **False** = device is not enrolled.  <br/> |
|Device is compliant with your [device security policies](https://go.microsoft.com/fwlink/?linkid=615144) <br/> |The value of the  *isCompliant*  parameter is:  <br/> **True** = device is compliant with policies.  <br/> **False** = device is not compliant with policies.  <br/> |
   
![Flow showing AAD Shell param values for whether devices are enrolled and complaint](media/647b70f4-f886-41ef-8bff-04773a1da278.png)
  
> [!NOTE]
> The commands and scripts in this article will also return details about any devices that are managed by [Microsoft Intune](https://www.microsoft.com/en-us/cloud-platform/microsoft-intune). 
  
## Before you begin
<a name="BYB"> </a>

There are a few things you'll need to set up to run the commands and scripts described in this article.
  
### Step 1: Download and install the Azure Active Directory Module for Windows PowerShell

For more info on these steps, see [Connect to Office 365 PowerShell](https://docs.microsoft.com/en-us/office365/enterprise/powershell/connect-to-office-365-powershell).
  
1. Go to [Microsoft Online Services Sign-In Assistant for IT Professionals RTWl](https://www.microsoft.com/en-us/download/details.aspx?id=41950) and click **Download** for Microsoft Online Services Sign-in Assistant. 
    
2. Install the Microsoft Azure Active Directory Module for Windows PowerShell with these steps:
    
1. Open an administrator-level PowerShell command prompt.
    
2. Run the Install-Module MSOnline command.
    
3. If prompted to install the NuGet provider, type Y and press ENTER.
    
4. If prompted to install the module from PSGallery, type Y and press ENTER.
    
5. After installation, close the PowerShell command window.
    
### Step 2: Connect to your Office 365 subscription

1. In the Windows Azure Active Directory Module for Windows PowerShell, run the following command.
    
  ```
  $UserCredential = Get-Credential
  ```

2. In the **Windows PowerShell Credential Request** dialog box, type the user name and password for your Office 365 global admin account, and then click **OK**.
    
3. Run the following command.
    
  ```
  Connect-MsolService -Credential $UserCredential
  ```

### Step 3: Make sure you're able to run PowerShell scripts

> [!NOTE]
> You can skip this step if you're already set up to run PowerShell scripts. 
  
To run the **Get-MsolUserDeviceComplianceStatus.ps1** script, you need to enable the running of PowerShell scripts. 
  
1. From your Windows Desktop, click **Start**, and then type Windows PowerShell. Right click **Windows PowerShell**, and then click **Run as administrator**.
    
2. Run the following command.
    
  ```
  Set-ExecutionPolicy RemoteSigned
  ```

3. When prompted, type Y and then press Enter. 
    
## Run the Get-MsolDevice cmdlet to display details for all devices in your organization
<a name="RunCmdlet"> </a>

1. Open the Microsoft Azure Active Directory Module for Windows PowerShell.
    
2. Run the following command.
    
  ```
  Get-MsolDevice -All -ReturnRegisteredOwners | Where-Object {$_.RegisteredOwners.Count -gt 0}
  ```

For more examples, see [Get-MsolDevice](https://go.microsoft.com/fwlink/?linkid=841721).
  
## Run a script to get device details
<a name="RunScript"> </a>

### First, save the script to your computer

1. Copy and paste the following text into Notepad. 
    
  ```
  param (
      [PSObject[]]$users = @(),
      [Switch]$export,
      [String]$exportFileName = "UserDeviceComplianceStatus_" + (Get-Date -Format "yyMMdd_HHMMss") + ".csv",
      [String]$exportPath = [Environment]::GetFolderPath("Desktop")
   )
  [System.Collections.IDictionary]$script:schema = @{
      
      DeviceId = ''
      DeviceOSType = ''
      DeviceOSVersion = ''
      DeviceTrustLevel = ''
      DisplayName = ''
      IsCompliant = ''
      IsManaged = ''
      ApproximateLastLogonTimestamp = ''
      DeviceObjectId = ''    
      RegisteredOwnerUpn = ''
      RegisteredOwnerObjectId = ''
      RegisteredOwnerDisplayName = ''
  }
  function createResultObject
  {
      [PSObject]$resultObject = New-Object -TypeName PSObject -Property $script:schema
      return $resultObject
  }
  If ($users.Count -eq 0)
  {
      $users = Get-MsolUser
  }
  [PSObject[]]$result = foreach ($u in $users)
  {
      
      [PSObject]$devices = get-msoldevice -RegisteredOwnerUpn $u.UserPrincipalName
      foreach ($d in $devices)
      {
          [PSObject]$deviceResult = createResultObject
          $deviceResult.DeviceId = $d.DeviceId 
          $deviceResult.DeviceOSType = $d.DeviceOSType 
          $deviceResult.DeviceOSVersion = $d.DeviceOSVersion 
          $deviceResult.DeviceTrustLevel = $d.DeviceTrustLevel
          $deviceResult.DisplayName = $d.DisplayName
          $deviceResult.IsCompliant = $d.GraphDeviceObject.IsCompliant
          $deviceResult.IsManaged = $d.GraphDeviceObject.IsManaged
          $deviceResult.DeviceObjectId = $d.ObjectId
          $deviceResult.RegisteredOwnerUpn = $u.UserPrincipalName
          $deviceResult.RegisteredOwnerObjectId = $u.ObjectId
          $deviceResult.RegisteredOwnerDisplayName = $u.DisplayName
          $deviceResult.ApproximateLastLogonTimestamp = $d.ApproximateLastLogonTimestamp
          $deviceResult
      }
  }
  If ($export)
  {
      $result | Export-Csv -path ($exportPath + "\" + $exportFileName) -NoTypeInformation
  }
  Else
  {
      $result
  }
  
  ```

2. Save it as a Windows PowerShell script file by using the file extension **.ps1**; for example, Get-MsolUserDeviceComplianceStatus.ps1.
    
### Run the script to get device information for a single user account

1. Open the Microsoft Azure Active Directory Module for Windows PowerShell.
    
2. Navigate to the folder where you saved the script. For example, if you saved it to C:\PS-Scripts, you'd run the following command.
    
  ```
  cd C:\PS-Scripts
  ```

3. Run the following command to identify the user you want to get device details for. This example gets details for bar@example.com.
    
  ```
  $u = Get-MsolUser -UserPrincipalName bar@example.com
  ```

4. Run the following command to initiate the script.
    
  ```
  .\Get-MsolUserDeviceComplianceStatus.ps1 -User $u -Export
  ```

The information is exported to your Windows Desktop as a CSV file. You can use additional parameters to specify the file name and path of the CSV.
  
### Run the script to get device information for a group of users

1. Open the Microsoft Azure Active Directory Module for Windows PowerShell.
    
2. Navigate to the folder where you saved the script. For example, if you saved it to C:\PS-Scripts, you'd run the following command.
    
  ```
  cd C:\PS-Scripts
  ```

3. Run the following command to identify the group you want to get device details for. This example gets details for users in the FinanceStaff group.
    
  ```
  $u = Get-MsolGroupMember -SearchString "FinanceStaff" | % { Get-MsolUser -ObjectId $_.ObjectId }
  ```

4. Run the following command to initiate the script.
    
  ```
  .\Get-MsolUserDeviceComplianceStatus.ps1 -User $u -Export
  ```

The information is exported to your Windows Desktop as a CSV file. You can use additional parameters to specify the file name and path of the CSV.
  
## More info
<a name="RunScript"> </a>

[Microsoft Connect Has Been Retired](https://docs.microsoft.com/en-us/collaborate/connect-redirect)
  
[Overview of MDM for Office 365](overview-of-mdm.md)
  
[Get-MsolDevice](https://go.microsoft.com/fwlink/?linkid=841721)
  

