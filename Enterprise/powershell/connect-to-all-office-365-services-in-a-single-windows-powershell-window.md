---
title: "Connect to all Office 365 services in a single Windows PowerShell window"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 04/04/2018
ms.audience: ITPro
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: 
- LIL_Placement
- Ent_Office_Other
- O365ITProTrain
- httpsfix
ms.assetid: 53d3eef6-4a16-4fb9-903c-816d5d98d7e8

description: "Summary: Connect Windows PowerShell to all Office 365 services in a single Windows PowerShell window."
---

# Connect to all Office 365 services in a single Windows PowerShell window

 **Summary:** Instead of managing different Office 365 services in separate PowerShell console windows, you can connect to all Office 365 services and manage them from single console window.
  
When you use PowerShell to manage Office 365, it is possible to have up to five different Windows PowerShell sessions open at the same time corresponding to Office 365 admin center, SharePoint Online, Exchange Online, Skype for Business Online, and the Security &amp; Compliance Center. With five different connection methods in separate Windows PowerShell sessions, your desktop could look like this:
  
![Five Windows PowerShell consoles running at once](images/a1a852c2-89ea-4e8e-8d8b-dcdf596763d1.png)
  
This is not optimal for managing Office 365 because you can't exchange data among those five windows for cross-service management. This topic describes how to use a single instance of Windows PowerShell from which you can manage Office 365, Skype for Business Online, Exchange Online, SharePoint Online, and the Security &amp; Compliance Center.

>[!Note]
>This article is in the process of being updated to use the Azure Active Directory V2 PowerShell module and for multifactor authentication (MFA).
>
  
## Before you begin
<a name="BeforeYouBegin"> </a>

Before you can manage all of Office 365 from a single instance of Windows PowerShell, consider the following prerequisites:
  
