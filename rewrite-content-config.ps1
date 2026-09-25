cd "C:\Projects\lemonlogic-lab-site"

$newContent = @'
import { defineCollection, z } from "astro:content";
import { glob } from "astro/loaders";

const blog = defineCollection({
  loader: glob({ pattern: "**/*.md", base: "./src/content/blog" }),
  schema: z.object({
    title: z.string(),
    description: z.string(),
    pubDate: z.coerce.date(),
    draft: z.boolean().optional().default(false),
    category: z.enum([
      "VAT & Tax",
      "Invoicing Basics",
      "Getting Paid",
      "Tools & Pricing",
      "Automation",
      "Case Studies",
    ]).optional().default("Invoicing Basics"),
  }),
});

export const collections = { blog };
'@

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("src\content.config.ts", $newContent, $utf8NoBom)

Write-Output "content.config.ts rewritten"