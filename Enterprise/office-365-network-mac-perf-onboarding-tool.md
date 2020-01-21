---
title: "Office 365 Network Onboarding Tool in the M365 Admin Center"
ms.author: kvice
author: kelleyvice-msft
manager: laurawi
ms.date: 1/21/2020
audience: Admin
ms.topic: conceptual
ms.service: o365-administration
localization_priority: Normal
search.appverid:
- MET150
ms.collection:
- Ent_O365
- Strat_O365_Enterprise
description: "Office 365 Network Onboarding Tool in the M365 Admin Center"
---

# Office 365 Network Onboarding Tool in the M365 Admin Center

The Office 365 network onboarding tool is located at <https://connectivity.office.com.> It is an adjunct tool to the network insights and network score information available in the Microsoft 365 Admin Center under the Health -> Network Performance menu.

The network insights in the Microsoft 365 Admin Center are based on in-product measurements for your Office 365 tenant. In comparison, the network insights from the Office 365 network onboarding tool are run locally in the tool. Testing that can be done in-product is limited and by running tests local to the user more data can be gathered resulting in deeper insights. Consider then that the network insights in the Microsoft 365 Admin Center will show that there is a networking problem for use of Office 365 at a specific office location the Office 365 network onboarding tool with it’s additional testing can help to identify the root cause of that problem leading to a recommended network performance improvement action.

We recommend that these be used together where networking quality status can be assessed for each office location in the Microsoft 365 Admin Center and more specifics can be found after deployment of testing based on the Office 365 network onboarding tool.

## The advanced tests client application

There are two parts to the Office 365 network onboarding tool. There is the web site <https://connectivity.office.com> and there is a downloadable Windows client application. The downloadable client runs advanced network connectivity tests and most of the tests require this to be run.

You can run the advanced client test from the web site, and it will populate results back into the web page as it runs.

![O365 network onboarding tool example test results](Media/m365-mac-perf/m365-mac-perf-onboarding-tool-tests.png)

## User office location

The user office location is detected from the users web browser. It is used to identify network distances to specific parts of the enterprise network perimeter.

The user office location is shown on the map view.

## Distance to the network egress location

We identify the network egress IP Address on the server side. Location databases are used to look up the approximate location for the network egress and determine the distance from that location to the office location. This is shown as a network insight if the distance is greater than 500 miles (800 kilometers).

The network egress location is shown on the map view and connected to the user office location indicating the network backhaul inside of the enterprise WAN.

The location looked up from the network egress IP Address may not be accurate and this would lead to a false result from this test. To validate if this error is occurring for a specific IP Address you can use publicly accessible network IP Address location web sites.

Implementing local and direct network egress from user office locations to the Internet is recommended for Office 365 network connectivity. Improvements to local and direct egress are the best way to address this network insight.

## Exchange Online service front door

The in-use Exchange Online service front door is identified in the same way that Outlook does this and we measure the network TCP latency from the user office location to it. These are both shown and the in-use Exchange Online service front door is compared to the list of recommended optimal service front doors for the current location. This is shown as a network insight if a non-optimal Exchange Online service front door is in use.

Use of a non-optimal Exchange Online service front door could be caused by network backhaul before the corporate network egress in which case we recommend local and direct network egress. It could also be caused by use of a remote DNS Recursive Resolver server in which case we recommend aligning the DNS Recursive Resolver server with the network egress.

We calculate a potential improvement in TCP latency to the Exchange Online service front door. This is done by looking at the tested user office location network latency and subtracting the network latency from the current location to the closets Exchange Online service front door. The difference represents the potential opportunity for improvement.

## Comparison of performance of customers in the area

The network TCP latency of the user office location to the Exchange Online service front door is compared to other Office 365 customers in the same metro area. A network insight is shown if 10% or more of customers in the same metro area have better performance.

This network insight is generated on the basis that all users in a city have access to the same telecommunications infrastructure and the same proximity to Internet circuits and Microsoft's network.

## In use default gateway

The in-use default gateway is the router that the test client has configured for routing TCP/IP network connections.

This is provided for information only and does not contribute to any network insight.

## In use DNS server(s)

This shows the DNS server configured on the client machine that ran the tests. It might be a DNS Recursive Resolver server however this is uncommon. It is more likely to be a DNS forwarder server which caches DNS results and forwards any uncached DNS requests to another DNS server.

This is provided for information only and does not contribute to any network insight.

## Identified DNS Recursive Resolver server

The in-use DNS Recursive Resolver is identified by making a specific DNS request and then asking the DNS Name Server for the IP Address that it received the same request from. This IP Address is the DNS Recursive Resolver and it will be looked up in IP Address location databases to find the location. The distance from the user office location to the DNS Recursive Resolver server location is then calculated. This is shown as a network insight if the distance is greater than 500 miles (800 kilometers).

The location looked up from the network egress IP Address may not be accurate and this would lead to a false result from this test. To validate if this error is occurring for a specific IP Address you can use publicly accessible network IP Address location web sites.

This network insight will specifically impact the selection of the Exchange Online service front door. To address this insight local and direct network egress should be a pre-requisite and then DNS Recursive Resolver should be located close to that network egress.

## DNS lookup of Exchange Online front end server and SharePoint Online front end server

These show the DNS record for the service front door for these two Office 365 workloads. They are provided for information only and there is no associated network insight.

## Proxy server identification

We identify proxy server(s) configured on the local machine. We identify if any of these are configured in the network path for optimize category Office 365 network traffic. We identify the distance from the user office location to the proxy servers. The distance is tested first by ICMP ping and if that fails we test with TCP ping and finally if that fails we look up the proxy server IP Address in an IP Address location database. We show a network insight if the proxy server is further than 500 miles (800 kilometers) away from the user office location.

## Media quality checks

This test installs and runs the Skype for Business network assessment tool and interprets the results. The tool can be found at [https://www.microsoft.com/download/details.aspx?id=53885](https://www.microsoft.com/download/details.aspx?id=53885).

These are UDP protocol tests as is used by Microsoft Teams audio and video call and conferencing functionality. We test for UDP packet loss, UDP network latency, UDP jitter, and UDP packet reorder. A network insight is shown if any of these are over the allowable range.

## TCP Connectivity tests

We test for HTTP connectivity from the user office location to all of the required Office 365 network endpoints. These are published at [https://aka.ms/o365ip](https://aka.ms/o365ip). A network insight is shown for any required network endpoints which cannot be connected to.

Connectivity ay be blocked by a proxy server, a firewall, or another network security device on the enterprise network perimeter or in use as a cloud proxy.

## SSL interception tests

We test the SSL certificate at each required Office 365 network endpoint that is in the optimize or allow category as defined at [https://aka.ms/o365ip](https://aka.ms/o365ip). If any tests do not find a Microsoft SSL certificate, then the encrypted network connected must have been intercepted by an intermediary network device. A network insight is shown on any intercepted encrypted network endpoints.

Where an SSL certificate is found that isn't provided by Microsoft, we show the FQDN for the test and the in-use SSL certificate owner. This SSL certificate owner may be a proxy server vendor, or it may be an enterprise self-signed certificate.

## Network path diagnostics

This section shows the results of an ICMP traceroute to the Exchange Online service front door, the SharePoint Online service front door, and the Microsoft Teams service front door. It is provided for information only and there is no associated network insight.