- The Office 365 work or school account that you use for these procedures needs to be a member of an Office 365 admin role. For more information, see [About Office 365 admin roles](https://go.microsoft.com/fwlink/p/?LinkId=532367). This a requirement for Office 365 PowerShell, not necessarily for all other Office 365 services.
    
- You can use the following 64-bit versions of Windows:
    
  - Windows 10
    
  - Windows 8.1 or Windows 8
    
  - Windows Server 2016
    
  - Windows Server 2012 R2 or Windows Server 2012
    
  - Windows 7 Service Pack 1 (SP1)*
    
  - Windows Server 2008 R2 SP1*
    
    * You need to install the Microsoft .NET Framework 4.5.*x* and then either the Windows Management Framework 3.0 or the Windows Management Framework 4.0. For more information, see [Installing the .NET Framework](https://go.microsoft.com/fwlink/p/?LinkId=257868) and [Windows Management Framework 3.0](https://go.microsoft.com/fwlink/p/?LinkId=272757) or [Windows Management Framework 4.0](https://go.microsoft.com/fwlink/p/?LinkId=391344).
    
    You need to use a 64-bit version of Windows because of the requirements for the Skype for Business Online module and one of the Office 365 modules.
    
- You need to install the modules that are required for Office 365, SharePoint Online, and Skype for Business Online:
    
   - [Microsoft Online Service Sign-in Assistant for IT Professionals RTW](https://go.microsoft.com/fwlink/p/?LinkId=286152)
   - Windows Azure Active Directory Module for Windows PowerShell (64-bit version) with the **Install-Module MSOnline** command at an elevated PowerShell command prompt.
   - [SharePoint Online Management Shell](https://go.microsoft.com/fwlink/p/?LinkId=255251)
   - [Skype for Business Online, Windows PowerShell Module](https://go.microsoft.com/fwlink/p/?LinkId=532439)
    
-  Windows PowerShell needs to be configured to run signed scripts for Skype for Business Online, Exchange Online, and the Security &amp; Compliance Center. To do this, run the following command in an elevated Windows PowerShell session (a Windows PowerShell window you open by selecting **Run as administrator**).
    
  ```
  Set-ExecutionPolicy RemoteSigned
  ```

## Connection steps
<a name="BeforeYouBegin"> </a>

Here are the steps to connect to all the services in a single PowerShell window.
  
1. Open Windows PowerShell as an administrator (use **Run as administrator**).
    
2. Run this command, and enter your Office 365 work or school account credentials.
    
  ```
  $credential = Get-Credential
  ```

3. Run these commands to connect to Office 365.
    
  ```
  Import-Module MsOnline
  Connect-MsolService -Credential $credential
  ```

4. Run these commands to connect to SharePoint Online. Replace  _\<domainhost>_ with the actual value for your domain. For example, for `litwareinc.onmicrosoft.com`, the  _\<domainhost>_ value is `litwareinc`.
    
  ```
  Import-Module Microsoft.Online.SharePoint.PowerShell -DisableNameChecking
  Connect-SPOService -Url https://<domainhost>-admin.sharepoint.com -credential $credential
  ```

5. Run these commands to connect to Skype for Business Online. A warning about increasing the `WSMan NetworkDelayms` value is expected the first time you connect and should be ignored.
    
  ```
  Import-Module SkypeOnlineConnector
  $sfboSession = New-CsOnlineSession -Credential $credential
  Import-PSSession $sfboSession
  ```

6. Run these commands to connect to Exchange Online.
    
  ```
  $exchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://outlook.office365.com/powershell-liveid/" -Credential $credential -Authentication "Basic" -AllowRedirection
  Import-PSSession $exchangeSession -DisableNameChecking
  ```

7. Run these commands to connect to the Security &amp; Compliance Center.
    
  ```
  $ccSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid/ -Credential $credential -Authentication Basic -AllowRedirection
  Import-PSSession $ccSession -Prefix cc
  ```
> [!NOTE]
> The text prefix "cc" is added to  *all*  Security &amp; Compliance Center cmdlet names so you can run cmdlets that exist in both Exchange Online and the Security &amp; Compliance Center in the same Windows PowerShell session. For example, **Get-RoleGroup** becomes **Get-ccRoleGroup** in the Security &amp; Compliance Center.
  
Here are all the commands in a single block. Specify the name of your domain host, and then run them all at one time.
  
```
$domainHost="<domain host name, such as litware for litwareinc.onmicrosoft.com>"
$credential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $credential
Import-Module Microsoft.Online.SharePoint.PowerShell -DisableNameChecking
Connect-SPOService -Url https://$domainHost-admin.sharepoint.com -credential $credential
Import-Module SkypeOnlineConnector
$sfboSession = New-CsOnlineSession -Credential $credential
Import-PSSession $sfboSession
$exchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://outlook.office365.com/powershell-liveid/" -Credential $credential -Authentication "Basic" -AllowRedirection
Import-PSSession $exchangeSession -DisableNameChecking
$ccSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid/ -Credential $credential -Authentication Basic -AllowRedirection
Import-PSSession $ccSession -Prefix cc
```
When you are ready to close down the Windows PowerShell window, run this command to remove the active sessions to Skype for Business Online, Exchange Online, SharePoint Online, and the Security &amp; Compliance Center:
  
```
Remove-PSSession $sfboSession ; Remove-PSSession $exchangeSession ; Remove-PSSession $ccSession ; Disconnect-SPOService
```

## New to Office 365?
<a name="LongVersion"> </a>

[!INCLUDE [LinkedIn Learning Info](../common/office/linkedin-learning-info.md)]

## See also

- [Manage Office 365 with Office 365 PowerShell](manage-office-365-with-office-365-powershell.md)
- [Getting started with Office 365 PowerShell](getting-started-with-office-365-powershell.md)
- [Manage SharePoint Online with Office 365 PowerShell](manage-sharepoint-online-with-office-365-powershell.md)
- [Manage user accounts and licenses with Office 365 PowerShell](manage-user-accounts-and-licenses-with-office-365-powershell.md)
- [Use Windows PowerShell to create reports in Office 365](use-windows-powershell-to-create-reports-in-office-365.md)
