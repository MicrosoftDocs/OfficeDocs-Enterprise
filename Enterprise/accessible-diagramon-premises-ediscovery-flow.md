---
title: "Accessible diagram - On-premises eDiscovery Flow"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 12/15/2017
audience: ITPro
ms.topic: article
ms.collection: Ent_O365
ms.service: o365-solutions
localization_priority: Normal
ms.assetid: b9dcd692-0485-4eec-870d-87ab6b89d97b
description: "This article is an accessible text version of the diagram named On-premises eDiscovery Flow."
---

# Accessible diagram - On-premises eDiscovery Flow

**Summary:** This article is an accessible text version of the diagram named On-premises eDiscovery Flow.
  
This poster provides details about the architecture and flow of data across server products. 
  
## Across SharePoint, Exchange, Lync, and file shares

The diagram shows a user sending a query that accesses two server farms, a SharePoint 2013 Enterprise App Farm, and a SharePoint 2013 Services Farm. The SharePoint 2013 Services Farm communicates with a SharePoint 2013 Content Farm, Exchange Server 2013 (which communicates with Lync 2013), and Windows File Shares. 
  
The eDiscovery Flow List describes the flow of data and the order in which eDisovery query actions occur across SharePoint, Exchange, Lync, and file shares. 
  
The eDiscovery flow list is described in detail first, followed by a detailed description of the features depicted in the diagram. 
  
### eDiscovery Flow List

The numbers for each of the steps described in this list pertain to a step depicted in the diagram. The diagram is described in detail later in this document. 
  
1. eDiscovery cases are created, managed, and used in the eDiscovery center (EDC). The EDC is a SharePoint 2013 site collection. This is where cases are defined, sources to be tracked are identified, queries are issued, query results are reviewed, and holds on content are placed or removed. 
    
2. The eDiscovery query or action, such as place a Hold, ReleaseHold, or GetStatus, is relayed from the EDC to the Search Service Application (SSA) proxy in the Enterprise App Farm. The SSA proxy then relays the traffic to the SSA in the Services App Farm. In this example, the request is to place anything in the SharePoint Content Farm with "CONTOSO" in the file name on hold. 
    
3. If the request is to query a case, the SSA consults the search index. Then, the eDiscovery query result set returns to the user through the EDC. 
    
4. If the request is an action, such as place a Hold or ReleaseHold, that action is written to the Actions_Table in the SSA Administrative database. In this example, a hold request for anything in the SharePoint Content Farm with "CONTOSO" is written to the Actions_Table. 
    
5. At regular intervals the Content Farm eDiscovery in-place hold timer job wakes up and generates a request for pending actions and sends status updates through the SSA proxy to the SSA. 
    
6. The query for pending actions is relayed to the central SSA, which consults the Action_Table for any pending actions for the Content Farm. The Content Farm in-place hold timer job also sends status updates for objects and actions it has received, which are written to the ActionsTable. 
    
7. The hold request for any content with "CONTOSO" in the name in the SharePoint 2013 Content Farm is sent by the SSA to the eDiscovery in-place hold timer job in the Content Farm. 
    
8. The eDiscovery in-place hold timer job places the "CONTOSO Site" and "CONTOSO content" on hold. 
    
9. The eDiscovery in-place hold timer job periodically runs in the Enterprise App Farm to check the status of discovery actions and to update the status. 
    
10. The status query is relayed through the Enterprise App Farm SSA proxy to the SharePoint Services Farm SSA. 
    
11. The SSA retrieves the status from the Actions table and returns it to the timer job in the Enterprise App Farm, which pushes the status updates to the EDC. 
    
12. When the eDiscovery user is searching (or performing an action) for Exchange sources, such as a mailbox or archived Lync content, the central SSA uses Exchange Web Services (EWS) proxy to query Exchange Web Services. Exchange has its own search and eDiscovery infrastructure and manages all eDiscovery calls internally. 
    
13. Exchange Web Services responds to SSA with eDiscovery search results or a response to a status request for a query-based hold, which, in turn, gets relayed to the EDC. 
    
#### Prerequisites

- SharePoint Enterprise Search must be configured, search crawls on content sources (SharePoint and Windows file shares) are successfully occurring, and all content sources are in the index. 
    
- Server-to-server trust and authentication must be configured between the SharePoint Services Farm and Exchange and also between Exchange and Lync. 
    
