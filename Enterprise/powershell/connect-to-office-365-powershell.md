---
title: "Connect to Office 365 PowerShell"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 10/16/2018
audience: ITPro
ms.topic: article
ms.service: o365-administration
localization_priority: Priority
ms.collection: Ent_O365
ms.custom: 
- LIL_Placement
- O365ITProTrain
- Ent_Office_Other
ms.assetid: 5ebc0e21-b72d-46d8-96fa-00643b18eaec
description: "Summary: Connect to your Office 365 organization using Office 365 PowerShell to perform admin center tasks from the command line."
---

# Connect to Office 365 PowerShell

 **Summary:** Connect to your Office 365 organization using Office 365 PowerShell to perform administration tasks from the command line.
  
Office 365 PowerShell lets you manage your Office 365 settings from the command line. Connecting to Office 365 PowerShell is a simple process where you install the required software and then connect to your Office 365 organization. 

There are two versions of the PowerShell module that you use to connect to Office 365 and administer user accounts, groups, and licenses:

- Azure Active Directory PowerShell for Graph (cmdlets include **AzureAD** in their name) 
- Microsoft Azure Active Directory Module for Windows PowerShell (cmdlets include **MSol** in their name) 

As of the date of this article, the Azure Active Directory PowerShell for Graph module does not completely replace the functionality in the cmdlets of Microsoft Azure Active Directory Module for Windows PowerShell module for user, group, and license administration. In many cases, you need to use both versions. You can safely install both versions on the same computer.

