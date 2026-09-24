cd "C:\Projects\lemonlogic-lab-site"

$content = [System.IO.File]::ReadAllText("src\pages\index.astro", [System.Text.Encoding]::UTF8)

$oldTag = '<BaseLayout title="Home">'
$newTag = '<BaseLayout title="Home" fullTitle="LemonLogic Lab | Practical AI & Automation for African SMEs" ogTitle="Practical AI & Automation for African SMEs | LemonLogic Lab" description="Practical AI and automation guidance for African SMEs, plus the SME Invoice & Payment Tracker Kit.">'

$content = $content.Replace($oldTag, $newTag)

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("src\pages\index.astro", $content, $utf8NoBom)

Write-Output "Homepage title updated"