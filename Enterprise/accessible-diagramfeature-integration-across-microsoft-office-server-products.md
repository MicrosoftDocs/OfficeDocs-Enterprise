---
title: "Accessible diagram - Feature Integration Across Microsoft Office Server Products"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 12/15/2017
audience: ITPro
ms.topic: article
ms.collection: Ent_O365
ms.service: o365-solutions
localization_priority: Normal
ms.assetid: d78983fa-0951-49b8-b890-d76a44c70035
description: "This article is an accessible text version of the diagram named Feature Integration Across Microsoft Office Server Products - SharePoint Server, Exchange Server, Lync Server, and Office Online Server."
---

# Accessible diagram - Feature Integration Across Microsoft Office Server Products

**Summary:** This article is an accessible text version of the diagram named Feature Integration Across Microsoft Office Server Products - SharePoint Server, Exchange Server, Lync Server, and Office Online Server.
  
The diagram consists of several tabs, as indicated by this document's section titles.
  
## Introduction tab

### Illustrations for cross-server features

This Visio file (or multipage PDF file) has nine tabs, each of which has information and a diagram about a feature that works across Office Server products.
  
The features and tabs are: 
  
- Introduction
    
- Server-to-server authentication 
    
- High resolution user photos 
    
- Unified contact store 
    
- Site mailboxes 
    
- Exchange task synchronization 
    
- Lync presence in Outlook Web App 
    
- Voicemail
    
- Meeting recordings 
    
Send feedback about this solution or requests for additional solutions to MODAContent@microsoft.com. 
  
### Tips for printing

The page size of each tab is 22 x 17 inches (about a quarter of the size of an ANSI Engineering diagram). You can print this page on two tabloid-sized sheets (17 x 11) inches) or four letter-sized sheets (11 x 8.5 inches). If you have a plotter, you can print these posters in their full size. If you don't have plotter, use the following steps to print on smaller paper. 
  
 **Print posters on smaller paper**
  
1. Open the poster in Visio. 
    
2. On the **File** menu, click **Page Setup**. 
    
3. On the **Print Setup** tab, in the **Printer paper** section, select the size of paper you want to print on.
    
4. On the **Print Setup** tab, in the **Print zoom** section, click **Fit to**, and then enter **1 sheet across by 1 sheet down**. 
    
5. On the **Page Size** tab, click **Size to fit drawing contents**, and then click **OK**. 
    
6. On the **File** menu, click **Print**. 
    
### Microsoft tags and QR codes

Use your Windows phone or download a QR Code reader to get more information about implementing these features. 
  
### Cross-server features

A table shows the features and the Office Server products that use them. The features are: 
  
Server-to-server authentication. This feature is applicable to: 
  
- SharePoint 
    
- Exchange
    
- Lync
    
- Office Online Server (formerly known as Office Web Apps) 
    
High resolution user photos. This feature is applicable to: 
  
- SharePoint
    
- Exchange
    
- Lync
    
Unified contact store. This feature is applicable to: 
  
- Exchange
    
- Lync
    
Site mailboxes. This feature is applicable to: 
  
- SharePoint
    
- Exchange
    
Exchange task synchronization. This feature is applicable to: 
  
- SharePoint
    
- Exchange
    
Lync presence in Outlook Web App. This feature is applicable to: 
  
- Lync
    
Voicemail. This feature is applicable to: 
  
- Lync
    
Meeting recordings. This feature is applicable to: 
  
- SharePoint
    
- Lync
    
### Office Web Apps Server

Office Web Apps Server is an Office server product that provides browser-based file viewing and editing services for Office files. Office Web Apps Server works with products and services that support the Web Application Open Platform Interface Protocol (WOPI). These products, known as hosts, include SharePoint 2013, Lync Server 2013, and Exchange Server 2013. 
  
To learn more about Office Web Apps Server, download the Office Web Apps deployment simplified poster at http://aka.ms/OfficeWebAppsPoster. 
  
## Server-to-Server Authentication tab

### Servicing resource requests between servers

Server-to-server authentication is a new feature of Exchange Server 2013, Lync Server 2013, and SharePoint Server 2013 that allows a server to request resources of another server on behalf of a user. This feature uses the industry standard Open Authorization (OAuth) 2.0 protocol. Server-to-server authentication enables many new scenarios, such as eDiscovery, high resolution user photos, and site mailboxes. 
  
 **Server products**
  
