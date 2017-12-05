---
title: "Build from the ground up"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 8/30/2017
ms.audience: ITPro
ms.topic: concetpual
ms.prod: office-online-server
localization_priority: Normal
ms.collection:
- Ent_O365
- Ent_O365_Top
ms.custom:
- DecEntMigration
- Ent_Architecture
ms.assetid: 84348d0c-d9d1-4a98-9b99-8433f9b70e45
description: "Summary: Get the details on the set of cloud storage building blocks that you can use to create your own storage service or solution."
---

# Build from the ground up

 **Summary:** Get the details on the set of cloud storage building blocks that you can use to create your own storage service or solution.
  
"Build from the ground up" storage solutions:
  
- Allow you to create your own storage solution from scratch 
    
- Requires programming using the REST APIs
    
- Provide the ultimate in customization and flexibility
    
The following sections describe the details of each "Build from the ground up" storage option.
  
## Azure Storage (files)

### Features

- Makes it easier to move legacy applications to the cloud
    
- Blob storage preferred for new applications
    
- Can mount from an Azure virtual machine
    
- Can mount on-premises with SMB 3.0
    
- Works with Linux and Windows
    
- Doesn't support Azure AD-based authentication or ACLs (Azure Storage account keys provide authentication and authorized access to the file share)
    
### Common uses

- Migrating legacy applications to the cloud that rely on file shares
    
- Share development and testing tools
    
- Distributed apps can store logs, diagnostic data, and crash dumps
    
### Key storage scenarios

- Backup files
    
### Resources

For additional information, click [here](https://msdn.microsoft.com/library/azure/dn166972.aspx).
  
For cost information, click [here](http://azure.microsoft.com/pricing/details/storage/).
  
## Azure Storage (blobs)

### Features

- Each storage account can hold up to 500 TB (one subscription can have multiple storage accounts)
    
- Storage accounts are organized into containers, which can have security applied to them and can contain blobs
    
- Block blobs are optimized for streaming and storing cloud objects, up to 200 GB in size
    
- Page blobs are optimized for representing PaaS disks and supporting random writes, up to 1 TB in size
    
- Append blobs are optimized for append operations, up to 195 GB
    
- Premium Storage provides faster IOPS through SSD storage
    
### Common uses

- Backups of files, computers, databases, and devices Images and text for web applications
    
- Configuration data for cloud applications
    
- Big data, such as logs and other large datasets
    
- Azure uses blob storage for its own services, such as HDInsight and virtual machine disks
    
### Key storage scenarios

- Manage data
    
### Resources

For additional information, click [here](https://msdn.microsoft.com/library/azure/dd179376.aspx).
  
For cost information, click [here](http://azure.microsoft.com/pricing/details/storage/).
  
## Azure Storage (queues)

### Features

- Storage account can contain any number of queues
    
- Queue can contain any number of messages (until the storage account is full)
    
- Queue messages are automatically deleted after seven days if not retrieved and deleted by an application
    
- Messages may be up to 64 KB in size
    
- Secured at storage account level
    
- Queues are intended to pass control messages, not raw data
    
### Common uses

- Create a backlog of work to process asynchronously
    
- Processing log messages
    
- Decouple applications
    
### Key storage scenarios

- Distribute events
    
### Resources

For additional information, click [here](https://msdn.microsoft.com/library/azure/dd179353.aspx).
  
For cost information, click [here](http://azure.microsoft.com/pricing/details/storage/).
  
## Azure Storage (tables)

### Features

- Best for semi-structured datasets
    
- Typically lower cost than traditional SQL
    
- Very fast if querying for key, slow if querying for value
    
- Massively scalable; any amount of tables up to the limits of the storage account
    
- Accessible through REST API, limited oData protocol, .NET
    
- Values must be serialized
    
### Common uses

- User data for web applications
    
- Address books
    
- Device information
    
### Key storage scenarios

- Manage data
    
### Resources

For additional information, click [here](https://msdn.microsoft.com/library/azure/dd179463.aspx).
  
For cost information, click [here](http://azure.microsoft.com/pricing/details/storage/).
  
## Microsoft Azure Storage recommendations

When designing your custom storage solution with Azure Storage, keep the following in mind:
  
- Leverage multiple storage accounts for greater scalability, either for increased size (> 100 TB) or for more throughput (> 5,000 operations per second).
    
- Design the ability for adding additional storage accounts as a configuration change, not as a code change.
    
- Carefully select partitioning functions for table storage to enable the desired scale in terms of insert and query performance.
    
- Choose short column names for table properties as the metadata (property names) are stored in-band (the column names also count towards the maximum row size of 1 MB).
    
- When possible, batch operations into storage.
    
- Aggressively cache information in the configuration database into a distributed cache.
    
- If application performance or reliability is dependent on having a certain segment of data available in the cache, your application should refuse incoming requests until the cache has been pre-populated.
    
- Partition the data in either vertically (by table) or horizontally (segment table across multiple shards) to spread the load across multiple databases.
    
## See Also

#### 

[Microsoft Cloud Storage for Enterprise Architects](microsoft-cloud-storage-for-enterprise-architects.md)
  
[Microsoft Cloud IT architecture resources](microsoft-cloud-it-architecture-resources.md)
#### 

[Microsoft's Enterprise Cloud Roadmap: Resources for IT Decision Makers](https://sway.com/FJ2xsyWtkJc2taRD)

