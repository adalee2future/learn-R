con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode = readLines(con)
close(con)
htmlCode

## parsing with XML
library(XML)
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html <- htmlTreeParse(url, useInternalNodes=T)
xpathSApply(html, "//title", xmlValue)  ## [1] "Jeff Leek - Google Scholar Citations"

xpathSApply(html, "//td[@class='gsc_a_c']", xmlValue)

## GET from the httr package
library(httr); html2 = GET(url)
content2 = content(html2,as="text")
parsedHtml = htmlParse(content2,asText=TRUE)
xpathSApply(parsedHtml, "//title", xmlValue) ## [1] "Jeff Leek - Google Scholar Citations"

## access websites with passwords
pg1 = GET("http://httpbin.org/basic-auth/user/passwd")
pg1

pg2 = GET("http://httpbin.org/basic-auth/user/passwd", authenticate("user","passwd"))
pg2
names(pg2)

## using handles
google = handle("http://google.com")
pg1 = GET(handle=google,path="/")
pg2 = GET(handle=google, path="search")
