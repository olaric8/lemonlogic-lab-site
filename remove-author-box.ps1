cd "C:\Projects\lemonlogic-lab-site"

$files = Get-ChildItem "src\content\blog\*.md"
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$marker = "## About the author"

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    $idx = $content.IndexOf($marker)
    if ($idx -ge 0) {
        $beforeMarker = $content.Substring(0, $idx)
        $beforeMarker = $beforeMarker.TrimEnd()
        if ($beforeMarker.EndsWith("---")) {
            $beforeMarker = $beforeMarker.Substring(0, $beforeMarker.Length - 3).TrimEnd()
        }
        $finalText = $beforeMarker + [Environment]::NewLine
        [System.IO.File]::WriteAllText($file.FullName, $finalText, $utf8NoBom)
        Write-Output ("Stripped author box: " + $file.Name)
    } else {
        Write-Output ("No author box found: " + $file.Name)
    }
}

Write-Output "Done."