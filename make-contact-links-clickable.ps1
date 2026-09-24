cd "C:\Projects\lemonlogic-lab-site"

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$files = @("src\pages\about.md", "src\pages\contact.md", "src\pages\invoice-kit.astro")

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)
    $original = $content

    $content = $content.Replace("hello@lemonlogicai.com", '<a href="mailto:hello@lemonlogicai.com">hello@lemonlogicai.com</a>')
    $content = $content.Replace("+234 814 466 4481", '<a href="https://wa.me/2348144664481">+234 814 466 4481</a>')

    if ($content -ne $original) {
        [System.IO.File]::WriteAllText($file, $content, $utf8NoBom)
        Write-Output ("Updated: " + $file)
    } else {
        Write-Output ("No change: " + $file)
    }
}

Write-Output "Done."