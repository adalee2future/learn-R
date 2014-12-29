library(datasets)
data(cars)

## base plot
with(cars, plot(speed, dist))

## lattice plot
library(lattice)
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4, 1))

## ggplot2 plot
library(ggplot2)
data(mpg)
qplot(displ, hwy, data = mpg)
