﻿clear

$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.9/tobescraped.html

#$scraped_page.Count

#$scraped_page.Links

#$scraped_page.Links | Select-Object outerText, href

#$h2s=$scraped_page.ParsedHtml.body.getElementsByTagName("h2") | Select-Object outerText

#$h2s

$divs1=$scraped_page.ParsedHtml.body.getElementsByTagName("div") | where { 
$_.getAttributeNode("class").value -ilike "*div-1*" } | select innerText

$divs1