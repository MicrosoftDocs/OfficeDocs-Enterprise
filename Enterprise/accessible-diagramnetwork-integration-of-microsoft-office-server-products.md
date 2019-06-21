---
title: "Accessible diagram - Network Integration of Microsoft Office Server Products"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 12/15/2017
audience: ITPro
ms.topic: article
ms.collection: Ent_O365
ms.service: o365-solutions
localization_priority: Normal
ms.assetid: 89f564eb-95c3-4077-bb92-75bf71b51270
description: "This article is an accessible text version of the diagram named Network Integration of Microsoft Office Server Products."
---

# Accessible diagram - Network Integration of Microsoft Office Server Products

**Summary:** This article is an accessible text version of the diagram named Network Integration of Microsoft Office Server Products.
  
This poster provides a general illustration of a network environment that includes Lync Server 2013, SharePoint 2013, and Exchange Server 2013. It also illustrates the following networking elements that are common across these products: remote and internal access, authentication, client traffic, and routing traffic through shared devices. 
  
## High-level concepts for Lync, Exchange, SharePoint Server, and Office Web Apps

### About the design

#### Streamlined network design

This topology illustrates an on-premises network deployment of SharePoint 2013, Exchange Server 2013, and Lync Server 2013. It also shows the use of the Microsoft cloud-based service, Exchange Online Protection, which provides spam and malware protection for inbound Simple Mail Transfer Protocol (SMTP) traffic from the Internet. 
  
This network design is streamlined to a minimum set of network features. The design does not take into account additional security or infrastructure features that some organizations might require. 
  
This diagram: 
  
- Provides an example network topology illustrating inbound and outbound traffic through a gateway router and load balancing of client session traffic (external and internal) to the appropriate SharePoint, Exchange, and Lync server tiers. 
    
- Shows the use of optional remote access servers, such as a third-party VPN gateway or DirectAccess server, to provide secure communication for roaming or remote employees. 
    
- Details the SharePoint, Exchange, and Lync traffic flow from the client to each platform server tier. 
    
- Identifies the type of remote or internal access connection based on client (such as partner or employee), and the authentication method used. 
    
- Breaks down the SharePoint, Exchange, and Lync platforms by required server roles, identifying the front end, application, database, and other levels. 
    
The architecture used here for SharePoint, Lync, and Exchange does not suggest a preferred way of implementing these platforms. It merely provides an example as topologies differ based on unique network requirements and security considerations. 
  
#### Gateway router

For this topology, the gateway router sits at the edge of the network and routes all incoming and outgoing traffic to and from the intranet. Alternatively, there could also be other components that bridge the gap between the gateway router and the load balancer shown, such as multiple layers of firewalls. This topology represents just one way to deploy your network out of many. In this configuration, the gateway is configured with access control lists (ACLs) to permit very specific incoming and outgoing IP-based traffic on the router interfaces. ACLs, advanced inspection, or Network Address Translation (NAT) can also be performed on other devices, such as firewalls, throughout your network. 
  
#### Load balancer and reverse proxy devices

You can use hardware or software load balancing solutions to redirect traffic for segments including SharePoint front-end web servers and Exchange Client Access Servers (CASs). In some cases it's optimal to use a layer 7 hardware-based load balancer for persistence requirements as it can perform better by using information in the request, such as cookies or headers. However, factors like cost and increased utilization and workload from such a solution might not be desirable for your specific needs. Consider the following points for load balancing across SharePoint, Exchange, and Lync: 
  
- SharePoint - For SharePoint 2013, you do not need to enable affinity for your front-end web servers. Normally, this would be used for creating sticky sessions and avoiding multiple authentication requests from clients to each front-end web server. The new Distributed Cache service in SharePoint 2013 stores and distributes logon tokens across the web servers of the SharePoint farm. 
    
- Exchange - In Exchange 2013, the CAS role is designed to use layer 4 load balancing, distributing requests at the transport layer. This can significantly decrease load balancer utilization and workload. 
    
- Lync - Domain Name System (DNS) load balancing is recommended for Session Initiation Protocol (SIP) traffic for Lync pools. Hardware load balancing (HLB) is required for Lync Web (HTTPS) traffic. 
    
### Remote access options

There are several options that can publish intranet resources for partners on the Internet or provide secure remote access for remote or roaming employees. Such examples include reverse proxies, DirectAccess, and third-party VPN gateways. The remote access solutions discussed later in this section are possibilities for SharePoint, Lync, and Exchange, or any combination of these servers in an on-premises deployment. However, some remote options might not work with a particular solution. 
  