> [!TIP]
> **New to PowerShell?** See a [video Overview of PowerShell](https://support.office.com/en-us/article/7d0107d4-f672-4d0f-ad7d-417844b926c7.aspx), brought to you by LinkedIn Learning. 
  
## What do you need to know before you begin?

- Estimated time to complete: 5 minutes
    
- You can use the following versions of Windows:
    
  - Windows 10, Windows 8.1, Windows 8, or Windows 7 Service Pack 1 (SP1) 
    
  - Windows Server 2019, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, or Windows Server 2008 R2 SP1
    
    > [!NOTE]
    >Use a 64-bit version of Windows. Support for the 32-bit version the Microsoft Azure Active Directory Module for Windows PowerShell was discontinued in October of 2014.
    
-  These procedures are intended for users who are members of an Office 365 admin role. For more information, see [About Office 365 admin roles](https://go.microsoft.com/fwlink/p/?LinkId=532367).


## Connect with the Azure Active Directory PowerShell for Graph module

Commands in the [Azure Active Directory PowerShell for Graph](https://docs.microsoft.com/powershell/azuread/v2/azureactivedirectory) module have **AzureAD** in their cmdlet name.

For procedures that require the new cmdlets in the Azure Active Directory PowerShell for Graph module, use these steps to install the module and connect to your Office 365 subscription.

>[!Note]
>See [Azure Active Directory PowerShell for Graph module](https://docs.microsoft.com/powershell/azuread/v2/azureactivedirectory) for information about the support for different versions of Microsoft Windows.
>

### Step 1: Install required software

These steps are required once on your computer, not every time you connect. However, you'll likely need to install newer versions of the software periodically.
  
1. Open an elevated Windows PowerShell command prompt (run Windows PowerShell as an administrator).
    
2. In the **Administrator: Windows PowerShell** command window, run this command:
    
  ```
  Install-Module -Name AzureAD
  ```

If prompted about installing a module from an untrusted repository, type **Y** and press ENTER.

### Step 2: Connect to Azure AD for your Office 365 subscription

To connect to Azure AD for your Office 365 subscription with an account name and password or with *multi-factor authentication (MFA)*, run one of these commands from a Windows PowerShell command prompt (it does not have to be elevated).

|||
|:-------|:-----|
| **Office 365 cloud** | **Command** |
| Office 365 Worldwide (+GCC) | `Connect-AzureAD` |
| Office 365 operated by 21 Vianet | `Connect-AzureAD -AzureEnvironmentName AzureChinaCloud` |
| Office 365 Germany | `Connect-AzureAD -AzureEnvironmentName AzureGermanyCloud` |
| Office 365 U.S. Government DoD and Office 365 U.S. Government GCC High | `Connect-AzureAD -AzureEnvironmentName AzureUSGovernment` |
|||

In the **Sign into your account** dialog box, type your Office 365 work or school account user name and password, and then click **OK**.

If you are using MFA, follow the instructions in the additional dialog boxes to provide more authentication information, such as a verification code.


After connecting, you can use the new cmdlets for the [Azure Active Directory PowerShell for Graph module](https://docs.microsoft.com/powershell/azuread/v2/azureactivedirectory).
  

## Connect with the Microsoft Azure Active Directory Module for Windows PowerShell

Commands in the Microsoft Azure Active Directory Module for Windows PowerShell have **Msol** in their cmdlet name.
    
### Step 1: Install required software

These steps are required once on your computer, not every time you connect. However, you'll likely need to install newer versions of the software periodically.
  
1.  Install the 64-bit version of the Microsoft Online Services Sign-in Assistant: [Microsoft Online Services Sign-in Assistant for IT Professionals RTW](https://go.microsoft.com/fwlink/p/?LinkId=286152).
    
2. Install the Microsoft Azure Active Directory Module for Windows PowerShell with these steps:
    
  - Open an elevated Windows PowerShell command prompt (run Windows PowerShell as an administrator).
  - Run the **Install-Module MSOnline** command.
  - If prompted to install the NuGet provider, type **Y** and press ENTER.
  - If prompted to install the module from PSGallery, type **Y** and press ENTER.
    
### Step 2: Connect to Azure AD for your Office 365 subscription

To connect to Azure AD for your Office 365 subscription with an account name and password or with *multi-factor authentication (MFA)*, run one of these commands from a Windows PowerShell command prompt (it does not have to be elevated).

|||
|:-------|:-----|
| **Office 365 cloud** | **Command** |
| Office 365 Worldwide (+GCC) | `Connect-MsolService` |
| Office 365 operated by 21 Vianet | `Connect-MsolService -AzureEnvironment AzureChinaCloud` |
| Office 365 Germany | `Connect-MsolService -AzureEnvironment AzureGermanyCloud` |
| Office 365 U.S. Government DoD and Office 365 U.S. Government GCC High | `Connect-MsolService -AzureEnvironment USGovernment` |
|||

In the **Sign into your account** dialog box, type your Office 365 work or school account user name and password, and then click **OK**.

If you are using MFA, follow the instructions in the additional dialog boxes to provide more authentication information, such as a verification code.

### How do you know this worked?

If you don't receive any errors, you connected successfully. A quick test is to run an Office 365 cmdlet—for example, **Get-MsolUser** —and see the results.
  
If you receive errors, check the following requirements:
  
- **A common problem is an incorrect password**. Run Step 2 again. and pay close attention to the user name and password you enter.
    
- **The Microsoft Azure Active Directory Module for Windows PowerShell requires that the Microsoft .NET Framework 3.5.*x* feature is enabled on your computer**. It's likely that your computer has a newer version installed (for example, 4 or 4.5.*x*), but backwards compatibility with older versions of the .NET Framework can be enabled or disabled. For more information, see the following topics:
    
  - For Windows Server 2012 or Windows Server 2012 R2, see [Enable .NET Framework 3.5 by using the Add Roles and Features Wizard](https://go.microsoft.com/fwlink/p/?LinkId=532368)
    
  - For Windows 7 or Windows Server 2008 R2, see [You can't open the Azure Active Directory Module for Windows PowerShell](https://go.microsoft.com/fwlink/p/?LinkId=532370)

  - For Windows 10, Windows 8.1, and Windows 8, see [Install the .NET Framework 3.5 on Windows 10, Windows 8.1, and Windows 8](https://docs.microsoft.com/en-us/dotnet/framework/install/dotnet-35-windows-10)

  
- **Your version of the Microsoft Azure Active Directory Module for Windows PowerShell might be out of date.** To check, run the following command in Office 365 PowerShell or the Microsoft Azure Active Directory Module for Windows PowerShell:
    
  ```
  (Get-Item C:\Windows\System32\WindowsPowerShell\v1.0\Modules\MSOnline\Microsoft.Online.Administration.Automation.PSModule.dll).VersionInfo.FileVersion
  ```

    If the version number returned is lower than the value 1.0.8070.2, uninstall the Microsoft Azure Active Directory Module for Windows PowerShell and install the latest version from the link in Step 1.
    
- **If you receive a connection error, see this topic:** ["Connect-MsolService: Exception of type was thrown" error](https://go.microsoft.com/fwlink/p/?LinkId=532377).
    

## See also

- [Manage Office 365 with Office 365 PowerShell](manage-office-365-with-office-365-powershell.md)
- [Getting started with Office 365 PowerShell](getting-started-with-office-365-powershell.md)
- [Connect to all Office 365 services in a single Windows PowerShell window](connect-to-all-office-365-services-in-a-single-windows-powershell-window.md)
- [Get-Credential](https://go.microsoft.com/fwlink/p/?LinkId=389618)
- [Connect-MsolService](https://go.microsoft.com/fwlink/p/?LinkId=532375)

