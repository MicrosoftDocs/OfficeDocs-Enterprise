---
title: "Add a domain to a client tenancy with Windows PowerShell for Delegated Access Permission (DAP) partners"
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
ms.assetid: f49b4d24-9aa0-48a6-95dd-6bae9cf53d2c
description: "Summary: Use Windows PowerShell for Office 365 to add an alternate domain name to an existing customer tenant."
---

# Add a domain to a client tenancy with Windows PowerShell for Delegated Access Permission (DAP) partners

 **Summary:** Use Windows PowerShell for Office 365 to add an alternate domain name to an existing customer tenant.
  
You can create and associate new domains with your customer's tenancy with Windows PowerShell for Office 365 faster than using the Microsoft 365 admin center.
  
Delegated Access Permission (DAP) partners are Syndication and Cloud Solution Providers (CSP) Partners. They are frequently network or telecom providers to other companies. They bundle Office 365 subscriptions into their service offerings to their customers. When they sell an Office 365 subscription, they are automatically granted Administer On Behalf Of (AOBO) permissions to the customer tenancies so they can administer and report on the customer tenancies.
## What do you need to know before you begin?

UNRESOLVED_TOKEN_VAL(GENL_O365_PowerShell_BeforeYouBegin)
  
You also need the following information:
  
- You need the fully qualified domain name (FQDN) that your customer wants.
    
- You need the customer's **TenantId**.
    
- The FQDN must be registered with an Internet domain name service (DNS) registrar, such as GoDaddy. For more information on how to publically register a domain name, see [How to buy a domain name](https://go.microsoft.com/fwlink/p/?LinkId=532541).
    
- You need to know how to add a TXT record to the registered DNS zone for your DNS registrar. For more information on how to add a TXT record, see [Create DNS records at any DNS hosting provider for Office 365](https://go.microsoft.com/fwlink/p/?LinkId=532542). If those procedures don't work for you, you will need to find the procedures for your DNS registrar.
    
## Create domains

 Your customers will likely ask you to create additional domains to associate with their tenancy because they don't want the default <domain>.onmicrosoft.com domain to be the primary one that represents their corporate identities to the world. This procedure walks you through creating a new domain associated with your customer's tenancy.
  
> [!NOTE]
> To perform some of these operations, the partner administrator account you sign in with must be set to **Full administration** for the **Assign administrative access to companies you support** setting found in the details of the admin account in the Office 365 admin center. For more information on managing partner administrator roles, see[Partners: Offer delegated administration](https://go.microsoft.com/fwlink/p/?LinkId=532435). 
  
### Create the domain in Azure Active Directory

This command creates the domain in Azure Active Directory but does not associate it with the publicly registered domain. That comes when you prove that you own the publicly registered domain to Microsoft Office 365 for enterprises.
  
```
New-MsolDomain -TenantId <customer TenantId> -Name <FQDN of new domain>
```

### Get the data for the DNS TXT verification record

 Office 365 will generate the specific data that you need to place into the DNS TXT verification record. To get the data, run this command.
  
```
Get-MsolDomainVerificationDNS -TenantId <customer TenantId> -DomainName <FQDN of new domain>
```

This will give you output like:
  
 `Label: domainname.com`
  
 `Text: MS=ms########`
  
 `Ttl: 3600`
  
> [!NOTE]
> You will need this text to create the TXT record in the publicly registered DNS zone. Be sure to copy and save it. 
  
### Add a TXT record to the publically registered DNS zone

Before Office 365 will start accepting traffic that is directed to the publicly registered domain name, you must prove that you own and have administrator permissions to the domain. You prove you own the domain by creating a TXT record in the domain. A TXT record doesn't do anything in your domain, and it can be deleted after your ownership of the domain is established. To create the TXT records, follow the procedures at [Create DNS records at any DNS hosting provider for Office 365](https://go.microsoft.com/fwlink/p/?LinkId=532542). If those procedures don't work for you , you need to find the procedures for your DNS registrar.
  
Confirm the successful creation of the TXT record via nslookup. Follow this syntax.
  
```
nslookup -type=TXT <FQDN of registered domain>
```

This will give you output like:
  
 `Non-authoritative answer:`
  
 `FQDN of the registered domain`
  
 `text=MS=ms########`
  
### Validate domain ownership in Office 365

In this last step, you validate to Office 365 that you own the publically registered domain. After this step, Office 365 will begin accepting traffic routed to the new domain name. To complete the domain creation and registration process, run this command. 
  
```
Confirm-MsolDomain -TenantId <customer TenantId> -DomainName <FQDN of new domain>
```

This command won't return any output, so to confirm that this worked, run this command.
  
```
Get-MsolDomain -TenantId <customer TenantId> -DomainName <FQDN of new domain>
```

This will return something like this
  
||||
|:-----|:-----|:-----|
| `Name` <br/> | `Status` <br/> | `Authentication` <br/> |
| `FQDN of new domain` <br/> | `Verified` <br/> | `Managed` <br/> |
   
## See also

#### 

[Help for partners](https://go.microsoft.com/fwlink/p/?LinkID=533477)