Reverse Proxy - A reverse proxy supports traffic encryption, such as Secure Sockets Layer (SSL), and with it you can publish intranet applications and web resources to authenticated users and partners on the Internet. An example is Microsoft Forefront Unified Access Gateway (UAG). Many hardware load balancers also support reverse proxy functionality. However, there are still valid scenarios for using a standalone solution based on your needs and requirements, such as traffic isolation, security compartmentalization, and performance optimization. 
  
Reverse-proxy benefits and considerations: 
  
- Provides authenticated and secured access for partners or users accessing intranet resources (uses SSL (TCP 443) between the client and reverse proxy server). 
    
- For Exchange, a benefit of using a reverse proxy such as Forefront UAG is pre-authentication before accessing the Exchange Client access server. Remote access users using published applications such as Outlook Web Access (OWA) can authenticate with the basic, NTLM, or Kerberos methods before they reach the internal network. 
    
- For Exchange and SharePoint, solutions like Forefront UAG can terminate SSL connections and decrease the load of the intranet resources server while providing a single point of management for certificates. 
    
- For Lync, Web (HTTPS) traffic goes through the reverse proxy (TCP 443) for client communication. The reverse proxy proxies the HTTPS connection to Lync Web Services, Exchange CAS, and Office Web Apps. Lync Server 2013 does not support UAG. 
    
DirectAccess - A remote access technology that relies on Internet Protocol security (IPsec) for authentication and for encrypting traffic between the DirectAccess client and server. DirectAccess provides simultaneous access to both Internet and intranet resources for roaming and remote employees without having to initiate a connection. 
  
DirectAccess points to consider: 
  
- DirectAccess uses IPsec protected traffic (protocol 50 and 51 and UDP 500) between the DirectAccess client and server. 
    
- DirectAccess for Windows Server 2012 and Windows 8 does not need a public key infrastructure (PKI) deployment for server and client authentication. 
    
- We recommend against using DirectAccess with Lync Server 2013 because of audio and video latency issues associated with IPsec encryption and decryption. 
    
    VPN Gateway - Typical VPN gateways provide a remote access connection in which a remote access client computer is logically projected onto the intranet through a tunneled and user-initiated connection. You can use Unified Remote Access in Windows Server 2012 or several third-party solutions to provide secured access to the intranet for roaming or remote employees. VPN is not recommended for Lync. Remote Lync traffic should use the Edge Servers and split tunneling. 
    
### Domain Name System (DNS) considerations

You need to plan for the set of DNS records that allow both Internet and intranet users to resolve DNS names to the appropriate IP addresses. 
  
- For Internet-based partners and roaming or remote employees, DNS records registered with Internet DNS servers provide resolution to the set of public IP addresses corresponding to the gateway router, the Lync Edge Server, the set of virtual IP addresses (VIPs) on the load balancer, and the DirectAccess or VPN gateway as needed. 
    
- For intranet-based users, DNS records registered with intranet DNS servers provide resolution to the set of virtual IP addresses (VIPs) on the load balancer for access to SharePoint, Lync, and Exchange resources. 
    
- DirectAccess clients use intranet DNS servers for names corresponding to the intranet DNS name space and Internet DNS servers for names that do not. To simplify the operation of DirectAccess, consider the use of a split DNS implementation that uses different DNS namespaces for intranet and Internet-based names. For example, use contoso.com for Internet namespace and corp.contoso.com for the intranet namespace. 
    
- Exchange uses a split DNS model where host to IP resolution differs on publicly routed traffic from that on the corporate network. At a minimum, you need to have DNS records for OWA, Autodiscover, ActiveSync URLs for client traffic, and an MX record for inbound mail. 
    
- If you are using Exchange Online Protection (EOP), your MX record points to that service instead of your Exchange farm. 
    
- For Exchange, you need a proof of ownership TXT record in your public DNS, and a Federation Org ID to set up federated sharing. 
    
- Remote access VPN clients can be configured to use only intranet DNS servers when the remote access VPN connection is active. 
    
### Diagram Description

This diagram provides an example network topology illustrating inbound and outbound traffic through a gateway router and load balancing of client session traffic (external and internal) to the appropriate SharePoint, Exchange, and Lync server tiers. The description of this diagram is divided into two parts: 
  
- Description of components shown in the diagram 
    
- Description of how traffic moves through the components to the SharePoint, Exchange, Lync, and Office Web Apps server tiers. 
    
#### Description of components shown in the diagram

#### User types

There are four different types of users, three outside the network and cloud services and one internal, which include: 
  
- Partner companies (business-to-business)-external 
    
- Individual partners (SharePoint and anonymous (Lync))-external 
    
- Roaming and remote employees-external 
    
- Internal employees 
    
