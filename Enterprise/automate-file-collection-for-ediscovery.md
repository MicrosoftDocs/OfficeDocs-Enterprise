---
title: "Automate file collection for eDiscovery"
ms.author: chrfox
author: chrfox
manager: laurawi
ms.audience: ITPro
ms.topic: article
ms.service: o365-solutions
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: 
ms.assetid: 8d751419-d81b-4eb7-a2e5-8b03ccbf670c
search.appverid:
- MET150
description: "Summary: Learn how to automate file collection from user computers for eDiscovery."
---

# Automate file collection for eDiscovery

 **Summary:** Learn how to automate file collection from user computers for eDiscovery.
  
All companies face the potential of lawsuits or other types of legal action. While legal departments work to reduce that exposure, litigation is a fact of business life. When a company faces legal action, they are required, through the process of legal discovery, to provide all relevant documentary materials to the court and to opposing counsel. 
  
eDiscovery is the process by which companies inventory, search, identify, preserve, filter, and make available the relevant documentary materials that exist in electronic form. SharePoint 2013, Exchange Server 2013, Lync Server 2013, SharePoint Online, and Exchange Online can hold large amounts of documentary content. Depending on the version, these products may support eDiscovery and in place holds (Lync via Exchange Server), making it easier for the legal teams to index, identify, hold, and filter the most relevant content for a given case.
  
Many documents are stored on users' (Custodians) local computers, not in a centralized location. This makes it essentially impossible for SharePoint 2013 to search, and if it can't be searched, it can't be included in eDiscovery. This solution shows you how to use logon scripts, System Center Orchestrator 2012 R2 and Windows PowerShell for Exchange Server to automate the identification and collection of documentary materials from users' computers.
  
## What this solution does

This solution uses a global security group, Group Policy, and a Windows PowerShell script to locate, inventory, and collect content and Outlook personal store (PST) files from users local computers to a hidden file share. From there, the PST files can be imported into either Exchange Server 2013 or Exchange Online. All files are then moved using a System Center Orchestrator 2012 R2 runbook to another file share in Microsoft Azure for long-term storage and indexing by SharePoint 2013. You then use eDiscovery centers in your on-premises SharePoint 2013 deployment or in SharePoint Online as you regularly would to perform eDiscovery. 
  
> [!IMPORTANT]
> This solution uses robocopy to copy files from custodian's computers to a centralized file share. Because robocopy does not copy files that are open or locked, any files, including PST files, that the custodian has open will not be collected. You will have to collect them manually. This solution does provide you with a list that explicitly identifies the files it cannot copy and the full path to each file. 
  
The following diagram walks you through all the steps and elements of the solution.
  
![Overview of Automated File Collection Solution](media/dbb447b5-c74c-4956-986c-10a1d047ac99.png)
  
|****Legend****||
|:-----|:-----|
|![magenta callout 1](media/000026a3-2bf0-4678-b468-ccb5f81da6f1.png)|Create a Group Policy object (GPO), and associate it with the collection logon script.  <br/> |
|![magenta callout 2](media/a31b11e2-3597-42a4-933e-b6af11ed6ef1.png)| Configure the GPO security filter to apply the GPO only to the Custodians group. <br/> |
|![magenta callout 3](media/3ced060c-daec-460d-a9b5-260a3dfcae36.png)|A Custodian logs on and the GPO runs, calling the collection logon script.  <br/> |
|![magenta callout 4](media/6f269d84-2559-49e3-b18e-af6ac94d0419.png)|The collection logon script inventories all locally attached drives on the Custodians computer, searching for the files you want, and recording their location.  <br/> |
|![magenta callout 5](media/4bf8898c-44ad-4524-b983-70175804eb85.png)|The collection logon script copies the inventoried files to a hidden file share on the staging server.  <br/> |
|![magenta call out 6](media/99589726-0c7e-406b-a276-44301a135768.png)| (Option A) Manually run the PST import script to import the collected PST files into Exchange Server 2013. <br/> |
|![magenta callout 7](media/ff15e89c-d2fd-4614-9838-5e18287d578b.png)|(Option B) Using the Office 365 Import tool and process, import the collected PST files into Exchange Online.  <br/> |
|![magenta callout 8](media/aaf3bd3d-9508-4aaf-a3af-44ba501da63a.png)|Move all collected files to an Azure file share for long term storage with the MoveToColdStorage System Center Orchestrator 2012 R2 runbook. <br/> |
|![magenta callout 9](media/b354642e-445e-4723-a84a-b41f7ac6e774.png)|Index the files in the cold storage file share with SharePoint 2013.  <br/> |
|![magenta callout 10](media/cebf7de5-7525-413b-9e52-638a4f8b2f74.png)|Perform eDiscovery on content in cold storage and in the on-premises Exchange Server 2013.  <br/> |
|![magenta callout 11](media/e59ab403-2f19-497a-92a5-549846dded66.png)|Perform eDiscovery on content in Office 365.  <br/> |
   
