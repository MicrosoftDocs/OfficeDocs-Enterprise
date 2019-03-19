---
title: "Aggregate customer reporting data via Windows PowerShell for Delegated Access Permission (DAP) partners"
ms.author: chrfox
author: chrfox
manager: laurawi
ms.audience: Admin
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.collection: 
- Ent_O365
- M365-subscription-management
ms.custom: 
ms.assetid: 0f946b46-200a-4bdd-9b1b-019a554ddcc6
description: "Summary: Use Windows PowerShell for Office 365 to retrieve reports on all customer tenancies and aggregate the data into a single location."
---

# Aggregate customer reporting data via Windows PowerShell for Delegated Access Permission (DAP) partners

 **Summary:** Use Windows PowerShell for Office 365 to retrieve reports on all customer tenancies and aggregate the data into a single location.
  
By default, Windows PowerShell for Office 365 does not have a built-in aggregation of reporting data from multiple customer tenancies. However, you can use this sample Windows PowerShell for Office 365 script to iterate through all your customer tenancies to retrieve a single report for each of your customers and then aggregate the reporting data into a single location. The result is that you'll have a single report for all your customer tenants. 
  
Delegated Access Permission (DAP) partners are Syndication and Cloud Solution Providers (CSP) Partners. They are frequently network or telecom providers to other companies. They bundle Office 365 subscriptions into their service offerings to their customers. When they sell an Office 365 subscription, they are automatically granted Administer On Behalf Of (AOBO) permissions to thecustomer tenancies so they can administer and report on the customer tenancies.
## Before you begin

To use this script, substitute your particular values in for these variables:
  
- **$UserName** - This is your partner administrator user name. These credentials will be used to connect to all your customer tenancies.
    
- **$OutputFile** - This is the comma-separated value file that reporting data will be aggregated to.
    
- **$ErrorFile** - This is the text log file for errors.
    
- **$ScriptBlock** - This sample script uses **Get-MailboxActivityReport** and parameters (such as start and end dates) so you have a way to get started. If you want other reports, substitute the report name that you want and necessary parameters for **Get-MailboxActivityReport**.
    
- Open a remote Windows PowerShell session to Exchange Online by using the steps in [Connect to Exchange Online tenants with remote Windows PowerShell for Delegated Access Permissions (DAP) partners](connect-to-exchange-online-tenants-with-remote-windows-powershell-for-delegated.md)
    
## Use Windows PowerShell to aggregate customer tenant reports to a single location

1. Copy and paste this script into Notepad.
    
  ```
  # Import the MSOnline module to allow connectivity to Office 365.

Import-Module MSOnline

# This is the partner admin user name to be used to run the report.

$UserName = "admin@contoso.onmicrosoft.com"

# These are the locations for the report output and error log.

$OutputFile = ".\ReportOutput.csv"

$ErrorFile = ".\Errors.txt"

# This is the report to run and all the necessary parameters.

$ScriptBlock = {Get-MailboxActivityReport -ReportType Daily -StartDate 03/18/2015 -EndDate 03/18/2015}

$LinesToSkip = 0

# This is the prompt for the password of the partner admin user name.

$Cred = get-credential -Credential $UserName

# Establish a Windows PowerShell session with Office 365.

Connect-MsolService -Credential $Cred

# Get all the contracts for the signed-in partner.  
# Contracts define the AOBO/DAP relationship between the partner and the customers.

$Contracts = Get-MsolPartnerContract -All

Write-Host "Found $($Contracts.Count) customers for this Partner."

# For each of the contracts (customers), run the specified report and output the information.

foreach ($c in $contracts) { 

    # Get the initial domain for the customer.

    $InitialDomain = Get-MsolDomain -TenantId $c.TenantId | Where {$_.IsInitial -eq $true}

    # Construct the URL with the DelegatedOrg parameter.
    
    $DelegatedOrgURL = "https://ps.outlook.com/powershell-liveid?DelegatedOrg=" + $InitialDomain.Name
        
    Write-Host "Running report for $($InitialDomain.Name)"

    # Invoke-Command establishes a Windows PowerShell session based on the URL,
    # runs the command, and closes the Windows PowerShell session.
    
    $ReportInfo = Invoke-Command -ConnectionUri $DelegatedOrgURL -Credential $Cred -Authentication Basic -ConfigurationName Microsoft.Exchange -AllowRedirection -ScriptBlock $ScriptBlock -HideComputerName

    # If Invoke-Command returned information (that is, it's not NULL), format and output the information.
    
    If ($ReportInfo) {

        Write-Host "Writing report information for $($InitialDomain.Name) to $OutputFile"  -foregroundcolor green

        # Convert the report data to CSV format.
        # For the first time, don't skip any lines, so include the header.
        # For all other times, skip the first line (so don't rewrite the header).
        
        $OutputInfo = $ReportInfo |  ConvertTo-CSV -NoTypeInformation | Select -Skip $LinesToSkip

        Out-File $OutputFile -InputObject $OutputInfo -Append

        $LinesToSkip = 1

    } else {

        # If Invoke-Command didn't return and report data, log an error.
        
        Write-Host "No report information for $($InitialDomain.Name)." -foregroundcolor yellow
           
        Out-File $ErrorFile  -InputObject @("No report information for $($InitialDomain.Name).") -Append
    }

}

  ```

2. Save the script as GetMailboxActivityReport.ps1 in a location that's easy for you to find. For the example, the file is saved in C:\\O365 Scripts. 
    
3. Run the script in remote Windows PowerShell by following this syntax.
    
  ```
  &amp; "C:\O365 Scripts\GetMailboxActivityReport.ps1"
  ```

This sample script places the aggregated report in the ReportOutput.csv file.
  
## See also

#### 

[Help for partners](https://go.microsoft.com/fwlink/p/?LinkID=533477)
  
[Office 365 Reporting web service](https://go.microsoft.com/fwlink/p/?LinkId=532777)
  
[Reporting cmdlets in Exchange Online](https://go.microsoft.com/fwlink/p/?LinkId=526430)

