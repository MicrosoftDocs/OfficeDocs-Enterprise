---
title: "Use PowerShell to perform an IMAP migration to Office 365"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 12/15/2017
audience: Admin
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: 
ms.assetid: c28de4a5-1e8e-4491-9421-af066cde7cdd
description: "Summary: Learn how to use Windows PowerShell to perform an IMAP migration to Office 365."
---

# Use PowerShell to perform an IMAP migration to Office 365

 **Summary:** Learn how to use Windows PowerShell to perform an IMAP migration to Office 365.
  
As part of the process of deploying Office 365, you can choose to migrate the contents of user mailboxes from an Internet Mail Access Protocol (IMAP) email service to Office 365. This article walks you through the tasks for an email IMAP migration by using Exchange Online PowerShell. 
  
> [!NOTE]
> You can also use the Exchange admin center to perform an IMAP migration. See [Migrate your IMAP mailboxes to Office 365](https://go.microsoft.com/fwlink/p/?LinkId=536685). 
  
## What do you need to know before you begin?

Estimated time to complete this task: 2-5 minutes to create a migration batch. After the migration batch is started, the duration of the migration will vary based on the number of mailboxes in the batch, the size of each mailbox, and your available network capacity. For information about other factors that affect how long it takes to migrate mailboxes to Office 365, see [Migration Performance](https://go.microsoft.com/fwlink/p/?LinkId=275079).
  
You need to be assigned permissions before you can perform this procedure or procedures. To see what permissions you need, see the "Migration" entry in a table in the [Recipients Permissions](https://go.microsoft.com/fwlink/p/?LinkId=534105) topic.
  
To use the Exchange Online PowerShell cmdlets, you need to sign in and import the cmdlets into your local Windows PowerShell session. See [Connect to Exchange Online using remote PowerShell](https://go.microsoft.com/fwlink/p/?LinkId=534121) for instructions.
  
For a full list of migration commands, see [Move and migration cmdlets](https://go.microsoft.com/fwlink/p/?LinkId=534750).
  
The following restrictions apply to IMAP migrations:
  
- Only items in a user's inbox or other mail folders can be migrated. You can't migrate contacts, calendar items, or tasks.
    
- A maximum of 500,000 items can be migrated from a user's mailbox.
    
- The maximum message size that can be migrated is 35 MB.
    
## Migration steps

### Step 1: Prepare for an IMAP migration
<a name="BK_Step1"> </a>

- **If you have a domain for you IMAP organization, add it as an accepted domain of your Office 365 organization.** If you want to use the same domain you already own for your Office 365 mailboxes, you first have to add it as an accepted domain to Office 365. After you have added it, you can create your users in Office 365. For more information, see[Verify your domain in Office 365](https://go.microsoft.com/fwlink/p/?LinkId=534110).
    
- **Add each user to Office 365 so that they have an Office 365 mailbox.** For instructions, see[Add users to Office 365 for business](https://go.microsoft.com/fwlink/p/?LinkId=535065).
    
- **Obtain the FQDN of the IMAP server**. You need to provide the fully qualified domain name (FQDN) (also called the full computer name) of the IMAP server that you will migrate mailbox data from when you create an IMAP migration endpoint. Use an IMAP client or the PING command to verify that you can use the FQDN to communicate with the IMAP server over the Internet.
    
- **Configure the firewall to allow IMAP connections**. You might have to open ports in the firewall of the organization that hosts the IMAP server so network traffic originating from the Microsoft datacenter during the migration is allowed to enter the organization that hosts the IMAP server. For a list of IP addresses used by Microsoft datacenters, see [Exchange Online URLs and IP Address Ranges](https://go.microsoft.com/fwlink/p/?LinkId=535066).
    
- **Assign the administrator account permissions to access mailboxes in your IMAP organization**. If you use administrator credentials in the CSV file, the account that you use must have the necessary permissions to access the on-premises mailboxes. The permissions required to access user mailboxes is determined by the particular IMAP server. 
    
- **To use the Exchange Online PowerShell cmdlets**, you need to sign in and import the cmdlets into your local Windows PowerShell session. See [Connect to Exchange Online using remote PowerShell](https://go.microsoft.com/fwlink/p/?LinkId=534121) for instructions.
    
    For a full list of migration commands, see [Move and migration cmdlets](https://go.microsoft.com/fwlink/p/?LinkId=534750).
    
- **Verify that you can connect to your IMAP server**. Run the following command in Exchange Online PowerShell to test the connection settings to your IMAP server.
    
  ```
  Test-MigrationServerAvailability -IMAP -RemoteServer <FQDN of IMAP server> -Port <143 or 993> -Security <None, Ssl, or Tls>
  ```

    For the value of the **Port** parameter, it's typical to use 143 for unencrypted or Transport Layer Security (TLS) connections and to use 993 for SSL connections.
    
### Step 2: Create a CSV file for an IMAP migration batch
<a name="BK_Step2"> </a>

Identify the group of users whose mailboxes you want to migrate in an IMAP migration batch. Each row in the CSV file contains information necessary to connect to a mailbox in the IMAP messaging system.
  
Here are the required attributes for each user: 
  
- **EmailAddress** specifies the user ID for the user's Office 365 mailbox.
    
- **UserName** specifies the logon name for the account to use to access the mailbox on the IMAP server.
    
- **Password** specifies the password for the account in the **UserName** column.
    
Here's an example of the format for the CSV file. In this example, three mailboxes are migrated:
  
```
EmailAddress,UserName,Password
terrya@contoso.edu,terry.adams,1091990
annb@contoso.edu,ann.beebe,2111991
paulc@contoso.edu,paul.cannon,3281986
```

For the **UserName** attribute, in addition to the user name, you can use the credentials of an account that has been assigned the necessary permissions to access mailboxes on the IMAP server, the following are some of the specific formats used for some of the IMAP servers:
  
 **Microsoft Exchange:**
  
If you're migrating email from the IMAP implementation for Microsoft Exchange, use the format **Domain/Admin_UserName/User_UserName** for the **UserName** attribute in the CSV file. Let's say you're migrating email from Exchange for Terry Adams, Ann Beebe, and Paul Cannon. You have a mail administrator account, where the user name is **mailadmin** and the password is **P@ssw0rd**. Here's what your CSV file would look like:
  
```
EmailAddress,UserName,Password
terrya@contoso.edu,contoso-students/mailadmin/terry.adams,P@ssw0rd
annb@contoso.edu,contoso-students/mailadmin/ann.beebe,P@ssw0rd
paulc@contoso.edu,contoso-students/mailadmin/paul.cannon,P@ssw0rd
```

 **Dovecot:**
  
For IMAP servers that support Simple Authentication and Security Layer (SASL), such as a Dovecot IMAP server, use the format **User_UserName*Admin_UserName**, where the asterisk ( * ) is a configurable separator character. Let's say you're migrating those same users' email from a Dovecot IMAP server using the administrator credentials **mailadmin** and **P@ssw0rd**. Here's what your CSV file would look like:
  
```
EmailAddress,UserName,Password
terrya@contoso.edu,terry.adams*mailadmin,P@ssw0rd
annb@contoso.edu,ann.beebe*mailadmin,P@ssw0rd
paulc@contoso.edu,paul.cannon*mailadmin,P@ssw0rd
```

 **Mirapoint:**
  
If you're migrating email from Mirapoint Message Server, use the format **#user@domain#Admin_UserName#** for the administrator credentials. To migrate email from Mirapoint using the administrator credentials **mailadmin** and **P@ssw0rd**, your CSV file would look like this:
  
```
EmailAddress,UserName,Password
terrya@contoso.edu,#terry.adams@contoso-students.edu#mailadmin#,P@ssw0rd
annb@contoso.edu,#ann.beebe@contoso-students.edu#mailadmin#,P@ssw0rd
paulc@contoso.edu,#paul.cannon@contoso-students.edu#mailadmin#,P@ssw0rd
```

 **Courier IMAP:**
  
Some source email systems, such as Courier IMAP, don't support using mailbox admin credentials to migrate mailboxes to Office 365. Instead, you can set up your source email system to use virtual shared folders. By using virtual shared folders, you can use the mailbox admin credentials to access user mailboxes on the source email system. For more information about how to configure virtual shared folders for Courier IMAP, see [Shared Folders](https://go.microsoft.com/fwlink/p/?LinkId=398870).
  
To migrate mailboxes after you set up virtual shared folders on your source email system, you have to include the optional attribute **UserRoot** in the migration file. This attribute specifies the location of each user's mailbox in the virtual shared folder structure on the source email system. For example, the path to Terry's mailbox is /users/terry.adams.
  
Here's an example of a CSV file that contains the **UserRoot** attribute:
  
```
EmailAddress,UserName,Password,UserRoot
terrya@contoso.edu,mailadmin,P@ssw0rd,/users/terry.adams
annb@contoso.edu,mailadmin,P@ssw0rd,/users/ann.beebe
paulc@contoso.edu,mailadmin,P@ssw0rd,/users/paul.cannon
```

### Step 3: Create an IMAP migration endpoint
<a name="BK_Step3"> </a>

To migrate email successfully, Office 365 needs to connect to and communicate with the source email system. To do this, Office 365 uses a migration endpoint. The migration endpoint also defines the number of mailboxes to migrate simultaneously and the number of mailboxes to synchronize simultaneously during incremental synchronization, which occurs once every 24 hours. To create a migration end point for IMAP migration, first [connect to Exchange Online](https://go.microsoft.com/fwlink/p/?LinkId=534121). 
  
For a full list of migration commands, see [Move and migration cmdlets](https://go.microsoft.com/fwlink/p/?LinkId=534750).
  
To create the IMAP migration endpoint called "IMAPEndpoint" in Exchange Online PowerShell, run the following command:
  
```
New-MigrationEndpoint -IMAP -Name IMAPEndpoint -RemoteServer imap.contoso.com -Port 993 -Security Ssl

```

You can also add parameters to specify concurrent migrations, concurrent incremental migrations, and the port to use. The following Exchange Online PowerShell command creates an IMAP migration endpoint called "IMAPEndpoint" that supports 50 concurrent migrations and up to 25 concurrent incremental synchronizations. It also configures the endpoint to use port 143 for TLS encryption.
  
```
New-MigrationEndpoint -IMAP -Name IMAPEndpoint -RemoteServer imap.contoso.com -Port 143 -Security Tls -MaxConcurrentMigrations
50 -MaxConcurrentIncrementalSyncs 25
```

For more information about the **New-MigrationEndpoint** cmdlet, see[New-MigrationEndpoint](https://go.microsoft.com/fwlink/p/?LinkId=536437).
  
#### Verify it worked

Run the following command in Exchange Online PowerShell to display information about the "IMAPEndpoint":
  
```
Get-MigrationEndpoint IMAPEndpoint | Format-List EndpointType,RemoteServer,Port,Security,Max*
```

### Step 4: Create and start an IMAP migration batch
<a name="BK_Step4"> </a>

You can use the [New-MigrationBatch](https://go.microsoft.com/fwlink/p/?LinkId=536439) cmdlet to create a migration batch for an IMAP migration. You can create a migration batch and start it automatically by including the _AutoStart_ parameter. Alternatively, you can create the migration batch and then start it afterwards by using the[Start-MigrationBatch](https://go.microsoft.com/fwlink/p/?LinkId=536440) cmdlet.
  
The following Exchange Online PowerShell command will automatically start the migration batch called "IMAPBatch1" using the IMAP endpoint called "IMAPEndpoint":
  
```
New-MigrationBatch -Name IMAPBatch1 -SourceEndpoint IMAPEndpoint -CSVData ([System.IO.File]::ReadAllBytes("C:\Users\Administrator\Desktop\IMAPmigration_1.csv")) -AutoStart
```

#### Verify it worked

Run the [Get-MigrationBatch](https://go.microsoft.com/fwlink/p/?LinkId=536441) cmdlet to display information about the "IMAPBatch1":
  
```
Get-MigrationBatch -Identity IMAPBatch1 | Format-List
```

You can also verify that the batch has started by running the following command:
  
```
Get-MigrationBatch -Identity IMAPBatch1 | Format-List Status
```

### Step 5: Route your email to Office 365
<a name="BK_Step5"> </a>

Email systems use a DNS record called an MX record to figure out where to deliver emails. During the email migration process, your MX record was pointing to your source email system. Now that the email migration to Office 365 is complete, it's time to point your MX record at Office 365. This helps make sure that email is delivered to your Office 365 mailboxes. By moving the MX record, you can also turn off your old email system when you're ready. 
  
For many DNS providers, there are specific instructions to [change your MX record](https://go.microsoft.com/fwlink/p/?LinkId=279163). If your DNS provider isn't included, or if you want to get a sense of the general directions, [general MX record instructions ](https://go.microsoft.com/fwlink/?LinkId=397449) are provided as well.
  
It can take up to 72 hours for the email systems of your customers and partners to recognize the changed MX record. Wait at least 72 hours before you proceed to the next task: Step 6: Delete IMAP migration batch. 
  
### Step 6: Delete IMAP migration batch
<a name="BK_Step6"> </a>

After you change the MX record and verify that all email is being routed to Office 365 mailboxes, notify the users that their mail is going to Office 365. After this, you can delete the IMAP migration batch. Verify the following before you delete the migration batch.
  
- All users are using Office 365 mailboxes. After the batch is deleted, mail sent to mailboxes on the on-premises Exchange Server isn't copied to the corresponding Office 365 mailboxes.
    
- Office 365 mailboxes were synchronized at least once after mail began being sent directly to them. To do this, make sure that the value in the Last Synced Time box for the migration batch is more recent than when mail started being routed directly to Office 365 mailboxes.
    
To delete the "IMAPBatch1" migration batch from Exchange Online PowerShell, run the following command:
  
```
Remove-MigrationBatch -Identity IMAPBatch1
```

For more information about the **Remove-MigrationBatch** cmdlet, see[Remove-MigrationBatch](https://go.microsoft.com/fwlink/p/?LinkId=536481).
  
#### Verify it worked

Run the following command in Exchange Online PowerShell to display information about the "IMAPBatch1":
  
```
Get-MigrationBatch IMAPBatch1"
```

The command will return either the migration batch with a status of **Removing**, or it will return an error stating that migration batch couldn't be found, verifying that the batch was deleted.
  
For more information about the **Get-MigrationBatch** cmdlet, see[Get-MigrationBatch](https://go.microsoft.com/fwlink/p/?LinkId=536441).
  
## See also

#### 

[IMAP Migration Troubleshooter](https://go.microsoft.com/fwlink/p/?LinkId=536482)

