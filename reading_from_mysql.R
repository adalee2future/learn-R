library("RMySQL")

## connecting and listing databases
ucscDb <- dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb,"show databases;")
dbDisconnect(ucscDb)  ## always remember to disconnect when you don't use it

## connecting to h919 and listing tables
hg19 <- dbConnect(MySQL(),user="genome", db="hg19", 
                  host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)
allTables[1:5]

## get dimensions of a specific table
dbListFields(hg19, "affyU133Plus2")
dbGetQuery(hg19, "select count(*) from affyU133Plus2")

## read from the table
affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData)

## select a specific subset
query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query); quantile(affyMis$misMatches)
affyMissSmall <- fetch(query,n=10); dbClearResult(query)
dim(affyMissSmall)

## don’t forget to close the connection
dbDisconnect(hg19)