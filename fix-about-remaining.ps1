cd "C:\Projects\lemonlogic-lab-site"

$content = [System.IO.File]::ReadAllText("src\pages\about.md", [System.Text.Encoding]::UTF8)

$content = $content.Replace(
    'alt="Eric Adekunle Akindolire, founder of LemonLogic Lab"',
    'alt="Eric Olafisoye, founder of LemonLogic Lab"'
)

$content = $content.Replace(
    "So I built the SME Invoice & Payment Tracker Kit to solve the problem I was solving manually across all my businesses.",
    "So I built the SME Invoice & Payment Tracker Kit to solve the problem I kept running into helping these businesses automate their invoicing."
)

$content = $content.Replace(
    "I use it across my own businesses. Other Nigerian SMEs use it. If it works for you, great. If it doesn't, there's a refund.",
    "I use it with the businesses I work with. Other Nigerian SMEs use it too. If it works for you, great. If it doesn't, there's a refund."
)

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("src\pages\about.md", $content, $utf8NoBom)

Write-Output "Remaining ownership wording and photo alt text fixed"