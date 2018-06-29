---
title: "Content delivery networks"
ms.author: kvice
author: kelleyvice-msft
manager: laurawi
ms.date: 6/26/2018
ms.audience: ITPro
ms.topic: conceptual
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Adm_O365
search.appverid:
- MOE150
- BCS160
ms.assetid: 0140f704-6614-49bb-aa6c-89b75dcd7f1f
description: "Use this information to learn about Content Delivery Networks (CDNs) and how Office 365 leverages them. CDNs help keep Office 365 fast and reliable for end users. With CDNs, cloud services like Office 365 quickly download generic content, like icons, to your users' browser when they're using the service through a web client."
---

# Content delivery networks

Use this information to learn about Content Delivery Networks (CDNs) and how Office 365 leverages them. CDNs help keep Office 365 fast and reliable for end users. With CDNs, cloud services like Office 365 quickly download generic content, like icons, to your users' browser when they're using the service through a web client.
  
 **Head back to**[Network planning and performance tuning for Office 365](https://aka.ms/tune).
  
## How should I set up my network so that CDNs work best with Office 365?

If you're planning [Network connectivity to Office 365](network-connectivity.md), it's helpful to understand how CDNs work. It is also important to understand that you can't filter connectivity to the CDNs by IP address. We provide a best effort list of IPs for the services within Office 365, such as Exchange Online. Learn more about our recommendations for [Managing Office 365 endpoints](https://support.office.com/article/99cab9d4-ef59-4207-9f2b-3728eb46bf9a).
  
## How do CDNs make services work faster?

Downloading common things like icons over and over again can take up network bandwidth that can be better used for downloading important personal content, like email or documents. Because Office 365 uses an architecture that includes CDNs, the icons, scripts, and other generic content can be downloaded from servers closer to client computers, making the downloads faster. This means faster access to your personal content, which is securely stored in Office 365 datacenters. 
  
## What exactly is a CDN?

CDNs are used by most enterprise cloud services. Cloud services like Office 365 have millions of customers downloading a mix of proprietary content (such as emails) and generic content (such as icons) at one time. It's more efficient to put images everyone uses, like icons, as close to the user's computer as possible. Yet, it isn't practical for every cloud service to build CDN datacenters that store this generic content in every metropolitan area, or even in every major Internet hub around the world, so some of these CDNs are shared. 
  
CDNs can be private or public. Private CDNs are owned and operated by a single company, and only that company's applications and services can use it. Public CDNs are run by companies who lease usage to multiple companies. Depending on where you're located, it might be most efficient for Office 365 to download generic images for you from a CDN that Office 365 owns and runs, a public CDN, or a combination of the two. Regardless of what type of CDN is used, the steps to retrieve the data are the same.
  
1. Your client requests data from Office 365.
    
2. Office 365 either returns the data directly to your client or directs your client to a CDN.
    
3. If the data is already cached at the CDN, your client downloads the data directly from the nearest CDN location to your client on the internet.
    
4. If the data isn't cached at the CDN, the CDN node requests the data from Office 365 and then cache's the data for a period of time after your client downloads the data.
    
The CDNs pull the files and images from the nearest Office 365 datacenter and in turn, your client pulls the files and images from the nearest CDN. When users are accessing a cloud service, like reading email in Outlook Web App, the user's browser attempts to retrieve the files and images from the Office 365 datacenter. Instead of spending the time and bandwidth delivering the files, Office 365 redirects the browser to the CDN. The CDN figures out the closest datacenter to the user's browser and, using redirection, downloads the generic images from there. Using this CDN redirection is quick, and it saves users a lot of download time.
  
## Is there a list of all the FQDNs that leverage CDNs?

The list of FQDNs and how they leverage CDNs change over time, refer to our published [Office 365 endpoints page](https://go.microsoft.com/fwlink/p/?LinkID=293744) to get up to date on the latest FQDNs that leverage CDNs. 
  
## Is there a list of all the CDNs that Office 365 uses?

The CDNs in use by Office 365 are always subject to change and in many cases there are multiple CDN partners configured in the event one is unavailable. The two most common CDNs in use are [Akamai](https://www.akamai.com/us/en/cdn.jsp) and [Microsoft Azure](https://azure.microsoft.com/documentation/services/cdn/). Both of these CDN solutions have a global reach enhancing the reach of the service to more corners of the world. The content that is stored there includes general Office 365 scripts, files, and images. For example, when you logon to portal.office.com, the images are pulled from the nearest CDN to speed up the page load times. Other examples include Office 365 ProPlus storing the installation bits on a CDN to speed up the amount of time it takes to download the latest version of Office. There is also some proprietary content that is stored on CDNs such as the video files for Office 365 Video. Once you upload the videos, the files are encrypted and then stored in their encrypted format with Azure Media Services. When the Office 365 video player retrieves the video it is first cached to the nearest CDN before being downloaded to speed up the amount of time it takes to download the video.
  
## Does Office 365 offer a CDN that I can use for my own files?

Yes! Your Office 365 subscription now includes a CDN that is separate from Azure that you can use specifically for your SharePoint Online assets. For information on how to use the Office 365 CDN, see [Use the Office 365 content delivery network with SharePoint Online](use-office-365-cdn-with-spo.md).
  
## Can I use my own CDN and cache content on my local network?

We're continually looking for new ways to support our customers needs and are currently exploring the use of caching proxy solutions and other on-premises CDN solutions.
  
## Is my data safe?

We take great care to help ensure that we protect the data that runs your business. The items stored at our content delivery network partners is either encrypted; such as with [Office 365 Video](https://support.office.com/article/2bed67a1-4052-49ff-a4ce-b7e6530eb98e), or not customer specific; such as the Office 365 ProPlus installation files. Head on over to the [Office 365 Trust Center](https://go.microsoft.com/fwlink/p/?LinkId=397383) to learn more about our in-depth efforts to protect your data and your privacy. 
  
## How can I secure my network with all these 3rd party services?

Leveraging an extensive set of partner services allows Office 365 to scale and meet availability requirements as well as enhance the user experience when using Office 365. The 3rd party services Office 365 leverages include both certificate revocation lists; such as crl.microsoft.com or sa.symcb.com, and CDNs; such as r3.res.outlook.com. Every CDN FQDN Office 365 uses is a custom FQDN for Office 365, if you're sent to a FQDN at the request of Office 365 you can be assured that we control the FQDN and the underlying content at that location. 
  
For customers that still want to segregate requests destined for a Microsoft or Office 365 datacenter from requests that are destined for a 3rd party, we've written up guidance on [Managing Office 365 endpoints](https://support.office.com/article/99cab9d4-ef59-4207-9f2b-3728eb46bf9a). 
  
## I'm using Azure ExpressRoute for Office 365, does that change things?

[Azure ExpressRoute for Office 365](azure-expressroute.md) provides a dedicated connection to Office 365 infrastructure that is segregated from the public internet. This means that clients will still need to connect over non-ExpressRoute connections to connect to CDNs and other Microsoft infrastructure that is not explicitly included in the list of services supported by ExpressRoute. For more information about how to route specific traffic such as requests destined for CDNs, refer to [Office 365 network traffic management](routing-with-expressroute.md).
  
Here's a short link you can use to come back: [https://aka.ms/o365cdns](https://aka.ms/o365cdns)
  
## See also

[Office 365 endpoints FAQ](https://support.office.com/article/d4088321-1c89-4b96-9c99-54c75cae2e6d)