#### Cloud-based email traffic

There is a cloud-based component for SMTP-based email traffic, either Internet Mail Hosts or Exchange Online Protection. 
  
#### Authentication for external access

There is a specific set of authentication procedures for Lync, SharePoint, and Exchange for each of the user types. They are described in more detail later in this document. 
  
#### Gateway router with ACLs

The gateway router sits at the edge of the network and routes all incoming and outgoing traffic to and from the intranet. 
  
#### Remote access servers for Lync and SharePoint

This topology includes a Lync Edge server, and a SharePoint VPN gateway or DirectAccess server. 
  
#### Load balancer and reverse proxy device

You can use hardware or software load balancing solutions to redirect traffic for segments including SharePoint front-end web servers and Exchange Client Access Servers (CASs). This topology shows Lync VIP, SharePoint VIP, and Exchange VIP components in the load balancer. 
  
#### Servers

There are four servers: Lync, SharePoint, Exchange, and Office Web Apps Server. Each server can have three tiers: a front-end, client-access tier, an application tier, and a database/storage tier.
  
#### Front-end, client-access tier

This tier has components on all four servers: 
  
- Lync pool (front end). The diagram shows two Lync databases. 
    
- SharePoint front end and distributed cache. The diagram shows three SharePoint databases. 
    
- Exchange CAS. The diagram shows two Exchange databases. 
    
- Office Web Apps Server. The diagram shows two Office Web Apps databases. 
    
#### Application tier

This tier has components only on the SharePoint server: 
  
- Search (query, index, admin). The diagram shows three SharePoint databases. 
    
- Batch processing. The diagram shows three SharePoint databases. 
    
#### Database/storage tier

This tier has components on the Lync, SharePoint, and Exchange servers: 
  
- Lync Database (backend). The diagram shows three Lync databases. 
    
- SharePoint Database. The diagram shows three SharePoint databases. 
    
- Exchange Mailbox server. The diagram shows two Exchange Mailbox servers. 
    
