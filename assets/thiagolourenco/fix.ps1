$content = Get-Content -Path ".\index.html" -Raw -Encoding UTF8
$content = $content -replace ' crossorigin="anonymous"', ''
$content = $content -replace ' integrity="[^"]*"', ''
$content = $content -replace '\./assets/gsap\.min\.js', 'assets/gsap_ccff8235a467.js'
$content = $content -replace '\./assets/ScrollTrigger\.min\.js', 'assets/ScrollTrigger_29accb920e10.js'
$content = $content -replace '\./assets/SplitText\.min\.js', 'assets/split-type_9231198fc636.js'
Set-Content -Path ".\index1.html" -Value $content -Encoding UTF8
