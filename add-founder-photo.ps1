cd "C:\Projects\lemonlogic-lab-site"

$content = [System.IO.File]::ReadAllText("src\pages\about.md", [System.Text.Encoding]::UTF8)

$oldIntro = '# About LemonLogic Lab'
$newIntro = @'
# About LemonLogic Lab

<div class="founder-photo">
  <img src="/images/founder-photo.jpg" alt="Eric Adekunle Akindolire, founder of LemonLogic Lab" />
</div>
'@

$content = $content.Replace($oldIntro, $newIntro)

$oldPlaceholder = "**Photo coming soon.**"
$content = $content.Replace($oldPlaceholder, "")

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("src\pages\about.md", $content, $utf8NoBom)

Write-Output "Founder photo added to About page"