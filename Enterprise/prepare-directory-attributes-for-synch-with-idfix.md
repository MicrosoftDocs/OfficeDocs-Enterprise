---
title: "Prepare directory attributes for synchronization with Office 365 by using the IdFix tool"
ms.author: robmazz
author: robmazz
manager: laurawi
ms.date: 8/21/2018
ms.audience: Admin
ms.topic: article
ms.service: o365-administration
localization_priority: Normal
ms.custom: Adm_O365
ms.collection:
- Ent_O365
- M365-identity-device-management
search.appverid:
- MET150
- MOE150
ms.assetid: 497593cf-24c6-491c-940b-7c86dcde9de0
description: "Provides instructions on using IdFix to prepare and clean up your on-premises directory before synchronizing to Office 365."
---

# Prepare directory attributes for synchronization with Office 365 by using the IdFix tool
This topic contains detailed instructions about running the IdFix tool, some common errors you may encounter, suggested fixes, examples, and best practices for what to do if you have a large number of errors.
  
## Fixing errors in your directory by using the IdFix GUI
[Run the Office 365 IdFix tool](install-and-run-idfix.md) to search for problems in your directory and then fix the errors in the GUI as described in this topic. If a blank table is returned by the tool, then no errors were discovered. If there are a lot of problems in your directory, it can be overwhelming when the tool returns the errors. One way to tackle this is to fix all errors of one type first and then move on to the next type. 
  
1. Before you start making changes, take a look at the recommendations presented by IdFix.
    
2. Look over the list of errors that IdFix has returned. You can sort the errors by error type by clicking **ERROR** at the top of the column that lists the error types. If more than one error is associated with a single attribute, the errors are combined into one row. Where possible, IdFix presents a recommendation for a fix in the **UPDATE** column. The fix is based on a check of other attributes associated with an object. While these are usually better than what is already in the directory, only you can decide what is really accurate. 
    
3. If IdFix has a suggestion for a fix for a duplication error, the fix is identified by one of three flags at the start of the value in the **UPDATE** column, for example,  `[E]john.doe@contoso.com`. If you accept the suggestion, when you apply the change the flag will not be inserted in the directory. Only the value following the suggestion flag will be applied, for example,  `john.doe@contoso.com`. If you want to accept the suggestion, select the matching action from the **ACTION** column. The flags indicate actions as follows: 
    
 - **[C]** Suggested action **COMPLETE**. The value does not need to be edited.
    
 - **[E]** Suggested action **EDIT**. The value should be changed to avoid conflict with another value in the directory.
    
 - **[R]** Suggested action **REMOVE**. The value is an SMTP proxy on a non-mail enabled object and can probably be safely removed.
    
4. Once you've read and understood the errors, update the entry in the **UPDATE** column with your changes, and then in the **ACTION** column select what you want IdFix to do to implement the change. For example, two users may have a  `proxyAddress` identified as duplicate. Only one user can use the  `proxyAddress` for mail delivery. To fix this, mark the **ACTION** column **COMPLETE** for the user with the correct value, and mark the **ACTION** column **REMOVE** for the other user. This removes the  `proxyAddress` attribute from the user to whom this  `proxyAddress` doesn't belong and it makes no change to the user for whom this  `proxyAddress` is correct.
    
## Common errors and fixes detected by IdFix
The following table describes the errors that are detected by IdFix, provides the most commonly suggested fixes from the tool, and in some cases provides examples of how to fix them.