- Exchange Server 2013 
    
- SharePoint Server 2013 
    
- Lync Server 2013 
    
### Server-to-server trust relationships

For a server to service an incoming resource request, it must trust the server making the request. To establish this trust, you must configure server-to-server trust relationships. 
  
A server-to-server trust relationship is one way. When you configure a server that runs SharePoint 2013 to trust an Exchange 2013 server, the server that runs SharePoint Server trusts resource requests from the Exchange server, but the Exchange server does not trust resource requests from the server that runs SharePoint Server. For seamless integration, you should establish two-way trusts. 
  
The accompanying diagram shows server-to-server trust relationships that are established as two-way trusts. The two-way trust relationships shown are between an Exchange Server, a SharePoint Server, and a Lync Server. Each server type has a two-way trust with each of the other two servers. 
  
### Configuration

To configure a server-to-server authentication trust, you must add a new trusted security token issuer that corresponds to each server that sends resource requests on behalf of users. Each type of server has a JavaScript Object Notation (JSON) metadata endpoint that contains configuration information and a public portion of the access token signing certificate. Part of configuring a server-to-server authentication trust is specifying the JSON metadata endpoint of the other server. 
  
The following table lists the JSON metadata endpoint for each server. The table shows: 
  
- An Exchange server with a JSON metadata endpoint of https://<server name>/autodiscover/metadata/json/1 
    
- A Lync server with a JSON metadata endpoint of https://<server name>/metadata/json/1 
    
- A SharePoint server with a JSON metadata endpoint of https://<web app name>/_layouts/15/metadata/json/1 
    
### Example: How server-to-server authentication works for eDiscovery between SharePoint and Exchange

In this example, the Exchange 2013 server has been configured to trust the server that runs SharePoint Server with a server-to-server trust. An eDiscovery center on the server that runs SharePoint Server has been configured to include data in mailboxes on the Exchange server. 
  
Requests for resources on another server take the form of access tokens that are sent to the web server service on the destination server. 
  
The accompanying diagram shows how the queries and access tokens travel between the two servers. 
  
1. An eDiscovery administrator sends a query to the server that runs SharePoint Server that includes resources on an Exchange server. 
    
2. The server that runs SharePoint Server generates an access token, identifying the user and the requested resource. 
    
3. The server that runs SharePoint Server sends the access token to the Exchange server. 
    
4. The Exchange server validates the access token and sends the query results. 
    
5. The server that runs SharePoint Server sends the eDiscovery query results to the eDiscovery administrator's computer. 
    
## High-Resolution User Photos tab

### Larger profile picture used across all Office applications

By using the **High-resolution user photos** tab, you can store photos up to 648 x 648 pixels in Exchange 2013. They can then be accessed by client applications, including Outlook, Outlook Web App, SharePoint 2013, Lync 2013, and mobile email clients. A low-resolution photo is also stored in Active Directory.
  
 **Server products**
  
- Exchange Server 2013 
    
- SharePoint Server 2013 
    
- Lync Server 2013 
    
### Configuration

Configure server-to-server authentication: 
  
- Between Exchange 2013 and SharePoint 2013. 
    
- Between Exchange 2013 and Lync 2013. 
    
 **On Exchange Server 2013**
  
- Start and configure the Exchange 2013 Autodiscover service. 
    
- Set external URLs for SharePoint. These are the URLs SharePoint uses when it accesses photos in Exchange. 
    
 **On SharePoint Server 2013**
  
- Install the Exchange Web Services Managed API. Use GacUtil to load the Microsoft.Exchange.WebServices.dll into the Global Assembly Cache (GAC). 
    
- Use Windows PowerShell to configure photo sync with Exchange. 
    
 **How it works**
  
- Users upload a photo by using the My Account page in Outlook Web App (OWA) or account settings in Outlook 2013. 
    
- Exchange automatically resizes the image for use by AD DS (48 x 48 pixels) or by other Office applications, including OWA and the Outlook 2013 client (96 x 96 pixels). 
    
Users can upload pictures with pixel ranges from 48 × 48 to 648 × 648. The photos are resized: 
  
- 64 × 64 is used for the AD thumbnail. 
    
- 96 × 96 is used for Outlook Web Access, Outlook, Lync Web Access, and Lync 2013. 
    
- 648 × 648 is used for Lync Web Access and Lync 2013. 
    
