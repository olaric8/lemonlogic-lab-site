cd "C:\Projects\lemonlogic-lab-site"

$contactContent = @'
---
layout: "../layouts/MarkdownLayout.astro"
title: "Contact LemonLogic Lab"
description: "Get in touch with LemonLogic Lab for questions about the SME Invoice & Payment Tracker Kit, support, or anything else."
---

# Contact

Have a question about the invoice kit, need support, or just want to talk business? Reach out directly - a real person reads every message.

## Email

**hello@lemonlogicai.com**

Best for detailed questions, support requests, or anything that needs a written record.

## WhatsApp

**+234 814 466 4481**

Best for quick questions or if you would rather chat than write an email.

## Response time

Every message gets a reply within **48 hours**, usually much sooner.

## What people usually reach out about

- Questions before buying the invoice kit
- Help setting up or using the kit
- Refund requests
- General business or invoicing questions
- Feedback on the blog or the kit

Whatever it is, just ask. If I cannot help directly, I will point you toward something that can.
'@

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("src\pages\contact.md", $contactContent, $utf8NoBom)

Write-Output "Contact page created"