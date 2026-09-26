cd "C:\Projects\lemonlogic-lab-site"

$emdash = [char]0x2014

# Add link in free-vs-paid-invoicing-tools pointing to OK3D case study
$file1 = "src\content\blog\free-vs-paid-invoicing-tools-nigerian-smes.md"
$content1 = [System.IO.File]::ReadAllText($file1, [System.Text.Encoding]::UTF8)
$old1 = "## The bottom line"
$new1 = "See how this plays out in practice in our case study on [how OK3D handles invoicing and waybills together](/blog/case-study-ok3d).`n`n## The bottom line"
if ($content1.Contains($old1)) {
    $content1 = $content1.Replace($old1, $new1)
    [System.IO.File]::WriteAllText($file1, $content1, (New-Object System.Text.UTF8Encoding($false)))
    Write-Output "Link added to free-vs-paid-invoicing-tools"
} else {
    Write-Output "NO MATCH in free-vs-paid-invoicing-tools"
}

# Add link in how-to-get-clients-to-pay-on-time pointing to OK3D case study
$file2 = "src\content\blog\how-to-get-clients-to-pay-on-time.md"
$content2 = [System.IO.File]::ReadAllText($file2, [System.Text.Encoding]::UTF8)
$old2 = "## One thing on the horizon"
$new2 = "For a real example of tightening up recurring client billing, see our case study on [OK3D's invoicing and waybill workflow](/blog/case-study-ok3d).`n`n## One thing on the horizon"
if ($content2.Contains($old2)) {
    $content2 = $content2.Replace($old2, $new2)
    [System.IO.File]::WriteAllText($file2, $content2, (New-Object System.Text.UTF8Encoding($false)))
    Write-Output "Link added to how-to-get-clients-to-pay-on-time"
} else {
    Write-Output "NO MATCH in how-to-get-clients-to-pay-on-time (trying alternate marker)"
    $idx = $content2.LastIndexOf("## ")
    Write-Output $content2.Substring($idx, [Math]::Min(60, $content2.Length - $idx))
}

# Add link in the OK3D case study itself, pointing to invoice-template-checklist
$file3 = "src\content\blog\case-study-ok3d.md"
$content3 = [System.IO.File]::ReadAllText($file3, [System.Text.Encoding]::UTF8)
$old3 = "## The takeaway"
$new3 = "For the full list of what a compliant invoice needs, see the [12-point invoice checklist](/blog/invoice-template-checklist).`n`n## The takeaway"
if ($content3.Contains($old3)) {
    $content3 = $content3.Replace($old3, $new3)
    [System.IO.File]::WriteAllText($file3, $content3, (New-Object System.Text.UTF8Encoding($false)))
    Write-Output "Link added within case-study-ok3d"
} else {
    Write-Output "NO MATCH in case-study-ok3d"
}