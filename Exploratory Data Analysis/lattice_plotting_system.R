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