### Description of components in the diagram

The diagram shows a user sending a query, which accesses two server farms, a SharePoint 2013 Enterprise App Farm and a SharePoint 2013 Services Farm. The SharePoint Services Farm interfaces with a SharePoint 2013 Content Farm, Exchange Server 2013 (which interfaces with Lync 2013), and Windows File Shares. 
  
#### SharePoint 2013 Enterprise App Farm

The SharePoint 2013 Enterprise App Farm contains the following components: 
  
- EDC
    
- SSA proxy 
    
- Timer job 
    
A query or action sent by the user is sent to the EDC in the Enterprise App Farm. The following actions occur: 
  
- The query or action goes to the SSA proxy. 
    
- The SSA proxy sends a status query or response to the Timer job in the Enterprise App Farm, and it also sends a status query or response to the SSA service in the SharePoint Services Farm. The actions that result from this are described in the section about the SharePoint Services Farm. 
    
- When it receives a response, the Timer job sends the response to the SSA proxy and to the EDC. 
    
- Any results from the query or action are sent to the user from the EDC. 
    
#### SharePoint 2013 Services Farm

The SharePoint 2013 Services Farm contains the following components: 
  
- SSA Service 
    
- Search index database 
    
- SSA admin_db database. The Actions Table in this database contains: Hold Release Hold GetStatus 
    
- EWS proxy 
    
When the SSA proxy in the SharePoint Enterprise App Farm sends a status query to the SSA in the SharePoint Services Farm, the following actions occur: 
  
- If the request is a query, the SSA consults the search index. The discovery response is returned to the SSA and then to the user through the EDC. 
    
- If the request is a write action, the SSA service sends the write action to the SSA admin_db. 
    
- A crawl and responding results request is sent from the SSA to the SharePoint 2013 Content Farm and a response is returned to the SSA. 
    
- A crawl and responding results request is sent from the SSA to the Windows File Shares, and a response is returned to the SSA. 
    
- A query for pending action(s), responses, or status updates is sent from the SSA to the SSA proxy in the SharePoint Content Farm, and a response is returned to the SSA. 
    
- An Exchange action/status request is sent from the SSA to the EWS proxy, which sends an Exchange Query action/status request to the Exchange Web Service on the Exchange 2013 server. 
    
- A status query/response is sent from the SSA to the SSA admin_db and is returned to the SSA. 
    
- A pending action query/response is sent from the SSA to the SSA admin_db and is returned to the SSA. 
    
#### SharePoint 2013 Content Farm

The SharePoint 2013 Content Farm contains the following components: 
  
- SSA proxy 
    
- Timer job 
    
- Contoso SharePoint site 
    
- Contoso SharePoint content 
    
When the SSA in the SharePoint Services Farm sends a status query to the SSA Proxy in the SharePoint Content Farm, the following actions occur: 
  
- The SSA proxy in the SharePoint Content Farm sends a query for pending actions/status response to the Timer job. 
    
- The Timer job sends a request to the Contoso SharePoint site, which reviews the Contoso SharePoint content. 
    
- The response to the pending actions/status query is sent from the Timer job to the SSA proxy in the SharePoint Content Farm, and then it is sent to the SSA service in the SharePoint Services Farm 
    
#### Exchange 2013

The Exchange 2013 server component contains the Exchange Web Service and provides the following: 
  
- Server-to-server Trust/OAuth is handled between the SharePoint 2013 Content Farm and Exchange 2013. 
    
- Server-to-server Trust/OAuth is handled between Exchange 2013 and Lync 2013. 
    
#### Lync 2013

The Lync 2013 component archives Lync content in Exchange 2013. 
  
#### Windows File Shares

The Windows File Shares component provides crawl results to the SSA in the SharePoint Services Farm. 
  
### Legend

The legend for this diagram graphically shows the different types of traffic depicted among the components in different colored lines as follows: 
  
- Light blue line: Query/action - eDiscovery query or action data 
    
- Orange line: eDisovery response - eDiscovery query response data 
    
- Green line: Status query/response - eDiscovery status query/response data 
    
- Purple line: Exchange action/status request - eDiscovery request for action status for Exchange traffic. 
    
- Red line: Exchange data/status response - eDiscovery query or status response from Exchange. 
    
- Dotted black line: Server-to-Server Trust/Oauth 
    
- Solid black line: Crawl/results 
    

