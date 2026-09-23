cd "C:\Projects\lemonlogic-lab-site"

$mojibakeArrow = [char]0x00E2 + [char]0x2020 + [char]0x2019
$arrow = [char]0x2192

$files = Get-ChildItem "src\content\blog\*.md"
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

foreach ($f in $files) {
    $content = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    $original = $content

    $content = $content.Replace($mojibakeArrow, [string]$arrow)

    if ($content -ne $original) {
        [System.IO.File]::WriteAllText($f.FullName, $content, $utf8NoBom)
        Write-Output ("Fixed: " + $f.Name)
    }
}

Write-Output "All done."