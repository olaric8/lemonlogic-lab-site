cd "C:\Projects\lemonlogic-lab-site"

$content = [System.IO.File]::ReadAllText("src\pages\blog\[id].astro", [System.Text.Encoding]::UTF8)

$oldBlock = @"
    <div class="article-cta">
      <h3>Ready to stop calculating invoices manually?</h3>
      <p>Get the SME Invoice &amp; Payment Tracker Kit for &#8358;4,500. Works in Excel and Google Sheets, with automatic VAT calculations and payment tracking.</p>
      <a class="btn" href="/invoice-kit">Get the Invoice Kit</a>
    </div>
  </article>
"@

$newBlock = @"
    <div class="article-cta">
      <h3>Ready to stop calculating invoices manually?</h3>
      <p>Get the SME Invoice &amp; Payment Tracker Kit for &#8358;4,500. Works in Excel and Google Sheets, with automatic VAT calculations and payment tracking.</p>
      <a class="btn" href="/invoice-kit">Get the Invoice Kit</a>
    </div>

    <div class="author-box">
      <h3>About the author</h3>
      <p class="author-name">Written by Eric</p>
      <p>Founder of <a href="/about">LemonLogic Lab</a> and operator of LA AutoWorks (20+ years), OK3D, Andstan Solar, and other Nigerian ventures. Builder of practical systems for SMEs.</p>
      <a href="/about">Read more about LemonLogic Lab</a>
    </div>
  </article>
"@

$content = $content.Replace($oldBlock, $newBlock)

$oldStyle = @"
  .article-cta p { color: var(--ink); font-size: 0.98rem; margin: 0 0 20px; max-width: 48ch; margin-left: auto; margin-right: auto; }
"@

$newStyle = @"
  .article-cta p { color: var(--ink); font-size: 0.98rem; margin: 0 0 20px; max-width: 48ch; margin-left: auto; margin-right: auto; }

  .author-box {
    margin-top: 48px; padding-top: 32px; border-top: 1px dashed var(--gridline-dark);
  }
  .author-box h3 { font-size: 1.1rem; margin-bottom: 12px; }
  .author-box .author-name { font-weight: 700; margin: 0 0 8px; }
  .author-box p { color: var(--ink); font-size: 0.95rem; margin: 0 0 12px; }
  .author-box a { color: var(--forest); }
"@

$content = $content.Replace($oldStyle, $newStyle)

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("src\pages\blog\[id].astro", $content, $utf8NoBom)

Write-Output "Author box templated after CTA"