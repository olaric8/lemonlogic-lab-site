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

## Three messages, ready to send

WhatsApp is how these clients actually talk, so send them there. Replace `[name]` with the person you deal with at each business — everything else is ready.

Each message names the specific thing that client does, so it does not read as a mass blast, and each ends with an easy "no" so nobody feels cornered. Most people answer the second question even when they skip the first.

### 1. To OK3D

> Hi [name] — I'm writing up the OK3D case study for the site, and I'd like it to have real numbers in it instead of vague claims. Three quick ones, whatever you can answer off the top of your head:
>
> 1. Roughly how many invoices a month now, across how many clients?
> 2. Before we moved the waybills and invoices onto the tracker, how long did billing take you in a week? And now?
> 3. If another logistics business asked whether it was worth setting up, what would you tell them?
>
> Rough guesses are fine — I'd rather have "about half a day" than nothing. And is it OK to quote you by name and business on the site?

### 2. To LA AutoWorks

> Hi [name] — I'm writing up how LA AutoWorks handles invoicing now, and I want to use real numbers rather than vague ones. Three quick questions, off the top of your head:
>
> 1. Roughly how many invoices a month these days, across walk-in customers and fleet clients?
> 2. Before the tracker, how long did invoicing take you in a week — and how long now?
> 3. What would you say to another workshop owner who asked whether it was worth it?
>
> Guesses are fine. And is it OK if I quote you by name and business on the site?

### 3. To Unique Ojali Fashion House

> Hi [name] — I'm putting together a short write-up on how Unique Ojali handles invoicing for custom orders, and I'd like it to have real numbers. Three quick ones:
>
> 1. Roughly how many invoices a month, with custom orders varying the way they do?
> 2. How long did a week's invoicing take before the tracker, and how long now?
> 3. If another fashion business asked whether it was worth it, what would you tell them?
>
> Rough answers are fine. And is it OK to quote you by name and business?

### If nobody replies

Send one nudge four or five days later, then stop. One line is enough:

> Hi [name] — no rush on this, just bumping it in case it got buried. Even a rough guess on the time saved would help.

If someone would rather not share figures, that is still useful. Ask instead:

> No problem at all — would you be OK with just a sentence about whether it's working for you?

A quote with no numbers still beats a testimonial with no name attached.

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

## Two numbers you can get today, without asking anyone

Client replies take time. These two do not.

**1. Your own time.** The About page already says the kit "automates what took me 30 minutes every week to do manually." That is a real, first-person number and it is already public — you just have not used it on the product page. A line in your own voice works even where a client quote is missing: *"I used to spend about 30 minutes a week on this by hand. Now it is a couple of minutes."*

**2. How many buyers.** Your Selar dashboard holds the sales count. "Used by 40 Nigerian businesses" is more persuasive than "used by real Nigerian businesses" — but only publish it if the number is respectable. A small count does the opposite of what you want, so use your judgement and leave it out if it is not there yet.

Neither of these needs anyone's permission, and both are strictly true.

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

The two case-study TODO comments are visible in the published page source, so delete them once the sections are written. The one in `invoice-kit.astro` uses Astro comment syntax and is stripped at build time.

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
