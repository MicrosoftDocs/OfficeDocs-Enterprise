---
title: "Setup guides for Office 365 and Microsoft 365 services"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 05/29/2020
audience: ITPro
ms.topic: conceptual
ms.service: o365-administration
localization_priority: Normal
ms.collection: 
- Ent_O365
- M365-subscription-management
- SPO_Content
f1.keywords:
- CSH
ms.custom: Adm_O365_Setup
search.appverid:
- MET150
- MET150
- BCS160
ms.assetid: 165f46e8-3533-4d76-be57-97f81ebd40f2
description: "Accelerate your planning and configuration of Office 365 or Microsoft 365 with setup guides."
---

# Setup guides for Office 365 and Microsoft 365 services

Office 365 and Microsoft 365 setup guides give admins tailored guidance and resources for deploying apps and services. These guides are created using the same best practices that FastTrack onboarding specialists share in individual interactions, and they're available to all admins within the Microsoft 365 admin center. They give information on product setup, enabling security features, deploying collaboration tools, and provide scripts to speed up advanced deployments.

## How to access setup guides in the Microsoft 365 admin center

The setup guides are accessible from the [Setup guidance](https://aka.ms/setupguidance) page in the Microsoft 365 admin center. You can keep track of the status of your progress and you have the option to return at any time to complete a guide. To reach the **Setup guidance** page:

1. In the [admin center](https://admin.microsoft.com/), go to the **Home** page.
2. Find the **Training & guides** card. 

  ![Training & guides card in the Microsoft 365 admin center](./media/setup-guides-for-office-365/adminportal-trainingandguides.png)

3. Select **Customized setup guidance**.

  ![Screenshot of the Setup guidance page in the Microsoft 365 admin center](./media/setup-guides-for-office-365/adminportal-setupguidance.png)

>[!NOTE]
>Tenant administrator permissions are required to access the Microsoft 365 admin center.

## How do setup guides work in the Microsoft 365 admin center?

Each guide provides you with step-by-step instructions, resources, articles, and when needed, scripts you can use to make configuration changes. These guides provide you with choices that reflect the specific needs of both small and large orgs. Additionally, the guidance provided includes assistance for both new and more experienced admins.

![Example of a setup guide](./media/setup-guides-for-office-365/m365-setupguide-example.png)

You can use the guides to learn more about specific Office 365 and Microsoft 365 features during the planning phase or revisit them after you've completed a deployment to modify a setting.

## Guides for initial setup

### Prepare your environment

The **Prepare your environment** guide helps you prepare your org's environment for Office 365 and Microsoft 365 services. Regardless of your goals, there are tasks you'll need to complete to ensure a successful deployment. To avoid any errors while preparing your environment, you're provided with step-by-step instructions to connect your domain, add users, assign licenses, set up email with Exchange Online, and install or deploy Office apps. 

|||
|:-------|:-----|
| **Run:** | [Prepare your environment](https://aka.ms/prepareyourenvironment) |
||||

### Email setup advisor

The **Email setup advisor** provides you with the step-by-step guidance needed for configuring Exchange Online for your organization. This includes setting up new email accounts, migrating email, and configuring email protection. For a successful email set up, use this advisor and you'll receive the recommended migration method based on your org's current mail system, the number of mailboxes being migrated, and how you want to manage users and their access.

|||
|:-------|:-----|
| **Run:** | [Email setup advisor](https://aka.ms/office365setup) |
||||

### Gmail contacts and calendar advisor

When you migrate a Gmail user's mailbox to Office 365, email messages are migrated, but contacts and calendar items are not. This advisor provides steps for importing Google contacts and Google calendar items to Office 365 using import and export methods with Outlook.com, the Outlook client, or PowerShell.

|||
|:-------|:-----|
| **Run:** |  [Gmail contacts and calendar advisor](https://aka.ms/gmailcontactscalendar) |
|||

### Microsoft 365 deployment advisor

The **Microsoft 365 deployment advisor** provides commercial customers with guidance when setting up productivity tools, security policies, and device management capabilities. With a Microsoft 365 Business Premium or Microsoft 365 Enterprise subscription, you can use this advisor to set up and configure your organization's devices. You'll receive guidance and access to resources to enable your cloud services, update devices to the latest supported version of Windows 10, and join devices to Azure Active Directory (Azure AD), all in one central location.

|||
|:-------|:-----|
| **Run:** | [Microsoft 365 deployment advisor](https://aka.ms/microsoft365setupguide) |
|||

### Remote work setup guide

The **Remote work setup guide** provides organizations with the tips and resources needed to ensure your users can successfully work remotely, your data is secure, and users' credentials are safeguarded. You'll receive guidance to optimize remote workers' device connection to your organization's network, which will reduce the strain on your VPN infrastructure. 

|||
|:-------|:-----|
| **Run:** | [Remote work setup guide](https://aka.ms/remoteworksetup) |
|||

## Guides for security

### Azure AD setup guide

The **Azure AD setup guide** provides information to ensure your org has a strong security foundation. In this guide you’ll set up initial features, like Azure role-based access control (Azure RBAC) for admins, Azure AD Connect for your on-premises directory, and Azure AD Connect Health, so you can monitor your hybrid identity's health during automated syncs. It also includes essential information on enabling self-service password resets, conditional access and integrated third-party sign-on including optional advanced ID protection, and user provisioning automation.

|||
|:-------|:-----|
| **Run:** | [Azure AD setup guide](https://aka.ms/aadpguidance) |
|||

### Microsoft Defender Advanced Threat Protection (ATP) advisor

The Microsoft Defender ATP advisor provides instructions that will help your enterprise network prevent, detect, investigate, and respond to advanced threats. Make an informed assessment of your org's vulnerability and decide which deployment package and configuration methods are best. 

>[!NOTE]
>A Microsoft Volume License is required for Microsoft Defender ATP.

|||
|:-------|:-----|
| **Run:** | [Microsoft Defender Advanced Threat Protection advisor](https://aka.ms/mdatpsetup) |
|||

### Exchange Online Protection setup guide

Microsoft Exchange Online Protection (EOP) is a cloud-based email filtering service for protection against spam and malware, with features to safeguard your organization from messaging policy violations. With this guide you'll set up EOP by selecting which of the three deployment scenarios&mdash;on-premises mailboxes, hybrid (mix of on-premises and cloud) mailboxes, or all cloud mailboxes&mdash;fits your organization. The guide provides information and resources to set up and review your user's licensing, assign permissions in the Microsoft 365 admin center, and configure your organization's anti-malware and spam policies in the Security & Compliance Center. 

|||
|:-------|:-----|
| **Run:** | [Exchange Online Protection setup guide](https://aka.ms/EOPguidance) |
|||

### Office 365 Advanced Threat Protection advisor

The Office 365 Advanced Threat Protection advisor safeguards your organization against malicious threats that your environment might encounter through email messages, links, and third-party collaboration tools. This guide provides you with the resources and information to help you prepare and identify the advanced threat protection plan to fit your organization's needs. 

|||
|:-------|:-----|
| **Run:** | [Office 365 Advanced Threat Protection advisor](https://aka.ms/oatpsetup) |
|||

### Active Directory Federation Services (AD FS) deployment advisor

The **AD FS deployment advisor** provides you with step-by-step guidance on deploying an on-premises AD FS infrastructure that authenticates users for Office 365 and Microsoft 365 services. With this guide your org can review AD FS components and requirements, acquire and install SSL certificates that are necessary for deployment, and install a required web application proxy server. 

|||
|:-------|:-----|
| **Run:** | [AD FS deployment advisor](https://aka.ms/adfsguidance) |
|||

## Guides for collaboration

### Microsoft 365 Apps for enterprise deployment advisor

The **Microsoft 365 Apps for enterprise deployment advisor** helps you get your users' devices running the latest version of Office products like Word, Excel, PowerPoint, and OneNote. You'll get guidance on the various deployment methods that include easy self-install options to enterprise deployments with management tools. The instructions will help you assess your environment, figure out your specific deployment requirements, and implement the necessary support tools to ensure a successful install. 

|||
|:-------|:-----|
| **Run:** | [Microsoft 365 Apps deployment advisor](https://aka.ms/OPPquickstartguide) |
|||

### Mobile apps setup assistant

This setup assistant provides instructions for the download and installation of Office apps on your Windows, iOS, and Android mobile devices. This guide provides you with step-by-step information to download and install Office 365 and Microsoft 365 apps on your phone and tablet devices.

|||
|:-------|:-----|
| **Run:** | [Mobile apps setup assistant](https://aka.ms/officeappguidance) |
|||

### Microsoft Teams setup guide

The **Microsoft Teams setup guide** provides your organization with guidance to set up team workspaces that host real-time conversations through messaging, calls, and audio or video meetings for both team and private communication. You'll receive the instructions for determining your organization's network requirements by using the Network Planner tool and the Teams advisor within the Teams admin center. Once your deployment is complete, the guide includes helpful resources to get started using Teams.

|||
|:-------|:-----|
| **Run:** | [Microsoft Teams setup guide](https://aka.ms/teamsguidance) |
|||

### SharePoint deployment advisor

The **SharePoint deployment advisor** helps you set up your SharePoint document storage and content management, create sites, configure external sharing, migrate data and configure advanced settings, all to drive user engagement and communication within your organization. You'll follow steps for configuring your content-sharing permission policies, choose your migration sync tools, as well as enable the security settings for your SharePoint environment. 

|||
|:-------|:-----|
| **Run:** | [SharePoint deployment advisor](https://aka.ms/spoguidance) |
|||

### OneDrive quick start guide

Use this guide to get started with OneDrive file storage, sharing, collaboration, and syncing capabilities. OneDrive provides a central location where users can sync their Microsoft 365 Apps files, configure external sharing, migrate user data, and configure advanced security and device access settings. The OneDrive setup guide can be deployed using a OneDrive subscription or a standalone OneDrive plan. 

|||
|:-------|:-----|
| **Run:** | [OneDrive setup guide](https://aka.ms/ODfBquickstartguide) |
|||

## Advanced wizards

### In-place upgrade with Configuration Manager

Use the **In-place upgrade with Configuration Manager** guide when upgrading Windows 7 and Windows 8.1 devices to the latest version of Windows 10. You'll use the script provided to check the prerequisites and automatically configure an in-place upgrade.

|||
|:-------|:-----|
| **Run:** | [In-place upgrade with Configuration Manager](https://aka.ms/win10upgradedemo) |
|||

### Deploy Office to your users

Deploy Office apps from the cloud with the ability to customize your installation by using the Office Deployment Tool. This guide helps you create a customized Office configuration with advanced settings, or you can use a pre-built recommended configuration. Whether your users are conducting a self-install or you're deploying to your users individually or in bulk, this advanced wizard provides you with step-by-step instructions to give users an Office installation tailored to your organization.

|||
|:-------|:-----|
| **Run:** | [Deploy Office to your users](https://aka.ms/proplusodt) |
|||

### Deploy and update Microsoft 365 Apps with Configuration Manager

For organizations using Configuration Manager, you can use this guide to generate a script that will automatically configure your Microsoft 365 Apps deployment using best practices recommended by FastTrack engineers. Use this guide to build your deployment groups, customize your Office apps and features, configure dynamic or lean installations, and then run the script to create the applications, automatic deployment rules, and device collections you need to target your deployment. 

|||
|:-------|:-----|
| **Run:** | [Deploy and update Microsoft 365 Apps with Configuration Manager](https://aka.ms/oppinstall) |
|||

