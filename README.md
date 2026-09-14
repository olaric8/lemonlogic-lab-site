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
