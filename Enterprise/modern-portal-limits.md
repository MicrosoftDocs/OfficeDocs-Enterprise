---
title: "Modern Portal Boundaries and Limits"
ms.author: kvice
author: kelleyvice-msft
manager: laurawi
ms.date: 9/11/2019
audience: Admin
ms.topic: interactive-tutorial
ms.service: o365-administration
localization_priority: Normal
ms.collection: Strat_O365_Enterprise
ms.custom: Adm_O365
search.appverid: 
- MET150
description: "Learn about the performance and capacity limits of modern portals in SharePoint Online and how limits relate to acceptable performance."
---

# Modern Portal Boundaries and Limits

This article describes software boundaries and limits of modern portals in SharePoint Online. These include the following:
  
- **Boundaries:** Static limits that cannot be exceeded by design

- **Thresholds:** Configurable limits that can be exceeded to accommodate specific requirements

- **Supported limits:** Configurable limits that have been set by default to a tested value

## Overview of boundaries and limits
<a name="Overview"> </a>

This article contains information to help you understand the boundaries and limits of modern portals in SharePoint Online, and offers guidelines for how limits relate to acceptable performance. Use the information in this article to determine whether your planned deployment falls within acceptable guidelines, and to appropriately configure limits in your environment.
  
Note that there are many factors that can affect performance in a given environment, and each of these factors can affect performance in different areas. Some of the recommendations in this article might be related to features or user operations that do not exist in your environment, and therefore do not apply to your architecture.
  
### Boundaries, thresholds and supported limits
<a name="Boundaries"> </a>

In SharePoint Online, there are certain limits that are by design and cannot be exceeded, and other limits that are set to default values that may be changed by and administrator. There are also certain limits that are not represented by a configurable value, such as the number of site collections per web application.
  
- Boundaries are absolute limits that cannot be exceeded by design. It is important to understand these limits to ensure that you do not make incorrect assumptions when you design your farm.

    An example of a boundary is the 10 gigabyte (GB) document size limit; you cannot configure SharePoint Server 2016 to store documents that are larger than 10 GB. This is a built-in absolute value, and cannot be exceeded by design.

- Thresholds are those that have a default value that cannot be exceeded unless the value is modified. Thresholds can, in certain circumstances, be exceeded to accommodate variances in your farm design, but it is important to understand that doing this may affect the performance of the farm in addition to the effective value of other limits.

    The default value of certain thresholds can only be exceeded up to an absolute maximum value. A good example is the document size limit. By default, the default document size threshold is set to 250 megabyte (MB), but can be changed to support the maximum boundary of 10 GB.

- Supported limits define the tested value for a given parameter. The default values for these limits were defined by testing, and represent the known limitations of the product. Exceeding supported limits may cause unexpected results, significant decrease in performance, or other harmful effects.

    Some supported limits are configurable parameters that are set by default to the recommended value, while other supported limits relate to parameters that are not represented by a configurable value.

An example of a supported limit is the number of site collections per farm. The supported limit is the largest number of site collections per web application that met performance benchmarks during testing.
  
It is important to be aware that many of the limit values that are provided in this document represent a point in a curve that describes an increasing resource load and concomitant decrease in performance as the value increases. Therefore, exceeding certain limits, such as the number of site collections per web application, may only result in a fractional decrease in farm performance. However, in most cases, operating at or near an established limit is not a best practice, as acceptable performance and reliability targets are best achieved when a farm's design provides for a reasonable balance of limits values.
  
Thresholds and supported limits guidelines are determined by performance. In other words, you can exceed the default values of the limits, but as you increase the limit value, farm performance and the effective value of other limits may be affected. Many limits in SharePoint Online can be changed, but it is important to understand how changing a given limit affects other parts of the farm.

## Limits and boundaries
<a name="Limits"> </a>

This section lists the objects that can be a part of a solution and provides guidelines for acceptable performance for each kind of object. Acceptable performance means that the system as tested can support that number of objects, but that the number cannot be exceeded without some decrease in performance or a reduction in the value of related limits. Objects are listed both by scope and by feature. Limits data is provided, together with notes that describe the conditions under which the limit is obtained and links to additional information where available.
  
Use the guidelines in this article to review your overall solution plans. If your solution plans exceed the recommended guidelines for one or more objects, take one or more of the following actions:
  
- Evaluate the solution to ensure that compensations are made in other areas.
- Flag these areas for testing and monitoring as you build your deployment.
- Redesign or partition the solution to ensure that you do not exceed capacity guidelines.

|**Limit**|**Maximum value**|**Limit type**|**Notes**|
|:-----|:-----|:-----|:-----|
|News/Pages  <br/> |5,000  <br/> |Supported  <br/> |We recommended limiting the number of pages in a modern portal site as much as possible.  <br/> |
|Web parts on a page  <br/> |20  <br/> |Supported  <br/> |  <br/> |
|Dynamic web parts on a page  <br/> |4  <br/> |Supported  <br/> |  <br/> |
|Security groups  <br/> |20  <br/> |Supported  <br/> |  <br/> |
|Items in the navigation bar  <br/> |100  <br/> |Supported  <br/> |  <br/> |
|Images in the main window  <br/> |5  <br/> |Supported  <br/> |  <br/> |
|Maximum image size  <br/> |100  <br/> |Supported  <br/> |  <br/> |