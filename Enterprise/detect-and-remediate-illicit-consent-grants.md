---
title: "How to Detect and Remediate Illicit Consent Grants in Office 365"
ms.author: chrfox
author: chrfox
manager: laurawi
ms.date: 4/23/2018
ms.audience: ITPro
ms.topic: article
ms.collection:o365_security_incident_response
ms.service: o365-solutions
localization_priority: Normal
ms.custom: 
ms.assetid:

description: "Learn how to recognize and remediate the Illicit Consent Grants attack in Office 365."
---
## What is the Illicit Consent Grant attack in Office 365?
In an Illicit Consent Grant attack, the attacker creates an Azure registered application that requests access to data such as contact information, email, or documents. The attacker then tricks an end user into granting that application consent to access their data either through a phishing attack, or by injecting illicit code into a trusted website. After the illicit application has been granted consent, it has account-level access to data without the need for an organizational account. Normal remediation steps, like resetting passwords for breached accounts or requiring MFA on accounts, are not effective against this type of attack, since these are third-party applications and are external to the organization. These attacks leverage an interaction model which presumes the entity that is calling the information is automation and not a human.

## What does an Illicit Consent Grant attack look like in Office 365?
You need to search the Office 365 Audit log to find signs, also called Indicators of Compromise (IOC)of this attack. For organizations with many Azure registered applications and a large user base, the best practice is to review your organizations consent grants on a weekly basis.
### Steps
1. Open the Security and Compliance Center in your Office 365 tenant
2. Navigate to the Search & investigation node and select Audit log search
3. Create a search (all activities and all users) and filter the results for these two activities:
    a. Consent to application
    b. Add OAuth2PermissionGrant
4. Examing the Extended Properties and check to see if IsAdminContent is set to True


