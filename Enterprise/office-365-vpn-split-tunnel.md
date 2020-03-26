---
title: "Using VPN Split Tunneling with Office 365"
ms.author: kvice
author: kelleyvice-msft
manager: laurawi
ms.date: 3/26/2020
audience: Admin
ms.topic: conceptual
ms.service: o365-administration
localization_priority: Priority
search.appverid:
- MET150
ms.collection:
- Ent_O365
- Strat_O365_Enterprise
f1.keywords:
- NOCSH
description: "Guidance for how to securely configure VPN split tunneling for Office 365."
---

# Using VPN split tunneling with Office 365 to optimize Office 365 connectivity for remote users

Traditional corporate networks are often configured to work securely for a pre cloud world where most important data, services, applications are hosted on premises and are connected to the internal corporate network, as are the majority of users. Thus network infrastructure is built around these elements in that branch offices are connected back to head office via MPLS, and remote users are forced to VPN into the corporate network to access both on premises endpoints, and also the internet.

![Common VPN configuration](media/vpn-split-tunneling/vpn-common-backhaul.png)

_Figure 1: A common VPN solution for remote users where all traffic is forced back into the corporate network regardless of destination_

As organizations move to those services, data and application to the cloud, this model starts to make less and less sense as it quickly becomes cumbersome, expensive and unscalable, significantly impacting the performance and efficiency of users and restricting the ability of the organization to adapt to changing needs. Many Microsoft customers report that where a few years ago 80% of network traffic was to some internal destination, where the above model worked well for them, but that in 2020 that number is now down lower than 20% with 80% plus of traffic needing to connect to some external cloud based resource.

The recent COVID-19 crisis has accelerated this problem to require immediate solutions for the vast majority of organizations. Many have found that the forced VPN model where all traffic from remote users is forced back into the corporate network only to hairpin back out to the cloud service is not scalable or performant enough for 100% remote work scenarios such as that which this crisis has necessitated. This then requires rapid solutions for the organization to continue to operate efficiently.

For the Office 365 service, Microsoft has designed the connectivity requirements for the service with this problem squarely in mind, where a focused, tightly controlled and relatively static set of service endpoints can be Optimized very simply and quickly so as to deliver high performance for users accessing the service, and removing the burden on the VPN infrastructure so it can be used by traffic which still requires it.

Office 365 categorizes the required endpoints for the service into three categories &#39;Optimize&#39;, &#39;Allow&#39; &amp; &#39;Default&#39;. The Optimize endpoints are our focus here and have the following characteristics.

- Are Microsoft owned and managed endpoints, hosted on Microsoft infrastructure.
- Have IPs provided
- Low rate of change and are expected to remain small in number(currently 20 IP subnets)
- Are High volume and/or latency sensitive
- Are able to have required security elements provided in the service rather than inline on the network
- Account for around 70-80% of the volume of traffic seen to the Office 365 service

Microsoft can also commit that the Optimize endpoint set for the service will not change until at least June 30 2020 allowing customers to focus on other challenges rather than maintaining the configuration once initially implemented.

These tightly scoped set of endpoints can be split out of the forced VPN tunnel and sent securely and direct to the service via the user&#39;s local interface, this is known as split tunnelling.

 Security elements such as DLP, AV protection, authentication &amp; access control can all be delivered much more efficiently against these endpoints at different layers within the service. As we also divert the bulk of the traffic volume away from the VPN solution, this frees the VPN capacity up for business critical traffic which still relies on it. It also should remove the need in many cases to go through a lengthy and costly upgrade program to deal with this sudden new way of operating.

![Split Tunnel VPN configuration](media/vpn-split-tunneling/vpn-model-2.png)

_Figure 2: A split VPN solution with defined Office 365 exceptions sent direct to the service all other traffic is forced back into the corporate network regardless of destination_

From a security perspective, Microsoft has an array of security features which can be used to provide similar, or even enhanced security than that delivered by inline inspection by on premises security stacks. The Microsoft Security team's blog has a clear summary of features available and you'll find more detailed guidance within this article.

