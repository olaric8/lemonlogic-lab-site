cd "C:\Projects\lemonlogic-lab-site"

$content = [System.IO.File]::ReadAllText("src\layouts\BaseLayout.astro", [System.Text.Encoding]::UTF8)

$marker = '<!-- End Cloudflare Web Analytics -->'

$trackingScript = @'
<!-- End Cloudflare Web Analytics -->

  <script is:inline>
    (function () {
      function trackEvent(name) {
        try {
          var real = location.pathname + location.search + location.hash;
          history.pushState({}, '', '/e/' + name);
          history.replaceState({}, '', real);
        } catch (e) {}
      }
      window.lemonTrack = trackEvent;

      document.addEventListener('click', function (e) {
        var a = e.target.closest('a');
        if (!a) return;
        var href = a.getAttribute('href') || '';
        if (href.indexOf('/invoice-kit') === 0) {
          trackEvent('click-invoice-kit-link');
        } else if (href.indexOf('selar.com') !== -1) {
          trackEvent('click-selar-checkout');
        } else if (href.indexOf('wa.me') !== -1 || href.indexOf('whatsapp') !== -1) {
          trackEvent('click-whatsapp');
        } else if (href.indexOf('mailto:') === 0) {
          trackEvent('click-email');
        }
      });

      var scrollTracked = {};
      window.addEventListener('scroll', function () {
        var scrolled = (window.scrollY + window.innerHeight) / document.body.scrollHeight;
        if (scrolled > 0.75 && !scrollTracked['75']) {
          scrollTracked['75'] = true;
          trackEvent('scroll-75-' + location.pathname.replace(/\//g, '-'));
        }
      }, { passive: true });
    })();
  </script>
'@

$content = $content.Replace($marker, $trackingScript)

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("src\layouts\BaseLayout.astro", $content, $utf8NoBom)

Write-Output "Conversion tracking script added"