cd "C:\Projects\lemonlogic-lab-site"

$content = [System.IO.File]::ReadAllText("src\pages\blog\[id].astro", [System.Text.Encoding]::UTF8)

$oldSection = '      <Content />' + [Environment]::NewLine + '    </div>' + [Environment]::NewLine + '  </article>'

$newSection = '      <Content />' + [Environment]::NewLine + '    </div>' + [Environment]::NewLine + [Environment]::NewLine + '    <div class="article-cta">' + [Environment]::NewLine + '      <h3>Ready to stop calculating invoices manually?</h3>' + [Environment]::NewLine + '      <p>Get the SME Invoice &amp; Payment Tracker Kit for &#8358;4,500. Works in Excel and Google Sheets, with automatic VAT calculations and payment tracking.</p>' + [Environment]::NewLine + '      <a class="btn" href="/invoice-kit">Get the Invoice Kit</a>' + [Environment]::NewLine + '    </div>' + [Environment]::NewLine + '  </article>'

if ($content.Contains($oldSection)) {
    $content = $content.Replace($oldSection, $newSection)
    Write-Output "Match found and replaced"
} else {
    Write-Output "NO MATCH FOUND - manual check needed"
}

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("src\pages\blog\[id].astro", $content, $utf8NoBom)