In many cases, this implementation can be achieved In a matter of hours, allowing rapid resolution to one of the most pressing problems facing organizations as they rapidly shift to full scale remote working.

## Introduction and Problem Statement: The VPN problem for remote workers in a cloud-first world

For many years enterprises have been using VPNs to support remote experiences for their users. Whilst core workloads remained on-premises, a VPN from the remote client routed through a datacenter on the corporate network was the main way to stay connected. To safeguard these connections, enterprises build layers of network security solutions along the VPN paths. This was done to protect internal infrastructure as well as to safeguard mobile browsing of external web sites by rerouting traffic into the VPN and then out through the on-premises Internet perimeter. VPNs, network perimeters and associated security infrastructure were often purpose built and scaled for a defined volume of traffic, typically with the majority of connectivity being initiated from within the corporate network, and most of it staying withing the internal network boundaries.

For quite some time, VPN models (known as force tunneling) where all connections from the remote user device are routed back into the on-premises network (known as forced tunneling) were largely sustainable for for as long as the concurrent scale of remote users was modest and the traffic volumes traversing VPN were low.  Some customers continued to use VPN _force tunneling_ as status quo even after their applications moved from inside the corporate perimeter to the public SaaS clouds - Office 365 being the prime example.

Using forced tunneled VPNs for connecting to distributed and performance sensitive cloud applications is extremely suboptimal, but the negative impact of that may have been accepted by some enterprises so as to maintain the status quo from a security perspective. An example diagram of this scenario can be seen below:

![Split Tunnel VPN configuration](media/vpn-split-tunneling/vpn-ent-challenge.png)

This problem has been growing for a number of years, with many customers reporting a significant shift of traffic patterns. Traffic which used to stay on premises, now needing to go to some external cloud source.

One Microsoft customer recently reported that in 2017 80% of their network traffic was to some internal source. In 2020 that number is now 20% as they have shifted to the cloud, these figures are not uncommon with other enterprises. Over time, the above model becomes increasingly cumbersome and unsustainable, preventing an organization from being agile as they move into a cloud first world.

The recent worldwide pandemic events changed all of has suddenly escalated this problem to require immediate remediation. The COVID-19 situation and the need to ensure safe employee experiences generated unprecedented demands on enterprise IT to support work-from-home productivity at a massive scale. Microsoft Office 365 is well positioned to help customers fulfil that demand, but high concurrency of users working from home generate large amounts of Office 365 traffic which, if routed through forced tunnel VPN and on-premises network perimeters, causes rapid saturation and runs VPN infrastructure out of capacity. In this new reality, using VPN to access Office 365 is no longer just a performance impediment, but a hard wall which not only impacts Office 365 but critical business operations which still have to rely on the VPN to operate.  scale wall.

