cd "C:\Projects\lemonlogic-lab-site"
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$emdash = [System.Char]0x2014
$mojibake1 = [System.Char]0x00E2 + [System.Char]0x20AC + [System.Char]0x201D
$mojibake2 = [System.Char]0x00E2 + [System.Char]0x20AC

$updates = @{
    "src\content\blog\7-invoicing-mistakes-costing-nigerian-businesses.md" = "Invoicing Basics"
    "src\content\blog\do-you-actually-need-to-register-for-vat.md" = "VAT & Tax"
    "src\content\blog\five-free-automations-nigerian-smes.md" = "Automation"
    "src\content\blog\free-vs-paid-invoicing-tools-nigerian-smes.md" = "Tools & Pricing"
    "src\content\blog\how-much-should-you-charge.md" = "Tools & Pricing"
    "src\content\blog\how-to-calculate-vat-nigeria.md" = "VAT & Tax"
    "src\content\blog\how-to-get-clients-to-pay-on-time.md" = "Getting Paid"
    "src\content\blog\how-to-write-an-invoice-that-gets-paid.md" = "Invoicing Basics"
    "src\content\blog\quote-vs-invoice-when-to-send-each.md" = "Invoicing Basics"
    "src\content\blog\what-to-do-when-client-refuses-to-pay.md" = "Getting Paid"
}

foreach ($file in $updates.Keys) {
    $category = $updates[$file]
    $lines = [System.IO.File]::ReadAllLines($file, [System.Text.Encoding]::UTF8)
    $newLines = New-Object System.Collections.Generic.List[string]

    foreach ($line in $lines) {
        $fixedLine = $line.Replace($mojibake1, [string]$emdash).Replace($mojibake2, [string]$emdash)
        $newLines.Add($fixedLine)
        if ($fixedLine.StartsWith("pubDate:")) {
            $newLines.Add('category: "' + $category + '"')
        }
    }

    $finalText = [string]::Join([Environment]::NewLine, $newLines) + [Environment]::NewLine
    [System.IO.File]::WriteAllText($file, $finalText, $utf8NoBom)
    Write-Output ("Updated: " + $file)
}

Write-Output "All files processed."