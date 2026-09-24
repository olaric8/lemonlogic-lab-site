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
$evaluator = { param($m) $newSection }
$newContent = [regex]::Replace($content, $pattern, [System.Text.RegularExpressions.MatchEvaluator]$evaluator, 1)

if ($newContent -ne $content) {
    Write-Output "Section replaced successfully"
    $content = $newContent
} else {
    Write-Output "NO MATCH - check manually"
}

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("src\pages\invoice-kit.astro", $content, $utf8NoBom)

Write-Output "Done."