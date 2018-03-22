Plan for OneDrive for Business Multi-Geo
========================================

This guidance is designed for administrators of multi-national companies (MNCs) who are preparing their SharePoint Online tenant to be expanded to additional geographies in accordance with the company’s presence to meet data residency requirements.

In a OneDrive Multi-Geo configuration, your Office 365 tenant consists of a central location (also known as the default location) and one or more satellite geo locations. This is a single tenant that spans across multiple geo locations. In OneDrive Multi-Geo, your tenant information, including geo locations, is mastered in Azure Active Directory (AAD). 

Here are some key multi-geo terms to help you understand the basic concepts of the configuration:

-   **Tenant** – An organization’s representation in the Office 365 cloud which typically has one or more domains associated with it (example: http://contoso.sharepoint.com). 

<!-- -->

-   **Geo locations** – The geographic locations where your tenant’s data is hosted. Multi-geo tenants span more than one geo location, for example, North America and Europe.

-   **Allowed Data Locations (ADL)** – The geo locations for which your tenant has been configured to host data.

-   **Preferred Data Location (PDL)** – The geo location where an individual user’s OneDrive data is stored. This can be set by the administrator to any of the Allowed Data Locations that have been configured for the tenant. Note that if you change a user’s PDL, their OneDrive data is not moved to the new geo location automatically. See MOVE ONEDRIVE LIBRARIES for more information.

Enabling Multi-Geo requires four key steps:

1.  Set your tenant as a Multi-National Company (MNC).

2.  Add the desired satellite geo location(s) to your tenant.

3.  Set your users’ preferred data location to the desired satellite geo location.

4.  Migrate your users’ OneDrive from the home location to their preferred data location as needed.

Each of these steps has its corresponding Microsoft Azure Active Directory PowerShell cmdlet, which will be covered in the Configure Multi-Geo steps.

Important: Note that the Multi-Geo features of Office 365 are not primarily designed for performance optimization cases, they are designed to meet data residency requirements. For information about performance optimization for Office 365, see [Network planning and performance tuning for Office 365](https://support.office.com/article/e5f1228c-da3c-4654-bf16-d163daee8848) or contact your support group.

You can configure any of the following locations to be satellite geo locations where you can host OneDrive files. As you plan for Multi-Geo, make a list of the locations that you want to add to your Office 365 tenant. We recommend starting with one or two satellite locations and then gradually expanding to more geo locations, if needed.

<table>
<thead>
<tr class="header">
<th align="left"><strong>Location</strong></th>
<th align="left"><strong>Code</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Asia-Pacific</td>
<td align="left">APC</td>
</tr>
<tr class="even">
<td align="left">Europe / Middle East / Africa</td>
<td align="left">EUR</td>
</tr>
<tr class="odd">
<td align="left">North America</td>
<td align="left">NAM</td>
</tr>
<tr class="even">
<td align="left">Australia</td>
<td align="left">AUS</td>
</tr>
<tr class="odd">
<td align="left">Canada</td>
<td align="left">CAN</td>
</tr>
<tr class="even">
<td align="left">India*</td>
<td align="left">IND</td>
</tr>
<tr class="odd">
<td align="left">Japan</td>
<td align="left">JPN</td>
</tr>
<tr class="even">
<td align="left">South Korea*</td>
<td align="left">KOR</td>
</tr>
<tr class="odd">
<td align="left">United Kingdom</td>
<td align="left">GBR</td>
</tr>
</tbody>
</table>

Note: Both India and South Korea currently require that the customer have a billing address in these countries.

Take this opportunity to consolidate your on-premises infrastructure while migrating to Office 365. For example, if you have on-premises farms in Singapore and Malaysia, then you can consolidate them to the APC satellite location, provided data residency requirements allow you to do so.

Create a test user in Office 365 to do some initial testing with. We’ll walk through some additional testing and verification steps with this user before you proceed to onboard production users into the OneDrive Multi-Geo feature.

Once you’ve completed testing with your test user, select a pilot group – perhaps from your IT department – to be the first to use OneDrive in a new geo. For this first group, select users who do not yet have a OneDrive. We recommend no more than five people in this initial group and gradually expand following a batched rollout approach.

Each user should have a *preferred data location* (PDL) set so that Office 365 can determine in which geo location to provision their OneDrive. The user’s preferred data location must match one of your chosen satellite locations or your central location. While the PDL field is not mandatory, we recommend that a PDL be set for all users. Workloads of a user without a PDL will be provisioned in the central location based on the Multi-Geo logic.   

Create a list of your users, and include their user principal name (UPN) and the location code for the appropriate preferred data location. Include your test user and your initial pilot group to start with. You’ll need this list for the configuration procedures.

If your users are synchronized from an on-premises Active Directory (AD) system to Azure Active Directory (AAD), you must set the preferred data location for synchronized users by using Azure Active Directory Connect. You cannot directly configure the preferred data location for synchronized users using Azure AD PowerShell. The steps to set up PDL in AD and Synchronize it are covered in the [Azure Active Directory Connect sync: Configure preferred data location for Office 365 resources](https://docs.microsoft.com/en-us/azure/active-directory/connect/active-directory-aadconnectsync-feature-preferreddatalocation)

The administration of a multi-geo tenant can differ from a non-multi-geo tenant, as many of the SharePoint and OneDrive settings and services are multi-geo aware. We recommend that you review LINK TO ADMIN TOPIC before you proceed with your configuration.

The experience for your users is mostly unchanged in a multi-geo environment. Read LINK TO END USER TOPIC for details.

To get started configuring OneDrive for Business Multi-Geo, see LINK TO CONFIGURE TOPIC.

Once you’ve completed the configuration, remember to MIGRATE ONEDRIVES as needed to get your users working from their preferred data locations.
