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
description: "Guidance for using VPN split tunneling with Office 365 to optimize Office 365 connectivity for remote users."
---

# Using VPN split tunneling with Office 365 to optimize Office 365 connectivity for remote users

Traditional corporate networks are often configured to work securely for a pre-cloud world where most important data, services, applications are hosted on premises and are connected to the internal corporate network, as are the majority of users. Thus network infrastructure is built around these elements in that branch offices are connected to the head office via _Multiprotocol Label Switching (MPLS)_ networks, and remote users must connect to the corporate network over a VPN to access both on premises endpoints and the Internet. In this model, all traffic from remote users traverses the corporate network and is routed to the cloud service through a common egress point.

![Forced VPN configuration](media/vpn-split-tunneling/vpn-common-backhaul.png)

_Figure 1: A common VPN solution for remote users where all traffic is forced back into the corporate network regardless of destination_

As organizations move data and applications to the cloud, this model starts to make less and less sense as it quickly becomes cumbersome, expensive and unscalable, significantly impacting network performance and efficiency of users and restricting the ability of the organization to adapt to changing needs. Many Microsoft customers report that where a few years ago 80% of network traffic was to an internal destination, in 2020 80% plus of traffic connects to an external cloud based resource.

The COVID-19 crisis has aggravated this problem to require immediate solutions for the vast majority of organizations. Many customers have found that the forced VPN model is not scalable or performant enough for 100% remote work scenarios such as that which this crisis has necessitated. Rapid solutions are required for these organization to continue to operate efficiently.

For the Office 365 service, Microsoft has designed the connectivity requirements for the service with this problem squarely in mind, where a focused, tightly controlled and relatively static set of service endpoints can be optimized very simply and quickly so as to deliver high performance for users accessing the service, and reducing the burden on the VPN infrastructure so it can be used by traffic which still requires it.

Office 365 categorizes the required endpoints for Office 365 into three categories: **Optimize**, **Allow** and **Default**. **Optimize** endpoints are our focus here and have the following characteristics:

- Are Microsoft owned and managed endpoints, hosted on Microsoft infrastructure
- Have IPs provided
- Low rate of change and are expected to remain small in number(currently 20 IP subnets)
- Are high volume and/or latency sensitive
- Are able to have required security elements provided in the service rather than inline on the network
- Account for around 70-80% of the volume of traffic to the Office 365 service

Microsoft can also commit that **Optimize** endpoints for Office 365 will not change until at least **June 30 2020**, allowing customers to focus on other challenges rather than maintaining the configuration once initially implemented.

This tightly scoped set of endpoints can be split out of the forced VPN tunnel and sent securely and directly to the Office 365 service via the user's local interface. This is known as **split tunnelling**.

 Security elements such as DLP, AV protection, authentication and access control can all be delivered much more efficiently against these endpoints at different layers within the service. As we also divert the bulk of the traffic volume away from the VPN solution, this frees the VPN capacity up for business critical traffic which still relies on it. It also should remove the need in many cases to go through a lengthy and costly upgrade program to deal with this new way of operating.

![Split Tunnel VPN configuration](media/vpn-split-tunneling/vpn-model-2.png)

_Figure 2: A split VPN solution with defined Office 365 exceptions sent direct to the service. All other traffic is forced back into the corporate network regardless of destination._

From a security perspective, Microsoft has an array of security features which can be used to provide similar, or even enhanced security than that delivered by inline inspection by on premises security stacks. The Microsoft Security team's blog has a clear summary of features available and you'll find more detailed guidance within this article.

In many cases, this implementation can be achieved in a matter of hours, allowing rapid resolution to one of the most pressing problems facing organizations as they rapidly shift to full scale remote working.

For more information on VPN models and the challenges of optimizing VPN architectures for modern remote work requirements, visit [The VPN problem for remote workers in a cloud-first world](office-365-vpn-models.md).


## Recommended Strategy and Approach

- Min desired split tunnel state (with a picture perhaps)
- Brief explanation why we recommend focusing on Optimize set and starting with IP exemption only (no FQDNs) as simplest config
- Brief statement why such min config is simple and static.
- Security statement why split tunnel for Optimize set is secure (targeting security decision makers). Links to security statement from Teams why opening up media doesn't pose security threats

## Implementation Guidance

 Below you'll find the simple steps required to move to a VPN forced tunnel with key focused exceptions for Office 365.

### 1. Identify the endpoints to optimize

