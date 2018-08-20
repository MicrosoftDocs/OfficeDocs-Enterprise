---
title: "Using content delivery networks with SharePoint Online"
ms.author: krowley
author: kccross
manager: laurawi
ms.date: 5/8/2017
ms.audience: Admin
ms.topic: troubleshooting
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Adm_O365
search.appverid:
- MET150
- SPO160
ms.assetid: 9a64268c-0b74-4eaa-b971-fb6380b1b165
description: "Summary: This article describes Content Delivery Networks (CDNs) and how you can use them to increase SharePoint Online performance."
---

# Using content delivery networks with SharePoint Online

 **Summary:** This article describes Content Delivery Networks (CDNs) and how you can use them to increase SharePoint Online performance. 
  
In today's web development communities, there are many common libraries (such as JavaScript and CSS files) that you may include in your SharePoint solution. Many of these are hosted by Microsoft on their ASP CDN. This means you can reference these libraries from these distributed servers and allow the internet's built-in DNS routing systems to find the closest server to your user. The examples in this article demonstrate how the time difference between downloading the popular library jQuery from the SharePoint Online server versus the ASP CDN is quite significant. The user also may already have the CDN version cached on the local computer so that they do not have to download the file. This can be important if you have users distributed all over the world and far away from the datacenter that hosts your SharePoint Online site.
  
When creating pages for SharePoint Online, latency can be affected by the physical distance between your users and the location of the SharePoint Online instance. This is particularly important for organizations that have a global presence where a site may be hosted on one continent while users on the other side of the world are accessing its content. CDNs help mitigate this situation by hosting certain popular web assets in different locations closer to the end users.
  
Since a CDN is a worldwide network of servers that host the same files, Internet URLs for files stored on the CDNs are interpreted by the client machine so that the server that is closest to the user serves the file. Doing this significantly reduces delays caused by network round trips.
  
## The challenge of hosting SharePoint Online sites for a global audience

SharePoint Online sites are hosted at datacenters relative to the location (specified by the user) selected when you signed up with Office 365. For example, if your site is on servers in the United States and you have users accessing the site from East Asia, latency issues might arise due to the distance the data has to travel over fiber optic cable.
  
Many static files used by the default SharePoint user interface are already hosted on Microsoft's worldwide network of CDNs. This will improve performance over time. However, if you use any popular JavaScript and CSS assets (for example; JQuery, Modernizr, Bootstrap, or ASP.NET Ajax) you can improve the loading times of these files by using freely available CDNs.
  
## Advantages of using CDNs to improve download speed

Using CDNs can improve page load times for a variety of reasons. One reason is that the distance between the CDN and the user may be shorter than the distance to the SharePoint Online instance. These networks are highly distributed and are also designed to have very high availability and response times. Another reason is that if you are using a popular library of CSS files, in conjunction with a CDN, the user may already have the library cached and they won't even need to download it at all.
  
The following screen shots illustrate the advantages of using CDNs. These screen shots are from the **Network** tab in the Internet Explorer 11 developer tools. These screen shots show the latency on the popular library jQuery. To bring up this screen, in Internet Explorer, press **F12** and select the **Network** tab which is symbolized with a Wi-Fi icon. 
  
![Screenshot of F12 Network](media/930541fd-af9b-434a-ae18-7bda867be128.png)
  
This screen shot shows the library uploaded to the master page gallery on the SharePoint Online site itself. The time it took to upload the library is 1.51 seconds.
  
![Screenshot of load time 1.51s](media/64225c79-fa53-480f-81cd-0d351674320e.png)
  
The second screen shot shows the same file delivered by Microsoft's CDN. This time the latency is around 496 milliseconds. This is a large improvement and shows that a whole second is shaved off the total time to download the page content.
  
![Screenshot of load times in 469 ms](media/6a553cc3-25a0-42c1-aae7-4aebbc2eb4c3.png)
  
## Using CDNs with SharePoint Server 2013

Using CDNs only makes sense in a SharePoint Online context and should be avoided with SharePoint Server 2013. This is because all of the advantages around geographic location do not hold true if the server is located on-premises or geographically close anyway. Additionally, if there is a network connection to the servers where it's hosted, then the site may be used without an Internet connection and therefore cannot retrieve the CDN files. Otherwise, you should use a CDN if there is one available and stable for the library and files you need for your site.
  
## Popular CDNs and how to use them

Microsoft's Ajax CDN offers most of the popular libraries including jQuery (and all of its other libraries), ASP.NET Ajax, Bootstrap, Knockout.js, and many more.
  
To include these scripts in your project, simply replace any references to these publicly available libraries with references to the CDN address instead of including it in your project itself. For example, use the following code to link to jQuery:
  
```
<script src=http://ajax.aspnetcdn.com/ajax/jquery-2.1.1.js> </script>
```

For more information about CDNs, see [Content delivery networks](content-delivery-networks.md).
  
## More topics about using CDNs with SharePoint

[Hosting client-side web part from Office 365 CDN](https://dev.office.com/sharepoint/docs/spfx/web-parts/get-started/hosting-webpart-from-office-365-cdn)
  

