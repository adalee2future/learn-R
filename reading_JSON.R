library(jsonlite)
jsonData <- fromJOSN("https://api.github.com/users/jtleek/repos")
names(jsonData)

## nested objects in JSON
names(jsonData$owner)
jsonData$owner$login

## writing data frames to JSON
myjson <- toJSON(iris, pretty=TRUE)
cat(myjson)