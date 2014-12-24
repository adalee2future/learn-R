library(XML)
file <- "simple.xml"
doc <- xmlInternalTreeParse(file, useInternalNodes=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)

rootNode[[1]]
rootNode[[1]][[1]]

xmlSApply(rootNode, xmlValue)
xmlSApply(rootNode, xmlName)
xmlSApply(rootNode, xmlAttrs)
xmlSApply(rootNode, xmlSize)

xpathSApply(rootNode, "//name", xmlValue)
xpathSApply(rootNode, "//price", xmlValue)

## parse html
fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileUrl,useInternal=TRUE)
scores <- xpathSApply(doc, "//li[@class='score']", xmlValue)
teams <- xpathSApply(doc, “//li[@class='team-name']",xmlValue)
scores
teams