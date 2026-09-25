cd "C:\Projects\lemonlogic-lab-site"

$content = [System.IO.File]::ReadAllText("src\content.config.ts", [System.Text.Encoding]::UTF8)

$oldEnum = @'
    category: z.enum([
      "VAT & Tax",
      "Invoicing Basics",
      "Getting Paid",
      "Tools & Pricing",
      "Automation",
    ]).optional().default("Invoicing Basics"),
'@

$newEnum = @'
    category: z.enum([
      "VAT & Tax",
      "Invoicing Basics",
      "Getting Paid",
      "Tools & Pricing",
      "Automation",
      "Case Studies",
    ]).optional().default("Invoicing Basics"),
'@

$content = $content.Replace($oldEnum, $newEnum)

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("src\content.config.ts", $content, $utf8NoBom)

Write-Output "Case Studies category added to schema"