|**ERROR**|**Error Type Description**|**Suggested Fix**|**Example**|
|:-----|:-----|:-----|:-----|
|**character** | Illegal characters. The value contains a character which is invalid. | The suggested fix for the error shown in the **UPDATE** column shows the value with the invalid character removed.  <br/> | A trailing space at the end of a valid mail address is an illegal character, for example:  <br/> " `user@contoso.com` "  <br/> A leading space at the beginning of a valid mail address is an illegal character, for example:  <br/> " ` user@contoso.com `"  <br/>  The  `ú` character is an illegal character. |
|**duplicate** | Duplicate entry. The value has a duplicate within the scope of the query. All duplicate values will be displayed as errors. | Edit or remove values to eliminate duplication. The tool will not provide a suggested fix for duplicates. Instead, you must choose which of the two or more duplicates is the correct one and delete the duplicate entry or entries. ||
|**format** | Formatting error. The value violates the format requirements for the attribute usage. | The suggested Update will show the value with any invalid characters removed. If there are no invalid characters the Update and Value will appear the same. You need to determine what you really want in the Update. The tool will not provide a suggested fix for all formatting errors. | For example SMTP addresses must comply with RFC 2822 and mailNickName cannot start or end with a period. For more information about format requirements for directory attributes, see "Directory object and attribute preparation" in [Prepare to provision users through directory synchronization to Office 365](prepare-for-directory-synchronization.md). |
|topleveldomain  <br/> |Top level domain. This applies to values subject to [RFC 2822](https://go.microsoft.com/fwlink/p/?LinkId=401464) formatting. If the top level domain is not internet routable then this will be identified as an error. For example an SMTP address ending in .local is not internet routable and would cause this error. |Change the value to an internet routable domain such as  `.com` or  `.net`. | Change  `myaddress@fourthcoffee.local` to  `fourthcoffee.com` or another internet routable domain.  <br/> For instructions, see [How to prepare a non-routable domain (such as .local domain) for directory synchronization](prepare-a-non-routable-domain-for-directory-synchronization.md). |
|**domainpart** | Domain part error. This applies to values subject to RFC 2822 formatting. If the domain portion of the value is invalid and does not comply with RFC 2822 this will be generated. | Change the value to one that complies with RFC 2822. For example, make sure that it doesn't contain any spaces or illegal characters. | Change  `myaddress@fourth coffee.com` to  `myaddress@fourthcoffee.com`. |
|**domainpart_localpart** | Local-part error. This applies to values subject to RFC 2822 formatting. If the local-part of the value is invalid and does not comply with RFC 2822 this will be generated. |Change the value to one that complies with RFC 2822. For example, make sure that it doesn't contain any spaces or illegal characters. |Change  `my"work"address@fourthcoffee.com` to  `myworkaddress@fourthcoffee.com`. |
|**length** | Length error. The value violates the length limit for the attribute. This is most commonly encountered when the directory schema has been altered.  | The update suggested by IdFix will truncate the value to the acceptable length.  <br/> Be aware that this may produce undesired results. You should review the suggested fix and change it if necessary before you click **Apply**. ||
|**blank**  | Blank or null error. The value violates the null restriction for attributes to be synchronized. Only a few attributes must contain a value. | If possible, the suggested update will leverage other attribute values in order to generate a likely substitute. ||
|**mailmatch** | This applies to Office 365 Dedicated only. The value does not match the mail attribute. | The suggested update will be the mail attribute value prefixed by "SMTP:". ||
    
## Operations you can perform by using IdFix
To fix an error, you select an option from the **ACTION** drop-down list. The following table describes the **ACTION** operations you can perform on attributes using the IdFix tool. If you leave the **ACTION** column empty, the IdFix tool will not take any action on that specific error in the directory. 

|**ACTION**|**Action description**|**Example**|
|:-----|:-----|:-----|
|**COMPLETE** | The original value is acceptable and should not be changed despite being identified as an error. | Two users have a proxyAddress identified as duplicate. Only one can use the value for mail delivery. Mark the user with the correct value as **COMPLETE**. |
|**REMOVE** | The attribute value will be deleted from the source object. In the case of a multi-valued attribute, for example,  `proxyAddresses`, only the individual value shown will be deleted. | Two users have a proxyAddress identified as duplicate. Only one can use the value for mail delivery. Mark the user with the duplicate value as **REMOVE**. |
|**EDIT** | The information in the **UPDATE** column will be used to modify the attribute value. If a valid **UPDATE** value has been suggested by IdFix, then from the **ACTION** column, select **EDIT** and go on to the next error. If you don't like the suggestion, type a new one in the **UPDATE** column and then, from the **ACTION** column select **EDIT**. ||
|**UNDO** | This option is only available if you have restored from a transaction log. If you select **UNDO**, the attribute value will be restored to the original value. ||
|**FAIL** | This value is only returned if an **UPDATE** value has an unknown conflict with AD DS rules. In this case, you can edit the value in the **UPDATE** column again if you know what the failure is. It may be necessary to analyze the values in the object using ADSI Edit. For more information, see [ADSI Edit (adsiedit.msc)](https://go.microsoft.com/fwlink/p/?LinkId=401170). ||

After choosing an **ACTION** for an error or a batch of errors, click **Apply**. When you click **Apply**, the tool makes the changes in the directory. You can provide fixes for multiple errors before you click **Apply** and IdFix will change them all at the same time.

Run IdFix again to ensure that the fixes you made didn't introduce new errors. You can repeat these steps as many times as you need to. It's a good idea to go through the process a few times before you synchronize.
    
## Changing the rule set used by IdFix
By default, IdFix uses the Multi-Tenant rule set to test the entries in your directory. This is the right rule set for most Office 365= customers. However, if you are an Office 365 Dedicated or ITAR (International Traffic in Arms Regulations) customer, you can configure IdFix to use the Dedicated rule set instead. If you aren't sure what type of customer you are, you can safely skip this step. To set the rule set to Dedicated, click the gear icon in the menu bar and then click **Dedicated**.
  
## Changing the scope of the search used by IdFix
By default, IdFix searches the entire directory. If you want, you can configure the tool to search a specific subtree instead. To do this, in the menu bar, click the Filter icon and enter a valid subtree.
  
## Rolling back your changes by using the IdFix GUI
Each time you click **Apply** to apply changes, the IdFix tool creates a separate file called a transaction log that lists the changes you just made. You can use the transaction log to roll back just those changes that are in the most recent log in case you make a mistake. If you make a mistake while you are updating, you can undo the most recently applied changes by clicking **Undo**. When you click **Undo**, IdFix uses the transaction log to roll back just those changes that are in the most recent transaction log. For more information about using the transaction log, see [Reference: Office 365 IdFix transaction log](idfix-transaction-log.md).