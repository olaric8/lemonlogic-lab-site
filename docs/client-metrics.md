# Getting real numbers from your clients

The case studies on the site explain *how* the kit changes invoicing. None of them say *how much* it changed. That is the single biggest credibility gap on the site: a reader cannot tell whether the kit saves them ten minutes or ten hours, so they have no reason to believe the testimonials over any other vendor's.

**These numbers have to come from your clients.** Writing a figure for a named business — LA AutoWorks, OK3D, Unique Ojali — would be a false claim about a real third party, and it would undo the trust the rest of the site earns. So this document is the shortest path to real ones.

## The six questions

Ask each client these. Most take one message. Two or three of them will produce a quotable sentence with a number in it.

1. **Volume.** "Roughly how many invoices do you send in a month, and across how many clients?"
   Gives readers a way to recognise themselves. "Businesses like mine" is what makes a case study land.

2. **Time, before and after.** "Before the kit, how long did a week's invoicing take you? And now?"
   Accept approximations. "Most of a Friday" and "about 20 minutes" is a perfectly good answer, and far better than nothing.

3. **Errors and queries.** "How often did a client query a total or a VAT figure before? Does that still happen?"
   This is the pain the product removes, and it is easy for them to answer because they remember the awkwardness.

4. **The specific incident.** "Was there a time the old way cost you real money or caused a real argument? What happened?"
   A story beats a statistic. One paragraph of this outperforms three percentage points.

5. **The peer recommendation.** "If another logistics firm asked whether this was worth ₦4,500, what would you tell them?"
   This is your testimonial quote, naturally in their voice.

6. **Permission.** "Can I quote you by name and business, and use these numbers?"
   Ask every time, in writing, and keep the reply.

## Copy-paste message

WhatsApp is how these clients actually talk, so lead with that.

> Hi [name] — quick favour. I'm writing up how [business] handles invoicing now, and I want to include real numbers instead of vague claims. Three questions, whatever you can answer off the top of your head:
>
> 1. Roughly how many invoices a month, across how many clients?
> 2. Before the tracker, how long did a week's invoicing take? And now?
> 3. If another [sector] business asked if it was worth it, what would you say?
>
> Rough guesses are fine. And is it OK if I quote you by name and business on the site?

## Weak vs strong

What the site says today:

> "Payment tracking works per client, not per invoice... cut down significantly on the admin overhead of following up."

The same truth with a number and a person:

> "Chasing unpaid invoices used to eat a couple of hours every Monday. Now it's one tab — I check it with my morning tea." — OK3D, Lagos

The strong version needs no instrumentation at all. It is the client's own estimate, in their own words, attributed to them. That is what makes it believable.

## Rules

- Publish no number a client has not approved, in writing.
- Attribute estimates as estimates: "OK3D estimates…"
- Do not convert their words into a percentage they did not say. "Cut it in half" is theirs; "50% reduction" is yours, and it is exactly the kind of polish that gets a claim challenged.
- Round numbers you cannot substantiate read as invented. "About 20 minutes" sounds true. "Saved 347 hours" does not.
- If a client says "I don't track it," ask for a comparison instead: "Was it an afternoon, or most of a day?" Ranges are fine once the client has approved the range.

## The non-client testimonial

All three current testimonials come from businesses your About page says you consult for. A careful buyer notices that and discounts all three. **One testimonial from someone who simply bought the kit is worth more than the other three combined.**

The cheapest route: Selar holds the buyer list. Send a short message a week after delivery.

> Subject: Did the kit work for you?
>
> Hi [name] — you picked up the Invoice & Payment Tracker Kit last week. Two questions, both optional:
>
> 1. Has it saved you any time yet? Even a rough guess helps.
> 2. Mind if I quote your answer on the site, with your name and business?
>
> If it hasn't worked out, say so instead and I'll refund you. — Eric

Expect most people not to reply. Two or three replies is a real result, and one usable quote changes how the whole page reads.

## Where each answer goes

| Answer | Where it goes |
| --- | --- |
| Volume, time, errors | `src/content/blog/case-study-ok3d.md` and `case-study-la-autoworks.md` — marked with TODO comments |
| Peer recommendation | `src/pages/invoice-kit.astro`, the testimonial cards |
| Non-client quote | `src/pages/invoice-kit.astro` — add a fourth card |

## Ready-to-paste block

Once you have the figures, drop this into a case study where the TODO comment sits:

```md
## By the numbers

- **Invoices a month:** 40–50, across 12 recurring clients
- **Invoicing time:** about 3 hours a week → about 20 minutes
- **Totals queried by clients:** roughly monthly → twice since March
- **Waybill-to-invoice lag:** same week → same day

*Figures supplied by OK3D, September 2026.*
```

That closing italics line matters. It says plainly where the numbers came from, which is what separates a case study from an advert.

## A note on the numbers above

Every figure in that example block is illustrative — invented to show the shape of a good answer. Do not paste it as-is. Replace every value with something the client actually said.
