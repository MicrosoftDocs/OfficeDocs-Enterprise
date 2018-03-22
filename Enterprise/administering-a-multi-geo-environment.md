Many of the services in SharePoint Online and OneDrive for Business are multi-geo aware and require administrative procedures that are different than a non-multi-geo tenant.

##### OneDrive Administrator Experience

The OneDrive administration center <https://admin.onedrive.com/> has a Geo Locations tab in the left navigation which features a geo-locations map that where you can view and manage your geo-locations.

##### Taxonomy

We support a unified [Taxonomy](https://support.office.com/article/A180FA28-6405-4679-9EC3-81D2028C4EFC) for enterprise managed metadata across geo locations, with the master being hosted in the central location for your company. We recommend that you manage your global taxonomy from the central location and only add location-specific terms to the satellite geo location’s Taxonomy. Global taxonomy terms will synchronize to the satellite geo locations.

##### Sharing

Administrators can set and manage sharing policies for each of their locations. The OneDrive sites in each geo location will honor only the corresponding geo specific sharing settings. For example, you can allow [external sharing](https://support.office.com/en-us/article/Manage-external-sharing-for-your-SharePoint-Online-environment-C8A462EB-0723-4B0B-8D0A-70FEAFE4BE85) for your central location, but not for your satellite location or vice versa. For OneDrive Multi-Geo, you must manage your sharing settings at each geo location as these are not synchronized across the tenant.

To manage sharing visit the <https://admin.onedrive.com/?v=SharingSettings> page. By default external sharing is enabled with Anyone in each satellite location.

##### User Profile Application

There is a [user profile application](https://support.office.com/article/494bec9c-6654-41f0-920f-f7f937ea9723) in each geo location. Each user’s profile information is hosted in their geo location and available to the administrator for that geo location.

If you have custom profile properties, then we recommend that you use the same profile schema across geographies and populate your custom profile properties either in all geo locations or where needed.

##### BCS, Secure Store, Apps

BCS, Secure Store, and Apps all have separate geo instances, therefore the SharePoint Online administrator should manage and configure these services from each geo instance where they want them to be present.

##### Security and Compliance Admin Center

There is one central compliance center for the Multi-Geo tenant, hosted in https://protection.office.com/?rfr=AdminCenter\#/homepage.

###### Information Protection (IP) Data Loss Prevention (DLP) Policy

You can set your IP DLP policies for OneDrive for Business in the Security and Compliance center, scoping policies as needed to the whole tenant or to applicable users. For example: If you wish to select a policy for a OneDrive user in a satellite location, select to apply the policy to a specific OneDrive and enter the user’s OneDrive url. See the [Overview of data loss prevention policies](https://support.office.com/en-us/article/Overview-of-data-loss-prevention-policies-1966b2a7-d1e2-4d92-ab61-42efbb137f5e) article for general guidance in creating DLP policies.

The DLP policies are automatically synchronized based on their applicability to each geo location.

Implementing Information Protection and Data Loss prevention policies to all users in a geo location is not an option available in the UI, instead you must select the applicable OneDrive accounts for the policy or apply the policy globally to all OneDrive accounts.

##### eDiscovery 

By default, an eDiscovery Manager or Administrator of a multi-geo tenant will be able to conduct eDiscovery only in the central location of that tenant. To support the ability to conduct eDiscovery for satellite locations, a new Compliance Security Filter parameter called “Region” is available via PowerShell.

The Office 365 global administrator must assign eDiscovery Manager permissions to allow others to perform eDiscovery and assign a “Region” parameter in their applicable Compliance Security Filter to specify the region for conducting eDiscovery as satellite location, otherwise no eDiscovery will be carried out for the satellite location.

When the eDiscovery Manager or Administrator role is set for a particular-geo location, the eDiscovery Manager or Administrator will only be able to perform eDiscovery search actions against the SharePoint sites and OneDrives located in that geo location. If an eDiscovery Manager or Administrator attempts to search SharePoint or OneDrive Sites outside the specified region, no results will be returned. Also, when the eDiscovery Manager or Administrator for a region triggers an export, data is exported to the Azure instance of that region if there is one. This helps organizations stay within compliance by not allowing content to be exported across controlled borders.

Note: If it's necessary for an eDiscovery Manager to search across multiple SharePoint regions, another user account will need to be created for the eDiscovery Manager which specifies the alternate region where the OneDrive or SharePoint sites are located. 

The following regions support eDiscovery:

<table>
<thead>
<tr class="header">
<th align="left"><strong>Multi-Geo supported Geo Locations</strong></th>
<th align="left"><strong>eDiscovery for SharePoint Exported data will be in this Azure Blob data location…</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><strong>NAM</strong></td>
<td align="left">US Data Centers</td>
</tr>
<tr class="even">
<td align="left"><strong>EUR</strong></td>
<td align="left">Europe Data Centers</td>
</tr>
<tr class="odd">
<td align="left"><strong>APC</strong></td>
<td align="left">South East or East Asia Data Centers</td>
</tr>
<tr class="even">
<td align="left"><strong>CAN</strong></td>
<td align="left">US Data Centers</td>
</tr>
<tr class="odd">
<td align="left"><strong>AUS</strong></td>
<td align="left">South East or East Asia Data Centers</td>
</tr>
<tr class="even">
<td align="left"><strong>IND</strong></td>
<td align="left">South East or East Asia Data Centers</td>
</tr>
<tr class="odd">
<td align="left"><strong>GBR</strong></td>
<td align="left">Europe Data Centers</td>
</tr>
<tr class="even">
<td align="left"><strong>JPN </strong></td>
<td align="left">South East or East Asia Data Centers</td>
</tr>
<tr class="odd">
<td align="left"><strong>LAM</strong></td>
<td align="left">US Data Centers</td>
</tr>
</tbody>
</table>

To set the Compliance Security Filter for a Region:

1.  Open Windows PowerShell

2.  Enter  
    $s = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri <https://ps.compliance.protection.outlook.com/powershell-liveid> -Credential $cred -Authentication Basic -AllowRedirection -SessionOption (New-PSSessionOption -SkipCACheck -SkipCNCheck -SkipRevocationCheck)

    $a = Import-PSSession $s -AllowClobber  

3.  **New-ComplianceSecurityFilter** **-Action** ALL **-FilterName** EnterTheNameYouWantToAssign **-Region** EnterTheRegionParameter **-Users** EnterTheUserPrincipalName

    1.  For Example: **New-ComplianceSecurityFilter -Action** ALL **-FilterName** NAMEDISCOVERYMANAGERS **-Region** NAM **-Users** adwood@contosodemosx.onmicrosoft.com

See the [New-ComplianceSecurityFilter](https://technet.microsoft.com/en-us/library/mt210915(v=exchg.160).aspx) article for additional parameters and syntax

###### Audit log search

A unified [Audit log](https://support.office.com/en-us/article/Search-the-audit-log-in-the-Office-365-Security-Compliance-Center-0d4d0f35-390b-4518-800e-0c7ec95e946c) for all your geo locations is available from the Office 365 audit log search page. You can see all the audit log entries from across geos, for example, NAM & EUR geo users’ activities will show up in one org view and then you can apply existing filters to see specific user’s activities.
