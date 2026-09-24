cd "C:\Projects\lemonlogic-lab-site"

$content = [System.IO.File]::ReadAllText("src\pages\invoice-kit.astro", [System.Text.Encoding]::UTF8)

$newStyleBlock = @"
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

$pattern = '(?s)\.proof blockquote \{.*?\}\s*\}'
$evaluator = { param($m) $newStyleBlock }
$newContent = [regex]::Replace($content, $pattern, [System.Text.RegularExpressions.MatchEvaluator]$evaluator, 1)

if ($newContent -ne $content) {
    Write-Output "Style replaced successfully"
    $content = $newContent
} else {
    Write-Output "NO MATCH - check manually"
}

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("src\pages\invoice-kit.astro", $content, $utf8NoBom)

Write-Output "Done."