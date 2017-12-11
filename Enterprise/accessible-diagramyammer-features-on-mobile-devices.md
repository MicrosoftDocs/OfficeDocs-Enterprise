---
title: "Accessible diagram - Yammer features on mobile devices"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 11/19/2015
ms.audience: ITPro
ms.topic: article
ms.service: Office 365
localization_priority: Normal
ms.assetid: b18f4ae4-cd83-4a66-8e33-a7d5a4c06659
description: "This article is an accessible text version of the diagram named Yammer features on mobile devices."
---

# Accessible diagram - Yammer features on mobile devices

This article is an accessible text version of the diagram named Yammer features on mobile devices.
  
Yammer offers a premier social experience across multiple device platforms. This diagram shows an overview for Yammer options, Yammer for mobile devices, and the Yammer mobile app.
  
## Overview

### Yammer for mobile devices

Do you want to use Yammer when you are away from your desktop? You can use Yammer from wherever you are, on whatever device you use. Access Yammer from: 
  
- http://www.yammer.com
    
- The Yammer mobile app 
    
### Yammer mobile app

Use the Yammer mobile app to access your company's social network anytime, anywhere. The Yammer mobile app offers on-the-go access to conversations happening inside your company on your Yammer network. Use the Yammer mobile app to connect from any device, just as you would from a desktop. View messages, post updates, preview important documents, and receive important notifications.
  
## Yammer features on mobile devices

### Using Yammer's features on devices

The Yammer mobile app offers features for users to engage in conversations with coworkers in your company's social network. This section highlights features that mobile device users have available to them in the Yammer mobile app.
  
The user interface of these features might look different on the different mobile device platforms. 
  
The poster describes five Yammer features, arranged in the following sections: 
  
1. Messaging 
    
2. Groups 
    
3. People 
    
4. Localization 
    
5. Sharing files
    
### Messaging features in Yammer

In Yammer, all conversations and communications are made up of messages. Users create and reply to messages, which are displayed in the user's Inbox or Groups the user follows. 
  
The accompanying screenshot shows Messaging in Yammer on Windows Phone 8 and describes the following tasks and features. 
  
- Use the Inbox to track and manage your most important conversations in Yammer. The Inbox automatically aggregates your @mentions, group announcements, conversations, and private messages. 
    
- Users can quickly create new messages by clicking **Global Compose**. The Global Compose option is available throughout the Yammer mobile app. 
    
- Email or push notifications are sent to your email address to notify you about important activity taking place in Yammer as soon as it happens. 
    
- Private messages allow you to start a private dialogue with one or more coworkers. You can add more coworkers to the message any time. 
    
- Use Threaded Conversations to view multiple conversations with replies directly below or beside the original message. 
    
- Attach pictures from your mobile device to messages in Yammer. 
    
- Reply to private messages or conversations, or post an update to a group directly from your Inbox. 
    
- View read and unread messages in one split view in your Inbox. Mark messages as unread to follow up on later. Unread items appear at the top of your Inbox. 
    
- Search allows you to find items in your Inbox, files, notes, conversations, and people in your Yammer network. Search will be gradually implemented on all platforms. 
    
### Group features in Yammer

Use Groups in Yammer to collect related conversations about departmental communications, your next campaign launch, or an upcoming company event. Group conversations can apply to a team, a project, or area of common interest. You can perform the following tasks.
  
> Create, find, and join a group that interests you. 
    
> Use your Inbox to view new group messages, along with other messages sent to you from colleagues in Yammer (for example, private messages).
    
> Invite a colleague that is not a member of a private group to take part in a conversation in that private group.
    
> The accompanying screenshot shows Groups in Yammer on iPhone.
    
### People features in Yammer

Engage with coworkers using Yammer. Yammer provides the following features to quickly get in touch with people in your organization. 
  
- Find coworkers' contact information and call, text, or email.
    
- Send a private message directly to a coworker.
    
- Find and connect with people across your company using the Members Directory.
    
- Edit your profile or upload your profile picture.
    
- Follow people who share common interests with you.
    
The accompanying screenshot shows People in Yammer on iPhone.
  
### Localization features in Yammer

Yammer supports global communication among coworkers by providing:
  
- Localized Yammer apps. When you change the language preference settings on your mobile device, Yammer apps render their user interface in the selected language.
    
- Translation of messages. When coworkers post messages in languages that are different from your mobile device's language preference settings, the **Translate** button appears below the initial post. Clicking **Translate** converts the entire conversation, including related responses, into the user's default language. Clicking **Show original text** reverts the conversation to the initial language(s).
    
Languages supported for localization:
  
- Chinese Simplified 
    
- Chinese Traditional 
    
- Dutch 
    
- English 
    
- French (France) 
    
- German 
    
The accompanying screenshot shows Localized Yammer user interface on Android.
  
### File sharing features in Yammer

 Yammer supports the following features that allow users to share files from their mobile devices with coworkers.
  
- The supported file types include Office documents, PDFs, images, and notes.
    
- Use the Viewed by Your Coworker feature to discover files viewed by your colleagues.
    
- Open and edit files using Office Web Apps (opens in a web browser where you might have to sign in).
    
- Snap and share photos taken on your mobile device with coworkers.
    
The accompanying screenshot shows file sharing in Yammer on Android.
  
## Authentication for mobile devices

Users must be authenticated before they can access their Yammer network. The authentication option you choose to authenticate users visiting http://www.yammer.com is also used for authenticating mobile device users. 
  
### Yammer's three authentication options

- Yammer credentials — By using Yammer credentials, you can create user accounts and passwords in Yammer's directory service. These credentials are different from the credentials you use to log on to your organization's network. Choose this option if you prefer to keep your organization's user accounts separate from Yammer's user accounts.
    
- Yammer's Directory Sync — Use your organization assigned email address to log on to Yammer by implementing Yammer's Directory Sync tool. Directory Sync extracts some information from your organization's Active Directory Domain Services, creates matching directory information in Yammer, and then monitors the change log in Active Directory for any changes to user accounts. For example, Directory Sync creates new accounts in Yammer when new accounts are added to Active Directory, and accounts are suspended in Yammer when accounts are disabled in Active Directory. Choose this option if you want users to use the same credentials they use to access your organization's network, and you don't use a federated identity management system (for example, Active Directory Federation Services (AD FS)).
    
- Single sign-on (SSO) — When you use SSO in Yammer, users log on to Yammer using the same credentials they use to access your organization's network. When authenticating, Yammer redirects the authentication request to your organization's SAML-based SSO server. Your organization's SSO server automatically logs on users based on your authentication mechanisms. Choose this option if your organization uses a federated identity management system (for example, AD FS).
    
> [!IMPORTANT]
>  Yammer SSO and Yammer DSync are being deprecated and will stop working after December 1st, 2016. You will not be able to set up new configurations with Yammer SSO and DSync after April 1st, 2016.>  Instead of Yammer SSO, we recommend that you use[Office 365 sign-in for Yammer](https://go.microsoft.com/fwlink/?LinkId=708221). >  Instead of Yammer DSync, we recommend that you use Azure AD Connect. For more information, see[Integrating your on-premises identities with Azure Active Directory](http://go.microsoft.com/fwlink/?LinkID=699406) and[Understanding Office 365 identity and Azure Active Directory](https://go.microsoft.com/fwlink/?LinkId=708223). >  For more information about the deprecation and how to transition out of Yammer SSO and Yammer DSync, see[Plan for Yammer SSO and DSync deprecation](https://go.microsoft.com/fwlink/?LinkId=708222). 
  

