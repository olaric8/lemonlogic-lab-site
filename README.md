# LemonLogic Lab

The LemonLogic Lab site: homepage, blog, and the SME Invoice & Payment Tracker Kit product page — built with [Astro](https://astro.build).

## Local development

```
npm install
npm run dev
```

Opens at `http://localhost:4321`.

## Build

```
npm run build
```

Outputs a static site to `dist/`.

## Changing things: which file to edit

You should not need to read the code to make common changes. Find your task below.

| I want to change... | Edit this file |
| --- | --- |
| The site name, nav links or footer (all pages) | `src/layouts/BaseLayout.astro` |
| Colours and fonts (all pages) | `src/layouts/BaseLayout.astro` — the `:root` block at the top |
| Homepage wording | `src/pages/index.astro` |
| The kit page: copy, price, FAQ, testimonials | `src/pages/invoice-kit.astro` |
| An existing blog post | the matching file in `src/content/blog/` |
| About / Contact wording | `src/pages/about.md`, `src/pages/contact.md` |
| Privacy, Terms, Refunds, Disclaimer | the matching `.md` file in `src/pages/` |
| Screenshots and the founder photo | drop a file into `public/images/` |
| The demo video | `public/videos/invoice-kit-demo.mp4` |
| The grey description text under a Google result | the `description=` on an `.astro` page, or `description:` in a post's frontmatter |

### The email address

`hello@lemonlogicai.com` appears in **10 places across 7 files**. To change it, use your editor's find-and-replace across the whole project:

```
hello@lemonlogicai.com   →   hello@lemonlogiclab.com
```

Where it lives: `about.md`, `contact.md`, `invoice-kit.astro`, `terms.md`, `refund-policy.md` (three times), `disclaimer.md`, and `privacy.md` (twice). Do not cancel the old mailbox without setting up forwarding first — the privacy and refund policies send people there.

### The price

`₦4,500` appears in **5 places across 2 files**: `index.astro` (twice) and `invoice-kit.astro` (three times). Search the project for `4,500` and change every hit, or the pages will contradict each other.

### Publishing a change

```
git add -A
git commit -m "what I changed"
git push
```

Cloudflare rebuilds the live site from GitHub on every push. **Run `npm run build` first** — if it fails on your machine it will fail there too, and the deploy will not go out.

## Deploy to Cloudflare Pages

1. Push this project to a new GitHub repo (e.g. `lemonlogic-lab-site`).
2. In the Cloudflare dashboard: **Workers & Pages → Create → Pages → Connect to Git**, select the repo.
3. Build settings:
   - Framework preset: **Astro**
   - Build command: `npm run build`
   - Build output directory: `dist`
4. Deploy. Cloudflare gives you a free `*.pages.dev` URL immediately — attach your own domain under **Custom Domains** once it's registered.

## Adding a new blog post

Add a new Markdown file to `src/content/blog/`:

```md
---
title: "Your post title"
description: "One sentence for the blog index and SEO."
pubDate: 2026-01-01
---

Post content here.
```

It shows up automatically on `/blog` and the homepage's "From the blog" section — no other code changes needed. Set `draft: true` in the frontmatter to hide a post before it's ready.

## Structure

```
src/
  layouts/BaseLayout.astro   shared nav, footer, fonts, brand tokens
  pages/
    index.astro              homepage
    invoice-kit.astro        Invoice Kit product page (live demo calculator)
    blog/
      index.astro            blog listing
      [id].astro             individual post template
  content/
    blog/*.md                blog posts
  content.config.ts          blog collection schema
public/
  images/                    product screenshots used on the Invoice Kit page
```

## Brand tokens

Colors and type live as CSS variables in `BaseLayout.astro`'s `:root` — ink, paper, lemon, forest, gridline, muted. The Invoice Kit page layers its own ledger/receipt-specific styling (grid paper background, stamp graphic, receipt-shaped pricing block) on top of the shared tokens, scoped to that page only.