## Prerequisites

The configuration of this solution requires many elements, most of which you likely have in place and configured if you're thinking about eDiscovery. For the elements that you may not have or ones that require a specific configuration, we'll provide you with the links you need build out your base configuration. You must have the base configuration in place before you configure the solution itself.
  
### Base configuration

|**Element**|**Link**|
|:-----|:-----|
|Active Directory Domain Services (AD DS) domain  <br/> ||
|Internet connectivity from your on-premises network  <br/> ||
|SQL Server 2012 to support SharePoint 2013 and System Center Orchestrator 2012 R2  <br/> |[Deploying System Center Orchestrator - 2012](https://go.microsoft.com/fwlink/p/?LinkId=613503) <br/> |
| On-premises or Azure based SharePoint 2013 for eDiscovery (required for Option A) <br/> ||
|On-premises file share server for staging  <br/> ||
|On-premises Exchange Server 2013 for Option A PST import  <br/> |CU5 (15.913.22) is available at [CU5](https://go.microsoft.com/fwlink/p/?LinkId=613426).  <br/> |
|System Center Orchestrator 2012 R2  <br/> |[Deploying System Center Orchestrator - 2012](https://go.microsoft.com/fwlink/p/?LinkId=613503) <br/> |
|Office 365 (E3 Plan) with Exchange Online and SharePoint Online (required for Option B)  <br/> |To sign up for an Office 365 E3 subscription, see [Office 365 E3 subscription](https://go.microsoft.com/fwlink/p/?LinkId=613504).  <br/> |
|Azure subscription with a virtual machine  <br/> |To sign up for a Azure, see [Subscribe to Windows Azure](https://go.microsoft.com/fwlink/p/?LinkId=512010) <br/> |
|A VPN connection between your on-premises network and your Azure subscription  <br/> |To set up a VPN tunnel between your Azure subscription and your on-premises network, see [Connect an on-premises network to a Microsoft Azure virtual network](https://go.microsoft.com/fwlink/p/?LinkId=613507).  <br/> |
|SharePoint 2013 eDiscovery configured to search across SharePoint and Exchange Server 2013 and optionally Lync Server 2013  <br/> |To configure eDiscovery in this fashion, see [Configure eDiscovery in SharePoint Server 2013](https://go.microsoft.com/fwlink/p/?LinkId=613508) and[Test Lab Guide: Configure eDiscovery for an Exchange, Lync, SharePoint and Windows File Shares Test Lab](https://go.microsoft.com/fwlink/p/?LinkId=393130).  <br/> |
|eDiscovery in Office 365 for SharePoint Online and Exchange Online  <br/> |To configure eDiscovery in Office 365, see [Set up an eDiscovery Center in SharePoint Online](https://go.microsoft.com/fwlink/p/?LinkId=613628).  <br/> |
   
## Configure the environment

Now that you have the base configuration in place, you can move ahead to configuring the solution itself. 
  
### Staging file share

1. In the on-premises domain, create a global security group named Custodians.
    
2. Create a hidden file share for the files that are collected from Custodians computers. This should be on an on-premises server. For example, on a server called Staging, create a file share called Cases$. The **$** is required to make this a hidden share.
    
3. Set the following share permissions:
    
  - Custodians: Change, Read
    
  - Administrators: Full Control
    
  - Exchange Trusted Subsystem: Change, Read
    
4. Open the **Security** tab, add the Custodians group, and click **Advanced**. Set the following permissions for the Custodians group:
    
  - **Type: Deny**
    
  - **Applies to: This folder, subfolders and files**
    
5. Click **Advanced Permissions** and select the following:
    
  - **Read attributes**
    
  - **Read extended attributes**
    
  - **Read permissions**
    
6. Test access to the Cases$ file share by doing the following:
    
1. Add a user to the Custodians group.
    
2. Place a file in the Cases$ folder.
    
3. As the user, browse to the staging server, for example browse to the \\\\Staging share to see what shares are available. You shouldn't see the **Cases$** share listed.
    
4. Manually type the full path to the Cases$ share into Explorer. This should open the Cases$ share.
    
5. Try to open the file you previously placed in the share. This should fail.
    
### Logon script

1. Copy and paste this Windows PowerShell script into Notepad:
    
  ```
  # Automated file collection script
# Substantial error processing should be added for robust execution and troubleshooting opportunities
# All commented out write-hosts are for debugging only and are commented out for regular execution

# Functions 

Function CreateCaseFolder() {

#Check to see if case folder already exists
$CaseFolderCheck = Test-Path $CaseLocation

try {

    if (!$CaseFolderCheck) {
    # Case folder doesn't exist.  Create the case folder and the log file location
    # Write-Host -ForegroundColor Cyan "Creating Case Folder $CaseLocation"
    New-Item "$CaseLocation" -ItemType Directory -Force -ErrorAction SilentlyContinue
    # Write-Host -ForegroundColor Cyan "Creating Case Log Folder $CaseLogLocation"
    New-Item "$CaseLogLocation" -ItemType Directory -Force -ErrorAction SilentlyContinue
    # Write-Host -ForegroundColor Cyan "Creating Case PST folder $CasePSTLocation"
    New-Item "$CasePSTLocation" -ItemType Directory -Force -ErrorAction SilentlyContinue

    }
    else {

    # do nothing since the target case folder already exists

    }
}
catch [System.Exception] {

    # To do..
    # to log to an exception or log file
    
    }
}

Function CopyFileToCaseFolder($SourcePath, $TargetPath, $FileName) {
    
    # Check to see if the file already exists
    $TargetFileCheck = Test-Path $TargetPath\$FileName

try {

    if (!$TargetFileCheck) {
    # Copy the file to the case folder
    Write-Host $SourcePath $TargetPath $FileName
    robocopy "$SourcePath" "$TargetPath" "$FileName" /COPY:DATSO /TEE /LOG+:$LoggingFile /R:10 /W:10 | Out-Null

    }
    else {

    # do nothing since file is already in the target case folder

    }
}
catch [System.Exception] {

    # To do..
    # to log to an exception or log file
    
    }
}

# Global variable initializations

# Error log
$Loggederrors=@()

# The array to contain the file types we collect
$FileTypes = @("*.doc","*.docx","*.pst","*.txt")

# We'll set the case number to be a combination of the date and user name
# For example, a case for John Doe on Dec 14, 2014 at 2:38pm would be:
# 201412141438_jdoe
$CaseNo = get-date -Format yyyyMMddHHmm
$CaseNo = $CaseNo + "_" + [Environment]::UserName

# Target location to copy case files
$CaseRootLocation = "\\staging\Cases$" 

# File copy location, log file location, PST file location and temporary log file location
$CaseLocation = $CaseRootLocation + "\" + $CaseNo
$CaseLogLocation = $CaseRootLocation + "\" + $CaseNo + "\_Log"
$CasePSTLocation = $CaseRootLocation + "\" + $CaseNo + "\_PSTs"
$TemporaryLogLocation = [Environment]::getfolderpath('ApplicationData') + "\" + $CaseNo

# Inventory of local drives
$LocalDrives = Get-PSDrive -PSProvider FileSystem -Scope Global

$LoggingFile = "$CaseLogLocation\FileCopyErrors.log"

# Main script

# Create the case folder if it doesn't already exist
CreateCaseFolder

# Create the list of files to be copied
# First create the temporary directory in the AppData\Roaming folder
New-Item "$TemporaryLogLocation" -ItemType Directory -Force -ErrorAction SilentlyContinue
$LocalDrives | foreach {

    # Write-Host -ForeGroundColor Cyan "Collecting Files for Drive: " $_
    Get-ChildItem -Path $_.Root -Recurse -Include $FileTypes -ErrorAction SilentlyContinue -ErrorVariable +Loggederrors | Export-Clixml $TemporaryLogLocation\$_.xml -Force
    # Needs try catch and logged collection error file
}

# Now let's read each file and copy any files we need to the case folder
# We will also copy these XMLs to the case log files folder as we go along
# We only want to process XML files, just in case something else got in there as the script ran
$CaseDriveFiles = Get-ChildItem $TemporaryLogLocation -Filter '*.xml'
$CaseDriveFiles | foreach {
    # Copy the XML file to the case log location
    CopyFileToCaseFolder $_.Directory.FullName $CaseLogLocation $_.Name
    $DriveFile = $_.FullName
    # Write-Host -ForegroundColor Cyan "Copying Files specified in the XML file: $DriveFile"
    $CurrentDriveFile = Import-Clixml $DriveFile
    $CurrentDriveFile | foreach {
        # write-host $_.FullName
        # if it's a PST, add to the PSTs folder. otherwise add it to case folder
        if ($_.Extension -match '.PST')
        {
            CopyFileToCaseFolder $_.Directory.FullName $CasePSTLocation $_.Name
            write-host "this is a PST"
        }
        else
        {
            CopyFileToCaseFolder $_.Directory.FullName $CaseLocation $_.Name
        }
    }
}

# Now delete the temporary log file
Remove-Item $TemporaryLogLocation -Recurse 

Write-Host -ForegroundColor Cyan "Finished."

  ```

2. Save the above script as CollectionScript.ps1 in a location that's easy for you to find, for example, C:\\AFCScripts.
    
3. Use the Go To feature in Notepad. Make the following changes, as needed:
    
|**Line #**|**What you need to change**|**Required/optional**|
|:-----|:-----|:-----|
|71  <br/> |**$FileTypes** variable. Include all the file type extensions that you want the script to inventory and collect in the array variable. <br/> |Optional  <br/> |
|76 and 77  <br/> |Change the way the **$CaseNo** variable is built to suit your needs. The script captures the current date and time and appends the user name to it. <br/> |Optional  <br/> |
|80  <br/> |**$CaseRootLocation** variable needs to be set to your staging servers collection file share, for example **\\\\Staging\\Cases$**. <br/> |Required  <br/> |
   
4. Place the CollectionScript.ps1 file in the Netlogon file share on a domain controller. 
    
### Configure GPO for the logon script and Custodians Group

1. Configure a logon script for the Custodians group by following the "How to assign user logon scripts" section in the topic, [Using Startup, Shutdown, Logon, and Logoff Scripts in Group Policy](https://go.microsoft.com/fwlink/p/?LinkId=614844).
    
2. Remove authenticated users from **Security Filtering**, and add the Custodians group.
    
### PST import Option A, script for Exchange Server 2013

1.  Copy and paste the following Windows PowerShell script into Notepad:
    
  ```
  # Script to import all PSTs in a given folder to a target mailbox
#
# This is for on-prem Exchange only
# Input parameters
# When you run the script, you call it with two parameters, PST source path and target mailbox alias
# For example:  .\PSTImport.ps1 \\FileShare\PSTFiles jdoe

param ([String]$SourcePath,[String]$MailboxAlias)

# Folder identifier is the string we want to show in the mailbox that we import the PSTs to

$FolderIdentifier = "zzImportedPSTs_"

# Connect to Exchange remote powershell using the connection Uri below
# This would be the format http://<exchange server FQDN>/Powershell

$ConnectionUri = 'http://h10-exch/PowerShell'
$RemoteEx2013Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri $ConnectionUri -Authentication Kerberos
Import-PSSession $RemoteEx2013Session

# Get all the files in the source path

$AllFiles = Get-ChildItem $SourcePath -Recurse

# Go through each file and if it's a PST launch a mailbox import request for it

$AllFiles | ForEach-Object {
    If ($_.Extension -eq ".pst") {
        $ImportName = $MailboxAlias + "_" + $_.Name
        $FolderName = $FolderIdentifier + $_.Name
        New-MailboxImportRequest -Name $ImportName -Mailbox $MailboxAlias -FilePath $_.FullName -TargetRootFolder $FolderName
    }
}
  ```

2. Save the script as PSTImportScript.ps1 in a location that's easy for you to find. For example and ease of use, create a folder on your staging server called \\\\Staging\\AFCScripts, and save it there.
    
3. Use the Go To feature in Notepad, and make the following changes, as needed:
    
|**Line #**|**What you need to change**|**Required/optional**|
|:-----|:-----|:-----|
|12  <br/> |**$FolderIdentifier** tags the mailbox folders that PSTs are imported into. Change this if necessary. <br/> |Optional  <br/> |
|17  <br/> |**$ConnectionUri** needs to be set to your own server. <br/> > [!IMPORTANT]> Make sure your **$ConnectionUri** points to a http location, not https. It won't work with https:.          |Required  <br/> |
   
4. Verify that the Exchange Trusted Subsystem account has Read, Write, and Execute permissions to the \\\\Staging\\Cases$ share.
    
5. The PST import script requires the following two input parameters:
    
  - **$SourcePath** The location of the PST files to be imported, for example \\\\Staging\\Cases$.
    
  - **$MailboxAlias** The alias of the target mailbox that will receive the imported email items.
    
6. For example, if you want to import all the PST files from the path \\Staging\Cases$ into a mailbox with the alias eDiscoveryMailbox, you would run the script like this `\\staging\AFCscripts\PSTImportScript.ps1 \\Staging\cases$ eDiscoveryMailbox`.
    
### PST Import Option B, for Exchange Online

-  Create the mailbox structure to place the imported PST files into. For more information on how to create a user mailbox in Exchange Online, see[Create User Mailboxes in Exchange Online](https://go.microsoft.com/fwlink/p/?LinkId=615118).
    
### Cold storage

1. Create a file share on the Azure Virtual Machine, where all the collected files will be placed, for example, \\\\AZFile1\\ContentColdStorage.
    
2. Grant the default content access account at least Read permissions to the share and all subfolders and files. For more information about configuring SharePoint 2013 Search, see [Create and configure a Search service application in SharePoint Server 2013](https://go.microsoft.com/fwlink/p/?LinkId=614940).
    
3. If you anticipate importing PST files from \\\\AZFile1\\ContentColdStorage, grant the Exchange Trusted Subsystem Read, Write, and Execute permissions to the share.
    
### Orchestrator

1. Download the[ MoveToColdStorage runbook](https://go.microsoft.com/fwlink/?LinkId=616095) from the Microsoft Download Center.
    
2. Open the **Runbook Designer**, in the **Connections** pane, click the folder that you want to import the runbook into. Click the **Actions** menu, and the click **Import**. The **Import** dialog box appears.
    
3. In the **File Location** box, type the path and file name of the runbook you want to import, or click the ellipsis ( **...**) to browse to the file you want to import. 
    
4. Select **Import runbooks** and **Import Orchestrator encrypted data**. Clear **Counters**, **Schedules**, **Variables**, **Computer Groups**, **Import global configurations**, and **Overwrite existing global configurations**.
    
5. Click **Finish**.
    
6. Edit the **MoveFilesToColdStorage** runbook as follows:
    
1. **Move File** activity - set the **Source File** path to the collection file share, for example \\\\Staging\\cases$. Set the **Destination Folder** to the cold storage file share in Azure, for example \\\\AZFile1\\ContentColdStorage. Select **Create a file with a unique name**.
    
2. **Delete Folder** activity - Set the **Path:** to the collection file share, for example \\\\Staging\\cases$\\*, and select **Delete all files and sub-folders**. 
    
7. Deploy the **MoveToColdStorage** runbook using the procedures in[Deploying Runbooks](https://go.microsoft.com/fwlink/p/?LinkId=615120).
    
### SharePoint on-premises search for cold storage

1. Create an new content source in your SharePoint 2013 farm for the cold storage share in Azure, for example \\\\AZFile1\\ContentColdStorage. For more information about managing content sources, see [Add, edit, or delete a content source in SharePoint Server 2013](https://go.microsoft.com/fwlink/p/?LinkId=615004)
    
2. Start a full crawl. For more information see, [Start, pause, resume, or stop a crawl in SharePoint Server 2013](https://go.microsoft.com/fwlink/p/?LinkId=615005).
    
## Using the solution

There are five major steps in using this solution, assuming you don't want to import the PST files into both Exchange Server 2013 and Exchange Online. This section provides you with the procedures for all of them. Your primary interaction with the solution will be in doing the following:
  
1. Manage user membership in the Custodians group.
    
2. Review the log files generated by the logon script. The FileCopyErrors.log lists all the files that were not successfully copied. You need to decide what you want to do with them
    
3. Managing the PST import process.
    
4. Moving the collection files to cold storage.
    
All the other steps are not specific to this solution. They are standard administrative tasks that you perform in SharePoint 2013, and Office 365 and Azure. There are items that this solution does not provide any guidance that you will need to work out based on your company's needs, such as:
  
1. Tracking your eDiscovery cases, and which Custodians are associated with which case.
    
2. Tracking which sets of file collections are associate with which eDiscovery case.
    
3. Coordinating the timing of the Import and move to cold storage steps.
    
4. Managing the file space used in Azure.
    
5. Managing the mailboxes that PSTs are imported into.
    
6. Backup and restoration of all on-premises data.
    
### Custodian management

- To start the automated file collection process for an individual user, add them to the Custodians group. The next time that the user logs on, the logon script assigned to the Custodians group through Group Policy will run. 
    
### Monitor collected files and review log files

1. Watch the collection file share, for example \\\\Staging\\cases$\\*, for the collection folder from the user. The name of the folder will be formatted like this:  *yyyyMMddHHmm_UserName*  .
    
2. When the collection is completed, open the collection folder, and browse to the _Log folder. In the _Log folder, you will see the following:
    
  - One XML file for every local drive on the user's computer, for example **A.xml**, **C.xml**. These files contain the inventory drives that they are named after, and they are used for the robocopy operation.
    
    > [!NOTE]
    > The collection script will only create an entry in the inventory file for the file types that you defined in the script itself. It will not create an inventory entry for every file on the user's computer. 
  
  - One log file named FileCopyErrors.log for each collection run. This file contains a listing of the files that robocopy could not copy to the file collection share, for example, \\\\Staging\\cases$\\*. You will need to review this and decide what actions to take for these missed files. Usually, you either need to collect them manually if you want them, or you may decide that they are not required and can therefore be omitted from the collection.
    
### PST import option A for Exchange Server 2013

1. Log on to the server that hosts the collection file share, for example **Staging**, and open Windows PowerShell. For more information about starting Windows PowerShell, see[Starting Windows PowerShell on Windows Server](https://go.microsoft.com/fwlink/p/?LinkId=615115).
    
2. Set the Execution policy to Unrestricted . Type  `Set-ExecutionPolicy Unrestricted -Scope Process` into Windows PowerShell, and press Enter.
    
3. Run the PSTImportScript.ps1 file, and provide the **$SourcePath** and **$MailboxAlias** parameters. For more information about running Windows PowerShell scripts, see[Running Scripts](https://go.microsoft.com/fwlink/p/?LinkID=615117).
    
4. Review the output for errors.
    
5. Before you attempt to import an identically named PST file into the same mailbox, you have to remove the mailbox import request. Run the following command to do that:  `Get-MailboxImportRequest | Remove-MailboxImportRequest`. You will be prompted to remove each individual request from the queue. Respond as needed.
    
### PST import option B, for Exchange Online

- To place the collected PST files into Exchange Online, follow the procedures in the Import files into Office 365 through the network upload section of [Office 365 Import Service](https://go.microsoft.com/fwlink/p/?LinkId=614938).
    
### Move to cold storage

1. Run the **MoveToColdStorage** runbook using the procedures in[Running Runbooks](https://go.microsoft.com/fwlink/p/?LinkId=615123).
    
2. Watch the Azure file share you are using for long term storage, for example \\\\AZFile1\\ContentColdStorage and the on-premises collection file share, for example \\\\Staging\\cases$. You should see the files and folders appear in the cold storage file share and disappear from the collection file share.
    
### eDiscovery

1. Either allow the full crawl of the cold storage file share to run as schedules, or initiate a crawl. For more information on starting full or incremental crawls, see [Start, pause, resume, or stop a crawl in SharePoint Server 2013](https://go.microsoft.com/fwlink/p/?LinkId=615005).
    
2. Create an eDiscovery case in SharePoint 2013 if you used option A for a PST file import or create an eDiscovery case in SharePoint Online if you used option B.
    

