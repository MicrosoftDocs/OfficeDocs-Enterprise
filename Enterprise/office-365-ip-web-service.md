## **Office 365 IP Address and URL**  **Web service**

To help you better identify and differentiate Office 365 network traffic, a new web service publishes Office 365 endpoints, making it easier for you to evaluate, configure, and stay up to date with changes. This new web service (now in preview), will eventually replace the lists of endpoints in the [Office 365 URLs and IP address ranges](https://docs.microsoft.com/en-us/office365/enterprise/urls-and-ip-address-ranges) article, along with the RSS and XML versions of that data. The XMLse format of endpoint data areis planned to be phased out on October 2, 2018.

As a customer or a network perimeter device vendor, you can build against the new REST-based web service for the Office 365 IP address and FQDN entries. You can access the data directly in a web browser using these URLs.

- For the latest version of the Office 365 URLs and IP address ranges, use [https://endpoints.office.com/version](https://endpoints.office.com/version?clientrequestid=b10c5ed1-bad1-445f-b386-b919946339a7).
- For the data on the Office 365 URLs and IP address ranges page for firewalls and proxy servers, use [https://endpoints.office.com/endpoints/worldwide](https://endpoints.office.com/endpoints/worldwide?clientrequestid=b10c5ed1-bad1-445f-b386-b919946339a7).
-

#
[ANNOTATION:

BY &#39;Jay Sebastian&#39;
ON &#39;2018-08-29T10:28:00&#39;JS
NOTE: &#39;This statement doesn&#39;t sound precise. This URL will get all changes since end of July 2018 – consider clarifying or saying &quot;use the version number that your configuration is currently on&quot;&#39;]
To get all the latest changes since the end of July 2018 when the web service was first available, use [https://endpoints.office.com/changes/worldwide/0000000000](https://endpoints.office.com/changes/worldwide/0000000000?clientrequestid=b10c5ed1-bad1-445f-b386-b919946339a7).

As a customer, you can use this web service to:

- Update your PowerShell scripts to obtain Office 365 endpoint data and modify any formatting for your networking devices.
- Use this information to update PAC files deployed to client computers.

As a network perimeter device vendor, you can use this web service to:

- Create and test device software to download the list for automated configuration.
- Check for the current version.
- Get the current changes.

The following sections describe the preview of this web service, which might change over time until the service is generally available.

The data on the web service is up to date and we are not planning to make further changes to the web service URLs or returned data schema before the general availability release of this web service.

For additional information, see:

- [Announcement blog post in the Office 365 Tech Community Forum](https://techcommunity.microsoft.com/t5/Office-365-Blog/Announcing-Office-365-endpoint-categories-and-Office-365-IP/ba-p/177638)
- [Office 365 Tech Community Forum for questions about use of the web services](https://techcommunity.microsoft.com/t5/Office-365-Networking/bd-p/Office365Networking)

### **Common parameters**

These parameters are common across all the web service methods:

- **format=CSV | JSON** - Query string parameter. By default, the returned data format is JSON. Include this optional parameter to return the data in comma-separated values (CSV) format.
- **ClientRequestId** - Query string parameter. A required GUID that you generate for client session You should generate a GUID for each client machine that calls the web service. Do not use the GUIDs shown in the following examples because they may be blocked by the web service in the future. GUID format is xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx, where x represents a hexadecimal number. To generate a GUID, you can use the [New-Guid](https://docs.microsoft.com/powershell/module/microsoft.powershell.utility/new-guid?view=powershell-6) PowerShell command.

### **Version web method**

Microsoft updates the Office 365 IP address and FQDN entries at the end of each month and occasionally out of cycle for operational or support requirements. The data for each published instance is assigned a version number. The version web method lets you poll for the latest version for each Office 365 service instance. We recommend you check the version daily, or at the most, hourly. New versions should be expected at the start of each month. Sometimes due to support incident, security, or other operational requirements there will be new versions during the month.

There is one parameter for the version web method:

- **AllVersions=true** - Query string parameter. By default, the version returned is the latest. Include this optional parameter to request all published versions.
- **Format=JSON**** | ****CSV**** | ****RSS** – iIn addition to the JSON and CSV formats, the version web method also supports RSS. You can use this along with the allVersions=true parameter to request an RSS feed which can be used with Outlook or other RSS readers.
- **Instance** - Route parameter. This optional parameter specifies the instance to return the version for. If omitted, all instances are returned. Valid instances are: Worldwide, China, Germany, USGovDoD, USGovGCCHigh

The result from the version web method may be a single record or an array of records. The elements of each record are:

- instance - The short name of the Office 365 service instance.
- latest - The latest version for endpoints of the specified instance.
- versions - A list of all previous versions for the specified instance. This element is only included if the AllVersions parameter is true.

#### **Examples:**

Example 1 request URI: **https://endpoints.office.com/version?ClientRequestId=b10c5ed1-bad1-445f-b386-b919946339a7**

This URI returns the latest version of each Office 365 service instance. Example result:

[Copy]

[

 {

  &quot;instance&quot;: &quot;Worldwide&quot;,

  &quot;latest&quot;: &quot;2018063000&quot;

 },

 {

  &quot;instance&quot;: &quot;USGovDoD&quot;,

  &quot;latest&quot;: &quot;2018063000&quot;

 },

 {

  &quot;instance&quot;: &quot;USGovGCCHigh&quot;,

  &quot;latest&quot;: &quot;2018063000&quot;

 },

 {

  &quot;instance&quot;: &quot;China&quot;,

  &quot;latest&quot;: &quot;2018063000&quot;

 },

 {

  &quot;instance&quot;: &quot;Germany&quot;,

  &quot;latest&quot;: &quot;2018063000&quot;

 }

]

Important

The GUID for the ClientRequestID parameter in these URIs are only an example. To try the web service URIs out, generate your own GUID. The GUIDs shown in these examples may be blocked by the web service in the future.

Example 2 request URI: **https://endpoints.office.com/version/Worldwide?ClientRequestId=b10c5ed1-bad1-445f-b386-b919946339a7**

This URI returns the latest version of the specified Office 365 service instance. Example result:

[Copy]

{

 &quot;instance&quot;: &quot;Worldwide&quot;,

 &quot;latest&quot;: &quot;2018063000&quot;

}

Example 3 request URI: **https://endpoints.office.com/version/Worldwide?Format=CSV&amp;ClientRequestId=b10c5ed1-bad1-445f-b386-b919946339a7**

This URI shows output in CSV format. Example result:

[Copy]

instance,latest

Worldwide,2018063000

Example 4 request URI: **https://endpoints.office.com/version/Worldwide?AllVersions=true&amp;ClientRequestId=b10c5ed1-bad1-445f-b386-b919946339a7**

This URI shows all prior versions that have been published for the Office 365 worldwide service instance. Example result:

[Copy]

{

  &quot;instance&quot;: &quot;Worldwide&quot;,

  &quot;latest&quot;: &quot;2018063000&quot;,

  &quot;versions&quot;: [

    &quot;2018063000&quot;,

    &quot;2018062000&quot;

  ]

}

Example 5 RSS Feed URI:

[**https://endpoints.office.com/version/**](https://endpoints.office.com/version/worldwide?clientRequestId=b10c5ed1-bad1-445f-b386-b919946339a7&amp;allVersions=true&amp;format=RSS)[**worldwide**](https://endpoints.office.com/version/worldwide?clientRequestId=b10c5ed1-bad1-445f-b386-b919946339a7&amp;allVersions=true&amp;format=RSS)[**?clientRequestId=**](https://endpoints.office.com/version/worldwide?clientRequestId=b10c5ed1-bad1-445f-b386-b919946339a7&amp;allVersions=true&amp;format=RSS)[**b10c5ed1-bad1-445f-b386-b919946339a7**](https://endpoints.office.com/version/worldwide?clientRequestId=b10c5ed1-bad1-445f-b386-b919946339a7&amp;allVersions=true&amp;format=RSS)[**&amp;allVersions=true&amp;**](https://endpoints.office.com/version/worldwide?clientRequestId=b10c5ed1-bad1-445f-b386-b919946339a7&amp;allVersions=true&amp;format=RSS)[**f**](https://endpoints.office.com/version/worldwide?clientRequestId=b10c5ed1-bad1-445f-b386-b919946339a7&amp;allVersions=true&amp;format=RSS)[**ormat=**](https://endpoints.office.com/version/worldwide?clientRequestId=b10c5ed1-bad1-445f-b386-b919946339a7&amp;allVersions=true&amp;format=RSS)[**RSS**](https://endpoints.office.com/version/worldwide?clientRequestId=b10c5ed1-bad1-445f-b386-b919946339a7&amp;allVersions=true&amp;format=RSS)

This URI shows an RSS feed of the published versions that include links to the list of changes for each version. Example result:

[Copy]

\&lt;?xml version=&quot;1.0&quot; encoding=&quot;ISO-8859-1&quot;?\&gt;

\&lt;rss version=&quot;2.0&quot; xmlns:a10=&quot;http://www.w3.org/2005/Atom&quot;\&gt;

\&lt;channel\&gt;

\&lt;link\&gt;[http://aka.ms/o365ip\&lt;/link](http://aka.ms/o365ip&lt;/link)\&gt;

\&lt;description/\&gt;

\&lt;language\&gt;en-us\&lt;/language\&gt;

\&lt;lastBuildDate\&gt;Thu, 02 Aug 2018 00:00:00 Z\&lt;/lastBuildDate\&gt;

\&lt;item\&gt;

\&lt;guid isPermaLink=&quot;false&quot;\&gt;2018080200\&lt;/guid\&gt;

\&lt;link\&gt;https://endpoints.office.com/changes/Worldwide/2018080200?singleVersion&amp;clientRequestId=b10c5ed1-bad1-445f-b386-b919946339a7\&lt;/link\&gt; \&lt;description\&gt;Version 2018080200 includes 2 changes. IPs: 2 added and 0 removed.\&lt;/description\&gt;

\&lt;pubDate\&gt;Thu, 02 Aug 2018 00:00:00 Z\&lt;/pubDate\&gt;

\&lt;/item\&gt;

...

### **Endpoints web method**

The endpoints web method returns all records for IP address ranges and URLs that make up the Office 365 service. Whist the latest data from the endpoints web method should be used for network device configuration, the data can be cached for up to 30 days after it is published due to the advance notice provided for additions.Parameters for the endpoints web method are:

- **ServiceAreas** - Query string parameter. A comma-separated list of service areas. Valid items are Common,Exchange,SharePoint,Skype. Because Common service area items are a prerequisite for all other service areas, the web service will always include them. If you do not include this parameter, all service areas are returned.
- **TenantName** - Query string parameter. Your Office 365 tenant name. The web service takes your provided name and inserts it in parts of URLs that include the tenant name. If you don&#39;t provide a tenant name, those parts of URLs have the wildcard character (\*).
- **NoIPv6** - Query string parameter. Set this to true to exclude IPv6 addresses from the output, for example, if you don&#39;t use IPv6 in your network.
- **Instance** - Route parameter. This required parameter specifies the instance to return the endpoints for. Valid instances are: Worldwide, China, Germany, USGovDoD, USGovGCCHigh.

The result from the endpoints web method is an array of records with each record representing an endpoint set. The elements for each record are:

-
id -
#
[ANNOTATION:

BY &#39;Jay Sebastian&#39;
ON &#39;2018-08-29T10:41:00&#39;JS
NOTE: &#39;Though ID is immutable, it may be worth noting (here or elsewhere) that an endpoint set with a given ID may not appear in the response at a future point if it has been deleted&#39;]
The immutable id number of the endpoint set.
- serviceArea - The service area that this is part of: Common, Exchange, SharePoint, or Skype.
- urls - URLs for the endpoint set. A JSON array of DNS records. Omitted if blank.
- tcpPorts - TCP ports for the endpoint set. All ports elements are formatted as a comma-separated list of ports or port ranges separated by a dash character (-). Ports apply to all IP addresses and all URLs in that endpoint set for that category. Omitted if blank.
- udpPorts - UDP ports for the IP address ranges in this endpoint set. Omitted if blank.
-
ips -
#
[ANNOTATION:

BY &#39;Jay Sebastian&#39;
ON &#39;2018-08-29T10:40:00&#39;JS
NOTE: &#39;Should also say this is a JSON array? To make it consistent with the urls description above&#39;]
The IP address ranges associated with this endpoint set as associated with the listed TCP or UDP ports. A JSON array of IP Address ranges. Omitted if blank.
- category - The connectivity category for the endpoint set. Valid values are Optimize, Allow, and Default. Required.
- expressRoute - True or False if this endpoint set is routed over ExpressRoute.
- required - True if this endpoint set is required to have connectivity for Office 365 to be supported. False if this endpoint set is optional.  Omitted if false.
-
notes -
#
[ANNOTATION:

BY &#39;Jay Sebastian&#39;
ON &#39;2018-08-29T10:42:00&#39;JS
NOTE: &#39;I don&#39;t think the connection is explicitly made that optional endpoints are those where &quot;required = false&quot;&#39;]
For optional endpoints, this text describes Office 365 functionality that will be missing if IP addresses or URLs in this endpoint set cannot be accessed at the network layer. Omitted if blank.

#### **Examples:**

Example 1 request URI: **https://endpoints.office.com/endpoints/Worldwide?ClientRequestId=b10c5ed1-bad1-445f-b386-b919946339a7**

This URI obtains all endpoints for the Office 365 worldwide instance for all workloads. Example result showing an excerpt of the output:

[Copy]

[

 {

  &quot;id&quot;: 1,

  &quot;serviceArea&quot;: &quot;Exchange&quot;,

  &quot;serviceAreaDisplayName&quot;: &quot;Exchange Online&quot;,

  &quot;urls&quot;:

   [

    &quot;\*.protection.outlook.com&quot;

   ],

  &quot;ips&quot;:

   [

    &quot;2a01:111:f403::/48&quot;, &quot;23.103.132.0/22&quot;, &quot;23.103.136.0/21&quot;, &quot;23.103.198.0/23&quot;, &quot;23.103.212.0/22&quot;, &quot;40.92.0.0/14&quot;, &quot;40.107.0.0/17&quot;, &quot;40.107.128.0/18&quot;, &quot;52.100.0.0/14&quot;, &quot;213.199.154.0/24&quot;, &quot;213.199.180.128/26&quot;, &quot;94.245.120.64/26&quot;, &quot;207.46.163.0/24&quot;, &quot;65.55.88.0/24&quot;, &quot;216.32.180.0/23&quot;, &quot;23.103.144.0/20&quot;, &quot;65.55.169.0/24&quot;, &quot;207.46.100.0/24&quot;, &quot;2a01:111:f400:7c00::/54&quot;, &quot;157.56.110.0/23&quot;, &quot;23.103.200.0/22&quot;, &quot;104.47.0.0/17&quot;, &quot;2a01:111:f400:fc00::/54&quot;, &quot;157.55.234.0/24&quot;, &quot;157.56.112.0/24&quot;, &quot;52.238.78.88/32&quot;

   ],

  &quot;tcpPorts&quot;: &quot;443&quot;,

  &quot;expressRoute&quot;: true,

  &quot;category&quot;: &quot;Allow&quot;

 },

 {

  &quot;id&quot;: 2,

  &quot;serviceArea&quot;: &quot;Exchange&quot;,

  &quot;serviceAreaDisplayName&quot;: &quot;Exchange Online&quot;,

  &quot;urls&quot;:

   [

    &quot;\*.mail.protection.outlook.com&quot;

   ],

...

Additional endpoint sets are not included in this example.

Example 2 request URI: **https://endpoints.office.com/endpoints/Worldwide?ServiceAreas=Exchange&amp;ClientRequestId=b10c5ed1-bad1-445f-b386-b919946339a7**

This example obtains endpoints for the Office 365 Worldwide instance for Exchange Online and dependencies only.

The output for example 2 is similar to example 1 except that the results will not include endpoints for SharePoint Online or Skype for Business Online.

### **Changes web method**

The changes web method returns the most recent updates that have been published. This is typically the previous month&#39;s changes to IP address ranges and URLs. The most critical changes to be processed are when new URLs or IP Addresses are added since failing to add an IP Address to a firewall access control list, or a URL to a proxy server bypass list can cause an outage for Office 365 users behind that network device. Notwithstanding operational requirements Add operations are added with 30 days&#39; notice before such an outage would occur.

Note

Data from the changes API is accurate in the preview and should be used for development and testing only.

The parameter for the changes web method is:

- **Version** - Required URL route parameter. The version that you have currently implemented, and you want to see the changes since that version. The format is YYYYMMDDNN.

The result from the changes web method is an array of records with each record representing a change in a specific version of the endpoints. The elements for each record are:

- id - The immutable id of the change record.
- endpointSetId - The ID of the endpoint set record that is changed. Required.
- disposition - This can be either of change, add, or remove and describes what the change did to the endpoint set record. Required.
- version - The version of the published endpoint set in which the change was introduced. Version numbers are of the format YYYYMMDDNN, where NN is a natural number incremented if there are multiple versions required to be published on a single day.
- previous - A substructure detailing previous values of changed elements on the endpoint set. This will not be included for newly added endpoint sets. Includes tcpPorts, udpPorts, ExpressRoute, category, required, notes.
- current - A substructure detailing updated values of changes elements on the endpoinset. Includes tcpPorts, udpPorts, ExpressRoute, category, required, notes.
- add - A substructure detailing items to be added to endpoint set collections. Omitted if there are no additions.
  - effectiveDate - Defines the data when the additions will be live in the service.
  - ips - Items to be added to the ips array.
  - urls- Items to be added to the urls array.
- remove - A substructure detailing items to be removed from the endpoint set. Omitted if there are no removals.
  - ips - Items to be removed from the ips array.
  - urls- Items to be removed from the urls array.

**Examples:**

Example 1 request URI: **https://endpoints.office.com/changes/worldwide/0000000000?ClientRequestId=b10c5ed1-bad1-445f-b386-b919946339a7**

This requests all previous changes to the Office 365 worldwide service instance. Example result:

[Copy]

[

 {

  &quot;id&quot;: 424,

  &quot;endpointSetId&quot;: 32,

  &quot;disposition&quot;: &quot;Change&quot;,

  &quot;version&quot;: &quot;2018062700&quot;,

  &quot;remove&quot;:

   {

    &quot;urls&quot;:

     [

      &quot;\*.api.skype.com&quot;, &quot;skypegraph.skype.com&quot;

     ]

   }

 },

 {

  &quot;id&quot;: 426,

  &quot;endpointSetId&quot;: 31,

  &quot;disposition&quot;: &quot;Change&quot;,

  &quot;version&quot;: &quot;2018062700&quot;,

  &quot;add&quot;:

   {

    &quot;effectiveDate&quot;: &quot;20180609&quot;,

    &quot;ips&quot;:

     [

      &quot;51.140.203.190/32&quot;

     ]

   },

  &quot;remove&quot;:

   {

    &quot;ips&quot;:

     [

...

Example 2 request URI: **https://endpoints.office.com/changes/worldwide/2018062700?ClientRequestId=b10c5ed1-bad1-445f-b386-b919946339a7**

This requests changes since the specified version to the Office 365 Worldwide instance. In this case, the version specified is the latest. Example result:

[Copy]

[

  {

    &quot;id&quot;:3,

    &quot;endpointSetId&quot;:33,

    &quot;changeDescription&quot;:&quot;Removing old IP prefixes&quot;,

    &quot;disposition&quot;:&quot;Change&quot;,

    &quot;version&quot;:&quot;2018031301&quot;,

    &quot;remove&quot;:{

      &quot;ips&quot;:[&quot;65.55.127.0/24&quot;,&quot;66.119.157.192/26&quot;,&quot;66.119.158.0/25&quot;,

      &quot;111.221.76.128/25&quot;,&quot;111.221.77.0/26&quot;,&quot;207.46.5.0/24&quot;]

    }

  },

  {

    &quot;id&quot;:4,

    &quot;endpointSetId&quot;:45,

    &quot;changeDescription&quot;:&quot;Removing old IP prefixes&quot;,

    &quot;disposition&quot;:&quot;Change&quot;,

    &quot;version&quot;:&quot;2018031301&quot;,

    &quot;remove&quot;:{

      &quot;ips&quot;:[&quot;13.78.93.8/32&quot;,&quot;40.113.87.220/32&quot;,&quot;40.114.149.220/32&quot;,

      &quot;40.117.100.83/32&quot;,&quot;40.118.214.164/32&quot;,&quot;104.208.31.113/32&quot;]

    }

  }

]

### **Example PowerShell Script**

Here is a PowerShell script that you can run to see if there are actions you need to take for updated data. This script checks the version number for the Office 365 Worldwide instance endpoints. When there is a change, it downloads the endpoints and filters for the &quot;Allow&quot; and &quot;Optimize&quot; category endpoints. It also uses a unique ClientRequestId across multiple calls and saves the latest version found in a temporary file. You should call this script once an hour to check for a version update.

[Copy]

# webservice root URL

$ws = &quot;https://endpoints.office.com&quot;

# path where client ID and latest version number will be stored

$datapath = $Env:TEMP + &quot;\endpoints\_clientid\_latestversion.txt&quot;

# fetch client ID and version if data file exists; otherwise create new file

if (Test-Path $datapath) {

    $content = Get-Content $datapath

    $clientRequestId = $content[0]

    $lastVersion = $content[1]

}

else {

    $clientRequestId = [GUID]::NewGuid().Guid

    $lastVersion = &quot;0000000000&quot;

    @($clientRequestId, $lastVersion) | Out-File $datapath

}

# call version method to check the latest version, and pull new data if version number is different

$version = Invoke-RestMethod -Uri ($ws + &quot;/version/Worldwide?clientRequestId=&quot; + $clientRequestId)

if ($version.latest -gt $lastVersion) {

    Write-Host &quot;New version of Office 365 worldwide commercial service instance endpoints detected&quot;

    # write the new version number to the data file

    @($clientRequestId, $version.latest) | Out-File $datapath

    # invoke endpoints method to get the new data

    $endpointSets = Invoke-RestMethod -Uri ($ws + &quot;/endpoints/Worldwide?clientRequestId=&quot; + $clientRequestId)

    # filter results for Allow and Optimize endpoints, and transform these into custom objects with port and category

    $flatUrls = $endpointSets | ForEach-Object {

        $endpointSet = $\_

        $urls = $(if ($endpointSet.urls.Count -gt 0) { $endpointSet.urls } else { @() })

        $urlCustomObjects = @()

        if ($endpointSet.category -in (&quot;Allow&quot;, &quot;Optimize&quot;)) {

            $urlCustomObjects = $urls | ForEach-Object {

                [PSCustomObject]@{

                    category = $endpointSet.category;

                    url      = $\_;

                    tcpPorts = $endpointSet.tcpPorts;

                    udpPorts = $endpointSet.udpPorts;

                }

            }

        }

        $urlCustomObjects

    }

    $flatIps = $endpointSets | ForEach-Object {

        $endpointSet = $\_

        $ips = $(if ($endpointSet.ips.Count -gt 0) { $endpointSet.ips } else { @() })

        # IPv4 strings have dots while IPv6 strings have colons

        $ip4s = $ips | Where-Object { $\_ -like &#39;\*.\*&#39; }

        $ipCustomObjects = @()

        if ($endpointSet.category -in (&quot;Allow&quot;, &quot;Optimize&quot;)) {

            $ipCustomObjects = $ip4s | ForEach-Object {

                [PSCustomObject]@{

                    category = $endpointSet.category;

                    ip = $\_;

                    tcpPorts = $endpointSet.tcpPorts;

                    udpPorts = $endpointSet.udpPorts;

                }

            }

        }

        $ipCustomObjects

    }

    Write-Output &quot;IPv4 Firewall IP Address Ranges&quot;

    ($flatIps.ip | Sort-Object -Unique) -join &quot;,&quot; | Out-String

    Write-Output &quot;URLs for Proxy Server&quot;

    ($flatUrls.url | Sort-Object -Unique) -join &quot;,&quot; | Out-String

    # TODO Call Send-MailMessage with new endpoints data

}

else {

    Write-Host &quot;Office 365 worldwide commercial service instance endpoints are up-to-date&quot;

}

### **Example Python Script**

Here is a Python script, tested with Python 3.6.3 on Windows 10, that you can run to see if there are actions you need to take for updated data. This script checks the version number for the Office 365 Worldwide instance endpoints. When there is a change, it downloads the endpoints and filters for the &quot;Allow&quot; and &quot;Optimize&quot; category endpoints. It also uses a unique ClientRequestId across multiple calls and saves the latest version found in a temporary file. You should call this script once an hour to check for a version update.

[Copy]

import json

import os

import urllib.request

import uuid

# helper to call the webservice and parse the response

def webApiGet(methodName, instanceName, clientRequestId):

    ws = &quot;https://endpoints.office.com&quot;

    requestPath = ws + &#39;/&#39; + methodName + &#39;/&#39; + instanceName + &#39;?clientRequestId=&#39; + clientRequestId

    request = urllib.request.Request(requestPath)

    with urllib.request.urlopen(request) as response:

        return json.loads(response.read().decode())

# path where client ID and latest version number will be stored

datapath = os.environ[&#39;TEMP&#39;] + &#39;\endpoints\_clientid\_latestversion.txt&#39;

# fetch client ID and version if data exists; otherwise create new file

if os.path.exists(datapath):

    with open(datapath, &#39;r&#39;) as fin:

        clientRequestId = fin.readline().strip()

        latestVersion = fin.readline().strip()

else:

    clientRequestId = str(uuid.uuid4())

    latestVersion = &#39;0000000000&#39;

    with open(datapath, &#39;w&#39;) as fout:

        fout.write(clientRequestId + &#39;\n&#39; + latestVersion)

# call version method to check the latest version, and pull new data if version number is different

version = webApiGet(&#39;version&#39;, &#39;Worldwide&#39;, clientRequestId)

if version[&#39;latest&#39;] \&gt; latestVersion:

    print(&#39;New version of Office 365 worldwide commercial service instance endpoints detected&#39;)

    # write the new version number to the data file

    with open(datapath, &#39;w&#39;) as fout:

        fout.write(clientRequestId + &#39;\n&#39; + version[&#39;latest&#39;])

    # invoke endpoints method to get the new data

    endpointSets = webApiGet(&#39;endpoints&#39;, &#39;Worldwide&#39;, clientRequestId)

    # filter results for Allow and Optimize endpoints, and transform these into tuples with port and category

    flatUrls = []

    for endpointSet in endpointSets:

        if endpointSet[&#39;category&#39;] in (&#39;Optimize&#39;, &#39;Allow&#39;):

            category = endpointSet[&#39;category&#39;]

            urls = endpointSet[&#39;urls&#39;] if &#39;urls&#39; in endpointSet else []

            tcpPorts = endpointSet[&#39;tcpPorts&#39;] if &#39;tcpPorts&#39; in endpointSet else &#39;&#39;

            udpPorts = endpointSet[&#39;udpPorts&#39;] if &#39;udpPorts&#39; in endpointSet else &#39;&#39;

            flatUrls.extend([(category, url, tcpPorts, udpPorts) for url in urls])

    flatIps = []

    for endpointSet in endpointSets:

        if endpointSet[&#39;category&#39;] in (&#39;Optimize&#39;, &#39;Allow&#39;):

            ips = endpointSet[&#39;ips&#39;] if &#39;ips&#39; in endpointSet else []

            category = endpointSet[&#39;category&#39;]

            # IPv4 strings have dots while IPv6 strings have colons

            ip4s = [ip for ip in ips if &#39;.&#39; in ip]

            tcpPorts = endpointSet[&#39;tcpPorts&#39;] if &#39;tcpPorts&#39; in endpointSet else &#39;&#39;

            udpPorts = endpointSet[&#39;udpPorts&#39;] if &#39;udpPorts&#39; in endpointSet else &#39;&#39;

            flatIps.extend([(category, ip, tcpPorts, udpPorts) for ip in ip4s])

    print(&#39;IPv4 Firewall IP Address Ranges&#39;)

    print(&#39;,&#39;.join(sorted(set([ip for (category, ip, tcpPorts, udpPorts) in flatIps]))))

    print(&#39;URLs for Proxy Server&#39;)

    print(&#39;,&#39;.join(sorted(set([url for (category, url, tcpPorts, udpPorts) in flatUrls]))))

    # TODO send mail (e.g. with smtplib/email modules) with new endpoints data

else:

    print(&#39;Office 365 worldwide commercial service instance endpoints are up-to-date&#39;)

### **Web Service interface versioning**

Updates to the parameters or results for these web service methods may be required in the future. After the general availability version of these web services is published, Microsoft will make reasonable efforts to provide advance notice of material updates to the web service. When Microsoft believes that an update will require changes to clients using the web service, Microsoft will keep the previous version (one version back) of the web service available for at least twelve (12) months after the release of the new version. Customers who do not upgrade during that time may be unable to access the web service and its methods. Customers must ensure that clients of the web service continue working without error if the following changes are made to the web service interface signature:

- Adding a new optional parameter to an existing web method that doesn&#39;t have to be provided by older clients and doesn&#39;t impact the result an older client receives.
- Adding a new named attribute in one of the response REST items or additional columns to the response CSV.
- Adding a new web method with a new name that is not called by the older clients.