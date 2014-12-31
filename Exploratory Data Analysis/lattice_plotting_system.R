library(lattice)
library(datasets)

## simple scatterplot
xyplot(Ozone ~ Wind, data = airquality)

## convert 'Month' to a factor variable
airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5, 1))

## lattice behavior
p <- xyplot(Ozone ~ Wind, data = airquality)  ## nothing happens
print(p)  ## plot appears
xyplot(Ozone ~ Wind, data = airquality)  ## auto-printing

## lattice panel functions
set.seed(100)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f * x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group 1", "Group 2"))
xyplot(y ~ x | f, layout = c(2, 1))

## custom panel function
xyplot(y ~ x | f, panel = function(x, y, ...) {
        panel.xyplot(x, y, ...)  ## first call the default panel function for 'xyplot'
        panel.abline(h = median(y), lty = 2)  ## add a horizontal line at the median
})

## regression line
xyplot(y ~ x | f, panel = function(x, y, ...) {
        panel.xyplot(x, y, ...)  ## first call the default panel function for 'xyplot'
        panel.lmline(x, y, col = 2)  ## overlay a simple leaner regression line
})