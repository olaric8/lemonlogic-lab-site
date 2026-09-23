cd "C:\Projects\lemonlogic-lab-site"

$mojibakeNaira = [char]0x00E2 + [char]0x201A + [char]0x00A6
$mojibakeDashQuote = [char]0x2014 + [char]0x201C
$naira = [char]0x20A6
$endash = [char]0x2013

$files = @(
    "src\content\blog\7-invoicing-mistakes-costing-nigerian-businesses.md",
    "src\content\blog\how-to-calculate-vat-nigeria.md",
    "src\content\blog\how-to-write-an-invoice-that-gets-paid.md",
    "src\content\blog\quote-vs-invoice-when-to-send-each.md"
)

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)
    $original = $content

    $content = $content.Replace($mojibakeNaira, [string]$naira)
    $content = $content.Replace($mojibakeDashQuote, [string]$endash)

    if ($content -ne $original) {
        [System.IO.File]::WriteAllText($file, $content, $utf8NoBom)
        Write-Output ("Fixed: " + $file)
    } else {
        Write-Output ("No change needed: " + $file)
    }
}

Write-Output "All done."