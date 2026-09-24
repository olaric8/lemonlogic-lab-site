cd "C:\Projects\lemonlogic-lab-site"

$content = [System.IO.File]::ReadAllText("src\pages\invoice-kit.astro", [System.Text.Encoding]::UTF8)

$oldTag = @'
<BaseLayout
  title="SME Invoice & Payment Tracker Kit"
  description="A ready-to-use Excel kit for Nigerian small business owners. Enter your prices — VAT, discounts, and totals calculate themselves."
>
'@

$newTag = @'
<BaseLayout
  title="SME Invoice & Payment Tracker Kit"
  description="A ready-to-use Excel kit for Nigerian small business owners. Enter your prices — VAT, discounts, and totals calculate themselves."
>
  <script type="application/ld+json" set:html={JSON.stringify({
    "@context": "https://schema.org",
    "@type": "Product",
    "name": "SME Invoice & Payment Tracker Kit",
    "description": "A ready-to-use Excel and Google Sheets kit for Nigerian small business owners that automatically calculates VAT, tracks payments, and generates professional invoices.",
    "brand": {
      "@type": "Brand",
      "name": "LemonLogic Lab"
    },
    "image": "https://lemonlogiclab.com/images/og-image.png",
    "offers": {
      "@type": "Offer",
      "price": "4500",
      "priceCurrency": "NGN",
      "availability": "https://schema.org/InStock",
      "url": "https://selar.com/6w04585s89"
    }
  })} />
'@

$content = $content.Replace($oldTag, $newTag)

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("src\pages\invoice-kit.astro", $content, $utf8NoBom)

Write-Output "Product schema added to invoice-kit page"