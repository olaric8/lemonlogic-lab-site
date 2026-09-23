cd "C:\Projects\lemonlogic-lab-site"

$files = @(
    "src\pages\about.md",
    "src\pages\privacy.md",
    "src\pages\terms.md",
    "src\pages\refund-policy.md",
    "src\pages\disclaimer.md"
)

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

foreach ($file in $files) {
    $lines = [System.IO.File]::ReadAllLines($file, [System.Text.Encoding]::UTF8)
    if ($lines[0] -eq "---") {
        $newLines = New-Object System.Collections.Generic.List[string]
        $newLines.Add("---")
        $newLines.Add('layout: "../layouts/MarkdownLayout.astro"')
        for ($i = 1; $i -lt $lines.Length; $i++) {
            $newLines.Add($lines[$i])
        }
        $finalText = [string]::Join([Environment]::NewLine, $newLines) + [Environment]::NewLine
        [System.IO.File]::WriteAllText($file, $finalText, $utf8NoBom)
        Write-Output ("Updated: " + $file)
    } else {
        Write-Output ("SKIPPED (unexpected format): " + $file)
    }
}

Write-Output "Done."