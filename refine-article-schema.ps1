cd "C:\Projects\lemonlogic-lab-site"

$content = [System.IO.File]::ReadAllText("src\layouts\BaseLayout.astro", [System.Text.Encoding]::UTF8)

$oldSchema = @'
      "datePublished": pubDate ? pubDate.toISOString() : undefined,
      "mainEntityOfPage": {
        "@type": "WebPage",
        "@id": Astro.url.href
      }
'@

$newSchema = @'
      "datePublished": pubDate ? pubDate.toISOString() : undefined,
      "dateModified": pubDate ? pubDate.toISOString() : undefined,
      "image": "https://lemonlogiclab.com/images/og-image.png",
      "mainEntityOfPage": {
        "@type": "WebPage",
        "@id": Astro.url.href
      }
'@

$content = $content.Replace($oldSchema, $newSchema)

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("src\layouts\BaseLayout.astro", $content, $utf8NoBom)

Write-Output "Article schema refined with image and dateModified"