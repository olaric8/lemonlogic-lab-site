cd "C:\Projects\lemonlogic-lab-site"

$content = [System.IO.File]::ReadAllText("src\pages\blog\[id].astro", [System.Text.Encoding]::UTF8)

$ctaBlock = @"
    </div>

    <div class="article-cta">
      <h3>Ready to stop calculating invoices manually?</h3>
      <p>Get the SME Invoice &amp; Payment Tracker Kit for &#8358;4,500. Works in Excel and Google Sheets, with automatic VAT calculations and payment tracking.</p>
      <a class="btn" href="/invoice-kit">Get the Invoice Kit</a>
    </div>
  </article>
"@

$pattern = '(?s)\s*</div>\s*</article>'
$newContent = [regex]::Replace($content, $pattern, "`n" + $ctaBlock, 1)

if ($newContent -ne $content) {
    Write-Output "Match found and replaced via regex"
    $content = $newContent
} else {
    Write-Output "STILL NO MATCH - showing last 200 chars of file for inspection"
    Write-Output $content.Substring($content.Length - 200)
}

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("src\pages\blog\[id].astro", $content, $utf8NoBom)