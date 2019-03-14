---
title: "Content delivery networks"
ms.author: kvice
author: kelleyvice-msft
manager: laurawi
ms.date: 3/14/2019
ms.audience: ITPro
ms.topic: conceptual
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Adm_O365
search.appverid:
- MET150
- MOE150
- BCS160
ms.assetid: 0140f704-6614-49bb-aa6c-89b75dcd7f1f
description: "Use this information to learn about Content Delivery Networks (CDNs) and how Office 365 leverages them."
---

# Content Delivery Networks

The information in this topic will help you learn about Content Delivery Networks (CDNs) and how they are used by Office 365.

CDNs help keep Office 365 fast and reliable for end users. Cloud services like Office 365 use CDNs to cache static assets closer to the browsers requesting them to speed up downloads and reduce latency. Public CDNs allow faster downloads of generic content such as javascript files, icons and images, while private CDNs can provide fast, secure access to user content such as videos and SharePoint Online document libraries.
  
 **Head back to**[Network planning and performance tuning for Office 365](https://aka.ms/tune).
  
## What exactly is a CDN?

CDNs are used by most enterprise cloud services. Cloud services like Office 365 have millions of customers downloading a mix of proprietary content (such as emails) and generic content (such as icons) at one time. It's more efficient to put images everyone uses, like icons, as close to the user's computer as possible. Yet, it isn't practical for every cloud service to build CDN datacenters that store this generic content in every metropolitan area, or even in every major Internet hub around the world, so some of these CDNs are shared.
  
CDNs can be private or public. Private CDNs are owned and operated by a single company, and only that company's applications and services can use it. Public CDNs are run by companies who lease usage to multiple companies. Depending on where you're located, it might be most efficient for Office 365 to download generic images for you from a CDN that Office 365 owns and runs, a public CDN, or a combination of the two. Regardless of what type of CDN is used, the steps to retrieve the data are the same.
  
1. Your client requests data from Office 365.

2. Office 365 either returns the data directly to your client or directs your client to a CDN.

3. If the data is already cached at the CDN, your client downloads the data directly from the nearest CDN location to your client on the internet.

4. If the data isn't cached at the CDN, the CDN node requests the data from Office 365 and then cache's the data for a period of time after your client downloads the data.

The CDNs pull the files and images from the nearest Office 365 datacenter and in turn, your client pulls the files and images from the nearest CDN. When users are accessing a cloud service, like reading email in Outlook Web App, the user's browser attempts to retrieve the files and images from the Office 365 datacenter. Instead of spending the time and bandwidth delivering the files, Office 365 redirects the browser to the CDN. The CDN figures out the closest datacenter to the user's browser and, using redirection, downloads the generic images from there. Using this CDN redirection is quick, and it saves users a lot of download time.

## How do CDNs make services work faster?

Downloading common things like icons over and over again can take up network bandwidth that can be better used for downloading important personal content, like email or documents. Because Office 365 uses an architecture that includes CDNs, the icons, scripts, and other generic content can be downloaded from servers closer to client computers, making the downloads faster. This means faster access to your personal content, which is securely stored in Office 365 datacenters.

## How should I set up my network so that CDNs work best with Office 365?

If you're planning [Network connectivity to Office 365](network-connectivity.md), it's helpful to understand how CDNs work in general, and how CDN network traffic should be managed.

When you enable a CDN for your Office 365 tenant, you begin by setting policies that govern the content sources (called **origins** in the context of CDNs), data classifications or file types you want to be distributed over the CDN. Users who access the specified content will be redirected to the closest location of the file in the CDN. Therefore, you should use the best practices outlined in [Managing Office 365 endpoints](managing-office-365-endpoints.md) to ensure that your network configuration permits client browsers to access the CDN directly rather than routing CDN traffic through central proxies to avoid introducing unnecessary latency.

## Is my data safe?

We take great care to help ensure that we protect the data that runs your business. Customer-specific data stored in CDNs is encrypted both in transit and at rest.

>
> [!NOTE] CDN providers may have privacy and compliance standards that differ from the commitments outlined by the Office 365 Trust Center. Data cached through the CDN service may not conform to the Microsoft Data Processing Terms (DPT), and may be outside of the Office 365 Trust Center compliance boundaries.

For in-depth information about privacy and data protection for Office 365 CDN providers, visit the following:  

+ Learn more about Office 365 privacy and data protection at the [Microsoft Trust Center](https://www.microsoft.com/trustcenter)
+ Learn more about Azure privacy and data protection at the [Azure Trust Center](https://azure.microsoft.com/en-us/overview/trusted-cloud/)
+ Learn more about Akamai’s privacy and data protection at the [Akamai Privacy Trust Center](https://www.akamai.com/us/en/about/compliance/data-protection-at-akamai.jsp)

## How can I secure my network with all these 3rd party services?

Leveraging an extensive set of partner services allows Office 365 to scale and meet availability requirements as well as enhance the user experience when using Office 365. The 3rd party services Office 365 leverages include both certificate revocation lists; such as crl.microsoft.com or sa.symcb.com, and CDNs; such as r3.res.outlook.com. Every CDN FQDN Office 365 uses is a custom FQDN for Office 365. If you're sent to a FQDN at the request of Office 365 you can be assured that the CDN provider controls the FQDN and the underlying content at that location.
  
For customers that still want to segregate requests destined for a Microsoft or Office 365 datacenter from requests that are destined for a 3rd party, we've written up guidance on [Managing Office 365 endpoints](https://support.office.com/article/99cab9d4-ef59-4207-9f2b-3728eb46bf9a).

## Is there a list of all the CDNs that Office 365 uses?

The CDNs in use by Office 365 are always subject to change and in many cases there are multiple CDN partners configured in the event one is unavailable. The primary CDNs in use are:

+ [Office 365 (specifically for SharePoint Online content)](https://docs.microsoft.com/en-us/office365/enterprise/use-office-365-cdn-with-spo)
+ [Microsoft Azure](https://azure.microsoft.com/documentation/services/cdn/)
+ [Akamai](https://www.akamai.com/us/en/cdn.jsp)

These CDN solutions have a global reach enhancing the reach of the service to more corners of the world. The content that is stored there includes general Office 365 scripts, files, and images. For example, when you logon to portal.office.com, the images are pulled from the nearest CDN to speed up the page load times. Other examples include Office 365 ProPlus storing the installation bits on a CDN to speed up the amount of time it takes to download the latest version of Office.

There is also some proprietary content that is stored on CDNs such as the video files for Office 365 Video. Once you upload the videos, the files are encrypted and then stored in their encrypted format with Azure Media Services. When the Office 365 video player retrieves the video it is first cached to the nearest CDN before being downloaded to speed up the amount of time it takes to download the video.

For information on how to use the Office 365 CDN, see [Use the Office 365 content delivery network with SharePoint Online](use-office-365-cdn-with-spo.md).

## Is there a list of all the FQDNs that leverage CDNs?

The list of FQDNs and how they leverage CDNs change over time, refer to our published [Office 365 URLs and IP address ranges](https://go.microsoft.com/fwlink/p/?LinkID=293744) page to get up to date on the latest FQDNs that leverage CDNs.

## Can I use my own CDN and cache content on my local network?

We're continually looking for new ways to support our customers needs and are currently exploring the use of caching proxy solutions and other on-premises CDN solutions.

## I'm using Azure ExpressRoute for Office 365, does that change things?

[Azure ExpressRoute for Office 365](azure-expressroute.md) provides a dedicated connection to Office 365 infrastructure that is segregated from the public internet. This means that clients will still need to connect over non-ExpressRoute connections to connect to CDNs and other Microsoft infrastructure that is not explicitly included in the list of services supported by ExpressRoute. For more information about how to route specific traffic such as requests destined for CDNs, refer to [Office 365 network traffic management](routing-with-expressroute.md).
  
Here's a short link you can use to come back: [https://aka.ms/o365cdns](https://aka.ms/o365cdns)
  
## See also

[Managing Office 365 endpoints](https://docs.microsoft.com/en-us/office365/enterprise/managing-office-365-endpoints)

[Office 365 URLs and IP address ranges](https://go.microsoft.com/fwlink/p/?LinkID=293744)

[Use the Office 365 content delivery network with SharePoint Online](https://docs.microsoft.com/en-us/office365/enterprise/use-office-365-cdn-with-spo)

[Microsoft Trust Center](https://www.microsoft.com/trustcenter)