For more information about components installed on each of the SharePoint server roles, see [Streamlined Topologies for SharePoint 2013](https://aka.ms/Ma5cgk). 
  
#### Description of how traffic moves through the components to the different server tiers

This section describes how user requests move through the network topology. 
  
#### Authentication and routing for external access

There are three different types of clients outside the network and cloud services, which include: 
  
- Partner companies (business-to-business)-external 
    
- Individual partners (SharePoint and anonymous (Lync))-external 
    
- Roaming and remote employees-external 
    
The authentication and routing process for each external user type is described individually. 
  
#### Partner companies (business-to-business) (https://partnerweb.contoso.com)

- Lync: federation trust with other organizations, Skype and Public IM Connectivity (PIC) with AOL. The Lync federation traffic goes through the gateway router to the Lync Edge Server, to the Lync VIP (load balancer/reverse proxy server), and then to the Lync Server. 
    
- SharePoint: Trusted partner identity provider with SAML authentication. The SharePoint client traffic goes through the Gateway router to the SharePoint VIP (load balancer/reverse proxy server), and then to the SharePoint Server. 
    
- Exchange: Mutual Auth TLS for mail traffic, SAML authentication for Federated Sharing. The Exchange client traffic goes through the Gateway router to the Exchange VIP (load balancer/reverse proxy server), and then to the Exchange Server. 
    
- SMTP traffic goes through the Gateway router and through the Exchange VIP (load balancer/reverse proxy server) to the Exchange server. 
    
#### Individual partners (SharePoint) and anonymous (Lync) (https://partnerweb.contoso.com and https://meet.contoso.com)

- Lync: anonymous users can only join Lync meetings organized by employees. The Lync federation traffic goes through the Gateway router to the Lync Edge Server, to the Lync VIP (load balancer/reverse proxy server), and then to the Lync Server. 
    
- SharePoint: Trusted partner identity provider with SAML authentication or forms-based authentication. The SharePoint client traffic goes through the Gateway router to the SharePoint VIP (load balancer/reverse proxy server), and then to the SharePoint Server. 
    
- Exchange: Does not apply. 
    
- Lync Web traffic goes through the Gateway router to the Lync Edge Server, to the Lync VIP (load balancer/reverse proxy server), to a hardware load balancer, which is required for HTTPS traffic, and then to the Lync Server. 
    
#### Roaming and remote employees

1. https://intranet.contoso.com 
    
2. https://teams.contoso.com 
    
3. https://my.contoso.com
    
4. https://partnerweb.contoso.com 
    
5. https://mail.contoso.com* 
    
6. https://dial.contoso.com*
    
7. https://meet.contoso.com*
    
* The Exchange URL has the following virtual directories: Autodiscover, ecp, EWS, Microsoft-Server-ActiveSync, OAB, owa, PowerShell 
  
- Lync: TLS-DSK or NTLM authentication. The Lync client traffic goes through the Gateway router to the Lync Edge Server, to the Lync VIP (load balancer/reverse proxy server), and then to the Lync Server. 
    
- SharePoint: Active Directory Domain Services (AD DS), forms-based authentication, or SAML authentication. The SharePoint client traffic goes through the VPN gateway or the DirectAccess server to the SharePoint VIP (load balancer/reverse proxy server), and then to the SharePoint server. 
    
- Exchange: Basic authentication over SSL (ActiveSync, Autodiscover), forms-based authentication (OWA). The Exchange client traffic goes through the Gateway router to the Exchange VIP (load balancer/reverse proxy server), and then to the Exchange Server. 
    
- Lync client traffic goes through the Gateway router to the Lync VIP (load balancer/reverse proxy server) to a hardware load balancer, which is required for HTTPS traffic, and then to the Lync Server. 
    
#### Authentication for internal access

#### Internal employees

> https://intranet.contoso.com 
    
> https://teams.contoso.com 
    
> https://my.contoso.com
    
> https://partnerweb.contoso.com
    
> https://mail.contoso.com* 
    
> https://dial.contoso.com 
    
> https://meet.contoso.com
    
> https://admin.contoso.com
    
- Lync: Kerberos, TLS-DSK, or NTLM authentication. The Lync client traffic goes to the Lync VIP (load balancer/reverse proxy server), and then to the Lync Server. 
    
- SharePoint: Active Directory Domain Services (AD DS), forms-based authentication, or SAML authentication. The SharePoint client traffic goes to the SharePoint VIP (load balancer/reverse proxy server), and then to the SharePoint Server. 
    
- Exchange: AD DS, forms-based authentication. The Exchange client traffic goes to the Exchange VIP (load balancer/reverse proxy server), and then to the Exchange Server. 
    
- Lync client traffic goes to the Lync VIP (load balancer/reverse proxy server) to a hardware load balancer, which is required for HTTPS traffic, and then to the Lync Server. 
    
#### Cloud-based email traffic

The cloud-based component for SMTP-based email traffic consists of either Internet Mail Hosts or Exchange Online Protection.
  
These components move email traffic over the network using SMTP. The traffic goes through the Gateway router to the Exchange VIP (load balancer/reverse proxy server), and then to the Exchange Server. 
  
### Network traffic legend

The legend box graphically shows the different types of traffic depicted on the graph in different colored lines as follows: 
  
- Green line: Lync SIP traffic 
    
- Blue line: Lync Web traffic 
    
- Purple line: SharePoint client traffic 
    
- Orange line: Exchange client traffic 
    
- Gray line: Exchange Mail Server traffic between Exchange on-premises and Exchange Online Protection. 
    
The different types of traffic and the ports that they use are also described in the legend box. 
  
#### Lync SIP traffic and Lync web traffic

The Lync Edge Server uses the following ports for external user communication: 
  
- Signaling/IM traffic (SIP/SIMPLE): TCP port 443 (open for inbound traffic) 
    
- Web conferencing traffic (PSOM): TCP 443 (open for inbound traffic) 
    
- A/V traffic (SRTP): TCP 443, UDP 3478 and TCP 50000-59999 (optional) (open for inbound and outbound traffic) 
    
Lync Edge Server uses the following ports for federation communication: 
  
- TCP ports 5061 (SIP), 5269 (XMPP), 443 and UDP 3478 (SRTP) (open for inbound and outbound traffic) 
    
#### SharePoint client traffic

SharePoint can use TCP port 443 (SSL) for encrypted communication between the client and the load balancer. For external access from the Internet, this port needs to be opened for inbound and outbound traffic on the gateway router (or external firewall). 
  
#### Exchange client traffic and Exchange mail server traffic

Exchange uses TCP port 25 (SMTP) for server-to-server communications. Most client traffic (OWA, ActiveSync, Autodiscover, Outlook Anywhere) is handled over port 443 (HTTPS). If you have POP or IMAP clients, ports 110 (POP3), 995 (encrypted POP3), 143 (IMAP4), 993 (encrypted IMAP4), and 587 (SMTP) are also used to support these clients. 
  
#### More on Lync network traffic?

Learn how Lync Server can help your organization provide instant messaging, web conferencing, application sharing, and voice communication. For more information, see [Microsoft Lync Server 2013 Protocol Workloads Poster](https://aka.ms/G5jzjo). 
  
The poster also includes a QR code to access this information. 
  

