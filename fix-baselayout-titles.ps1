cd "C:\Projects\lemonlogic-lab-site"

$content = [System.IO.File]::ReadAllText("src\layouts\BaseLayout.astro", [System.Text.Encoding]::UTF8)

$oldProps = @'
interface Props {
  title: string;
  description?: string;
  isArticle?: boolean;
  pubDate?: Date;
  author?: string;
}
const {
  title,
  description = "Practical AI and automation guidance for African SMEs, from LemonLogic Lab.",
  isArticle = false,
  pubDate,
  author = "Eric",
} = Astro.props;
'@

$newProps = @'
interface Props {
  title: string;
  description?: string;
  isArticle?: boolean;
  pubDate?: Date;
  author?: string;
  fullTitle?: string;
  ogTitle?: string;
}
const {
  title,
  description = "Practical AI and automation guidance for African SMEs, from LemonLogic Lab.",
  isArticle = false,
  pubDate,
  author = "Eric",
  fullTitle,
  ogTitle,
} = Astro.props;
'@

$content = $content.Replace($oldProps, $newProps)

$oldTitle = '  <title>{title} · LemonLogic Lab</title>'
$newTitle = '  <title>{fullTitle || `${title} · LemonLogic Lab`}</title>'
$content = $content.Replace($oldTitle, $newTitle)

$oldOgTitle = '<meta property="og:title" content={title || "LemonLogic Lab"} />'
$newOgTitle = '<meta property="og:title" content={ogTitle || title || "LemonLogic Lab"} />'
$content = $content.Replace($oldOgTitle, $newOgTitle)

$oldTwitterTitle = '<meta name="twitter:title" content={title || "LemonLogic Lab"} />'
$newTwitterTitle = '<meta name="twitter:title" content={ogTitle || title || "LemonLogic Lab"} />'
$content = $content.Replace($oldTwitterTitle, $newTwitterTitle)

$oldFooterLinks = @'
        <a href="/disclaimer">Disclaimer</a>
'@

$newFooterLinks = @'
        <a href="/disclaimer">Disclaimer</a>
        <a href="/contact">Contact</a>
'@

$content = $content.Replace($oldFooterLinks, $newFooterLinks)

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("src\layouts\BaseLayout.astro", $content, $utf8NoBom)

Write-Output "BaseLayout updated: custom titles + Contact footer link"