Fortunately, Microsoft has been working closely with customers and the wider industry for many years to provide effective, modern solutions to these problems from within our own services, and also aligned to industry best practice. Solutions that apply very simply and effectively to remote workers as much as they do to branch offices. [The connectivity requirements](https://aka.ms/pnc) for the Office 365 service have been designed to work efficiently for remote users whilst still allowing an organization to maintain security and control over their connectivity. These solutions can also be implemented very quickly with limited work yet achieve significant impact on the problems outlined above.

Stated focus on Microsoft recommended strategy on VPNs, optimized for quickest possible implementation and least amount of change, unblocking most important scenarios first. Mindset: reconfigure your legacy VPN for the enterprise within hours to get ready for massive WFH of employee base.

Microsoft&#39;s recommended strategy for optimizing remote worker&#39;s connectivity is focused on rapidly alleviating the problems with the traditional approach and also providing high performance with a few simple steps. These steps adjust the legacy VPN approach for a small number of defined endpoints which are then diverted away from the bottlenecked VPN servers. Even though this is done, similar, or in many cases, increased security, can be applied at different layers to remove the need to do it at the egress of the corporate network. In most cases this can be effectively achieved within hours and is then scalable to other workloads as requirements demand, and time allows.

## Common Types of VPN scenarios

In the list below you&#39;ll see the most common VPN scenarios seen in enterprise environment.

Most customers will traditionally operate model number 1 (forced tunnel), and this document aims to help you to quickly and securely transition to model number 2, which is achievable with relatively little effort, but which has enormous benefits.

### 1. VPN Forced Tunnel

This is the most common starting scenario for most enterprise customers. A forced VPN is used which means 100% of traffic is directed into the corporate network regardless of the fact the endpoint resides within the corporate network or not. Any external (internet) bound traffic such as Office 365 or internet browsing is then hairpinned back out of the on premises security equipment such as proxies. In the current climate with nearly 100% of users working remotely, this model therefore puts extremely high load on the VPN infrastructure and is likely to significantly hinder performance of all corporate traffic and thus the enterprise to operate efficiently at a time of crisis.

![Split Tunnel VPN configuration 1](media/vpn-split-tunneling/vpn-model-1.png)

### 2. VPN Forced Tunnel with a small number of trusted exceptions

This model is significantly more efficient for an enterprise to operate under as it allows a small number of controlled and defined endpoints which are very high load and latency sensitive to bypass the VPN tunnel and go direct to the Office 365 service in this example. This significantly improves the performance for the offloaded services, and also decreases the load on the VPN infrastructure, thus allowing elements which still require it to operate with lower contention for resources.  It is this model which this article concentrates on assisting with the transition to as it allows for simple, defined actions to be taken very quickly with numerous positive outcomes.

![Split Tunnel VPN configuration 2](media/vpn-split-tunneling/vpn-model-2.png)

### 3. VPN Forced Tunnel with broad exceptions

This third model broadens the scope of model two as rather than just send a small group of defined endpoints direct, it instead sends all traffic to trusted service like Office 365, SalesForce etc direct. This further reduces the load on the corporate VPN infrastructure and improves the performance of the services defined. As this model is likely to take more time to assess the feasibility of and implement, it is likely a step which can be taken at a later date once model two is successfully in place.

![Split Tunnel VPN configuration 3](media/vpn-split-tunneling/vpn-model-3.png)

### 4. VPN selective Tunnel

This Model reverses the above model in that only traffic identified as having a corporate IP address is sent down the VPN tunnel and thus the internet path is the default route for anything else. This model requires an organization to be well on the path to [Zero Trust](https://www.microsoft.com/en-us/security/zero-trust?rtc=1) in able to safely implement this model.  However it should be noted that this model or some variation thereof will likely become the necessary default over time as more and more services move away from the corporate network and into the cloud. Microsoft uses this model internally and you can read more as to how, [in this article](https://www.microsoft.com/itshowcase/blog/running-on-vpn-how-microsoft-is-keeping-its-remote-workforce-connected/).

![Split Tunnel VPN configuration 4](media/vpn-split-tunneling/vpn-model-4.png)

### 5. No VPN

A more advanced version of model number two, whereby any internal services are published through a modern security approach such as Azure AD Proxy, MCAS, Zscaler ZPA etc.

![Split Tunnel VPN configuration 5](media/vpn-split-tunneling/vpn-model-5.png)

| **Model** | **Description** |
| --- | --- |
| 1. VPN Forced Tunnel | 100% of traffic goes into VPN tunnel, including on-premise, Internet and all O365/M365 |
| 2. VPN Forced Tunnel with few exceptions | VPN tunnel is used by default (default route points to VPN), with few, most important exempt scenarios that are allowed to go direct |
| 3. VPN Forced Tunnel with broad exceptions | VPN tunnel is used by default (default route points to VPN), with broad exceptions that are allowed to go direct (such as all Office 365, All Salesforce, All Zoom) |
| 4. VPN Selective Tunnel | VPN tunnel is used only for corpnet based services. Default route (Internet and all Internet based services) goes direct. |
| 5. No VPN | A variation of #2, where instead of legacy VPN, all corpnet services are published through modern security approaches (like Zscaler ZPA, AAD Proxy/MCAS, etc) |

## Recommended Strategy and Approach (1 page)

- Min desired split tunnel state (with a picture perhaps)
- Brief explanation why we recommend focusing on Optimize set and starting with IP exemption only (no FQDNs) as simplest config
- Brief statement why such min config is simple and static.
- Security statement why split tunnel for Optimize set is secure (targeting security decision makers). Links to security statement from Teams why opening up media doesn&#39;t pose security threats

## Implementation Guidance (1-2 pages)

 Below you&#39;ll find the simple steps required to move to a VPN forced tunnel with key focused exceptions for Office 365.

### 1. Identify the Endpoints we need to Optimize

Microsoft clearly identifiesthe key endpoints we need to optimize and marks them as such. In [the URL/IP list for the service](https://docs.microsoft.com/en-us/office365/enterprise/urls-and-ip-address-ranges) these endpoints are marked as &quot;Optimize&quot;. There are just four URLS which need to be optimized and twenty IP subnets. In just this small group of endpoints we can account for around 80% of the volume of traffic to theOffice 365 service and it also includes the latency sensitive endpoints such as those for Teams media. Essentially this is the traffic that we need to take special care of and is also the traffic which will put incredible pressure on traditional network paths.

URLs in this category have the following characteristics:

- Are Microsoft owned and managed endpoints hosted on Microsoft infrastructure.
- Have IPs provided
- Low rate of change to URLs/IPs compare to other two categories
- Expected to remain low in number of URLs
- Are High volume and/or latency sensitive

Microsoft also commits that the URLs/IPs/Port requirements for these endpoints will not change until at least June 30 2020.

The current Optimize marked URLs can be found in the table below, these should only be required in most circumstances for use in a PAC file where the endpoints are configured to be sent direct, rather than to the proxy.

| Endpoint to Optimize | Port/s | Use |
| --- | --- | --- |
| <https://outlook.office365.com> | TCP 443 | This is one of the Core URLs Outlook uses to connect to its Exchange Online server and has high volume of bandwidth usage and connection count. Low network latency is required for online features including: Instant search, Other mailbox calendars, Free / busy lookup, manage rules &amp; alerts, Exchange online archive, Emails departing the outbox. |
| <https://outlook.office.com> | TCP 443 | This is use for Outlook Online web access to connect to its Exchange Online server and network latency. Connectivity is particularly required for large file upload and download with SharePoint Online. |
| <https://\&lt;tenant\&gt;.sharepoint.com> | TCP 443 | This is the primary URL for SharePoint Online and has high volume of bandwidth usage. |
| <https://\&lt;tenant\&gt;-my.sharepoint.com> | TCP 443 | This is the primary URL for OneDrive for Business and has high volume of bandwidth and possibly high connection count from the OneDrive for Business Sync tool. |
| Teams Media IPs (no URL) | UDP 3478, 3479, 3480, and 3481 | Relay Discovery allocation and real time traffic (3478), Audio (3479), Video (3480), and Video Screen Sharing (3481). These are the endpoints used for Skype for Business and Microsoft Teams Media traffic (Calls, meetings etc). Most endpoints are provided when the Microsoft Teams client establishes a call (and are contained within the required IPs listed for the service).UDP is required for optimal media quality.   |

In the above examples, **tenant** should be replaced with your Office 365 tenant name. For example **contoso.onmicrosoft.com** would use _contoso.sharepoint.com_ and _constoso-my.sharepoint.com_.

At the time of writing the IP ranges which these endpoints correspond to are as follows. It is **very strongly** advised you use a [script such as this](https://github.com/microsoft/Office365NetworkTools/tree/master/Scripts/Display%20URL-IPs-Ports%20per%20Category) example, the [Web Service](https://docs.microsoft.com/en-us/office365/enterprise/office-365-ip-web-service) or the [URL/IP page](https://docs.microsoft.com/en-us/office365/enterprise/urls-and-ip-address-ranges) to check for any updates when applying the configuration, and put a policy in place to do so on a regular basis.

104.146.128.0/17

13.107.128.0/22

13.107.136.0/22

13.107.18.10/31

13.107.6.152/31

13.107.64.0/18

131.253.33.215/32

132.245.0.0/16

150.171.32.0/22

150.171.40.0/22

191.234.140.0/22

204.79.197.215/32

23.103.160.0/20

40.104.0.0/15

40.108.128.0/17

40.96.0.0/13

52.104.0.0/14

52.112.0.0/14

52.96.0.0/14

52.120.0.0/14

### 1. Optimize access to these endpoints via the VPN

Now that we have identified these critical endpoints, we need to divert them away from the VPN tunnel and allow them to use the user&#39;s local internet connection to connect directly to the service. The manner in which this is accomplished will vary depending on the VPN product and machine platform used but most VPN solutions will allow some simple configuration of policy to apply this logic. Some examples of how to achieve this with some of the most common VPN solutions can be found later in this document.

//Insert example here (working on this)

The VPN client should therefore be configured so that traffic to the above, Optimize marked IPs are routed in this way. This allows the traffic to utilize local Microsoft resources such as Office 365 Service Front Doors [such as AFD as one example,](https://azure.microsoft.com/en-us/blog/azure-front-door-service-is-now-generally-available/) which deliver Office 365 services &amp; connectivity points as close to your users as possible. This allows us to deliver extremely high performance levels to users wherever they are in the world. There is also [Microsoft&#39;s world class global network](https://azure.microsoft.com/en-us/blog/how-microsoft-builds-its-fast-and-reliable-global-network/) which is very likely within  a small number of milliseconds of your users direct egress, and is designed to take your traffic securely to Microsoft resources wherever they may be in the world, as efficiently as possible.

The solution would look something like that below.

![Split Tunnel VPN configuration detail](media/vpn-split-tunneling/vpn-split-detail.png)

#### Additional information on configuring and securing Teams media traffic

Some administrators prefer some more detailed information on how call flows operate in Teams and how we secure connectivity.

**Configuration:**

For both 1:1 calls and also meetings, as long as the required Optimize marked IP subnets for Teams media are correctly in place in the route table, when Teams calls GetBestRoute to determine which interface it should use for a particular destination, the local interface will be returned for Microsoft destinations in the Microsoft IP blocks listed above.

A current requirement for this to work in 100% of scenarios is to also add the IP range 13.107.60.1/32

This should not be necessary very shortly due to an update in the latest Teams client due for release w/c March 30 2020.

Signalling traffic is performed over HTTPS and is not as latency sensitive as the media traffic and thus is marked as &quot;Allow&quot; in the URL/IP data and thus can safely be routed through the VPN client if desired.

**Security:**

One common argument for avoiding split tunnels is that it is less secure to do so, i.e any traffic that does not go through the VPN tunnel will not benefit from whatever encryption scheme the VPN tunnel likely has, and therefore, is less secure.

The main counter argument to this is that media traffic is already encrypted via SRTP. SRTP itself relies on a randomly generated session key, which is exchanged via the TLS secured signaling channel. This is covered in great detail within [this security guide](https://docs.microsoft.com/en-us/skypeforbusiness/optimizing-your-network/security-guide-for-skype-for-business-online,) but the primary section of interest is:

#### Media Encryption

Media traffic is encrypted using Secure RTP (SRTP), a profile of Real-Time Transport Protocol (RTP) that provides confidentiality, authentication, and replay attack protection to RTP traffic. SRTP uses a session key generated by using a secure random number generator and exchanged using the signaling TLS channel. In addition, media flowing in both directions between the Mediation Server and its internal next hop is also encrypted using SRTP.

SfBO generates username/passwords for secure access to media relays over TURN. Media relays exchange the username/password over a TLS-secured SIP channel.

Also it is worth noting that even though a VPN tunnel may be used to connect the client to the corporate network, the traffic still needs to flow in it&#39;s SRTP form when it leaves the corporate network to reach the service.

Information on how Teams mitigates common security concerns such as voice or STUN amplification attacks can be [found in this article](https://docs.microsoft.com/en-us/openspecs/office_protocols/ms-ice2/69525351-8c68-4864-b8a6-04bfbc87785c).

### Testing

Once the policy is in place how do you test to confirm it is working as expected?

There are multiple ways of testing the path is correctly set to use the local internet connection such as:

- A simple tracert to an endpoint within scope of the split tunnel should show the path taken, for example:

```cmd
tracert worldaz.tr.teams.microsoft.com
```

You should then see a path via the local ISP to this endpoint which should resolve to an IP in the Teams ranges we have configured for split tunnelling.

- Run the tool at [https://connectivity.office.com/](https://connectivity.office.com/) which will run connectivity tests for you including trace routes as above. We&#39;re also adding in VPN tests into this tooling which should also provide some additional insight.

- Take a network capture using a tool such as Wireshark. Filter on UDP during a call and you should see traffic flowing to an IP in the Teams Optimize range. If the VPN tunnel is being used for this traffic, then the media traffic will not be visible in the trace.

### Additional support logs

If you need further data to troubleshoot, or are requesting assistance from Microsoft support, obtaining the following information should allow you to expediate finding a solution

- Concise set of steps.  Largely a port from relevant sections from PaulC blog.  Needs to reflect not just IP ranges, position on FQDN, .pac files, FW blocks (for media), etc
- List of additional features that may need reconfiguration in connection to VPN change (e.g. AAD CA, EXO and SPO IP lists, etc)
- Concise guidance how to ensure/test that the right setup is achieved
- Concise recommendation on how to raise support questions for most rapid response (what info to collect, logs)
- Third party links (for partners who have published similar implementation guidance for O365 for their products)

### How to guides for common VPN solutions

Below you&#39;ll find links with detailed guides on how to implement split tunneling for Office 365 traffic from the most common partners in this space. We&#39;ll add additional guides as they become available.

## FAQ (1-2 pages)

The Microsoft Security Team have published an article here awaiting URL which outlines key ways for security professionals and IT can achieve modern security controls in today&#39;s unique remote work scenarios. In addition, below are some of the common customer questions and answers.

### How do I stop users accessing other tenants I do not trust where they could exfiltrate data?

A: The answer is a [feature called tenant restrictions](https://docs.microsoft.com/en-us/azure/active-directory/manage-apps/tenant-restrictions). Authentication traffic is not high volume nor especially latency sensitive so can be sent through the VPN solution to the on-premises proxy where the feature is applied. An allow list of trusted tenants is maintained here and if the client attempts to obtain a token to a tenant which is not trusted, the proxy simply denies the request. If the tenant is trusted, then a token is accessible if the user has the right credentials and rights.

So even though a user can make a TCP/UDP connection to the Optimize marked endpoints above, without a valid token to access the tenant in question, they simply cannot login and access/move any data.

### Does this model allow access to consumer services such as personal OneDrive accounts?

A: No, it does not, the Office 365 endpoints are not the same as the consumer services (Onedrive.live.com as an example) so the split tunnel will not allow a user to directly access consumer services. Traffic to consumer endpoints will continue to use the VPN tunnel and existing policies will continue to apply.

### How do I apply DLP and protect my sensitive data when the traffic no longer flows through my on-premises solution?

A: To help you prevent the accidental disclosure of sensitive information, Office 365 has a rich set of [built-in tools](https://docs.microsoft.com/en-us/microsoft-365/compliance/data-loss-prevention-policies?view=o365-worldwide). You can use the built-in [DLP capabilities](https://docs.microsoft.com/en-us/microsoft-365/compliance/data-loss-prevention-policies?view=o365-worldwide) of Teams and SharePoint to detect inappropriately stored or shared sensitive information. If part of your remote work strategy involves a bring-your-own-device (BYOD) policy, you can use [Conditional Access App Control](https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/app-based-conditional-access) to prevent sensitive data from being downloaded to users&#39; personal devices

### How do I evaluate and maintain control of the user&#39;s authentication when they are connecting directly?

A: In addition to the tenant restrictions feature noted in Q1, [conditional access policies](https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/overview) can be applied to dynamically assess the risk of an authentication request and react appropriately. Microsoft recommends the [Zero Trust model](https://www.microsoft.com/en-us/security/zero-trust?rtc=1) is implemented over time and we can use Azure AD conditional access policies to maintain control in a mobile &amp; cloud first world. Conditional access policies can be used to make a real-time decision on whether an authentication request is successful based on numerous factors such as:

- Device, is the device known/trusted/Domain joined?
- IP – is the authentication request coming from a known corporate IP address? Or from a country we do not trust?
- Application – Is the user authorized to use this application?

We can then trigger policy such as approve, trigger MFA or block authentication based on these policies.

### How do I protect against viruses and malware?

A: Again, Office 365 provides protection for the Optimize marked endpoints in various layers in the service itself, [outlined in this document](https://docs.microsoft.com/en-us/office365/Enterprise/office-365-malware-and-ransomware-protection). As noted, it is vastly more efficient to provide these security elements in the service itself rather than try and do it in line with devices which may not fully understand the protocols/traffic.By default, SharePoint Online [automatically scans file uploads](https://docs.microsoft.com/en-us/microsoft-365/security/office-365-security/virus-detection-in-spo?view=o365-worldwide) for known malware

For the Exchange endpoints listed above, [Exchange Online Protection](https://docs.microsoft.com/en-us/office365/servicedescriptions/exchange-online-protection-service-description/exchange-online-protection-service-description) and [Office 365 Advanced Threat Protection](https://docs.microsoft.com/en-us/office365/servicedescriptions/office-365-advanced-threat-protection-service-description) do an excellent job of providing security of the traffic to the service.

### Can I send more than just the Optimize traffic direct?

A. Priority should be given to the Optimize marked endpoints as these will give maximum benefit for a low level of work. However, if you wish, the Allow marked endpoints are required for the service to work and have IPs provided for the endpoints which can be used if required.

There are also various vendors who offer cloud based proxy/security solutions called secure web gateways which provide central security, control and corporate policy application for general web browsing. These solutions can work well in a cloud first world, if highly available, performant, and provisioned close to your users by allowing secure internet access to be delivered from a cloud based location close to the user. This removes the need for a hairpin through the VPN/corporate network for general browsing traffic, whilst still allowing central security control.

Even with these solutions in place however, Microsoft still strongly recommends the Optimize marked Office 365 traffic is sent direct to the service.

For allowing direct access to an Azure Virtual Network, the Azure team have published a guide on how to accomplish this [here](https://docs.microsoft.com/en-us/azure/vpn-gateway/work-remotely-support).

### Why is port 80 required? Is traffic sent in the clear?

A. Port 80 is only used for things like redirect to a port 443 session, no customer data is sent or is accessible over port 80. [This article](https://docs.microsoft.com/en-us/microsoft-365/compliance/encryption?view=o365-worldwide) outlines encryption for data in transit, and at rest for Office 365 and [this article](https://docs.microsoft.com/en-us/microsoftteams/microsoft-teams-online-call-flows#types-of-traffic) outlines how we use SRTP to protect Teams media traffic.

### Does this advice apply to users in China using a worldwide instance of Office 365?

A. No it does not. The one caveat to the above advice is users in the PRC who are connecting to a worldwide instance of Office 365. Due to the common occurrence of cross border network congestion in the region, direct internet egress performance can be variable. Most customers in the region operate using a VPN to bring the traffic into the corporate network and utilize their authorized MPLS circuit or similar to egress outside the country via an optimized path. This is outlined further in this article [https://docs.microsoft.com/en-us/office365/enterprise/office-365-networking-china](https://docs.microsoft.com/en-us/office365/enterprise/office-365-networking-china)
