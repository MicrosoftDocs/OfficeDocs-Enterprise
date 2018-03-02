# Sample scripts to configure token issuance policies for Azure Active Directory
This folder contains the sample scripts used with the article [Using Azure AD for SharePoint Server Authentication](using-azure-ad-for-sharepoint-server-authentication.md).

## Contents
The following files accompany the article:
- `MSGraphTokenLifetimePolicy.psm1` - Module containing functions to interact with Azure Active Directory Graph endpoint.
- `Initialize.ps1` - Script to initialize a PowerShell environment to use the sample module.

## Instructions
To use these modules, open an elevated PowerShell session. Import the module using the command:

````powershell
Import-Module <file path of Initialize.ps1>
````
You can now use the functions defined in the .psm1 module.

````powershell
Add-TokenIssuancePolicy -DisplayName "SharePointSAML1.1" -SigningAlgorithm "http://www.w3.org/2001/04/xmldsig-more#rsa-sha256" -TokenResponseSigningPolicy TokenOnly -SamlTokenVersion "1.1"
````

For more details on using these scripts to configure Azure AD as a trusted identity provider for SharePoint 2016, see the article [Using Azure AD for SharePoint Server Authentication](using-azure-ad-for-sharepoint-server-authentication.md). 
