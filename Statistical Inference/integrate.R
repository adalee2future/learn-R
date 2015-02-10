# probability density function
mypdf <- function(x) {x / 2}

# use the R function integrate to integrate mypdf with 
# the parameters lower equal to 0 and upper equal to 1.6
integrate(mypdf, 0, 1.6)

