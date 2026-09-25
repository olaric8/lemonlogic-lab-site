cd "C:\Projects\lemonlogic-lab-site"

$articleContent = @'
---
title: "Case Study: How LA AutoWorks Invoices 20+ Years of Customers Without the Guesswork"
description: "LA AutoWorks has been running for over two decades. Here's exactly how a mechanic firm with that much history handles invoicing, VAT, and payment tracking today."
pubDate: 2026-09-24
category: "Case Studies"
---

LA AutoWorks has been repairing and servicing vehicles in Lagos for more than 20 years. That kind of longevity means one thing above all: volume. Thousands of jobs, thousands of invoices, and two decades of figuring out - sometimes the hard way - what actually works when it comes to getting paid for the work.

This is a look at how invoicing actually happens at LA AutoWorks today, what it looked like before, and why the fix ended up being smaller than expected.

## The business

LA AutoWorks operates out of Mechanic Village in Olodi Apapa, Lagos, handling everything from routine servicing to full mechanical repairs. Customers range from individual car owners to businesses with small fleets - which means invoice volume and invoice complexity both vary a lot from job to job.

A single-car customer might get one invoice for a service. A fleet client might need several invoices a month, each with different parts, labor, and sometimes discounts for repeat business.

## The problem before

For years, invoicing at LA AutoWorks followed a familiar pattern for older, established Nigerian businesses: handwritten or ad-hoc typed invoices, VAT calculated by hand (when it was calculated consistently at all), and payment status tracked mentally or on paper.

This worked - the business ran for two decades on it - but it wasn''t efficient. Three specific problems kept surfacing:

**VAT inconsistency.** With no fixed template, VAT calculation depended on whoever was writing the invoice that day. Sometimes it was added correctly. Sometimes it was estimated. Over years and thousands of invoices, small errors compound.

**No clean payment record.** With fleet clients getting multiple invoices over time, knowing exactly what was outstanding required either checking a paper ledger or asking. Neither was fast.

**Inconsistent invoice appearance.** Different invoices looked different depending on who wrote them, which is a minor issue for walk-in customers but matters more for business clients who need consistent paperwork for their own records.

## What changed

LA AutoWorks moved its invoicing onto the same spreadsheet-based system that eventually became the [SME Invoice & Payment Tracker Kit](/invoice-kit) - the same template built directly from what this business (and a few others) actually needed.

The shift wasn''t dramatic. It was a spreadsheet, not new software to learn, not a subscription, not a system that required internet access at the workshop. Three things changed immediately:

**VAT stopped being a judgment call.** Every invoice now calculates VAT automatically at 7.5%, the same way every time. For [a business figuring out its own VAT obligations](/blog/do-you-actually-need-to-register-for-vat), that consistency matters - both for the customer''s records and for LA AutoWorks'' own accounting.

**Payment status became a single glance.** The tracker tab shows every invoice, who''s paid, and what''s outstanding, without digging through paper records. For fleet clients getting billed regularly, this cut down significantly on the mental overhead of remembering who owed what.

**Every invoice looks the same.** Whoever is writing an invoice - regardless of which staff member - now produces the same professional, consistent document. For business clients especially, that consistency reads as more organized and more trustworthy.

## Why this matters for a 20-year-old business

There''s a temptation to think a business that''s survived two decades doesn''t need to change how it handles paperwork - if it worked for 20 years, why fix it? But "worked" and "worked efficiently" aren''t the same thing. LA AutoWorks didn''t have an invoicing crisis. It had accumulated inefficiency: small pockets of time lost to manual calculation, small gaps in payment tracking, small inconsistencies in how invoices looked.

None of that showed up as a single dramatic problem. It showed up as time - time spent double-checking VAT math, time spent figuring out what a client still owed, time spent making an invoice look presentable instead of just writing down a number.

## The takeaway

This is, in some ways, the whole argument for the invoice kit: it''s not built for businesses in crisis. It''s built for businesses like LA AutoWorks - established, functioning, profitable - that are simply tired of re-solving the same small administrative problems on every single invoice.

If a mechanic firm with 20 years of operating history found value in fixing this, the odds are good that a newer, smaller business will notice the difference even faster.

---

*This case study describes LA AutoWorks Limited''s own use of the invoicing system that became the SME Invoice & Payment Tracker Kit. Results and time savings will vary by business size and invoicing volume.*
'@

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("src\content\blog\case-study-la-autoworks.md", $articleContent, $utf8NoBom)

Write-Output "Case study written successfully"