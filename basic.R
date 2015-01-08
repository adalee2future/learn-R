## getting help
?rnorm  ## access help file
help.search("rnorm")  ## search help files
args("rnorm")  ## get arguments

## obtain information about all the available 
## packages on CRAN
available.packages() 

## installing R packages
install.packages("slidify")
install.packages("ggplot2", "devtools")

## installing an R package from Bioconductor
source("http://bioconductor.org/biocLite.R")
biocLite(c("GenomicFeatures", "AnnotationDbi"))

## loading R packages
library(ggplot2)
help(package = ggplot2)  ## an overview of the package

