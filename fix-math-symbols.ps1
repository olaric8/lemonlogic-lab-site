cd "C:\Projects\lemonlogic-lab-site"

$mojibakeTimes = [char]0x00C3 + [char]0x2014
$mojibakeDivide = [char]0x00C3 + [char]0x00B7
$mojibakeMinus = [char]0x00E2 + [char]0x02C6 + [char]0x2019

$times = [char]0x00D7
$divide = [char]0x00F7
$minus = [char]0x2212

$files = Get-ChildItem "src\content\blog\*.md"

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

foreach ($f in $files) {
    $content = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    $original = $content

    $content = $content.Replace($mojibakeTimes, [string]$times)
    $content = $content.Replace($mojibakeDivide, [string]$divide)
    $content = $content.Replace($mojibakeMinus, [string]$minus)

    if ($content -ne $original) {
        [System.IO.File]::WriteAllText($f.FullName, $content, $utf8NoBom)
        Write-Output ("Fixed: " + $f.Name)
    }
}

Write-Output "All done."