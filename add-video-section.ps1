cd "C:\Projects\lemonlogic-lab-site"

$content = [System.IO.File]::ReadAllText("src\pages\invoice-kit.astro", [System.Text.Encoding]::UTF8)

$oldMarker = '  <section class="inside">'

$videoSection = @'
  <section class="demo-video">
    <div class="wrap">
      <h2>See it in action</h2>
      <p class="demo-video-intro">A 60-second walkthrough of the kit in use — from opening the template to tracking a payment.</p>
      <div class="video-frame">
        <video controls preload="metadata" poster="/images/shot_invoice.png">
          <source src="/videos/invoice-kit-demo.mp4" type="video/mp4" />
          Your browser doesn't support embedded video. <a href="/videos/invoice-kit-demo.mp4">Download the demo instead</a>.
        </video>
      </div>
    </div>
  </section>

  <section class="inside">
'@

$content = $content.Replace($oldMarker, $videoSection)

$styleMarker = '  .inside-grid::after { content: ""; display: table; clear: both; }'

$videoStyles = @'
  .demo-video { text-align: center; }
  .demo-video-intro { color: var(--muted); font-size: 1.02rem; max-width: 60ch; margin: 0 auto 32px; }
  .video-frame {
    max-width: 800px; margin: 0 auto; border: 1.5px solid var(--ink); border-radius: 8px;
    overflow: hidden; box-shadow: 8px 8px 0 var(--lemon); background: #000;
  }
  .video-frame video { width: 100%; display: block; }

  .inside-grid::after { content: ""; display: table; clear: both; }
'@

$content = $content.Replace($styleMarker, $videoStyles)

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("src\pages\invoice-kit.astro", $content, $utf8NoBom)

Write-Output "Video section added successfully"