For example configuration scripts, see Jens Trier Rasmussen's blog articles: 
  
- Using Exchange 2013 high-resolution photos from SharePoint Server 2013 (http://aka.ms/Bhr4d2) 
    
- Integrating Exchange 2013 and Lync Server 2013 (http://aka.ms/Pn08dw) 
    
The poster also contains QR codes for these two blog articles. 
  
The accompanying diagram shows how a user can update a photo to use across all Office applications. 
  
1. User updates photo in Outlook, SharePoint, or Lync. Once updated, the updated photo is used across all Office applications. 
    
2. The user can use several different ways to update a photo: 
    
3. 
  - Outlook client or Outlook Web App (OWA) over HTTP port 443 to an Exchange Client Access server. 
    
  - My Site over HTTP or HTTPS to a SharePoint Server. SharePoint caches the user in the MySite database (Https:443). The SharePoint server interfaces with the Exchange Client Access Server using external URLs set in Exchange. 
    
  - Lync 2013 client, which maintains a GetConnection with the Exchange server to get photo updates (HTTPS Get request - 443). 
    
4. The Exchange Client Access Server connects to the Exchange Mailbox Server using internal Exchange communication. 
    
5. The Exchange Mailbox Server uses Exchange 2013 to push the high-resolution user photo to AD DS (LDAP:389). 
    
6. The photo is synced from Active Directory Domain Services (AD DS) to the Lync Address Book Service (ABS) on the Lync Server so legacy clients can get the same photo (LDAP:389). 
    
7. The Legacy Lync client now has access to the photo. 
    
## Unified Contact Store tab

### Exchange 2013 is the contact store for all Office applications

Unified contact store (UCS) provides a consistent contact experience across Microsoft Office products. Users store all contact information in their Exchange 2013 mailbox. The same contact information is available globally across Lync, Exchange, Outlook and Outlook Web App. 
  
 **Server products**
  
- Exchange Server 2013 
    
- Lync Server 2013 
    
 **Configuration**
  
- Configure server-to-server authentication between Exchange Server 2013 and Lync Server 2013. 
    
- In Lync 2013, enable the unified contact store policy (default is enabled). 
    
For example configuration scripts, see Jens Trier Rasmussen's blog article: 
  
- Integrating Exchange 2013 and Lync Server 2013 (http://aka.ms/Oyg7fh) 
    
 **How it works**
  
- Lync contacts for a user are migrated to Exchange 2013 automatically when the user logs in with Lync 2013. 
    
- Users can access and manage their Lync contacts from Lync 2013, Outlook 2013, or Outlook Web Access. 
    
A user's contacts are automatically migrated to the Exchange 2013 server when the user: 
  
1. Has been assigned a user services policy that has UcsAllowed set to **True**. 
    
2. Has been provisioned with an Exchange 2013 mailbox and has signed in to the mailbox at least once. 
    
3. Signs in to Lync by using a Lync 2013 rich client. 
    
Signs in to Lync by using a Lync 2013 rich client. 
  
1. Signs in to their Exchange 2013 mailbox on the Exchange Client Access Server, using an Outlook client or Outlook Web App (OWA) over HTTPS/443. The Exchange Mailbox Server uses an internal Exchange communication to communicate with the Exchange Client Access Server. 
    
2. Signs in to Lync 2013. The Lync client contacts the Lync server over SIP/5061 HTTPS/443. 
    
3. The Lync client tells the Lync server that the user is enabled for Unified Contact Store over SIP/5061. 
    
4. The Lync server uses the Lync Storage Service to migrate the user's contacts to Exchange 2013 on the Exchange Client Access Server. 
    
5. The user must sign out and sign in to Lync 2013 for the changes to appear (not shown in the diagram). 
    
6. After the migration, the Lync client uses Exchange Web Services (EWS) to read and maintain the Lync contacts. 
    
## Site mailboxes tab

### A central filing cabinet for emails and documents

Site mailboxes improve collaboration and user productivity by allowing access to documents stored in SharePoint and email messages stored in Exchange, using the same client interface. 
  
 **Server products**
  
- Exchange Server 2013 
    
- SharePoint Server 2013 
    
 **Configuration**
  
SharePoint configuration: 
  
- Configure user profile synchronization in the SharePoint farm. 
    
- Configure the app management service application in the SharePoint farm. 
    
- Configure SSL for the default zone to support server-to-server authentication. 
    
- Install the EWS API on servers that run SharePoint 2013. 
    
- Establish OAuth trust and service permissions on servers that run SharePoint 2013. 
    
Exchange configuration: 
  
- Establish OAuth trust and service permissions on Exchange servers. 
    
- Create site mailbox provisioning policy. 
    
- Configure site mailbox name prefix (optional). 
    
 **How it works**
  
A site mailbox is functionally comprised of SharePoint 2013 site membership (owners and members), shared storage through an Exchange 2013 mailbox for email messages and a SharePoint 2013 site for documents, and a management interface that addresses provisioning and lifecycle needs. 
  
The accompanying diagram shows users using site mailboxes to access email messages in Outlook and documents stored in SharePoint. 
  
1. Users can access SharePoint team site documents through the site mailboxes in Outlook 2013 Pro Plus. 
    
2. Users can also read emails in the Site Mailbox Inbox from the SharePoint team site. 
    
3. Emails are stored in site mailboxes on Exchange servers. 
    
4. Documents are stored in site mailboxes on SharePoint servers. 
    
5. The metadata of the content on the SharePoint site is synchronized to Exchange using the Representation State Transfer (REST) API over HTTPS. 
    
### Provisioning and management

Site mailboxes are provisioned and managed through SharePoint 2013. There are SharePoint and Exchange features for provisioning and management. 
  
#### SharePoint

A diagram shows the components on SharePoint that are required to provision the site mailbox, including: 
  
- Site Mailbox app 
    
- Team site members and owners 
    
- Team site lifecycle policy 
    
To provision a new Site Mailbox, install the Site Mailbox app on your team site and access the app at least once. 
  
The SharePoint site membership determines who has access to the Site Mailbox. 
  
Site mailbox retention follows the same lifecycle policy configured for the SharePoint site with which it is associated. 
  
#### Exchange

The diagram shows the Site Mailbox Provisioning Policy. This is the Exchange component that's required to provision the site mailbox.
  
On the Exchange server, you can define Site Mailbox Provisioning Policies. These policies govern the email characteristics sent to and received from the site mailbox, the size of the site mailbox on the Exchange Server, and let you define a prefix for Site Mailbox email addresses. 
  
For on-premises Exchange deployments, you also need to periodically search for and delete Site Mailboxes that have been marked for deletion through the SharePoint lifecycle policy. 
  
## Exchange Task Synchronization tab

### Synchronizing tasks among SharePoint Server 2013, Project Server 2013, and Exchange Server 2013

By using Exchange Task Synchronization, you can synchronize tasks in SharePoint Server 2013 and Project Server 2013 with Exchange Server 2013. Users can view and manage their tasks in Outlook 2013, or on their My Site. 
  
 **Server products**
  
- Exchange Server 2013 
    
- SharePoint Server 2013 
    
- Project Server 2013 (optional) 
    
 **Prerequisites**
  
On Exchange 2013: 
  
- Configure OAuth trust and service permission. 
    
On SharePoint Server 2013: 
  
- User Profile Service application. 
    
- Work Management Service application. 
    
- Search (this is required for tasks in SharePoint Server 2013). Configure with continuous crawls and incremental crawls. 
    
- Secure Sockets Layer (SSL) is required. 
    
- Users have existing My Sites. 
    
- Project Service application (to aggregate Project Server tasks). 
    
- Exchange Web Services API on each web front-end server (this is a separate downloadable .exe file that must be installed). 
    
On Project Server 2013: 
  
- Create Project Web Application sites. 
    
 **How it works**
  
When the My Tasks view on the My Sites is opened or refreshed: 
  
- The Work Management Service application synchronizes between SharePoint Server and Project Server. 
    
- Exchange Sync Timer Job calls the Work Management Service application to synchronize tasks with Exchange Server 2013. 
    
- The My Tasks page on the My Sites is refreshed. 
    
When the Exchange Sync Timer Job runs: 
  
- The Work Management Service application synchronizes among SharePoint Server, Project Server, and Exchange Server. 
    
The accompanying diagram shows the interaction among SharePoint Server 2013, Exchange Server 2013, Outlook 2013, and Project Server 2013. 
  
SharePoint Server 2013 runs the following jobs and applications: 
  
- User Profile Service application. 
    
- Search Service application. 
    
- Work Management Service application, which is described below. 
    
- Exchange Sync Timer Job, which is described below. 
    
- SharePoint Server 2013 contains the user's My Site and other Sites, and runs numerous user tasks. 
    
- SharePoint Server 2013 contains a Search Index. 
    
Exchange Server 2013 contains the following: 
  
- Exchange database with user email information 
    
- Synchronization tasks 
    
Outlook 2013 shows the following: 
  
- Users can opt in to synchronize their tasks, which is described below. 
    
- Users can view and edit tasks in Outlook. 
    
Project Server 2013 shows the following: 
  
- Project database 
    
- Project Web Access sites with tasks 
    
The Work Management Service application: 
  
- Aggregates tasks from SharePoint lists and Project task lists (does not synchronize tasks with Exchange Server). 
    
- Synchronizes when users view their My Site. 
    
- Maintains the list of users who opt-in. 
    
- Synchronizes the next batch of users. 
    
The Exchange Sync Timer Job: 
  
- Determines the next batch of users. 
    
- Ensures all users are constantly synchronized. 
    
- Initiates the call to the Work Management Service application to synchronizes tasks with Exchange Server for users that are opted-in only. 
    
Opt in 
  
- Users must opt in to synchronize their Exchange tasks with their My Site, or their SharePoint Server 2013 and Project Server 2013 tasks with Exchange Server 2013. 
    
## Lync Presence in Office 2013, Outlook Web App, and SharePoint Server tab

### Lync Server as the authoritative source of presence information

By using Lync presence information, you can have a consistent view of presence information among Lync, Outlook, and SharePoint. Outlook queries presence information directly from Lync, which is locally installed on the same computer as Outlook. When users view presence information in SharePoint Server, presence information is queried by Lync on the local computer.
  
Client products: 
  
- Outlook 2013 
    
- Lync 2013 
    
Server products: 
  
- Exchange Server 2013 
    
- Lync Server 2013 
    
- SharePoint Server 2013 
    
 **How it works**
  
As long as Lync 2013 is installed on the user's local computer, Outlook and SharePoint Server automatically display the presence information of users. 
  
For Outlook Web App users, Exchange CAS queries presence on behalf of the user. 
  
 **There are two accompanying diagrams**
  
The first shows how a user signs in to Outlook Web App, and then Exchange queries Lync Server for presence information. 
  
1. The user signs in to Outlook Web App. The client computer accesses the Exchange Client Access Server (CAS) over HTTPS/443, and also calls the Exchange Mailbox Server with an internal Exchange communication. 
    
2. The user signs in to their Exchange 2013 mailbox, and Exchange CAS queries the Lync Server for presence information over SIP/MTLS:5061. 
    
For more information, see [Integrating Microsoft Lync Server 2013 and Microsoft Outlook Web App 2013](https://go.microsoft.com/fwlink/?LinkId=313522).
  
The second diagram shows how Outlook and SharePoint Server use Lync 2013 to display the presence information of users. 
  
1. The user signs in to Lync 2013 over SIP/TLS:5061, which calls the Lync server. 
    
2. A. The user signs in to their Exchange 2013 mailbox through Outlook in Office 2013. The client computer accesses the Exchange Client Access Server (CAS) over HTTPS/443, and it also calls the Exchange Mailbox Server with an internal Exchange communication. 
    
3. A. Outlook calls Lync installed on the same computer as Outlook to retrieve presence information. 
    
4. B. The user connects to SharePoint MySite over HTTP or HTTPS, which calls the SharePoint server. 
    
5. B. Internet Explorer calls Lync, which is installed on the same computer as the browser, to retrieve presence information. 
    
## Voicemail tab

### Exchange UM is the voicemail system for Lync Server

Voicemail allows a caller to leave a voicemail to Lync users using Exchange Unified Messaging (UM). 
  
Client products: 
  
- Lync 2013 
    
- PSTN device (PBX, cellular, POTS) 
    
Server products: 
  
- Exchange Server 2013 
    
- Exchange Server 2013 
    
 **How it works**
  
When a call is not answered by the callee on any of the callee's active endpoints, Lync Server routes the call to voicemail on Exchange UM (i.e. Exchange Mailbox Server). 
  
The accompanying diagram shows the routing of calls for two scenarios: 
  
- The caller initiates a call using Lync 2013. 
    
- The caller initiates a call using PSTN device (PBX, cellular, POTS). 
    
The caller initiates a call using Lync 2013: 
  
1. Caller A initiates a call to the callee using Lync 2013. The call is initiated and sent to the Lync Server. 
    
2. The call is routed to the callee's Lync home server. 
    
3. Lync Server rings the callee's active endpoints on Lync 2013. 
    
4. When the call is not answered, the call is routed to voicemail (Exchange UM) on the Exchange CAS (call router). 
    
The caller initiates a call using Lync 2013: 
  
1. Caller B dials the callee's phone number using PSTN. 
    
2. The PSTN call is routed from the IP gateway to the Mediation Server, which is a Lync server. 
    
3. The Mediation server routs the call to the callee's Lync home server. 
    
4. Lync Server rings the callee's active endpoints on Lync 2013. 
    
5. When the call is not answered, the call is routed to voicemail (Exchange UM) on the Exchange CAS (call router). 
    
## Meeting Recordings tab

### Publish your meeting recordings on your SharePoint team site

Meeting recordings are a core component of unified communications. A good way to share your meeting recordings is to use SharePoint asset libraries on your team sites to store your meeting recordings. 
  
Client products: 
  
- Lync 2013 
    
Server products: 
  
- Server products: 
    
- SharePoint 2013 
    
Prerequisites: 
  
- Lync 2013 — Meeting recording is a client-side feature in Lync 2013. 
    
- SharePoint 2013 — You have the team site where you want to store the meeting recordings already up and running. 
    
 **What is recorded?**
  
The following are recorded into an MP4 file during the meeting (each bullet point is preceded with an icon representing the type of recording): 
  
- All audio 
    
- Active speaker's video (if used) 
    
- Panorama video (if used) 
    
- All content that is presented 
    
- Instant messages* 
    
*Only the instant messages within the meeting are included. Any peer-to-peer messaging between meeting participants is not part of the meeting and therefore is not captured. 
  
The poster includes two diagrams for two different scenarios: 
  
- Preparing for publishing meeting recordings 
    
- Recording and publishing a meeting using the Lync client 
    
### Preparing for publishing meeting recordings

The diagram shows SharePoint Server 2013 with a Team Site, Central Administration center, and Internet Information Services (IIS) Server. 
  
The Team site contains: 
  
- The Asset Library app. 
    
- Meetings asset library, to which team members send meeting recordings. 
    
The Central Administration Center contains web application general settings. 
  
The IIS Server contains IIS settings. 
  
To prepare for publishing meeting recordings: 
  
1. On your SharePoint team site, add the Asset Library app. Optionally, if you are unable to upload meeting recordings due to size restrictions or connection timeouts, perform the additional steps 2 and 3. 
    
2. In the SharePoint Central Administration, change the maximum upload size setting for the web application that contains your team site collection. 
    
3. In the IIS Server settings, increase the IIS connection timeout for the web site that contains your team site collection. 
    
 **Digital asset libraries**
  
Digital asset libraries are asset libraries that contain videos that have certain capacity and performance implications. For more information, see Plan digital asset libraries in SharePoint Server 2013 located at http://aka.ms/O1vq5w. The poster also includes a QR code to access this information. 
  
### Recording and publishing a meeting using the Lync client

The diagram shows a user using Lync to join a meeting. The meeting is recorded using the Lync client, which creates an MP4 file with the meeting content. The MP4 recording is saved to the Lync recording folder on your computer. You can move the MP4 recording to your meetings asset library, from which you can insert it into a wiki, SharePoint page, or blog. 
  
 **To record and publish a meeting using the Lync client**
  
1. Start recording the meeting using the Lync client. 
    
2. The meeting content is recorded into an MP4 file during the meeting. 
    
3. After the meeting concludes, the MP4 recording appears in the recording folder on your computer (C:\\Users\\<username>\\Videos\\Lync Recordings). Optionally, you can customize the meeting recording using the Lync Recording Manager app which gets installed with Lync client. 
    
4. Drag and drop the meeting recording into your SharePoint asset library. 
    
5. Optional: Once the recording is in your asset library, you can insert it in any SharePoint page. For more information about this step, see the Office 365 blog entry, Create and Publish Training Videos with SharePoint and Lync Online, located at http://aka.ms/R61q35. 
    
 **Video thumbnails**
  
Video thumbnails improve the look and feel of your asset library. To learn more about creating thumbnails for your meeting recordings, see Capture or change a video thumbnail, located at http://aka.ms/Kupj85. The poster also includes a QR code to access this information. 
  