If this value is true, it indicates that someone with Global Administrator access may have granted broad access to data. If this is unexpected, take steps to [confirm an attack](detect-and-remediate-illicit-consent-grants.md#confirmattack).

<a name="confirmattack"> </a>
## How to confirm an attack
If you have one or more instances of the IOCs  listed above, you need to do further investigation to positively confirm that the attack occurred. You can use any of these three methods to confirm the attack.
- Inventory applications and their permissions using the Azure Active Directory portal. This method is thorough, but you can only check one user at a time which can be very time consuming if you have many users to check.
- Inventory  applications and their permissions using PowerShell. This is the fastest and most thorough method, with the least amount of overhead.
- Have your users individually check their apps and permissions and report the results back to the administrators for remediation.

## Inventory apps with access in your organization
You can do this for your users with either the Azure Active Directory Portal, or PowerShell or have your users individually enumerate their application access.

### Steps for using the Azure Active Directory Portal
You can look up the applications to which any individual user has granted permisssions by using the [Azure Active Directory Portal](https://portal.azure.com/) 
1. **Sign in** to the Azure Portal with administrative rights.
2. Select the Azure Active Directory blade.
3. Select the **Users**.
4. Select the user that you want to review.
5. Select **Applications**

This will show you the apps that are assigned to the user and what permissions they have.

### Steps for having you users individually enumerate their application access
Have your users go to https://myapps.microsoft.com and review their own application access there. They should be able to see all the apps with access, view details about them (including the scope of access), and be able to revoke privileges to suspicious or illicit apps.

### Steps for doing this with PowerShell
The simplest way to verify the Illicit Consent Grant attack is to run the Get-AzureADPSPermissions.ps1, which will dump all the OAuth consent grants and app permissions for all users in your tenancy into one .csv files. 
- 	https://gist.github.com/psignoret/41793f8c6211d2df5051d77ca3728c09


***INSERTION POINT***

n order to signal a match on this rule. Or remove keywords that are causing false positives.

    3.  Confidence modifications — Modify the confidence with which the sensitive information type must match the criteria specified in its definition before a match is signaled and reported.

7.  Upload the new sensitive information type.

8.  Recrawl your content to identify the sensitive information. See [Manually request crawling and re-indexing of a site](https://support.office.com/en-us/article/Manually-request-crawling-and-re-indexing-of-a-site-a-library-or-a-list-9AFA977D-39DE-4321-B4CA-8C7C7E6D264E).

## Example: modify the ‘EU Debit Card Number’ sensitive information type

Improving the accuracy of DLP rules in any system requires testing against a sample data set, and may require fine tuning through repetitive modifications and tests. This example demonstrates modifications to the ‘EU Debit Card Number’ sensitive information type to improve its accuracy.

When searching for an EU Debit Card Number in our example, the definition of that number is strictly defined as 16 digits using a complex pattern, and being subject to the validation of a checksum. We cannot alter this pattern due to the string definition of this sensitive information type. However, we can make the following adjustments to improve the accuracy of how Office 365 DLP finds this sensitive information type within Office 365.

### Proximity modification

We'll shrink the window by modifying the patternProximity value in our \<Entity\> element from 300 to 150 characters. This means that our corroborative evidence, or our keywords, must be closer to our sensitive information type in order to signal a match on this rule.

\<Entity id="48da7072-821e-4804-9fab-72ffb48f6f78" patternsProximity="150" recommendedConfidence="85"\>

### Keyword modifications

Some keywords might cause false positives to occur. As a result you might want to remove keywords. Here are the keywords for this example::

\<Keyword id="Keyword\_card\_terms\_dict"\>

\<Group\>

\<Term\>corporate card\</Term\>

\<Term\>organization card\</Term\>

\<Term\>acct nbr\</Term\>

\<Term\>acct num\</Term\>

\<Term\>acct no\</Term\>

…

\</Group\>

\</Keyword\>

### Confidence modifications

If you remove keywords from the definition, you would typically want to adjust how confident you are that this sensitive information type was found by lowering this value. The default level for EU Debit Card Number type is 85.

\<Entity id="48da7072-821e-4804-9fab-72ffb48f6f78" patternsProximity="150" recommendedConfidence="85"\>

\<Pattern confidenceLevel="85"\>

…

\</Pattern\>

\</Entity\>

## Create a new custom sensitive information type

To create a new custom sensitive information type, start by using Content Search to:

-   Optimize a KQL query

-   See which keywords are most useful

Use these results to create a new sensitive information type. Then optimize the new sensitive information type for your environment.

Note: Many new sensitive information types are coming soon for personal data in EU countries. If you need to create new sensitive information types, begin by targeting data that is custom to your environment.

### Step 1 — Use KQL queries and key words to find additional data in your environment

You might need to create additional queries to find personal data that is subject to GDPR. Content Search uses Keyword Query Language (KQL) to find data. Most sensitive data can’t be accurately detected using just KQL without sensitive information types. So the goal is to test and optimize KQL strings using Content Search and then use these to create and tune new sensitive information types where you can achieve even greater accuracy.

Use these resources to formulate and optimize queries using KQL:

-   [Keyword Query Language (KQL) syntax reference (DMC)](https://docs.microsoft.com/en-us/sharepoint/dev/general-development/keyword-query-language-kql-syntax-reference)

-   [Run a Content Search in the Office 365 Security & Compliance Center](https://support.office.com/en-us/article/Run-a-Content-Search-in-the-Office-365-Security-Compliance-Center-61852fd9-fe8a-4880-a339-cb19ed3bff4a) 

Content Search provides another resource to help you develop KQL queries and sensitive information types — keywords. Why use the keyword list? You can get statistics that show how many items match each keyword. This can help you quickly identify which keywords are the most (and least) effective. For more information about search statistics, see [View keyword statistics for Content Search results](https://support.office.com/en-us/article/View-keyword-statistics-for-Content-Search-results-9701a024-c52e-43f0-b545-9a53478aec04).

Keywords on each row are connected by the OR operator in the search query that's created. You can also use a keyword phrase (surrounded by parentheses) in a row.

For more information, see [Keyword queries and search conditions for Content Search](https://support.office.com/en-us/article/Keyword-queries-and-search-conditions-for-Content-Search-c4639c2e-7223-4302-8e0d-b6e10f1c3be3).

### Example—Using Content Search to identify email addresses

Email addresses are considered sensitive information related to data subjects. This is a simple example to demonstrate how Content Search can help.

KQL and keywords can’t be used together. Use these tools separately to hone your query and determine keywords that might be useful in sensitive information types.

### KQL query

(^|\\b)([a-zA-Z0-9\_\\-\\.]+)@([a-zA-Z0-9\_\\-\\.]+)\\.([a-zA-Z]{2,5})($|\\b)

Notes:

-   You can use NEAR and ONEAR for proximity searches.

-   Unfortunately, KQL doesn’t support queries with the Regex Class (ex: IdRef="Regex\_email\_address")

### Keywords

Enter each keyword on a separate line. Example keywords:

-   email address

-   mail

-   contact

-   sender

-   recipient

-   cc

-   bcc

In this example, you might learn the keywords are not necessary and produce a lot of false positive results.

### Step 2 — Create a new custom sensitive information type

After using KQL queries and keywords to identify sensitive information, use these to create new custom sensitive information types. In many cases, you’ll require the sophistication of sensitive information types to achieve the right level of accuracy. You can then use these custom sensitive information types with Content Search, in DLP policies and other tools, and within other KQL queries.

The best practice is to create a new sensitive information type based on an existing one. Use the same process described earlier in this article.

### Example — Create a new sensitive information for email addresses 

We’ll continue with the email address as an example because it’s simple. The following table details the modifications recommended for a new email sensitive information type.

<table>
<thead>
<tr class="header">
<th align="left"><strong>Step</strong></th>
<th align="left"><strong>Modification </strong></th>
<th align="left"><strong>Example XML syntax</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">1</td>
<td align="left">Set the IdRef property
<p>Within the &lt;Entity&gt; element, modify the &lt;IdMatch&gt; element so that its idRef property is = to a unique value. This value will point to an element that defines our regular expression to find email addresses.</p></td>
<td align="left">IdRef=&quot;Regex_email_address&quot;</td>
</tr>
<tr class="even">
<td align="left">2</td>
<td align="left"><p>Proximity attribute</p>
<p>We'll start with a patternProximity value in our &lt;Entity&gt; element of 300.</p></td>
<td align="left">patternsProximity=&quot;300&quot;</td>
</tr>
<tr class="odd">
<td align="left">3</td>
<td align="left"><p>Confidence level</p>
<p>Set the recommendedConfidence property to a value you feel will represent the confidence of finding an accurate match. This will likely require testing with a representative data set to get an accurate result. As an initial setting, set this value to 75.</p></td>
<td align="left"><p>recommendedConfidence=&quot;75&quot;&gt;</p>
<p>The resulting XML for these first three elements combined looks like this:</p>
<p>&lt;Entity id=&quot;42e6348e-27f0-4774-9604-d470cb3e219a&quot; patternsProximity=&quot;300&quot; recommendedConfidence=&quot;75&quot;&gt;</p>
<p>&lt;Pattern confidenceLevel=&quot;75&quot;&gt;</p>
<p>&lt;IdMatch idRef=&quot;Regex_email_address&quot; /&gt;</p>
<p>&lt;Any minMatches=&quot;1&quot;&gt;</p>
<p>&lt;Match idRef=&quot;Keyword_email_terms&quot; /&gt;</p>
<p>&lt;/Any&gt;</p>
<p>&lt;/Pattern&gt;</p>
<p>&lt;/Entity&gt;</p></td>
</tr>
<tr class="even">
<td align="left">4</td>
<td align="left"><p>Regex element</p>
<p>Add a new &lt;Regex&gt; element immediately be below the &lt;Entity&gt; elements that defines the regular expression used to identify email addresses.</p></td>
<td align="left">&lt;Regex id=&quot;Regex_email_address&quot;&gt;(^|\b)([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})($|\b)&lt;/Regex&gt;</td>
</tr>
<tr class="odd">
<td align="left">5</td>
<td align="left"><p>Keywords</p>
<p>Add a new &lt;Keyword&gt; element below the &lt;Regex&gt; element that defines list of email address related keywords. Ensure that the id value for the &lt;Keyword&gt; element matches the &lt;Match idRef&gt; value in the &lt;Entity&gt;&lt;Pattern&gt; element. You may continue to add your own keywords if needed.</p>
<p>Keywords are likely not necessary to include in an email sensitive information type. These are provided as an example.</p></td>
<td align="left"><p>&lt;Keyword id=&quot;Keyword_email_terms&quot;&gt;</p>
<p>&lt;Group&gt;</p>
<p>&lt;Term&gt;email&lt;/Term&gt;</p>
<p>&lt;Term&gt;email address&lt;/Term&gt;</p>
<p>&lt;Term&gt;contact&lt;/Term&gt;</p>
<p>&lt;/Group&gt;</p>
<p>&lt;/Keyword&gt;</p></td>
</tr>
<tr class="even">
<td align="left">6</td>
<td align="left"><p>LocalizedStrings element</p>
<p>In the &lt;LocalizedStrings&gt;&lt;Resource&gt; element ensure that you have a unique name that identifies your sensitive information type.</p></td>
<td align="left"><p>&lt;LocalizedStrings&gt;</p>
<p>&lt;Resource idRef=&quot;42e6348e-27f0-4774-9604-d470cb3e219a&quot;&gt;</p>
<p>&lt;Name default=&quot;true&quot; langcode=&quot;en-us&quot;&gt;Email Address&lt;/Name&gt;</p>
<p>&lt;Description default=&quot;true&quot; langcode=&quot;en-us&quot;&gt;Detects email addresses.&lt;/Description&gt;</p>
<p>&lt;/Resource&gt;</p>
<p>&lt;/LocalizedStrings&gt;</p></td>
</tr>
</tbody>
</table>

## Create a new sensitive information type with example PowerShell and XML file — Contoso customer number

Contoso uses a Contoso Customer Number (CCN) to identify each customer in their customer database. A CCN consists of the following taxonomy:

-   Two digits to represent the year that the record was created. Contoso was founded in 2002; therefore, the earliest possible value would be 02.

-   Three digits to represent the partner agency that created the record. Possible agency values range from 000 to 999.

-   An alpha character to represent the line of business. Possible values are a-z and should be case insensitive.

-   A four-digit serial number. Possible serial number values range from 0000 to 9999.

Example CCNs:

> 15080P9562
>
> 14040O1119
>
> 15020J8317
>
> 14050E2330
>
> 16050E2166
>
> 17040O1118

Contoso always refers to customers by using a CCN in internal correspondence, external correspondence, documents, etc. They would like to create a custom sensitive information type to detect the use of CCN in Office 365 so that they may apply protection to the use of this form of personal data.

### Create a new sensitive information type for Contoso customer number

<table>
<thead>
<tr class="header">
<th align="left"><strong>Step</strong></th>
<th align="left"><strong>Action </strong></th>
<th align="left"><strong>Result</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">1</td>
<td align="left">Contoso uses PowerShell and Content Search to find documents that match an example set of CCNs.</td>
<td align="left">

<p>#Connect to Office 365 Security &amp; Compliance Center</p>
<p>$adminUser = &quot;alland@contoso.com&quot;</p>
<p>Connect-IPPSSession -UserPrincipalName $adminUser</p>
<p>#Create &amp; start search for sample data</p>
<p>$searchName = &quot;Sample Customer Information Search&quot;</p>
<p>$searchQuery = &quot;15080P9562 OR 14040O1119 OR 15020J8317 OR 14050E2330 OR 16050E2166 OR 17040O1118&quot;</p>
<p>New-ComplianceSearch -Name $searchName -SharePointLocation All -ExchangeLocation All -ContentMatchQuery $searchQuery</p>
<p>Start-ComplianceSearch -Identity $searchName</p>
</td>
</tr>
<tr class="even">
<td align="left">2</td>
<td align="left">Contoso analyzes the results. Every time the CCN was used, an EU formatted date was used and one of these keywords were also used within a proximity of 300 characters.</td>
<td align="left">customer number, customer no, customer #, customer#, Contoso customer</td>
</tr>
<tr class="odd">
<td align="left">3</td>
<td align="left">Contoso developed the following Regular Expression (RegEx) pattern to identify their CCN.</td>
<td align="left">[0-1][0-9][0-9]{3}[A-Za-z][0-9]{4}</td>
</tr>
<tr class="even">
<td align="left">4</td>
<td align="left">Contoso developed the following Regular Expression (RegEx) pattern to identify EU dates in the formats used by their various subsidiaries.</td>
<td align="left">
````xml
(0?[1-9]|[12][0-9]|3[0-1])[\/-](0?[1-9]|1[0-2]|j\x00e4n(uar)?|jan(uary|uari|uar|eiro|vier|v)?|ene(ro)?|genn(aio)?|‌ feb(ruary|ruari|rero|braio|ruar|br)?|f\x00e9vr(ier)?|fev(ereiro)?|mar(zo|o|ch|s)?|m\x00e4rz|maart|‌ apr(ile|il)?|abr(il)?|avril|may(o)?|magg(io)?|mai|mei|mai(o)?|jun(io|i|e|ho)?|giugno|juin|jul(y|io|i|ho)?|lu(glio)?|juil(let)?|ag(o|osto)?|aug(ustus|ust)?|ao\x00fbt|sep|sept(ember|iembre|embre)?|sett(embre)?|set(embro)?|‌ oct(ober|ubre|obre)?|ott(obre)?|okt(ober)?|out(ubro)?|nov(ember|iembre|embre|embro)?|dec(ember)?|‌ dic(iembre|embre)?|dez(ember|embro)?|d\x00e9c(embre)?)[ \/-](19|20)?[0-9]{2}
````
</td>
</tr>
<tr class="odd">
<td align="left">5</td>
<td align="left">Contoso uses PowerShell to generate three unique GUIDs.</td>
<td align="left"><p>#Generate a unique GUID for RulePack Id, Publisher Id, and Entity Id</p>
<p>[guid]::NewGuid().Guid</p>
<p>[guid]::NewGuid().Guid</p>
<p>[guid]::NewGuid().Guid</p></td>
</tr>
<tr class="even">
<td align="left">6</td>
<td align="left">Contoso defines the following parameters for their sensitive item type rule.</td>
<td align="left"><p>Name: Contoso Customer Number (CCN)</p>
<p>Description: Contoso Customer Number (CCN) that looks for additional keywords and EU formatted date</p></td>
</tr>
<tr class="odd">
<td align="left">7</td>
<td align="left">Contoso creates an XML file for a new sensitive information type to detect a Contoso Customer Number (CCN) and saves this to a local file system as C:\Scripts\ContosoCCN.xml in with UTF-8 encoding.</td>
<td align="left">See the XML file below this table.</td>
</tr>
<tr class="even">
<td align="left">8</td>
<td align="left">Contoso creates the custom sensitive information type with the following PowerShell.</td>
<td align="left"><p>#Connect to Office 365 Security &amp; Compliance Center</p>
<p>$adminUser = &quot;alland@contoso.com&quot;</p>
<p>Connect-IPPSSession -UserPrincipalName $adminUser</p>
<p>#Create new Sensitive Information Type</p>
<p>New-DlpSensitiveInformationTypeRulePackage -FileData (Get-Content -Path &quot;C:\Scripts\ContosoCCN.xml&quot; -Encoding Byte -ReadCount 0)</p></td>
</tr>
</tbody>
</table>

### Example XML file for the new sensitive information type (step 7)
```xml
\<?xml version="1.0" encoding="utf-8"?\>

\<RulePackage xmlns="http://schemas.microsoft.com/office/2011/mce"\>

\<RulePack id="130ae63b-a91e-4a12-9e02-a90e36a83d7f"\>

\<Version major="1" minor="0" build="0" revision="0" /\>

\<Publisher id="47148982-defd-42a1-890a-7b9472099f1f" /\>

\<Details defaultLangCode="en"\>

\<LocalizedDetails langcode="en"\>

\<PublisherName\>Contoso Ltd.\</PublisherName\>

\<Name\>Contoso Rule Package\</Name\>

\<Description\>Defines Contoso's custom set of classification rules\</Description\>

\</LocalizedDetails\>

\</Details\>

\</RulePack\>

\<Rules\>

\<!-- Contoso Customer Number (CCN) --\>

\<Entity id="a91f9a2e-6cfc-4622-8c5d-954875aa5b2b" patternsProximity="300" recommendedConfidence="85"\>

\<Pattern confidenceLevel="85"\>

\<IdMatch idRef="Regex\_contoso\_ccn" /\>

\<Match idRef="Keyword\_contoso\_ccn" /\>

\<Match idRef="Regex\_eu\_date" /\>

\</Pattern\>

\</Entity\>

\<Regex id="Regex\_contoso\_ccn"\>[0-1][0-9][0-9]{3}[A-Za-z][0-9]{4}\</Regex\>

\<Keyword id="Keyword\_contoso\_ccn"\>

\<Group matchStyle="word"\>

\<Term caseSensitive="false"\>customer number\</Term\>

\<Term caseSensitive="false"\>customer no\</Term\>

\<Term caseSensitive="false"\>customer \#\</Term\>

\<Term caseSensitive="false"\>customer\#\</Term\>

\<Term caseSensitive="false"\>Contoso customer\</Term\>

\</Group\>

\</Keyword\>

\<Regex id="Regex\_eu\_date"\> (0?[1-9]|[12][0-9]|3[0-1])[\\/-](0?[1-9]|1[0-2]|j\\x00e4n(uar)?|jan(uary|uari|uar|eiro|vier|v)?|ene(ro)?|genn(aio)?‌ |feb(ruary|ruari|rero|braio|ruar|br)?|f\\x00e9vr(ier)?|fev(ereiro)?|mar(zo|o|ch|s)?|m\\x00e4rz|maart‌|apr(ile|il)?|abr(il)?|avril‌ |may(o)?|magg(io)?|mai|mei|mai(o)?|jun(io|i|e|ho)?|giugno|juin|jul(y|io|i|ho)?|lu(glio)?|juil(let)?|ag(o|osto)?|aug(ustus|ust)?|ao\\x00fbt|sep|sept(ember|iembre|embre)?|sett(embre)?|set(embro)?|oct(ober|ubre|obre)?|ott(obre)?|okt(ober)?|out(ubro)?‌ |nov(ember|iembre|embre|embro)?|dec(ember)?|dic(iembre|embre)?|dez(ember|embro)?|d\\x00e9c(embre)?)[ \\/-](19|20)?[0-9]{2}\</Regex\>

\<LocalizedStrings\>

\<Resource idRef="a91f9a2e-6cfc-4622-8c5d-954875aa5b2b"\>

\<Name default="true" langcode="en-us"\>Contoso Customer Number (CCN)\</Name\>

\<Description default="true" langcode="en-us"\>Contoso Customer Number (CCN) that looks for additional keywords and EU formatted date\</Description\>

\</Resource\>

\</LocalizedStrings\>

\</Rules\>

\</RulePackage\>
```
