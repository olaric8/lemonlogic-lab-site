cd "C:\Projects\lemonlogic-lab-site"

$content = [System.IO.File]::ReadAllText("src\pages\about.md", [System.Text.Encoding]::UTF8)

$oldPara = "I'm Eric Adekunle Akindolire, founder of LemonLogic Lab. I run a few businesses - the biggest is LA AutoWorks, a mechanic firm in Lagos that's been operating for over 20 years. I also co-own OK3D (a logistics platform), Andstan Solar (clean energy), Unique Ojali (fashion design), and Accurate Ventures International."

$newPara = "I'm Eric Olafisoye, founder of LemonLogic Lab. I work with Nigerian businesses - including LA AutoWorks (a mechanic firm in Lagos operating for over 20 years), OK3D (logistics), Andstan Solar (clean energy), and Unique Ojali (fashion design) - helping them move from manual processes to proper automation and tools."

if ($content.Contains($oldPara)) {
    $content = $content.Replace($oldPara, $newPara)
    Write-Output "Match found and replaced"
} else {
    Write-Output "NO MATCH - showing actual text"
    $idx = $content.IndexOf("I'm Eric")
    Write-Output $content.Substring($idx, 400)
}

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("src\pages\about.md", $content, $utf8NoBom)