Microsoft clearly identifies the key endpoints you need to optimize and marks them as such. In the [URL/IP list for Office 365](https://docs.microsoft.com/office365/enterprise/urls-and-ip-address-ranges), these endpoints are marked as **Optimize**. There are just four URLS which need to be optimized and twenty IP subnets. This small group of endpoints accounts for around 80% of the volume of traffic to the Office 365 service including the latency sensitive endpoints such as those for Teams media. Essentially this is the traffic that we need to take special care of and is also the traffic which will put incredible pressure on traditional network paths.

#### Optimize URLs

The current Optimize URLs can be found in the table below. Under most circumstances, you should only need to use URL endpoints in a [browser PAC file](managing-office-365-endpoints.md#use-a-pac-file-for-direct-routing-of-vital-office-365-traffic) where the endpoints are configured to be sent direct, rather than to the proxy.

| Optimize URLs | Port/Protocol | Purpose |
| --- | --- | --- |
| <https://outlook.office365.com> | TCP 443 | This is one of the primary URLs Outlook uses to connect to its Exchange Online server and has a high volume of bandwidth usage and connection count. Low network latency is required for online features including: instant search, other mailbox calendars, free / busy lookup, manage rules and alerts, Exchange online archive, emails departing the outbox. |
| <https://outlook.office.com> | TCP 443 | This URL is used for Outlook Online Web Access to connect to Exchange Online server, and is sensitive to network latency. Connectivity is particularly required for large file upload and download with SharePoint Online. |
| <https://\&lt;tenant\&gt;.sharepoint.com> | TCP 443 | This is the primary URL for SharePoint Online and has high bandwidth usage. |
| <https://\&lt;tenant\&gt;-my.sharepoint.com> | TCP 443 | This is the primary URL for OneDrive for Business and has high bandwidth usage and possibly high connection count from the OneDrive for Business Sync tool. |
| Teams Media IPs (no URL) | UDP 3478, 3479, 3480, and 3481 | Relay Discovery allocation and real time traffic (3478), Audio (3479), Video (3480), and Video Screen Sharing (3481). These are the endpoints used for Skype for Business and Microsoft Teams Media traffic (calls, meetings etc). Most endpoints are provided when the Microsoft Teams client establishes a call (and are contained within the required IPs listed for the service). Use of the UDP protocol is required for optimal media quality.   |

In the above examples, **tenant** should be replaced with your Office 365 tenant name. For example, **contoso.onmicrosoft.com** would use _contoso.sharepoint.com_ and _constoso-my.sharepoint.com_.

#### Optimize IP address ranges

At the time of writing the IP ranges which these endpoints correspond to are as follows. It is **very strongly** advised you use a [script such as this](https://github.com/microsoft/Office365NetworkTools/tree/master/Scripts/Display%20URL-IPs-Ports%20per%20Category) example, the [Office 365 IP and URL web service](https://docs.microsoft.com/office365/enterprise/office-365-ip-web-service) or the [URL/IP page](https://docs.microsoft.com/office365/enterprise/urls-and-ip-address-ranges) to check for any updates when applying the configuration, and put a policy in place to do so on a regular basis.

```
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
```

### 2. Optimize access to these endpoints via the VPN

Now that we have identified these critical endpoints, we need to divert them away from the VPN tunnel and allow them to use the user's local Internet connection to connect directly to the service. The manner in which this is accomplished will vary depending on the VPN product and machine platform used but most VPN solutions will allow some simple configuration of policy to apply this logic. Some examples of how to achieve this with some of the most common VPN solutions can be found later in this document.

//Insert example here (working on this)

The VPN client should be configured so that traffic to the **Optimize** IPs are routed in this way. This allows the traffic to utilize local Microsoft resources such as Office 365 Service Front Doors [such as the Azure Front Door](https://azure.microsoft.com/blog/azure-front-door-service-is-now-generally-available/) which deliver Office 365 services and connectivity endpoints as close to your users as possible. This allows us to deliver extremely high performance levels to users wherever they are in the world. There is also [Microsoft's world class global network](https://azure.microsoft.com/blog/how-microsoft-builds-its-fast-and-reliable-global-network/) which is very likely within a small number of milliseconds of your users' direct egress, and is designed to take your traffic securely to Microsoft resources wherever they may be in the world as efficiently as possible.

The solution would look something like the diagram below.

![Split Tunnel VPN configuration detail](media/vpn-split-tunneling/vpn-split-detail.png)

## Configuring and securing Teams media traffic

Some administrators may require more detailed information on how call flows operate in Teams using a split tunneling model and how connections are secured.

### Configuration

For both calls and meetings, as long as the required Optimize IP subnets for Teams media are correctly in place in the route table, when Teams calls the _GetBestRoute_ method to determine which interface it should use for a particular destination, the local interface will be returned for Microsoft destinations in the Microsoft IP blocks listed above.

A current requirement for this to work in 100% of scenarios is to also add the IP range **13.107.60.1/32**. This should not be necessary very shortly due to an update in the latest Teams client due for release w/c **March 30 2020**.

Signalling traffic is performed over HTTPS and is not as latency sensitive as the media traffic and is marked as **Allow** in the URL/IP data and thus can safely be routed through the VPN client if desired.

### Security

One common argument for avoiding split tunnels is that it is less secure to do so, i.e any traffic that does not go through the VPN tunnel will not benefit from whatever encryption scheme is applied to the VPN tunnel, and is therefore less secure.

The main counter-argument to this is that media traffic is already encrypted via _Secure Real-Time Transport Protocol (SRTP)_, a profile of Real-Time Transport Protocol (RTP) that provides confidentiality, authentication, and replay attack protection to RTP traffic. SRTP itself relies on a randomly generated session key, which is exchanged via the TLS secured signaling channel. This is covered in great detail within [this security guide](https://docs.microsoft.com/skypeforbusiness/optimizing-your-network/security-guide-for-skype-for-business-online), but the primary section of interest is:

### Media Encryption

Media traffic is encrypted using SRTP, which uses a session key generated by a secure random number generator and exchanged using the signaling TLS channel. In addition, media flowing in both directions between the Mediation Server and its internal next hop is also encrypted using SRTP.

Skype for Business Online generates username/passwords for secure access to media relays over _Traversal Using Relays around NAT (TURN)_. Media relays exchange the username/password over a TLS-secured SIP channel. It is worth noting that even though a VPN tunnel may be used to connect the client to the corporate network, the traffic still needs to flow in its SRTP form when it leaves the corporate network to reach the service.

Information on how Teams mitigates common security concerns such as voice or _Session Traversal Utilities for NAT (STUN)_ amplification attacks can be [found in this article](https://docs.microsoft.com/openspecs/office_protocols/ms-ice2/69525351-8c68-4864-b8a6-04bfbc87785c).

### Testing

Once the policy is in place, you should confirm it is working as expected. There are multiple ways of testing the path is correctly set to use the local Internet connection:

- Run the tool at [https://connectivity.office.com/](https://connectivity.office.com/) which will run connectivity tests for you including trace routes as above. We're also adding in VPN tests into this tooling which should also provide some additional insight.

- A simple tracert to an endpoint within scope of the split tunnel should show the path taken, for example:

  ```powershell
  tracert worldaz.tr.teams.microsoft.com
  ```

  You should then see a path via the local ISP to this endpoint which should resolve to an IP in the Teams ranges we have configured for split tunnelling.

- Take a network capture using a tool such as Wireshark. Filter on UDP during a call and you should see traffic flowing to an IP in the Teams Optimize range. If the VPN tunnel is being used for this traffic, then the media traffic will not be visible in the trace.

### Additional support logs

If you need further data to troubleshoot, or are requesting assistance from Microsoft support, obtaining the following information should allow you to expediate finding a solution

- Concise set of steps.  Largely a port from relevant sections from PaulC blog.  Needs to reflect not just IP ranges, position on FQDN, .pac files, FW blocks (for media), etc
- List of additional features that may need reconfiguration in connection to VPN change (e.g. AAD CA, EXO and SPO IP lists, etc)
- Concise guidance how to ensure/test that the right setup is achieved
- Concise recommendation on how to raise support questions for most rapid response (what info to collect, logs)
- Third party links (for partners who have published similar implementation guidance for O365 for their products)

## HOWTO guides for common VPN solutions

This section provides links to detailed guides for implementing split tunneling for Office 365 traffic from the most common partners in this space. We'll add additional guides as they become available.

## FAQ

The Microsoft Security Team have published [an article](https://www.microsoft.com/security/blog/2020/03/26/alternative-security-professionals-it-achieve-modern-security-controls-todays-unique-remote-work-scenarios/) which outlines key ways for security professionals and IT can achieve modern security controls in today's unique remote work scenarios. In addition, below are some of the common customer questions and answers.

### How do I stop users accessing other tenants I do not trust where they could exfiltrate data?

The answer is a [feature called tenant restrictions](https://docs.microsoft.com/azure/active-directory/manage-apps/tenant-restrictions). Authentication traffic is not high volume nor especially latency sensitive so can be sent through the VPN solution to the on-premises proxy where the feature is applied. An allow list of trusted tenants is maintained here and if the client attempts to obtain a token to a tenant which is not trusted, the proxy simply denies the request. If the tenant is trusted, then a token is accessible if the user has the right credentials and rights.

So even though a user can make a TCP/UDP connection to the Optimize marked endpoints above, without a valid token to access the tenant in question, they simply cannot login and access/move any data.

### Does this model allow access to consumer services such as personal OneDrive accounts?

No, it does not, the Office 365 endpoints are not the same as the consumer services (Onedrive.live.com as an example) so the split tunnel will not allow a user to directly access consumer services. Traffic to consumer endpoints will continue to use the VPN tunnel and existing policies will continue to apply.

### How do I apply DLP and protect my sensitive data when the traffic no longer flows through my on-premises solution?

To help you prevent the accidental disclosure of sensitive information, Office 365 has a rich set of [built-in tools](https://docs.microsoft.com/microsoft-365/compliance/data-loss-prevention-policies?view=o365-worldwide). You can use the built-in [DLP capabilities](https://docs.microsoft.com/microsoft-365/compliance/data-loss-prevention-policies?view=o365-worldwide) of Teams and SharePoint to detect inappropriately stored or shared sensitive information. If part of your remote work strategy involves a bring-your-own-device (BYOD) policy, you can use [Conditional Access App Control](https://docs.microsoft.com/azure/active-directory/conditional-access/app-based-conditional-access) to prevent sensitive data from being downloaded to users' personal devices

### How do I evaluate and maintain control of the user's authentication when they are connecting directly?

In addition to the tenant restrictions feature noted in Q1, [conditional access policies](https://docs.microsoft.com/azure/active-directory/conditional-access/overview) can be applied to dynamically assess the risk of an authentication request and react appropriately. Microsoft recommends the [Zero Trust model](https://www.microsoft.com/security/zero-trust?rtc=1) is implemented over time and we can use Azure AD conditional access policies to maintain control in a mobile and cloud first world. Conditional access policies can be used to make a real-time decision on whether an authentication request is successful based on numerous factors such as:

- Device, is the device known/trusted/Domain joined?
- IP – is the authentication request coming from a known corporate IP address? Or from a country we do not trust?
- Application – Is the user authorized to use this application?

We can then trigger policy such as approve, trigger MFA or block authentication based on these policies.

### How do I protect against viruses and malware?

Again, Office 365 provides protection for the Optimize marked endpoints in various layers in the service itself, [outlined in this document](https://docs.microsoft.com/office365/Enterprise/office-365-malware-and-ransomware-protection). As noted, it is vastly more efficient to provide these security elements in the service itself rather than try and do it in line with devices which may not fully understand the protocols/traffic.By default, SharePoint Online [automatically scans file uploads](https://docs.microsoft.com/microsoft-365/security/office-365-security/virus-detection-in-spo?view=o365-worldwide) for known malware

For the Exchange endpoints listed above, [Exchange Online Protection](https://docs.microsoft.com/office365/servicedescriptions/exchange-online-protection-service-description/exchange-online-protection-service-description) and [Office 365 Advanced Threat Protection](https://docs.microsoft.com/office365/servicedescriptions/office-365-advanced-threat-protection-service-description) do an excellent job of providing security of the traffic to the service.

### Can I send more than just the Optimize traffic direct?

Priority should be given to the Optimize marked endpoints as these will give maximum benefit for a low level of work. However, if you wish, the Allow marked endpoints are required for the service to work and have IPs provided for the endpoints which can be used if required.

There are also various vendors who offer cloud based proxy/security solutions called secure web gateways which provide central security, control and corporate policy application for general web browsing. These solutions can work well in a cloud first world, if highly available, performant, and provisioned close to your users by allowing secure Internet access to be delivered from a cloud based location close to the user. This removes the need for a hairpin through the VPN/corporate network for general browsing traffic, whilst still allowing central security control.

Even with these solutions in place however, Microsoft still strongly recommends the Optimize marked Office 365 traffic is sent direct to the service.

For allowing direct access to an Azure Virtual Network, the Azure team have published a guide on how to accomplish this [here](https://docs.microsoft.com/azure/vpn-gateway/work-remotely-support).

### Why is port 80 required? Is traffic sent in the clear?

Port 80 is only used for things like redirect to a port 443 session, no customer data is sent or is accessible over port 80. [This article](https://docs.microsoft.com/microsoft-365/compliance/encryption?view=o365-worldwide) outlines encryption for data in transit, and at rest for Office 365 and [this article](https://docs.microsoft.com/microsoftteams/microsoft-teams-online-call-flows#types-of-traffic) outlines how we use SRTP to protect Teams media traffic.

### Does this advice apply to users in China using a worldwide instance of Office 365?

**No**. The one caveat to the above advice is users in the PRC who are connecting to a worldwide instance of Office 365. Due to the common occurrence of cross border network congestion in the region, direct Internet egress performance can be variable. Most customers in the region operate using a VPN to bring the traffic into the corporate network and utilize their authorized MPLS circuit or similar to egress outside the country via an optimized path. This is outlined further in this article [https://docs.microsoft.com/office365/enterprise/office-365-networking-china](https://docs.microsoft.com/office365/enterprise/office-365-networking-china)

## Related topics

[Alternative ways for security professionals and IT to achieve modern security controls in today's unique remote work scenarios (Microsoft Security Team blog)](https://www.microsoft.com/security/blog/2020/03/26/alternative-security-professionals-it-achieve-modern-security-controls-todays-unique-remote-work-scenarios/)

[The VPN problem for remote workers in a cloud-first world](office-365-vpn-models.md)
