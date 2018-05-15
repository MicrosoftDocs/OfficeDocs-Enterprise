---
title: "GDPR for Project Server"
ms.author: mikeplum
author: MikePlumleyMSFT
manager: pamgreen
ms.audience: ITPro
ms.topic: article
ms.service: o365-solutions
ms.custom: 
localization_priority: Priority
description: "Learn about how to address GDPR requirements in on-premises Project Server."
---

# GDPR for Project Server

Project Server uses custom scripts to export and redact user data in Project Web App. The basic process is:

1.  Find the Project Web App sites in your farm.

2.  Find the projects in each site that contain the user.

3.  Export and review the types of data that you want to review.

4.  Redact data as needed.

These steps are covered in detail in the following articles:

- [Export user data from Project Server CONTEXTUAL](https://docs.microsoft.com/en-us/Project/export-user-data-from-project-server?toc=/Office365/Enterprise/toc.json&bc=/Office365/Enterprise/breadcrumb/toc.json)  
- [Export user data from Project Server](https://docs.microsoft.com/en-us/Project/export-user-data-from-project-server)

-   [Delete user data from Project Server](https://docs.microsoft.com/en-us/Project/delete-user-data-from-project-server)

Note that Project Server is built on top of SharePoint Server and logs events to the SharePoint ULS logs and Usage database.
