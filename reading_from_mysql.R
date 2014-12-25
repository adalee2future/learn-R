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
