---
title: "Manage Skype for Business Online with Office 365 PowerShell"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 09/13/2018
ms.audience: ITPro
ms.topic: hub-page
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: 
ms.assetid: 054c16e6-9fd1-4e85-a0e6-81788b8410ea
description: "Summary: Use Office 365 PowerShell to manage Skype for Business Online policies, per-user policies, and meeting settings."
---

# Manage Skype for Business Online with Office 365 PowerShell

 **Summary:** Use Office 365 PowerShell to manage Skype for Business Online policies, per-user policies, and meeting settings.
  
One of the primary tasks of any Skype for Business Online administrator is managing policies. Although you can accomplish some of these tasks in the Office 365 Admin center, other tasks are much quicker and easier in Office 365 PowerShell. 

## Before you start

Download and install the [Skype for Business Online Connector module](https://www.microsoft.com/en-us/download/details.aspx?id=39366), and then restart your computer if prompted.


## Connect using a Skype for Business Online administrator account name and password

1. Open a Windows PowerShell command prompt and run the following commands: 
    
  ```
  Import-Module SkypeOnlineConnector
  $userCredential = Get-Credential
  $sfbSession = New-CsOnlineSession -Credential $userCredential
  Import-PSSession $sfbSession
  ```

2. In the **Windows PowerShell Credential Request** dialog box, type your Skype for Business Online administrator account name and password, and then click **OK**.


## Connect using a Skype for Business Online administrator account with multifactor authentication

1. Open a Windows PowerShell command prompt and run the following commands:

  ```
  Import-Module SkypeOnlineConnector
  $sfbSession = New-CsOnlineSession
  Import-PSSession $sfbSession
  ```

2. When prompted by the **New-CsOnlineSession** command, enter your Skype for Business Online administrator account name.

3. In the **Sign in to your account** dialog box, type your Skype for Business Online administrator password, and then click **Sign in**.

4. Follow the instructions in the **Sign in to your account** dialog box to provide additional authentication information, such as a verification code, and then click **Verify**.

For more information, see the following topics:
  
- [Manage Skype for Business Online policies with Office 365 PowerShell](manage-skype-for-business-online-policies-with-office-365-powershell.md)
    
- [Assign per-user Skype for Business Online policies with Office 365 PowerShell](assign-per-user-skype-for-business-online-policies-with-office-365-powershell.md)
    
## See also

[Manage Office 365 with Office 365 PowerShell](manage-office-365-with-office-365-powershell.md)
  
[Getting started with Office 365 PowerShell](getting-started-with-office-365-powershell.md)

[Skype for Business PowerShell cmdlet references](https://docs.microsoft.com/powershell/module/skype/?view=skype-ps)

