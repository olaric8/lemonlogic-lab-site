cd "C:\Projects\lemonlogic-lab-site"

$content = [System.IO.File]::ReadAllText("src\pages\blog\[id].astro", [System.Text.Encoding]::UTF8)

$oldText = 'Founder of <a href="/about">LemonLogic Lab</a> and operator of LA AutoWorks (20+ years), OK3D, Andstan Solar, and other Nigerian ventures. Builder of practical systems for SMEs.'

$newText = 'Founder of <a href="/about">LemonLogic Lab</a>, helping Nigerian businesses like LA AutoWorks, OK3D, and Andstan Solar move from manual processes to automation. Builder of practical systems for SMEs.'

if ($content.Contains($oldText)) {
    $content = $content.Replace($oldText, $newText)
    Write-Output "Match found and replaced"
} else {
    Write-Output "NO MATCH"
}

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("src\pages\blog\[id].astro", $content, $utf8NoBom)