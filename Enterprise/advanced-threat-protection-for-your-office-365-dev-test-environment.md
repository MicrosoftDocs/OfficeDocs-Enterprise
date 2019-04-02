---
title: "Advanced Threat Protection for your Office 365 dev/test environment"
ms.author: josephd
author: JoeDavies-MSFT
manager: laurawi
ms.date: 12/15/2017
ms.audience: ITPro
ms.topic: article
ms.service: o365-solutions
localization_priority: Normal
search.appverid:
- MET150
ms.collection: Ent_O365
ms.custom: 
- TLG
- Ent_TLGs
ms.assetid: 51019757-20ac-498c-b51e-cae6d41a8c08
description: "Summary: Configure and demonstrate Office 365 Advanced Threat Protection in your Office 365 dev/test environment."
---

# Advanced Threat Protection for your Office 365 dev/test environment

 **Summary:** Configure and demonstrate Office 365 Advanced Threat Protection in your Office 365 dev/test environment.
  
Office 365 Advanced Threat Protection (ATP) is a feature of Exchange Online Protection (EOP) that helps keep malware out of your email. With ATP, you create policies in the Exchange admin center (EAC) or the Security &amp; Compliance center that help ensure your users access only links or attachments in emails that are identified as not malicious. For more information, see [Advanced threat protection for safe attachments and safe links](https://technet.microsoft.com/library/mt148491%28v=exchg.150%29.aspx).
  
With the instructions in this article, you configure and test ATP in your Office 365 trial subscription.
  
## Phase 1: Build out your lightweight or simulated enterprise Office 365 dev/test environment

If you just want to test ATP in a lightweight way with the minimum requirements, follow the instructions in phases 2 and 3 of [Office 365 dev/test environment](office-365-dev-test-environment.md).
  
If you want to test ATP in a simulated enterprise, follow the instructions in [DirSync for your Office 365 dev/test environment](dirsync-for-your-office-365-dev-test-environment.md).
  
> [!NOTE]
> Testing ATP does not require the simulated enterprise dev/test environment, which includes a simulated intranet connected to the Internet and directory synchronization for an Active Directory Domain Services (AD DS) forest. It is provided here as an option so that you can test ATP and experiment with it in an environment that represents a typical organization. 
  
## Phase 2: Demonstrate the default email delivery behavior of Office 365

In this phase, you demonstrate that before configuring ATP policies, potentially malicious email gets delivered to Office 365 mailboxes without screening or mitigation.
  
1. Open Internet Explorer and sign in to the Outlook account you created in Phase 2 of [Office 365 dev/test environment](office-365-dev-test-environment.md).
    
  - If you are using the lightweight Office 365 dev/test environment, open a private session of Internet Explorer and sign in from your local computer.
    
  - If you are using the simulated enterprise Office 365 dev/test environment, use the [Azure portal](https://portal.azure.com) to connect to the CLIENT1 virtual machine, and then sign in from CLIENT1.
    
2. Run Notepad and enter some text.
    
3. Save the file to the Documents folder as **getKeys.js**.
    
4. From the Outlook Mail tab of Internet Explorer, click **New**.
    
5. In **To**, type the email address of the Office 365 global administrator name of your trial subscription.
    
6. For the subject, type **Your new keys**.
    
7. In the body, type **Here is the file**.
    
8. Click **Attach**, double-click **getKeys.js** in the Documents folder, click **Attach as a copy**, and then click **Send**.
    
9. Click **New**.
    
10. In **To**, type the email address of the Office 365 global administrator name of your trial subscription.
    
11. For the subject, type **New travel web site**.
    
12. In the body, type **Someone forwarded me this site**.
    
13. In the body, select the **this site** text and click the hyperlink icon in the toolbar.
    
14. In **URL**, type **http://www.spamlink.contoso.com/**, click **OK**, and then click **Send**.
    
15. Open a separate instance of Internet Explorer in private browsing mode, go to the Microsoft 365 admin center ([https://admin.microsoft.com](https://admin.microsoft.com)), and sign in to your Office 365 trial subscription with your global administrator account.
    
16. From the main portal page, click the apps tile, and then click **Mail**.
    
17. In the Inbox, click the message with the subject **Your new keys**.
    
18. In the Junk Mail folder, click the message with the subject **New travel web site**. Within the message, click the **this site** link. You should see a "Oops! Internet Explorer could not find spamlink.contoso.com." page. This is the correct result because there is no web page at that location.
    
Notice that both of these potentially malicious emails were delivered successfully. The **Your new keys** email could contain undetected malware and the user was allowed to click the potentially malicious link in the **New travel web site** email.
  
## Phase 3: Configure safe attachment and safe links policies for ATP

In this phase, you create and configure a safe attachment policy to prevent email with potentially malicious attachments from being delivered and a safe links policy to keep users from traveling to potentially unsafe URLs.
  
1. On the **Microsoft Office Home** tab of Internet Explorer, click the **Admin** tile.
    
2. In the left navigation, click **Admin centers**, and then **Exchange**.
    
3. In the left navigation of the Exchange admin center tab, click **advanced threats**.
    
4. Click the **safe attachments** tab, and then click the plus sign.
    
5. In the **new safe attachments policy** window, in **Name**, type **Safe Attachment Policy - Block**.
    
6. For **Safe attachments unknown malware response**, click **Block**.
    
7. For **Redirect attachment on detection**, click **Enable redirect** and type the email address of your Office 365 global administrator account.
    
8. For **Applied to**, click the down arrow, and then click **The recipient domain is**. In the window, click your organization name (such as contoso.onmicrosoft.com), and then click **OK**.
    
9. Click **Save**. After the update, you should see the new and enabled **Safe Attachment Policy - Block**.
    
10. Click the **safe links** tab, and then click the plus sign.
    
11. In the **new safe links policy** window, in **Name**, type **Safe Link Policy**.
    
12. For **Select the action for unknown potentially malicious URLs in messages**, click **On**, and then select **Do not allow users to click through to original URL**.
    
13. For **Applied to**, click the down arrow, and then click **The recipient domain is**. In the window, click your organization name (such as contoso.onmicrosoft.com), and then click **OK**.
    
14. Click **Save**. You should see the new and enabled **Safe Link Policy**.
    
## Phase 4: Show ATP in action

In this phase, you demonstrate how ATP deals with potentially malicious email.
  
1. From the instance of Internet Explorer that you used to send the email in Phase 2, in the left navigation, click **Sent Items.**
    
2. Click the email titled **Your new keys**, click the down arrow icon, and then click **Forward**.
    
3. For the new message, in **To**, type the email address of the Office 365 global administrator name of your trial subscription, and then click **Send**.
    
4. Click the email titled **New travel web site**, click the down arrow icon, click **Reply all**, and then click **Send**.
    
5. From the instance of Internet Explorer that you used to configure ATP policies in Phase 3, click the Exchange admin center tab, click the apps tile, and then click **Mail**. You should see two new email messages in the Inbox:
    
  - One titled **Fw: Your new keys**
    
  - One titled **Fw: New travel web site**
    
6. Open the email message titled **Fw: New travel web site** and click the **this site** link. You should see a "This website has been classified as malicious." page. This demonstrates that ATP is preventing you from accessing the potentially malicious web site.
    
7. In the Exchange admin center tab of Internet Explorer, in the left navigation, click **mail flow**.
    
8. Click the **message trace** tab, and then click **search**.
    
9. In the **Message Trace Results** window, double-click the message with the subject **Your new keys**. This message was successfully delivered to the Inbox. Close this window.
    
10. Double-click the message with the subject **New travel web site**. This message was successfully delivered to the Inbox. Close this window.
    
11. Double-click the message with the subject **Fw: Your new keys**. Note how this message was processed by ATP and then delivered to the Inbox. Close this window.
    
    > [!NOTE]
    > The purpose of the safe attachments policy was to begin scanning attachments for malicious code. The getKeys.js attachment was allowed because it was not determined to be malicious. This step shows that ATP did perform a scan of the attachment. 
  
12. Double-click the message with the subject **Fw: New travel web site**. Note that this message was successfully delivered to the Inbox.
    
You can now use this environment to create new policies and experiment with ATP.
  
> [!TIP]
> Click [here](http://aka.ms/catlgstack) for a visual map to all the articles in the One Microsoft Cloud Test Lab Guide stack.
  
## See Also

[Cloud adoption Test Lab Guides (TLGs)](cloud-adoption-test-lab-guides-tlgs.md)
  
[Base Configuration dev/test environment](base-configuration-dev-test-environment.md)
  
[Office 365 dev/test environment](office-365-dev-test-environment.md)
  
[DirSync for your Office 365 dev/test environment](dirsync-for-your-office-365-dev-test-environment.md)
  
[Cloud App Security for your Office 365 dev/test environment](cloud-app-security-for-your-office-365-dev-test-environment.md)
  
[Cloud adoption and hybrid solutions](cloud-adoption-and-hybrid-solutions.md) 

[Advanced threat protection for safe attachments and safe links](https://support.office.com/article/Office-365-Advanced-Threat-Protection-E100FE7C-F2A1-4B7D-9E08-622330B83653)


