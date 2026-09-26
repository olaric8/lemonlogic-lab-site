cd "C:\Projects\lemonlogic-lab-site"

$content = [System.IO.File]::ReadAllText("src\pages\blog\index.astro", [System.Text.Encoding]::UTF8)

$oldMarker = @'
  {categories.length > 0 && (
'@

$newMarker = @'
  <section class="wrap whatsapp-list">
    <div class="whatsapp-list-inner">
      <div>
        <strong>Want new articles and kit tips as they drop?</strong>
        <p>Join the WhatsApp list — no spam, just useful stuff for Nigerian SMEs.</p>
      </div>
      <a class="btn" href="https://wa.me/2348144664481?text=Hi%2C%20I%27d%20like%20to%20join%20the%20LemonLogic%20Lab%20updates%20list" target="_blank" rel="noopener">Join on WhatsApp</a>
    </div>
  </section>

  {categories.length > 0 && (
'@

$content = $content.Replace($oldMarker, $newMarker)

$oldStyle = @'
  .categories { padding-bottom: 24px; }
'@

$newStyle = @'
  .whatsapp-list { padding-bottom: 32px; }
  .whatsapp-list-inner {
    display: flex; align-items: center; justify-content: space-between; gap: 20px; flex-wrap: wrap;
    border: 1.5px solid var(--ink); border-radius: 8px; padding: 20px 24px;
    background: var(--lemon);
  }
  .whatsapp-list-inner strong { font-size: 1.02rem; display: block; margin-bottom: 4px; }
  .whatsapp-list-inner p { margin: 0; color: var(--ink); font-size: 0.92rem; }
  .whatsapp-list-inner .btn { flex-shrink: 0; background: #fff; }
  .whatsapp-list-inner .btn:hover { background: #f5f5f5; }

  .categories { padding-bottom: 24px; }
'@

$content = $content.Replace($oldStyle, $newStyle)

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("src\pages\blog\index.astro", $content, $utf8NoBom)

Write-Output "WhatsApp list banner added"