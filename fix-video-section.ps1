cd "C:\Projects\lemonlogic-lab-site"

$content = [System.IO.File]::ReadAllText("src\pages\invoice-kit.astro", [System.Text.Encoding]::UTF8)

$emdash = [char]0x2014
$mojibakeEmdash = [char]0x00E2 + [char]0x20AC + [char]0x201D

$oldIntro = '<p class="demo-video-intro">A 60-second walkthrough of the kit in use'
$content = $content.Replace($mojibakeEmdash, [string]$emdash)

$oldStyle = @'
  .demo-video { text-align: center; }
  .demo-video-intro { color: var(--muted); font-size: 1.02rem; max-width: 60ch; margin: 0 auto 32px; }
  .video-frame {
    max-width: 800px; margin: 0 auto; border: 1.5px solid var(--ink); border-radius: 8px;
    overflow: hidden; box-shadow: 8px 8px 0 var(--lemon); background: #000;
  }
  .video-frame video { width: 100%; display: block; }
'@

$newStyle = @'
  .demo-video { text-align: center; padding: 48px 0; }
  .demo-video-intro { color: var(--muted); font-size: 1rem; max-width: 56ch; margin: 0 auto 24px; }
  .video-frame {
    max-width: 480px; margin: 0 auto; border: 1.5px solid var(--ink); border-radius: 8px;
    overflow: hidden; box-shadow: 8px 8px 0 var(--lemon); background: #000;
    aspect-ratio: 16 / 9;
  }
  .video-frame video { width: 100%; height: 100%; display: block; object-fit: cover; }
'@

$content = $content.Replace($oldStyle, $newStyle)

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("src\pages\invoice-kit.astro", $content, $utf8NoBom)

Write-Output "Fixed em-dash and reduced video size"