cd "C:\Projects\lemonlogic-lab-site"

$content = [System.IO.File]::ReadAllText("src\pages\invoice-kit.astro", [System.Text.Encoding]::UTF8)

$newSection = @"
  <section class="proof">
    <div class="wrap">
      <h2>Used across real businesses</h2>
      <div class="testimonial-grid">
        <div class="testimonial-card">
          <blockquote>"We've used this kit to invoice repair and servicing work for over 20 years of customers. It cut our invoicing time down and stopped us from ever missing a VAT calculation."</blockquote>
          <div class="testimonial-source">LA AutoWorks Limited</div>
        </div>
        <div class="testimonial-card">
          <blockquote>"Between waybills and client invoices, our old process ate hours every week. Now every invoice goes out correct the first time, no more back-and-forth over totals."</blockquote>
          <div class="testimonial-source">OK3D</div>
        </div>
        <div class="testimonial-card">
          <blockquote>"Custom orders mean every invoice is different. Having a template that auto-calculates VAT and tracks who's paid has been a real time-saver for the business."</blockquote>
          <div class="testimonial-source">Unique Ojali Fashion House</div>
        </div>
      </div>
    </div>
  </section>
"@

$pattern = '(?s)<section class="proof">.*?</section>'
$newContent = [regex]::Replace($content, $pattern, [regex]::Escape($newSection).Replace('\', ''), 1)

if ($newContent -ne $content) {
    Write-Output "Section replaced successfully"
    $content = $newContent
} else {
    Write-Output "NO MATCH - check manually"
}

$oldStyle = @"
  .proof blockquote {
    margin: 0; font-family: 'Fraunces', serif; font-style: italic; font-weight: 500;
    font-size: clamp(1.2rem, 2.2vw, 1.55rem); line-height: 1.45; max-width: 800px; color: var(--ink);
  }
"@

$newStyle = @"
  .proof h2 { text-align: center; }
  .testimonial-grid { display: flex; gap: 24px; flex-wrap: wrap; }
  .testimonial-card {
    flex: 1; min-width: 260px; border: 1.5px solid var(--gridline-dark); border-radius: 8px;
    padding: 28px; background: #fff;
  }
  .testimonial-card blockquote {
    margin: 0 0 16px; font-family: 'Fraunces', serif; font-style: italic; font-weight: 500;
    font-size: 1.02rem; line-height: 1.5; color: var(--ink);
  }
  .testimonial-source { font-size: 0.88rem; font-weight: 700; color: var(--forest); }
"@

$content = $content.Replace($oldStyle, $newStyle)

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("src\pages\invoice-kit.astro", $content, $utf8NoBom)

Write-Output "Done."