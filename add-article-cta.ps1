cd "C:\Projects\lemonlogic-lab-site"

$content = [System.IO.File]::ReadAllText("src\pages\blog\[id].astro", [System.Text.Encoding]::UTF8)

$oldSection = @'
    <div class="prose">
      <Content />
    </div>
  </article>
'@

$newSection = @'
    <div class="prose">
      <Content />
    </div>

    <div class="article-cta">
      <h3>Ready to stop calculating invoices manually?</h3>
      <p>Get the SME Invoice &amp; Payment Tracker Kit for &#8358;4,500. Works in Excel and Google Sheets, with automatic VAT calculations and payment tracking.</p>
      <a class="btn" href="/invoice-kit">Get the Invoice Kit</a>
    </div>
  </article>
'@

$content = $content.Replace($oldSection, $newSection)

$oldStyle = @'
  .prose :global(hr) { border: none; border-top: 1px dashed var(--gridline-dark); margin: 40px 0; }
'@

$newStyle = @'
  .prose :global(hr) { border: none; border-top: 1px dashed var(--gridline-dark); margin: 40px 0; }

  .article-cta {
    margin-top: 48px; padding: 32px; border: 1.5px solid var(--ink); border-radius: 8px;
    background: var(--lemon); text-align: center;
  }
  .article-cta h3 { font-size: 1.25rem; margin-bottom: 12px; }
  .article-cta p { color: var(--ink); font-size: 0.98rem; margin: 0 0 20px; max-width: 48ch; margin-left: auto; margin-right: auto; }
'@

$content = $content.Replace($oldStyle, $newStyle)

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("src\pages\blog\[id].astro", $content, $utf8NoBom)

Write-Output "CTA block added to article template"